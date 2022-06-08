$fn = 50;

thickness = 1;
height = 15 + thickness;

module base(thickness) {
	union(1) {
		polygon(points=[
			[11, 36],
			[11, 37.7],
			[-11, 37.7],
			[-11, 36]
		]);

		polygon(points=[
			[11, -36],
			[8, -41.5],
			[-8, -41.5],
			[-11, -36]
		]);

		square([52.5 + thickness * 2, 72 + thickness + 2] , center= true);
	}
}

// Base
linear_extrude(height = thickness)
	base(0);

// Case
linear_extrude(height= height)
	#difference() {
		base(thickness);

		base(0);
	}

// Pole 1
translate([13, 30, 0])
	linear_extrude(height = height)
	circle(d = 3.8);

// Pole 2
translate([-13, 30, 0])
	linear_extrude(height = height)
	circle(d = 3.8);

// Logo and support
scale([0.7, 0.7, 0.7])
	translate([0, -7, 0])
	linear_extrude(height = thickness + 2)
	offset(0.01)
	import("logo-black.svg", center = true);
