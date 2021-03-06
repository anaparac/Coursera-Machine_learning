function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

Cvalue = [0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0, 30.0];
sigmaValue = [0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0, 30.0];

minError = inf;
for i = 1:length(Cvalue)
	for j = 1:length(sigmaValue)
		model = svmTrain(X, y, Cvalue(i), @(x1, x2) gaussianKernel(x1, x2, sigmaValue(j)));
		predictions = svmPredict(model, Xval);
		predError = mean(double(predictions ~= yval));

		if (predError <= minError)
			minError = predError;
			C = Cvalue(i);
			sigma = sigmaValue(j);
        end
    end
end






% =========================================================================

end
