% purpose��draw residue histogram
% 2021/1/6 yuqinghe
% file:insar_d_forusgsandmain.dat
% field: latitude      longitude observation     resiual  prediction     u_north      u_east        u_up
file=load('insar_d_forusgsandmain.dat');
residual=file(:,4);
figure;
hist(residual,5,'color','blue');
h=findobj(gca,'Type','patch');
set(h,'facecolor','b');%�ı���״ͼ��ɫ
[n,y] = hist(residual,5);
hold on;
plot(y,n);
% bar(y,n,0.5);
for i = 1:length(y)
text(y(i),n(i)+50,num2str(n(i)),'color','black');
end
title('residue histogram','FontSize',15);
xlabel('residual (cm)');
ylabel('sample count');

% no 2
file=load('insar_d_forusgsandsub.dat');
residual=file(:,4);
figure;
hist(residual,5,'color','blue');
h=findobj(gca,'Type','patch');
set(h,'facecolor','b');%�ı���״ͼ��ɫ
[n,y] = hist(residual,5);
hold on;
plot(y,n);
% bar(y,n,0.5);
for i = 1:length(y)
text(y(i),n(i)+50,num2str(n(i)),'color','black');
end
title('residue histogram','FontSize',15);
xlabel('residual (cm)');
ylabel('sample count');

% no 3 usgsandmain
file=load('insar_d_forusgsandmain_USGSdeepslip.dat');
residual=file(:,4);
figure;
hist(residual,5,'color','blue');
h=findobj(gca,'Type','patch');
set(h,'facecolor','b');%�ı���״ͼ��ɫ
[n,y] = hist(residual,5);
hold on;
plot(y,n);
% bar(y,n,0.5);
for i = 1:length(y)
text(y(i),n(i)+50,num2str(n(i)),'color','black');
end
title('residue histogram','FontSize',15);
xlabel('residual (cm)');
ylabel('sample count');

% no 4 Insar˫�ϲ�
file=load('insar_d_new0615.dat');
residual=file(:,4);
figure;
hist(residual,5,'color','blue');
h=findobj(gca,'Type','patch');
set(h,'facecolor','b');%�ı���״ͼ��ɫ
[n,y] = hist(residual,5);
hold on;
plot(y,n);
% bar(y,n,0.5);
for i = 1:length(y)
text(y(i),n(i)+50,num2str(n(i)),'color','black');
end
title('residue histogram','FontSize',15);
xlabel('residual (cm)');
ylabel('sample count');

% no 4 Insar���ϲ�
file=load('insar_d_new1109_50km.dat');
residual=file(:,4);
figure;
hist(residual,5,'color','blue');
h=findobj(gca,'Type','patch');
set(h,'facecolor','b');%�ı���״ͼ��ɫ
[n,y] = hist(residual,5);
hold on;
plot(y,n);
% bar(y,n,0.5);
for i = 1:length(y)
text(y(i),n(i)+50,num2str(n(i)),'color','black');
end
title('residue histogram','FontSize',15);
xlabel('residual (cm)');
ylabel('sample count');

% no 5 USGS���ϲ�
file=load('insar_d_forusgs.dat');
residual=file(:,4);
figure;
hist(residual,5,'color','blue');
h=findobj(gca,'Type','patch');
set(h,'facecolor','b');%�ı���״ͼ��ɫ
[n,y] = hist(residual,5);
hold on;
plot(y,n);
% bar(y,n,0.5);
for i = 1:length(y)
text(y(i),n(i)+50,num2str(n(i)),'color','black');
end
title('residue histogram','FontSize',15);
xlabel('residual (cm)');
ylabel('sample count');
