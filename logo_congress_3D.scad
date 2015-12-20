module a1c()
{
module a1b()
{
difference()
{
cylinder(r = 10, h = 40, $fn = 200, center = true);
translate([0,0,5])
cylinder(r = 9.25, h = 45, $fn = 200, center = true);
}
module deckel()
{
difference()
{
translate([0,0,20])
sphere(r = 10, $fn = 200, center = true);
translate([0,0,20])
sphere(r = 9.75, $fn = 200, center = true);
cylinder(r = 9.25, h = 46, $fn = 200, center = true);

}
}
deckel();
difference()
{
translate([0,0,33])
cylinder(r1 = 3, r2 = 3,h = 8, $fn = 200 , center = true);

translate([0,0,33])
cylinder(r = 2.5,h = 10, $fn = 200 , center = true);
}
}
difference(){
a1b();
translate([0,10,0])
cube([20,10,60], center = true);
}
}
module pns()
{
rotate([0,90,0])
a1c();
}
rotate([30,0,0])
pns();

hull()
{
translate([4,0,-9])
cube([20,5,0.1],center = true);
translate([4,0,-15])
cube([30,10.5,0.1],center = true);
}
translate([0,0,-5])
cube([40,15.5,0.1],center = true);


translate([10,0,-2])
rotate([0,0,45])
cube([4,4,6], center = true);

hull()
{
translate([10,0,1])
rotate([0,0,45])
cube([4,4,0.1],center = true);


translate([10,0,3])
rotate([0,0,45])
cube([0.1,4,0.1],center = true);
}
difference()
{
translate([4,4,-3.3])
rotate([0,0,20])
cube([3,2.5,3], center = true);
translate([4.25,5.5,-2.5])
rotate([0,0,25])
cube([0.5,0.7,0.4], center = true);

}

hull()
{
translate([4,4,-1.75])
rotate([0,0,20])
cube([3,2.5,0.1], center = true);
translate([4,4,-1])
rotate([0,0,20])
cube([3,0.1,0.1], center = true);

}

translate([1.5,0.5,-2.75])
rotate([0,0,-25])
cube([3.5,3.5,4], center = true);
hull()
{
translate([1.5,0.5,-0.75])
rotate([0,0,-25])
cube([3.5,3.5,0.1], center = true);
translate([2.5,1,0.25])
rotate([0,0,-25])
cube([0.1,2,0.1], center = true);
}
hull()
{
translate([1.5,0.5,-0.75])
rotate([0,0,-25])
cube([3.5,3.5,0.1], center = true);
translate([1.5,0.5,0.25])
rotate([0,0,-25])
cube([2,0.1,0.1], center = true);
}

translate([4.75,-2.5,-1.5])
cylinder(r = 0.5, h = 6, $fn = 100, center = true);
translate([4.75,-2.5,2])
cylinder(r1 = 0.6, r2 = 0.01, h = 1, $fn = 100, center = true);
hull()
{
translate([3.25,-2.75,-2])
rotate([0,0,20])
cube([3,2.5,0.1], center = true);

translate([3.25,-2.75,-1])
rotate([0,0,20])
cube([3,0.1,0.1], center = true);

}
translate([3.25,-2.75,-3.25])
rotate([0,0,20])
cube([3,2.5,2.5], center = true);

module haus()
{
cube([3.5,2,2.5], center = true);

}

hull()
{
translate([-1.5,-2,-3.5])
haus();
translate([-1.5,-2,-1.75])
cube([3.5,0.1,0.1], center = true);

}

hull()
{
translate([-4.5,2.5,-2.5])
rotate([0,0,20])
cube([3.5,2,4], center = true);
translate([-4.5,2.5,0])
rotate([0,0,20])
cube([3.5,0.1,0.1], center = true);

}
translate([-4.5,2.5,0])
rotate([0,0,20])
cube([0.4,0.4,0.8], center = true);
hull()
{
translate([-6.5,-2,-3.5])
cube([3.5,2,2.5], center = true);
translate([-6.5,-2,-1.75])
cube([3.5,0.1,0.1], center = true);

}


hull()
{
translate([-8.5,-4,-3.5])
cube([3.5,2,2.5], center = true);
translate([-8.5,-4,-1.75])
cube([3.5,0.1,0.1], center = true);

}
