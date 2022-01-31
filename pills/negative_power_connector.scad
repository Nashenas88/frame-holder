use <power_connector.scad>

thickness=4;
width = 9;
height = 11;
module negative_power_connector() {
    cube([width, height, thickness], center=true);
}

negative_power_connector();
