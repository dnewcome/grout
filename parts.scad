// adjust items according to scale
scale_len = 25 * 25.4;

// allow for 21 vs 22/24 fret neck
nut_to_last_fret = 15 * 25.4;

// neck bolt pattern offset
neck_offset = 0 * 25.4;

module rnd_rect_ctr(w, h, r) {
    rnd_trap(w, w, h, r);
}
 
module rnd_trap(w1, w2, h, r) {
    hull() {
        translate([-w1/2+r/2,h/2-r/2]) circle(r = r);
        translate([w1/2-r/2, h/2-r/2]) circle(r = r);
        translate([-w2/2+r/2, -h/2+r/2]) circle(r = r);
        translate([w2/2-r/2, -h/2+r/2]) circle(r = r);
    }
}

module neck_pocket() {
    // TODO: locate screw holes
    rnd_trap(50, 55, 60, 5);
}
  
module pickup_humbucker() {
    // TODO: locate screw holes
    rnd_rect_ctr(120, 20, 10);
    rnd_rect_ctr(100, 50, 10);
}

module tailpiece() {
    r = 2;
    w1 = 20;
    w2 = 20;
    h = 20;
        translate([-w1/2+r/2,h/2-r/2]) circle(r = r);
        translate([w1/2-r/2, h/2-r/2]) circle(r = r);
        translate([-w2/2+r/2, -h/2+r/2]) circle(r = r);
        translate([w2/2-r/2, -h/2+r/2]) circle(r = r);

}

module bridge(ctr, d) {
    translate([-ctr/2, 0]) circle(d);
    translate([ctr/2, 0]) circle(d);
    }

module jazzmaster_bridge() {
    w = 2.75 * 25.4;
    w2 = 0.625 * 25.4;
    h = 2.5 * 25.4;
    h2 = 3.125 * 25.4;
    rtr_bit_d = 3;
    rnd_rect_ctr(w, h, rtr_bit_d);
    translate([0, 10]) rnd_rect_ctr(w2, h, rtr_bit_d);
    // todo: locate screw holes
    
}
    
    
    


