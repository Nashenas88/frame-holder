use <m3_insert.scad>

module negative_insert() {
    $fs=1;
    $fa=0.4;

    translate([0, 0, 3.82])
    union() {
        translate([0, 0, -(3.82/2)])
        cylinder(h=3.82, r=2.5, center=true);
        translate([0, 0, -0.001])
        linear_extrude(height=3, scale=0.7)
        circle(r=2.5);
    }
}

negative_insert();