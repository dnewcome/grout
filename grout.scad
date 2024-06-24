use <parts.scad>

module neck_pickup() {
    pickup_humbucker();
}

module bridge_pickup() {
    pickup_humbucker();
}
    
// sample layout for a tune-o-matic style bridge
module tuneomatic_layout(slug=false) {
    difference() {
        translate([0, -25]) neck_strat();
        if(slug) {
            translate([0, -25]) neck_strat_plate();
        }
    }
    if(slug==false) {
        translate([0, -140]) neck_pickup();
        translate([0, -240]) bridge_pickup();
        translate([0, -320]) bridge(20, 5);
        translate([0, -350]) tailpiece();
    }
}

// sample layout for a jazzmaster style bridge
module jazz_layout(slug=false) {
    difference() {
        translate([0, -25]) neck_strat();
        if(slug) {
            translate([0, -25]) neck_strat_plate();
        }
    }
    if(slug==false) {
        translate([0, -140]) neck_pickup();
        translate([0, -240]) bridge_pickup();
        translate([0, -320]) bridge_jazzmaster();
    }
}

