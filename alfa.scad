$fn = 50;

thickness = 1;
height = 15 + thickness;

linear_extrude(height = thickness)
    union(1) {
        polygon(points=[
            [11, 36],
            [11, 39],
            [-11, 39],
            [-11, 36]
        ]);
 
        polygon(points=[
            [11, -36],
            [8, -41],
            [-8, -41],
            [-11, -36]
        ]);
 
        square([53, 73] , center= true);
     };
 
 linear_extrude(height= height)    
  #difference() {
    union(1) {
        polygon(points=[
            [11, 36],
            [11, 39],
            [-11, 39],
            [-11, 36]
        ]);
 
        polygon(points=[
            [11, -36],
            [8, -39 - thickness],
            [-8, -39 - thickness],
            [-11, -36]
        ]);
 
        square([53 + thickness * 2, 73 + thickness + 2] , center= true);
     };
     
    union(1) {
        polygon(points=[
            [11, 36],
            [11, 39],
            [-11, 39],
            [-11, 36]
        ]);
 
        polygon(points=[
            [11, -36],
            [8, -41],
            [-8, -41],
            [-11, -36]
        ]);
 
        square([53, 73] , center= true);
     };
  }
     
translate([13, 30, 0])
    linear_extrude(height = height)
    circle(d = 4);
    
translate([-13, 30, 0])
    linear_extrude(height = height)
    circle(d = 4);

#linear_extrude(height = thickness + 2)
    offset(0.01)
    import("logo-black.svg", center = true); 