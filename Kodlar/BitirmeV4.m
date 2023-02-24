
mesafeVerisetim = xlsread('dataset_1.xlsx')
adayCozum=[3,2,8,1,9,10,7,5,4,6]
fprintf('---------------RETURN ROUTİNG----------------\n')
[ToplaS,ToplaM,ToplaR]=grupla(adayCozum,mesafeVerisetim,20)





function[ToplaS,ToplaM,ToplaR] = grupla(adayCozum,VeriSetim,toplam)
adayCozum(1,1)
VeriSetim(1,1)
ToplaS=0
ToplaM=0
ToplaR=0
grupla=find(VeriSetim(:,adayCozum(1,1)))
for i=2:length(adayCozum)
 if length(find(VeriSetim(:,adayCozum(1,i))))+length(grupla) <=toplam
     fprintf('---------------Gruplama----------------\n')
     fprintf('%d.Sütun\n',adayCozum(1,i))
     grupla=[grupla;find(VeriSetim(:,adayCozum(1,i)))]
     ToplaS=Rotala(grupla)+ToplaS
     ToplaM=MidPoint(grupla)+ToplaM
     ToplaR=Return(grupla) +ToplaR
     
     fprintf('---------------TOPLAM----------------\n')
     %toplam=x+y
 else
     fprintf('---------------Tekli Gruplama----------------')
     grupla=[]
     fprintf('%d.Sütun\n',adayCozum(1,i))
     grupla(:,1)= find(VeriSetim(:,adayCozum(1,i))) 
     if length(adayCozum)==i
        ToplaS=Rotala(grupla)+ToplaS
        ToplaM=MidPoint(grupla)+ToplaM
        ToplaR=Return(grupla) +ToplaR
     else
             
      if length(find(VeriSetim(:,adayCozum(1,i+1))))+length(grupla) <=toplam% i yi kontrol ettir indexi asabilirsin
           fprintf('Sonradan Gruplanacakkkk')
       else
        ToplaS=Rotala(grupla)+ToplaS
        ToplaM=MidPoint(grupla)+ToplaM
        ToplaR=Return(grupla) +ToplaR
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
     if grupla(count,1)<=b && grupla(count,1)>b-20
         if grupla(count,1)>b-10
         
           if grupla(count,1)-10>temp
             temp=grupla(count,1)-10
           end
         else
              if grupla(count,1)>temp
               temp=grupla(count,1)
           end
         end
     end
     
 end
     fprintf('---------------------------------------')
     fprintf('%d Temp',temp)
     if temp==0
       fprintf('Devam Ediyor...')
     elseif mod(temp,10)==0
         ToplaRR=11*20 +ToplaRR
     else
         ToplaRR=(mod(temp,10)+1)*20 +ToplaRR
     end
     temp=0
     end
end



function [toplam] = Rotala(grupla)
fprintf('---------------S-Shape_Routing----------------\n')
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
    toplam=260+(sayac1-2)*120+(bitis-baslangic)*2+baslangic
else
   toplam=260+(sayac1-1)*120+(bitis-baslangic)*2+baslangic
end


fprintf('---------------------------------------')

end


function [toplam] = MidPoint(grupla)
fprintf('---------------Mid_Point_Routing----------------\n')
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
    toplam=260+(bitis-baslangic)*2+baslangic+RoutingMidPoint(grupla)
else
   toplam=260+(bitis-baslangic)*2+baslangic+RoutingMidPoint(grupla)
end


fprintf('---------------------------------------')

end



function [AsilToplam] = RoutingMidPoint(grupla)
fprintf('---------------RoutingMidPoint----------------\n')
yukari=101
asagi=0
sum=[]
AsilToplam=0
for b=20:20:100
 for count=1:length(grupla)
     grupla(count,1)
     if grupla(count,1)<b && grupla(count,1)>b-20 
     
     if grupla(count,1)<=b

      if grupla(count,1)>=b-4
          yukari
         if grupla(count,1)-10 <yukari
             yukari=grupla(count,1)-10
         end
      else if grupla(count,1)<=b-10 && grupla(count,1)>=b-14 
            if grupla(count,1)<yukari
              yukari=grupla(count,1)
            end
       
      end 
      
      if grupla(count,1)<=b-15 && grupla(count,1)>=b-19
         if grupla(count,1) >asagi
             asagi=grupla(count,1)
         end
      
      else if grupla(count,1)<=b-5 && grupla(count,1)>=b-9
            if grupla(count,1)-10>asagi
              asagi=grupla(count,1)-10
            end
       
     end 
  
 end

      
      end
      end
     end

 end
fprintf("*********************************\n")
fprintf('%d.yukarı\n',yukari)
fprintf('%d.asagı\n',asagi)
if yukari==101 & asagi==0
    fprintf("YOKkkkkkk\n")
elseif yukari==101
   sum(end+1)= (mod(asagi,10)+2)*20
elseif asagi==0
    sum(end+1)= (mod(yukari,10)+1)*20
else
    sum(end+1)= 260-(yukari-asagi-1)*20
end
yukari=101
asagi=0

fprintf("*********************************")

end
sum(1,end)=0
sum(1,1)=0
for count=1:    length(sum)
    fprintf('------------------------\n')
    sum(1,count)
    count
    AsilToplam=AsilToplam+sum(1,count)
end

end









