load('att_face.mat');

num_testing = size(id_testing,1);
num_training = size(id_training,1);
id_predict = zeros(size(id_testing));

scale = 3;

for i = 1:num_testing
%% extract testing image
    img_test = face_testing(:, :, i);
    vec_test = multiscale_sobel_feature(img_test, scale);
    
    error = zeros(num_training, 1);
    for j = 1:num_training
        
%% extract training image
        img_train = face_training(:, :, j);
        vec_train = multiscale_sobel_feature(img_train,scale);
        
%% compute the square error between feature vectors
        diff = vec_train - vec_test;
        error(j) = sum( diff .^2 );
    end
    
%% find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

accuracy = sum(id_testing == id_predict)/num_testing;
fprintf('Accuracy = %f\n', accuracy);

% Using gradient magnitude as features:
%---------------------------------------%
% Scale | Accuracy
%---------------------------------------%
% 1 | 0.5313
%---------------------------------------%
% 2 | 0.5500
%---------------------------------------%
% 3 | 0.5938
%---------------------------------------%
%
% Using gradient orientation as features:
%---------------------------------------%
% Scale | Accuracy
%---------------------------------------%
% 1 | 0.0688
%---------------------------------------%
% 2 | 0.0750
%---------------------------------------%
% 3 | 0.0813
%---------------------------------------%