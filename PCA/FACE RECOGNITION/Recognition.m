function OutputName = Recognition(TestImage, m, A, Eigenfaces)

ProjectedImages = [];
Train_Number = size(A,2);
for i = 1 : Train_Number
    temp = Eigenfaces' * A(:,i); 
    ProjectedImages = [ProjectedImages temp]; 
end

InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
Projected_TestImage = Eigenfaces'*Difference; 


Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( Projected_TestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);
OutputName = strcat(int2str(Recognized_index),'.jpg');