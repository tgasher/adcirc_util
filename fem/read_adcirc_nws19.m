function storm=read_adcirc_nws19(f22name)
% storm=read_adcirc_nws19(f22name)

fmtstr='%s%d%s%s%s%d%s%s%d%d%s%d%s%d%d%d%d%d%s%d%s%s%s%s%s%d%d%s%s%d%d%d%d%d%f%f%f%f%f';

[storm.basin,...
storm.cy,...
storm.dat,...
storm.tech_sort,...
storm.tech,...
storm.tau,...
storm.lat,...
storm.lon,...
storm.vmax,...
storm.cp,...
storm.ty,...
storm.rad,...
storm.windcode,...
storm.rad1,...
storm.rad2,...
storm.rad3,...
storm.rad4,...
storm.radp,...
storm.rrp,...
storm.mrd,...
storm.gusts,...
storm.eye,...
storm.subregion,...
storm.maxseas,...
storm.initials,...
storm.dir,...
storm.speed,...
storm.stormname,...
storm.depth,...
storm.seas,...
storm.seas1,...
storm.seas2,...
storm.seas3,...
storm.seas4,...
storm.rmax1,...
storm.rmax2,...
storm.rmax3,...
storm.rmax4,...
storm.holland_b] = textread(f22name,fmtstr,'delimiter', ',');

fs=fields(storm);
for i=1:length(fs)
    eval(sprintf('storm.%s=storm.%s'';',fs{i},fs{i}))    
end

for i=1:length(storm.basin)
    %if strcmp(storm.typ(i),'OFCL')
       storm.lat2(i)= str2double(storm.lat{i}(1:3))/10;
       storm.lon2(i)=-str2double(storm.lon{i}(1:3))/10;
       tmp=char(storm.dat(i));
       yyyy=str2double(tmp(1:4));
       mm=str2double(tmp(5:6));
       dd=str2double(tmp(7:8));
       hr=str2double(tmp(9:10));
       storm.time(i)=datenum(yyyy,mm,dd,hr,0,0);
       storm.hr(i)=storm.tau(i);
    %end
end

