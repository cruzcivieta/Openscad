FRONT_ROTATE = [90, 90, 90];

FINE_RESOLUTION = 10;
VERY_FINE_RESOLUTION = 100;

module body() 
{
    module top_cilinder()
    {
        offset = [0, 0, 0.3];
        radio = 0.1;
        height = 4;

        translate(offset)
            rotate(FRONT_ROTATE)
                cylinder(r = radio, h = height, $fn = FINE_RESOLUTION, center = true);
    }
    
    module large_body_top()
    {
        radio = 2;
        height = 0.1;
        
        first_offset = [2,0,0];
        translate(first_offset)
            cylinder(r = radio,h = height ,$fn = VERY_FINE_RESOLUTION, center = true);
        
        second_offset = [-2,0,0];
        translate(second_offset)	
            cylinder(r = radio,h = height ,$fn = VERY_FINE_RESOLUTION, center = true);
    }

    module height_body_top()
    {
        radio = 1.5;
        height = 0.1;
        
        offset = [1, 0, 0.75];
        translate(offset)
            cylinder(r = radio,h = height ,$fn = VERY_FINE_RESOLUTION, center = true);
    }

    module body_top()
    {
        hull()
        {
            large_body_top();
            height_body_top();
        }
    }
    
    module body_bottom() 
    {
        offset = [0, 0, -0.5];
        dimension = [3, 1.5, 1];
        
        translate(offset)
            cube(dimension, center = true);
    }
        
    hull()
    {
        body_top();
        body_bottom();
    }
}

body();

module paw()
{
    module hoof()
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
    
    module claw()
    {
        difference()
        {
            hoof();
            translate([0.1,0.1,10])
                cylinder(r = 1,$fn = 100 , h = 4, center = true);
        }
    }

    hoof();
        
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
	paw();

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
