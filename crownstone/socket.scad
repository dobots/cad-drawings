
module box() {
	box_h = 45;
	box_r = 71/2;
	box_r_in = 65/2;
	difference() {
		translate([0, 0, -box_h]) {
			cylinder(h=box_h, r=box_r, $fa=10);
		}

		// Bottom is 1.5mm thick
		translate([0, 0, 1.5-box_h]) {
			cylinder(h=box_h, r=box_r_in, $fa=10);
		}
	}

	cube_dist = 54; // Distance between the two cubes
	cube_h = 19;
	cube_w = box_r - cube_dist/2;
	cube_l = 9;

	translate([(cube_dist+cube_w)/2, 0, -cube_h/2]) {
		cube([cube_w, cube_l, cube_h], center=true);
	}
	translate([-(cube_dist+cube_w)/2, 0, -cube_h/2]) {
		cube([cube_w, cube_l, cube_h], center=true);
	}

}

module socket() {
	plate_h = 1;
	socket_w = 49.5;
	socket_whole_h = 28.5; // Including plate
	socket_h = 12.5;
	socket_l = 37;
	ground_h = 19; // Including plate
	ground_w = 7;
	ground_l = 46;

	translate([0, 0, -socket_h/2 -(socket_whole_h-socket_h-plate_h)]) {
		cube([socket_w, socket_l, socket_h], center=true);
	}
//	echo(socket_whole_h-socket_h-plate_h);


	translate([0, 0, -ground_h/2 -(-plate_h)]) {
		cube([ground_w, ground_l, ground_h], center=true);
	}

	
	
}

box();

socket();