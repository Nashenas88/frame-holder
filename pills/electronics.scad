use <dimensions.scad>

hole_inset = 3.5;
module electronics() {
    translate([0, 0, -electronics_thickness()/2-3])
    difference() {
        cube([electronics_width(), electronics_height(), electronics_thickness()], center=true);
        translate([-electronics_width()/2 + hole_inset, 0, 0])
        cylinder(h=electronics_thickness()*2, r=1.5, center=true);
    }
}

electronics();