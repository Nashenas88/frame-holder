use <../pills/dimensions.scad>
use <../pills/image_plate.scad>
use <../pills/led_strip.scad>
use <../pills/m3_screw.scad>
use <../pills/m3_insert.scad>
use <../pills/electronics.scad>
use <../parts/plate_spacer.scad>
use <../parts/led_holder.scad>
use <../parts/back_plate.scad>
use <../parts/front_cover.scad>
use <../parts/back_cover.scad>
use <../parts/electronics_holder.scad>
use <../parts/edge_fix.scad>

translate([0, 0, separator_thickness()])
color("blue")
    image_plate();
color("blue")
    led_strip();

color("yellow")
plate_spacer();
translate([0, 0, plate_thickness()+separator_thickness()])
color("yellow")
plate_spacer();

rotate([180, 0, 0])
color("green")
led_holder();



translate([0, 0, separator_thickness()*2+plate_thickness()])
union() {
    translate([0, 0, separator_thickness()])
    color("white")
        image_plate();
    color("white")
        led_strip();

    color("yellow")
    plate_spacer();
    translate([0, 0, plate_thickness()+separator_thickness()])
    color("yellow")
    plate_spacer();

    translate([0, 0, led_width()])
    color("green")
    led_holder();
}

// translate([-40, 30, 0])
// union() {
// // color("red")
// // electronics();
// color([1, 1, 1, 0.2])
// electronics_holder();
// }

color("brown")
back_plate();

translate([0, 0, -30])
back_cover();

module screw_assembly() {
    color("gray")
    union() {
        translate([0, 0, -10])
        m3_screw();
        translate([0, 0, 15])
            rotate([180, 0, 0])
            m3_insert();
    }
}

translate([-plate_width()/2 + hole_offset(), -plate_height() / 2 + hole_offset(), 0])
    screw_assembly();
translate([-plate_width()/2 + hole_offset(), plate_height() / 2 - hole_offset(), 0])
    screw_assembly();
translate([plate_width()/2 - hole_offset(), plate_height() / 2 - hole_offset(), 0])
    screw_assembly();
translate([plate_width()/2 - hole_offset(), -plate_height() / 2 + hole_offset(), 0])
    screw_assembly();



translate([0, 0, 22])
color([1, 1, 1, 0.5])
front_cover();

translate([0, 0, 50])
edge_fix();


back_plate_width = plate_width() + 12;
back_plate_height = plate_height() + 12;
thickness = 4;
mounting_width = 20;
mounting_inset = 15;
translate([-back_plate_width/2+10+mounting_inset, back_plate_height/2 - mounting_width/2, -23])
    screw_assembly();
translate([back_plate_width/2-10-mounting_inset,-back_plate_height/2 + mounting_width/2, -23])
    screw_assembly();