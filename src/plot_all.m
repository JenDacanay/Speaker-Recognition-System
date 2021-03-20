function plot_all(n)
% Plots all raw signals
figure() 
    for i=1:n
        subplot(n,1,i);
        sgtitle('Raw Signals')
        sn = sprintf('s%d',i);
        y=eval(sn);
        plot((1:length(y)),y)
        title(['s', num2str(i),'.wav'])
        xlabel('Time (s)'); ylabel('Amplitude')
    end
end