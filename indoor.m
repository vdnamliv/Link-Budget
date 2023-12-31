% Parameters
freq = 2.4e9; % Frequency in Hertz (2.4 GHz for example)
transmitPower = 20; % Transmit power in dBm
antennaGainTx = 5; % Transmit antenna gain in dBi
antennaGainRx = 3; % Receive antenna gain in dBi
pathLossExponent = 2; % Path loss exponent
distance = 1:0.1:100; % Distance in meters

% Free space path loss (in dB)
freeSpaceLoss = 20 * log10(distance) + 20 * log10(freq) + 20 * log10(4 * pi / 3e8);

% Link budget calculation (in dBm)
receivedPower = transmitPower + antennaGainTx + antennaGainRx - freeSpaceLoss;

% Threshold (arbitrary value for coverage, e.g., -80 dBm)
threshold = -80;

% Coverage area determination
coverageAreaIndoor = distance(receivedPower > threshold);

% Plot results
figure;
plot(distance, receivedPower, 'LineWidth', 2);
hold on;
plot(coverageAreaIndoor, ones(size(coverageAreaIndoor)) * threshold, 'r--', 'LineWidth', 2);
xlabel('Distance (meters)');
ylabel('Received Power (dBm)');
title('Link Budget and Coverage Area (Indoor)');
legend('Received Power', 'Coverage Threshold');
grid on;
hold off;

