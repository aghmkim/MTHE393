function[M]=Manual_Experimental_Bode_Script_Alyssa(loopNumber, stepSize)
    %% Filter Script for Hand Experimental Bode Plot
    y=zeros(loopNumber,1);
    max=zeros(loopNumber,1);
    min=zeros(loopNumber,1);
    cntr=zeros(loopNumber,1);
    amp=zeros(loopNumber,1);
    coeffs=zeros(loopNumber,1);
    freq = zeros(loopNumber,1);
    for i=1:stepSize:loopNumber
        funcName=sprintf('sin%d.output.signal',i);
        y(i) = medfilter(funcName,200);
        %y(i) = smooth(funcName,0.01);
        max(i) = max(y(i));
        min(i) = min(y(i));
    end
    for i=1:stepSize:loopNumber
        cntr(i)=(max(i)+min(i))/2;
        amp(i)=abs(max(i)-cntr(i));
    end
    mag = zeros(loopNumber,1);

    for i= 1:stepSize:loopNumber
        mag(i) = 20*log(amp(i));
        coeffs(i)=i;
        freq(i) = (coeffs(i)) / (2*pi);
    end

    
    for j=1:length(coefficients)
        
    end

    figure
    semilogx (freq, mag)

    max10 = max(y10);
end