mesafeVerisetim = xlsread('dataset_1.xlsx')
adayCozum=[3,2,8,1,9,10,7,5,4,6]
fprintf('---------------S-Shape----------------\n')
Toplam=grupla(adayCozum,mesafeVerisetim,20)





function[Topla] = grupla(adayCozum,VeriSetim,toplam)
adayCozum(1,1)
VeriSetim(1,1)
Topla=0
grupla=find(VeriSetim(:,adayCozum(1,1)))
for i=2:length(adayCozum)
 if length(find(VeriSetim(:,adayCozum(1,i))))+length(grupla) <=toplam
     fprintf('---------------Gruplama----------------\n')
     fprintf('%d.Sütun\n',adayCozum(1,i))
     grupla=[grupla;find(VeriSetim(:,adayCozum(1,i)))]
     %Topla=Rotala(grupla)+Topla
     %x=MidPoint(grupla)
     Topla=Return(grupla) +Topla
     
     fprintf('---------------TOPLAM----------------\n')
     %toplam=x+y
 else
     fprintf('---------------Tekli Gruplama----------------')
     grupla=[]
     fprintf('%d.Sütun\n',adayCozum(1,i))
     grupla(:,1)= find(VeriSetim(:,adayCozum(1,i))) 
     if length(adayCozum)==i
        %Topla=Rotala(grupla) +Topla
        Topla=Return(grupla)+Topla
     else
             
      if length(find(VeriSetim(:,adayCozum(1,i+1))))+length(grupla) <=toplam% i yi kontrol ettir indexi asabilirsin
           fprintf('Sonradan Gruplanacakkkk')
       else
        % Topla=Rotala(grupla) +Topla
        Topla=Return(grupla)+Topla
      end
         
     
    
     end

     %x=MidPoint(grupla)
     %y=RoutingMidPoint(grupla)
     
     fprintf('---------------TOPLAM----------------\n')
     %toplam=x+y
 end
end   
end






function [toplam] = Return(grupla)
fprintf('---------------Return Routing----------------\n')
grupla=sort(grupla)
deger=0
sayac1=0
sayac2=0
value=1
ListeToplam=[]
baslangic=0
bitis=0
toplam=0
yukari=100

for b=20:20:100
 for count=1:length(grupla)
     %grupla(count,1)
    
     if grupla(count,1)<b && grupla(count,1)>b-20 
         sayac1=sayac1+1
         value=0
         ListeToplam(end+1)=b
        
         break 
     else
         value=1
     end
     
     
 end
yukari=100
if value==1
     sayac2=sayac2+40
end
end
fprintf('*************-------------------------------***************\n')

if ListeToplam(1,1)==20
    baslangic=0
end
if ListeToplam(1,1)==40
    baslangic=40
end
if ListeToplam(1,1)==60
    baslangic=80
end
if ListeToplam(1,1)==80
    baslangic=120
end
if ListeToplam(1,1)==100
    baslangic=160
end




if ListeToplam(1,end)==20
    bitis=0
end
if ListeToplam(1,end)==40
    bitis=40
end
if ListeToplam(1,end)==60
    bitis=80
end
if ListeToplam(1,end)==80
    bitis=120
end
if ListeToplam(1,end)==100
    bitis=160
end

fprintf('----------------SONUÇLAR!!!!!-----------------------\n')
if mod(sayac1,2)==0
    toplam=(bitis-baslangic)*2+baslangic+RoutingReturn(grupla)+10
else
   toplam=(bitis-baslangic)*2+baslangic+RoutingReturn(grupla)+10
end


fprintf('---------------------------------------')
end

function [ToplaRR] = RoutingReturn(grupla)
yukari=101
asagi=0
sum=[]
ToplaRR=0
temp=0
for b=20:20:100
 for count=1:length(grupla)
     grupla(count,1)
     if grupla(count,1)<b && grupla(count,1)>b-20
         if grupla(count,1)>b-10
         
           if grupla(count,1)>temp
             temp=grupla(count,1)
           end
         end
     
     else
         
         if grupla(count,1)>temp
             temp=grupla(count,1)-10
         end
        
    
     end
 end
     fprintf('---------------------------------------')
     fprintf('%d Temp',temp)
     ToplaRR=mod(temp,10)*20 +ToplaRR
     end
end






