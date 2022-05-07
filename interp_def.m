% purpose：Interpolate the predicted deformations, calculate residuals and generate grd files for GMT plotting.
% 2020/11/6 yuqinghe
% input:observation-fitness file from SDM
metaAT = read_meta_S1P('20210429B_VV_Frame01_IW1.meta'); %
data_info = meta2datainfo(metaAT);
def_factor = -data_info.sensor_para.Wavelength/4/pi/100;
insard_sou=load('insar_d_forusgsandsub.dat');

insard_lon=insard_sou(:,2);
insard_lat=insard_sou(:,1);
insard_sou_pre=insard_sou(:,5);
insard_sou_mis=insard_sou(:,4);

lattemp_d=linspace(50.9,51.78,5316);
lontemp_d=linspace(99.45,101.09,3176);
[X,Y]=meshgrid(lattemp_d,lontemp_d);
Z_d=griddata(insard_lat,insard_lon,insard_sou_pre,X,Y,'cubic')/100;
mis_d=griddata(insard_lat,insard_lon,insard_sou_mis,X,Y,'cubic')/100;

%% 绘图
% figure; 原始观测
figure;
subplot(231);
imagesc(lon1,lat1,def_in_DT04);
colormap(jet);
colorbar;
caxis([-0.25,0.1]);
xlabel('Longitude(degree)');
ylabel('Latitude(degree)');
axis xy;
axis image;
title('DT04 observation');
axis([99.45 101.09 50.9 51.78]);
% axis([76.85 77.6 39.6 40.1]);
% axis([77.4 77.98 39.8 40.58]);
% colormap(jet); colorbar;

subplot(234); %卷成干涉条纹
obs_unwrapphs=def_in_DT04.*(1/def_factor);
cmpx=complex(cos(obs_unwrapphs),sin(obs_unwrapphs));;
imagesc(lon1,lat1,angle(cmpx));colorbar;axis image;title('DT04 observation');

axis([99.45 101.09 50.9 51.78]);axis xy;
xlabel('Longitude(degree)');
ylabel('Latitude(degree)');
% axis([77.4 77.98 39.8 40.58]);
colormap(jet); colorbar;caxis([-pi,pi]);

% figure; %正演结果
subplot(232);
imagesc(lontemp_d,lattemp_d,Z_d');
colormap(jet);
colorbar;
caxis([-0.25,0.1]);
xlabel('Longitude(degree)');
ylabel('Latitude(degree)');
axis xy;
axis image;
title('DT04 predicted');
axis([99.45 101.09 50.9 51.78]);
% axis([76.85 77.6 39.6 40.1]);
% axis([77.4 77.98 39.8 40.58]);
% colormap(jet); colorbar;

subplot(235); %卷成干涉条纹
predict_unwrapphs=Z_d.*(1/def_factor);
cmpx=complex(cos(predict_unwrapphs),sin(predict_unwrapphs));;
imagesc(lontemp_d,lattemp_d,angle(cmpx));colorbar;axis image;title('DT04 predicted');
xlabel('Longitude(degree)');
ylabel('Latitude(degree)');
axis([99.45 101.09 50.9 51.78]);axis xy;
% axis([77.4 77.98 39.8 40.58]);
colormap(jet); colorbar;caxis([-pi,pi]);

% figure; 残差
subplot(233);
imagesc(lontemp_d,lattemp_d,mis_d');
xlabel('Longitude(degree)');
ylabel('Latitude(degree)');
axis xy;
axis image;
title('DT04 misfit');
axis([99.45 101.09 50.9 51.78]);
% axis([77.4 77.98 39.8 40.58]);
colormap(jet); colorbar;caxis([-0.25,0.1]);

subplot(236); %卷成干涉条纹
mis_unwrapphs=mis_d.*(1/def_factor);
cmpx=complex(cos(mis_unwrapphs),sin(mis_unwrapphs));;
imagesc(lontemp_d,lattemp_d,angle(cmpx));colorbar;
axis image;axis xy;
title('DT04 misfit');
xlabel('Longitude(degree)');
ylabel('Latitude(degree)');
axis([99.45 101.09 50.9 51.78]);
% axis([77.4 77.98 39.8 40.58]);
colormap(jet); colorbar;caxis([-pi,pi]);


%% 输出grd文件
grdwrite2(lontemp_a,lattemp_a',Z_a','insar_a_southdip.grd');
grdwrite2(lontemp_d,lattemp_d',Z_d','insar_d_southdip.grd');
% def_in_AT_forGMT
grdwrite2(lontemp_a,lattemp_a',Z_a'-flipud(def_in_AT_forGMT)*100,'insar_a_southdip_misfit.grd');
grdwrite2(lontemp_d,lattemp_d',Z_d'-flipud(def_in_DT_forGMT)*100,'insar_d_southdip_misfit.grd');
% grdwrite2(lontemp,lattemp',Z_a-def_in_AT_forGMT,'insar_a_northdip_misfit.grd');
% % grdwrite2(lontemp,lattemp',Z_d-def_in_DT_forGMT,'insar_d_northdip_misfit.grd');