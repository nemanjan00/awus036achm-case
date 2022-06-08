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
			[8, -41],
			[-8, -41],
			[-11, -36]
		]);

		square([53 + thickness * 2, 72.5 + thickness * 2] , center= true);
	}
}

module lower() {
	union(1) {
		// Base
		linear_extrude(height = thickness)
			base(0);

		// Case
		linear_extrude(height= height)
			difference() {
				base(thickness);

				base(0);
			}

		// Pole 1
		translate([13, 30, 0])
			linear_extrude(height = height)
			circle(d = 3.2);

		// Pole 2
		translate([-13, 30, 0])
			linear_extrude(height = height)
			circle(d = 3.2);

		// Logo and support
		scale([0.7, 0.7, 0.7])
			translate([0, -7, 0])
			linear_extrude(height = thickness + 2)
			offset(0.01)
			import("logo-black.svg", center = true);
	}
}

module upper() {
	union(1) {
		// Base
		linear_extrude(height = thickness)
			base(thickness);

		linear_extrude(height = height * 0.2)
			difference() {
				base(0);

				base(thickness * -1);
			}
	}
}
