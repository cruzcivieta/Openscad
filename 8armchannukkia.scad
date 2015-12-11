module arm2(){

module arm()
{
difference()
{
cylinder(r = 3, $fn = 100 , h = 2,center= true);
translate([2,1,0])
	cylinder(r = 4 , $fn = 100 , h = 3,center= true);

	}
}

arm();
translate([2,-2.75,0])
	cube([4,0.5,2], center = true);

translate([-2.4,2.2,0])
	cube([0.5,2,0.5], center = true);
translate([-2.4,3.1,0])
	cube([2,0.2,2], center = true);
difference(){

translate([-2.4,4.1,0])
rotate([90,90,0])
	cylinder(r = 1, h = 2 , $fn = 100, center = true);
translate([-2.4,4.1,0])
rotate([90,90,0])
	cylinder(r = 0.5, h = 3 , $fn = 100, center = true);
}
}

module arm3(){
arm2();
translate([-3,0,0])
arm2();
}

module arm4(){
arm3();
translate([-6,0,0])
arm3();
}
translate([2,0,0])
arm4();
rotate([0,180,0])
translate([-2,0,0])
arm4();

translate([2,0,0])
	cube([0.5,6,0.5], center = true);



difference(){
rotate([90,90,0])
translate([0,2,-6])
	cylinder(r = 1, h = 14, $fn = 100);
translate([2,0,0])
	rotate([0,45,0])	
		cube([1.7,6,1.7], center = true);

rotate([0,90,90])
translate([0,-2,4.1])
	cylinder(r = 0.5, h = 2, $fn = 100);
}
translate([2,4.1,0])

cube([2,0.2,2], center = true);
hull(){
translate([2,-6.1,0])
	cube([2,0.2,2], center = true);
translate([2,-8.1,0])
	cube([4,0.2,4], center = true);
}