use <dimensions.scad>

thickness = 3;
module negative_screw() {
    translate([-plate_width()/2 + hole_offset(), -plate_height()/2 + hole_offset(), 0])
        cylinder(h = thickness * 2, r = hole_radius(), center=true);
    translate([plate_width()/2 - hole_offset(), -plate_height()/2 + hole_offset(), 0])
        cylinder(h = thickness * 2, r = hole_radius(), center=true);
    translate([plate_width()/2 - hole_offset(), plate_height()/2 - hole_offset(), 0])
        cylinder(h = thickness * 2, r = hole_radius(), center=true);
    translate([-plate_width()/2 + hole_offset(), plate_height()/2 - hole_offset(), 0])
        cylinder(h = thickness * 2, r = hole_radius(), center=true);
}

negative_screw();