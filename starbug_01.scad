module body_bottom()
{
    translate([0,0,0.3])
    rotate([90,90,90])
        cylinder(r = 0.1, h = 4, $fn = 10, center = true);

    translate([0,0,-0.5])
        cube([3,1.5,1], center = true);
}

module body_up()
{
    hull()
    {
        translate([2,0,0])
            cylinder(r = 2,h = 0.1 ,$fn = 100, center = true);
        translate([-2,0,0])	
            cylinder(r = 2,$fn = 100,h = 0.1, center = true);

        translate([1,0,0.75])
            cylinder(r = 1.5,h = 0.1 ,$fn = 100, center = true);
        translate([1,0,0.75])	
            cylinder(r = 1.5,$fn = 100,h = 0.1, center = true);
    }
}

module body() {
    hull()
    {
        body_up();
        body_bottom();
    }
}

body();

module a5a()
{
module a2a()
{
hull()
{
difference()
{
translate([0,0,10])
	cylinder(r = 1,$fn = 100 , h = 0.2, center = true);
translate([0.1,0.1,10])
	cylinder(r = 1,$fn = 100 , h = 0.3, center = true);

}
translate([0.2,-1,9.75])
	cylinder(r = 0.1,$fn = 100 , h = 1, center = true);

}

}
module a3a()
{
difference()
{
a2a();
translate([0.1,0.1,10])
	cylinder(r = 1,$fn = 100 , h = 4, center = true);

}
}

a2a();
hull()
{
translate([0.2,-1,9.75])
	cylinder(r = 0.1,$fn = 100 , h = 1.4 ,center = true);

translate([2,-0.5,9.75])
	cylinder(r = 0.1,$fn = 100 , h = 0.5, center = true);

}

}

module a6a()
{
rotate([180,-90,90])
translate([-2,3,-11])
	a5a();

}
module a7a()
{
a6a();
translate([-2,0,0])
	a6a();
translate([-4,0,0])
	a6a();
}
module bug()
{
a7a();
translate([0,2.5,0])
	a7a();
}
bug();

//difference()
//{
//translate([0,0,10])
//	cylinder(r = 4, h = 0.2, $fn = 5, center = true);
//translate([0,0,10])
//	cylinder(r = 3.8, h = 0.4, $fn = 5, center = true);
//
//}

translate([1,3.25,10])//e1
	cylinder(r = 0.5,h = 0.1, $fn = 5, center = true);//e1


translate([1,-3.25,10])//e2
	cylinder(r = 0.5,h = 0.1, $fn = 5, center = true);//e2


translate([3.5,0,10])//e3
	cylinder(r = 0.5,h = 0.1, $fn = 5, center = true);//e3

translate([-2.8,-2,10])//e4
	cylinder(r = 0.5,h = 0.1, $fn = 5, center = true);//e4

translate([-2.8,2,10])//e5
	cylinder(r = 0.5,h = 0.1, $fn = 5, center = true);//e5


module star()
{
//int i = 0.2

hull()//e1zue2
{
translate([1,3.25,10])//e1
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e1

translate([1,-3.25,10])//e2
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e2

}
hull()//e2 mit e5
{
translate([1,-3.25,10])//e2
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e2
translate([-2.8,2,10])//e5
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e5

}

hull()//e3 mit e4
{
translate([3.5,0,10])//e3
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e3
translate([-2.8,-2,10])//e4
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e4

}

hull()//e4 mit e1
{
translate([-2.8,-2,10])//e4
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e4
translate([1,3.25,10])//e1
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e1

}

hull()//e3 mit e5
{
translate([3.5,0,10])//e3
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e3
translate([-2.8,2,10])//e5
	cylinder(r = 0.2,h = 0.1, $fn = 5, center = true);//e5

}

}
translate([0,0,-13])
	star();
module b1b()
{
difference()
{
	translate([0,0,10])
		cylinder(r = 5, h = 0.2, $fn = 100 , center = true);
	translate([0.4,0,10])
		cylinder(r = 5, h = 0.3, $fn = 100 , center = true);
}
}
module b2b(){
translate([0,0,-6])
rotate([0,-75,0])
	b1b();

}
module b3b()
{
translate([7.5,0,8])
		b2b();
}
module b4b(){
rotate([0,35,0])
	b3b();
}
translate([-1,0,-2])
	b4b();
hull()
{
translate([0,0,-3.5	])
	cylinder(r = 4, h = 0.2, $fn = 5, center = true);
translate([0,0,-4	])
	cylinder(r = 5, h = 0.2, $fn = 5, center = true);
}
