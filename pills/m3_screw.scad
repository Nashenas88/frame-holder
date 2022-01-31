length = 30;
radius = 1.5;
module m3_screw() {
    translate([0, 0, length/2])
        cylinder(h=length, r=radius, center=true);
    translate([0, 0, -1.5])
        cylinder(h=3, r=3, center=true);
}

m3_screw();