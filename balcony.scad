translate([2350,910,0])
mirror([1,0,0])
rotate([0,0,-90])
wall(650);

translate([20,910,0])
rotate([0,0,-90])
wall(650);
// translate([20,1200,0])
// rotate([0,0,-90])
// wall(250);

translate([365+820,0,30])
wall(780);
translate([365,0,30])
wall(780);
module wall(width = 2000) {
    gap = 5;
    frame(width);
    translate([0,0,720 - gap + 40])
    mirror([0,0,1])
    frame(width);

    translate([0,0,720 - gap/2 + 40])
    rotate([0,90,0])
    frame(720 + 40);
    translate([width,0,720 - gap/2 + 40])
    mirror([1,0,0])
    rotate([0,90,0])
    frame(720 + 40);

    module frame(width = 10) {
        echo(width);
        difference() {
            cube([width, 28, 120 - gap]);
            translate([0.2 + gap/2, -0.2,0])
            rotate([0,-45,0])
            cube([400, 40, 400]);
            translate([width - 120 - gap/2, -0.2,120])
            rotate([0,45,0])
            cube([400, 40, 400]);
        }
    }

    translate([120,0,125])
    for(i = [0:1:3]){
        translate([0,0,i*(120 + 10)])
        cube([width - 120 * 2, 22, 120 - gap]);
        echo(width - 120 * 2 + 40);
    }
}

color([0.2,0.2,0.2])
bars();
color([0.8,0.8,0.7])
plate();
translate([0,0,786])
color([0.2,0.2,0.2])
topFlat();
translate([60,30,1080])
color([0.2,0.2,0.2])
topBar();
color([0.6,0.55,0.4])
floor();

module floor() {
    translate([390,350,0])
    for(i = [0:1:1]) {
        translate([0,600*i,0])
        for(i = [0:1:3]) {
            translate([600*i,0,0])
            for(i = [0:1:3]) {
                rotate([0,0,90*i])
                tile();
            }
        }
    }
}

module tile() {
    cube([300,300,3]);
    for(i = [0:1:4]) {
        translate([5,5 + 60 * i,0])
        cube([290, 50, 8]);
    }
}

module bars() {
    translate([290 + 40,0,0]) {
        for(i = [0:1:2]) {
            translate([820*i,0,0])
            cube([30,50,1080]);
        }
    }

    translate([2300,0,0]) {
        translate([0,220,0])
        cube([50,30,1080]);
        translate([0,920,0])
        cube([50,30,1080]);
    }
    translate([40,0,0]) {
        translate([0,220,0])
        cube([50,30,1080]);
        translate([0,920,0])
        cube([50,30,1080]);
    }
}

module plate() {
    translate([40-15*2,0,0])
    cube([15, 1210, 786]);
    translate([15,-15,0])
    rotate([0,0,-90])
    cube([15, 2350, 786]);
    translate([2350+15,0,0])
    cube([15, 1210, 786]);
}

module topFlat() {
    cube([40, 1210, 30]);
    rotate([0,0,-90])
    cube([40, 2390, 30]);
    translate([2350, 0, 0])
    cube([40, 1210, 30]);
}

module topBar() {
    rotate([-90,0,0])
    cylinder(r = 15, h = 1210);
    rotate([0,90,0])
    cylinder(r = 15, h = 2270);
    translate([2270,0,0])
    rotate([-90,0,0])
    cylinder(r = 15, h = 1385);
}