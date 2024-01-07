clc;clear all;close all;
tb=1;fs=10;
t=0:tb/100:1;
c=sqrt(2/tb)*sin(2*pi*fs*t);
subplot(5,1,1);
plot(t,c);
title('carrier signal');
xlabel('t');
ylabel('c(t)');
n=8;
m=rand(1,n);
t1=0;t2=tb;
for i=1:n
    t=[t1:0.01:t2];
    if m(i)>0.5
        m(i)=1;
        m_s=ones(1,length(t));
    else
        m(i)=0;
        m_s=zeros(1,length(t));
    end
    message(i,:)=m_s;
    subplot(5,1,2);
    stem(m);
    title('binary data');
    xlabel('n');
    ylabel('b(n');
    grid on;
    subplot(5,1,3);
    plot(t,message(i,:),'r');
    axis([0 n -2 2]);
    title('message signal');
    xlabel('t');
    ylabel('m(t)');
    grid on;
    hold on;
    ask_sig(i,:)=c.*m_s;
    subplot(5,1,4);
    plot(t,ask_sig(i,:));
    title('ask signal');
    xlabel('t');
    ylabel('s(t)');
    axis([0 n -2 2]);
    grid on;
    hold on;
    t1=t1+(tb+0.01);
    t2=t2+(tb+0.01);
end 
hold off
t1=0;t2=tb
for i=1:n
    t=[t1:0.01:t2];
    x=sum(c.*ask_sig(i,:));
    if x>0
        demod(i)=1;
    else
        demod(i)=0;
    end
    t=t1+(tb+0.01);
    t=t2+(tb+0.01);
end
subplot(5,1,5);
stem(demod);
title('ask demodulation');
xlabel('n');
ylabel('b(n)');
    
    