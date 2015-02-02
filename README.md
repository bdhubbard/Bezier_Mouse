# Bezier_Mouse
# Processing program to trace the mouse path with a Bezier curve
# Draws a bezier connected curve between mouse points
# uses the bezier function and tangent segment joints
# Has 3 bezier functions (for now) -
# bz1 to start a run
# bz2 for the middle points
# bz3 for the last point
#
# Makes heavy use of PVector to make point handling more convenient, 
# but no attention has been put towards allocating these efficiently
#
# Bruce Hubbard 2015/02/01 
# V1.0, Derived from description at:
#  http://www.benknowscode.com/2012/09/path-interpolation-using-cubic-bezier_9742.html

