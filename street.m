% Parameters for outdoor (street) environment
transmitPowerStreet = 23; % (dBm)
antennaGainTxStreet = 7; % (dBi)
antennaGainRxStreet = 5; % (dBi)

freeSpaceLossStreet = 20 * log10(distance) + 20 * log10(freq) + 20 * log10(4 * pi / 3e8);

receivedPowerStreet = transmitPowerStreet + antennaGainTxStreet + antennaGainRxStreet - freeSpaceLossStreet;

thresholdStreet = -85;

coverageAreaStreet = distance(receivedPowerStreet > thresholdStreet);

% Plot results for outdoor environment
figure;
plot(distance, receivedPowerStreet, 'LineWidth', 2);
hold on;
plot(coverageAreaStreet, ones(size(coverageAreaStreet)) * thresholdStreet, 'r--', 'LineWidth', 2);
xlabel('Distance (meters)');
ylabel('Received Power (dBm)');
title('Link Budget and Coverage Area (Outdoor)');
legend('Received Power', 'Coverage Threshold');
grid on;
hold off;
