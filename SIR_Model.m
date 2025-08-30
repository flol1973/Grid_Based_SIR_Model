%% Domain Creation
clear;clc;
Z = 50/2; R = sqrt(2); N = 2*Z+1; RT = 50; i_chance = 0.5;
%N = domain size; R = radius of influence; RT = recovery time
x = ones(N,1)*(-Z:Z); y = (ones(N,1)*(-Z:Z))';
figure(1); plot(x,y,'.k');
id = zeros(N,N);
for i = 1:N^2
    id(i) = i;
end

i_status = zeros(N,N);
for i = 1:10
    rx = randi([1 N^2],1,1); i_status(id==rx) = 1;
end

r_status = zeros(N,N); qr_status = zeros(N,N);
usymptomatic = zeros(N,N); usymptomatic(rx) = 1; qring = 0;
% i_status = infected status; r_status = recovered status
% qr_status = quarantine status; qring = quarantine switch

t_infected = zeros(N,N);

%%
t = 0;
while sum(i_status==1,'all')>0
    
    t = t + 1;
    
    t_infected(i_status==1) = t_infected(i_status==1) + 1;
    k = t_infected==RT; i_status(k==1) = 0; r_status(k==1) = 1;
    qr_status(k==1) = 0;
    if qring==1
        k1 = t_infected>=1; qr_status(k1==1 & usymptomatic==0) = 1;
    end
    
    for i = 1:N^2
        rx = unifrnd(0,1000,1,1)/1000;
        x1 = x - x(i); y1 = y - y(i);
        r = sqrt(x1.*x1 + y1.*y1);
        q1 = r<=R & r>0;
        q = i_status(q1==1)==1 & qr_status(q1==1)==0 & r_status(i)==0;
        if sum(q,'all')>=1 && rx<=i_chance
            i_status(i) = 1; rx2 = randi([1 1000],1,1)/1000;
            if rx2<=0.2
                usymptomatic(i) = 1;
            end
        end
    end
    
    suseptible(t) = sum(i_status==0 & r_status==0,'all');
    quarantined(t) = sum(i_status==1 & r_status==0 & qr_status==1,'all');
    infected(t) = sum(i_status==1 & r_status==0 & qr_status==0,'all');
    removed(t) = sum(i_status==0 & r_status==1,'all');
    
    if (infected(t)>=0.15*N*N && qring==0)
        qring = 1;
    end
    x_u = x(i_status==0 & r_status==0);
    y_u = y(i_status==0 & r_status==0);
    x_i = x(i_status==1 & r_status==0 & qr_status==0);
    y_i = y(i_status==1 & r_status==0 & qr_status==0);
    x_q = x(i_status==1 & r_status==0 & qr_status==1);
    y_q = y(i_status==1 & r_status==0 & qr_status==1);
    x_r = x(i_status==0 & r_status==1);
    y_r = y(i_status==0 & r_status==1);
    
    subject = num2str(t);
    title(subject); figure(1);
    plot(x_u,y_u,'.k',x_i,y_i,'.r',x_r,y_r,'.b',x_q,y_q,'.g');
end

figure(2); plot(1:t,suseptible,'k',1:t,(infected + quarantined),'r',1:t,removed,'b' ...
    ,1:t,quarantined,'g');
disp(max(removed)/N^2);