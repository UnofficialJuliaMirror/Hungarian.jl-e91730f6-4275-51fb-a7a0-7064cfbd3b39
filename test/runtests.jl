using Hungarian
using Base.Test

# test for simple examples
A = [ 92    99     1     8    15    67    74    51    58    40;
      98    80     7    14    16    73    55    57    64    41;
       4    81    88    20    22    54    56    63    70    47;
      85    87    19    21     3    60    62    69    71    28;
      86    93    25     2     9    61    68    75    52    34;
      17    24    76    83    90    42    49    26    33    65;
      23     5    82    89    91    48    30    32    39    66;
      79     6    13    95    97    29    31    38    45    72;
      10    12    94    96    78    35    37    44    46    53;
      11    18   100    77    84    36    43    50    27    59]

assignment = [0  0  1  0  0  0  0  0  0  0;
              0  0  0  0  1  0  0  0  0  0;
              1  0  0  0  0  0  0  0  0  0;
              0  0  0  0  0  0  0  0  0  1;
              0  0  0  1  0  0  0  0  0  0;
              0  0  0  0  0  0  0  1  0  0;
              0  0  0  0  0  0  1  0  0  0;
              0  0  0  0  0  1  0  0  0  0;
              0  1  0  0  0  0  0  0  0  0;
              0  0  0  0  0  0  0  0  1  0]

Z = munkres(A)
@test find(Z.==maximum(Z)) == find(assignment)

Z = munkres(ones(5,5) - eye(5))
@test find(Z.==maximum(Z)) == find(eye(5))

# test for random examples
@time munkres(rand(1000,1000))
