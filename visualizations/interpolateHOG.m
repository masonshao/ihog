% interpolateHOG(left, right, steps)
%
% Interpolates between 'left' and 'right' in HOG space, inverting the path.
% Uses 'n' steps between endpoints. If 'n' is not specified, show 10 steps.
function interpolateHOG(left, right, n),

if ~exist('n', 'var'),
  n = 10;
end

ny = size(left,1)*8+16;
nx = size(left,2)*8+16;

bigfig = zeros(ny, nx * n);

fprintf('ihog: interpolate: ');
c = 1;
for i=0:1./n:1,
  fprintf('.');
  x = (1-i)*left + i*right;
  ihog = invertHOG(x);
  bigfig(:, (c-1)*nx+1:c*nx) = ihog;
  c = c + 1;
end
fprintf('\n');

imagesc(bigfig);
axis image;
