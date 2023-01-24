use <primitives.scad>

// stratocaster style neck
module neck_strat() {
    w1 = 50;
    w2 = 55;
    h = 60;
    d = 5;
    difference() {
        rnd_trap(w1, w2, h, d);
        translate([-w1/2, h/2]) circle(d=2);
        translate([w1/2, h/2]) circle(d=2);
        translate([w1/2, -h/2]) circle(d=2);
        translate([-w1/2, -h/2]) circle(d=2);
    }
}
  
// pickup-ring style humbucker
module pickup_humbucker() {
    w = 100;
    h = 50;
    wing_w = 120;
    wing_h = 20;
    router_d = 6;
    screw_d = 2;
    screw_w = 110;
    screw_h = 60;
    
    // pickup cavity
    rnd_rect_ctr(wing_w, wing_h, router_d);
    rnd_rect_ctr(w, h, router_d);
    
    // pickup ring screw holes
    translate([-screw_w/2, screw_h/2]) circle(d=screw_d);
    translate([screw_w/2, screw_h/2]) circle(d=screw_d);
    translate([screw_w/2, -screw_h/2]) circle(d=screw_d);
    translate([-screw_w/2, -screw_h/2]) circle(d=screw_d);
}

// plain stop tailpiece
module tailpiece_stop() {
    r = 2;
    w1 = 20;
    w2 = 20;
    h = 20;
    translate([-w1/2+r/2,h/2-r/2]) circle(r = r);
    translate([w1/2-r/2, h/2-r/2]) circle(r = r);
    translate([-w2/2+r/2, -h/2+r/2]) circle(r = r);
    translate([w2/2-r/2, -h/2+r/2]) circle(r = r);
}

module bridge_tuneomatic(ctr, d) {
    translate([-ctr/2, 0]) circle(d);
    translate([ctr/2, 0]) circle(d);
}

module bridge_jazzmaster() {
    w = 2.75 * 25.4;
    w2 = 0.625 * 25.4;
    h = 2.5 * 25.4;
    h2 = 3.125 * 25.4;
    rtr_bit_d = 3;
    rnd_rect_ctr(w, h, rtr_bit_d);
    translate([0, 10]) rnd_rect_ctr(w2, h, rtr_bit_d);
    // todo: locate screw holes
    
}
    
    
    
neck_strat();

