%% 
training_picture = 'learning.jpg';
L_pozymiai = pozymiai_raidems_atpazinti(training_picture, 7);

P_learning_matrix = cell2mat(L_pozymiai);    % Unite matrices into one
T_learning_matrix = [eye(8), eye(8), eye(8), eye(8), eye(8), eye(8), eye(8)];% Target class matrix

number_of_neurons = 7;
radial_basis_network = newrb(P_learning_matrix, T_learning_matrix, 0, 1, number_of_neurons); % Create radial basis network

testing_picture = 'second.jpg';
T_pozymiai = pozymiai_raidems_atpazinti(testing_picture, 1);

P_testing_matrix = cell2mat(T_pozymiai);    % Unite matrices into one
Y_testing_matrix = sim(radial_basis_network, P_testing_matrix); % Run simulink model

[~, detected_indexes] = max(Y_testing_matrix);

dictionary = ['0', '1', '2', '3', '4', '5', '6', '7'];
md = mod(detected_indexes(), 8);
indx = dictionary(md);
fprintf('Your word is: %s\n', evalc('disp(indx)'));
