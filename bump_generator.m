function [position, dirac_comb_array, acceleration] = bump_generator(speed, bump_space_period, sampling_frequency, width_bump, height_bump, height_corrugation)
    %BUMP_FUNCTION Generates a comb of anomalies evenly-spaced 
    %   Detailed explanation goes here
    
    N_x = int32(sampling_frequency * bump_space_period / speed);  %number of samples
    
    kernel_width = round(sampling_frequency * width_bump / speed);  %number of samples
    kernal_array = zeros(kernel_width,1);
    % Kernel Generator
    
    for index = 1:kernel_width
        position = index;
        kernal_array(index) = exp((-abs(position-kernel_width/2)^2)/(2*kernel_width));
    end
    
    % Comb Generator
    dirac_comb_array = zeros(N_x,1); 
    dirac_comb_array(3) = height_bump;
    dirac_comb_array = repmat(dirac_comb_array,10,1);
    
    % Convolution
    dirac_comb_array = conv(dirac_comb_array,kernal_array);
    
    
    % Add Corrugation
    for index = 1:size(dirac_comb_array)
        spatial_period = 23;
        omega = 2*pi / (sampling_frequency * spatial_period / speed);
        position = index;
        dirac_comb_array(index) = dirac_comb_array(index) + height_corrugation*cos(omega*position + (height_corrugation/10)*randn());
        dirac_comb_array(index) = dirac_comb_array(index) + (height_corrugation/100)*randn();
    end
    
    % Second Kernel Generator
    
    for index = 1:kernel_width/100
        position = index;
        kernal_array(index) = exp((-abs(position-kernel_width/200)^2)/(kernel_width/100));
    end
    
    
    % Convolution
    dirac_comb_array = conv(dirac_comb_array,kernal_array);
    N = size(dirac_comb_array);
    position = linspace(0,speed*N(1)/sampling_frequency, N(1));
    
    % differentiation
    dx = diff(position);
    dy = diff(dirac_comb_array)';
    dydx = dy./dx;
    ddydx = diff(dydx);
    leng = size(ddydx);
    acceleration = ddydx ./ dx(1:leng(2));
    
end

