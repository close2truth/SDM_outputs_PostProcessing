% Plot the fault slip distribution, containing total slip, dip- and strike-slip components.
% 2022/3/15 yuqinghefor Mongolia earthquake
% input: slip file from SDM 
% field: x,y; n,e slip components

slip_totalfile=load('s02_s01_double_all.dat');
% %断层大小，10行25列，需自行设置
m=10;
n=6
% m=15;
% n=25;
% slip_vect=load('slip_vect_new.txt');
x=slip_totalfile(:,4);
y=slip_totalfile(:,5);
slip_total=slip_totalfile(:,10);
x_new=reshape(x,[m,n]);
y_new=reshape(y,[m,n]);
e_com=slip_totalfile(:,8);

e_com_new=reshape(e_com,[m,n]);
n_com=slip_totalfile(:,9);
n_com_new=reshape(n_com,[m,n]);
slip_new=reshape(slip_total,[m,n]);
mean_ncom=mean(n_com);
mean_ecom=mean(e_com);


figure
subplot(3,1,1)
pcolor(x_new,y_new,slip_new);%slip distributions
set(gca,'YDir','reverse')
%      set(gca,'XDir','reverse')
%colorbar('location','SouthOutside');
colormap(flipud(hot));
caxis([0,1]);
set(get(colorbar,'Title'),'string','slip(m)');
title('fault slip distribution','FontSize',15);
xlabel('Along strike direction (km)');
ylabel('Along dip direction (km)');
% xlim([0,50]);
% ylim([0,30]);
%     axis xy;
hold on;
quiver(x_new+1,y_new+1,-e_com_new,n_com_new,0.5,'k');

subplot(3,1,2)
pcolor(x_new,y_new,abs(e_com_new));%strike-slip distributions
set(gca,'YDir','reverse')
%      set(gca,'XDir','reverse')
%colorbar('location','SouthOutside');
colormap(flipud(hot));
caxis([0,1]);
set(get(colorbar,'Title'),'string','slip(m)');
title('strike-slip component','FontSize',15);
xlabel('Along strike direction (km)');
ylabel('Along dip direction (km)');
% xlim([0,50]);
% ylim([0,20]);


subplot(3,1,3)
pcolor(x_new,y_new,abs(n_com_new));%dip-slip distributions
set(gca,'YDir','reverse')
%      set(gca,'XDir','reverse')
%colorbar('location','SouthOutside');
colormap(flipud(hot));
caxis([0,1]);
set(get(colorbar,'Title'),'string','slip(m)');
title('dip-slip component','FontSize',15);
xlabel('Along strike direction (km)');
ylabel('Along dip direction (km)');
% xlim([0,50]);
% ylim([0,40]);