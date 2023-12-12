%% 
training_picture = 'Letters.jpg';
L_pozymiai = pozymiai_raidems_atpazinti(training_picture, 3);

P_learning_matrix = cell2mat(L_pozymiai);    % Unite matrices into one
T_learning_matrix = eye(size(L_pozymiai, 2));% Target class matrix

number_of_neurons = 10;
radial_basis_network = newrb(P_learning_matrix, T_learning_matrix, 0, 1, number_of_neurons); % Create radial basis network

testing_picture = 'word.jpg';
T_pozymiai = pozymiai_raidems_atpazinti(testing_picture, 1);

P_testing_matrix = cell2mat(T_pozymiai);    % Unite matrices into one
Y_testing_matrix = sim(radial_basis_network, P_testing_matrix); % Run simulink model

[~, detected_indexes] = max(Y_testing_matrix);

dictionary = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O'];
fprintf('Your word is: %s\n', evalc('disp(dictionary(detected_indexes()))'));
