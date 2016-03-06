FRONT_ROTATE = [90, 90, 90];

LOW_RESOLUTION = 5;
FINE_RESOLUTION = 10;
VERY_FINE_RESOLUTION = 100;
ARRAY_BASE_CORRECTION = -1;

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

module paw()
{
    module hoof()
    {
        module half_moon() {
            
            module cilynder(offset) {
                radio = 1;
                height = 0.2;
                
                translate(offset)
                    cylinder(r = radio, $fn = VERY_FINE_RESOLUTION , h = height, center = true);
            }
            
            difference()
            {
                part_visible_offset = [0, 0, 10];
                cilynder(part_visible_offset);
                
                hidden_part_offset = [0.1, 0.1, 10];
                cilynder(hidden_part_offset);

            }
        }
        
        module broadness() {
            offset = [0.2, -1, 9.75];
            radio = 0.1;
            heigh = 1;
            
            translate(offset)
                cylinder(r = radio, $fn = VERY_FINE_RESOLUTION , h = heigh, center = true);
        }
        
        hull()
        {
            half_moon();
            broadness();
        }

    }
    
    module claw()
    {
        module shape_difference() {
            offset = [0.1, 0.1, 10];
            radio = 1;
            height = 4;
            
            translate(offset)
                cylinder(r = radio,$fn = VERY_FINE_RESOLUTION , h = height, center = true);
        }
        
        difference()
        {
            hoof();
            shape_difference();
        }
    }
    
    module thigh()
    {
        module top() {
            offset = [0.2, -1, 9.75];
            radio = 0.1;
            height = 1.4;
            
            translate(offset)
                cylinder(r = radio, $fn = VERY_FINE_RESOLUTION, h = height, center = true);
        }
        
        module bottom() {
            offset = [2, -0.5, 9.75];
            radio = 0.1;
            height = 0.5;
            
            translate(offset)
                cylinder(r = radio, $fn = VERY_FINE_RESOLUTION , h = height, center = true);
        }
        
        hull()
        {
            top();
            bottom();
        }
    }

    

    thigh();
    hoof();   

}

module paws()
{
    SPACER_X = 2;
    OFFSET_X = -4;
    
    module located_paw(offset_x)
    {
        position = [-2, 3, -11];
        rotation = [180,-90,90];
        
        translate([offset_x, 0, 0])
            rotate(rotation)
                translate(position)
                    paw();

    }

    module group_paws(offset_x, size) 
    {
        offset_x = offset_x - SPACER_X;
        for (i = [1:size]) {
            located_paw(offset_x + SPACER_X * i);
        }
    }

    module left_group_paws()
    {
        group_paws(OFFSET_X, 3);
    }

    module right_group_paws()
    {
        offset_to_right = [0, 2.5, 0];
        
        translate(offset_to_right) {
            group_paws(OFFSET_X, 3);
        }
    }
    
    left_group_paws();
    right_group_paws();
}

module petagon_group()
{
    OFFSET_Y = 10;
        
    module petagon(offset) 
    {
        radio = 0.5;
        height = 0.1;
        
        cylinder(r = radio, h = height, $fn = LOW_RESOLUTION, center = true);
    }
    
    dimensions = [
        [1, 3.25, OFFSET_Y],
        [1, -3.25, OFFSET_Y],
        [3.5, 0, OFFSET_Y],
        [-2.8, -2, OFFSET_Y],
        [-2.8, 2, OFFSET_Y]
    ];
    number_of_pentagons = len(dimensions);
    
    for (i = [0:number_of_pentagons + ARRAY_BASE_CORRECTION]) {
        translate(dimensions[i])
            petagon();
    }
}


module star()
{
    OFFSET_X = 0;
    OFFSET_Y = 0;
    OFFSET_Z = -13;
    
    module point()
    {
        RADIO = 0.2;
        HEIGHT = 0.1;
        
        cylinder(r = RADIO,h = HEIGHT, $fn = LOW_RESOLUTION, center = true);
    }
    
    module edge(initial_offset, end_offset) 
    {
        hull() 
        {
            translate(initial_offset)
                point();
            
            translate(end_offset)
                point();
        }
    }
    
    module unlocated_star() {
        function next_position_index(position_index) = (position_index + 1) % number_of_points;   
        
        points = [
            [1, 3.25,10], [1, -3.25, 10], [1, -3.25, 10], [-2.8, 2, 10], [3.5, 0, 10], [-2.8, -2, 10]
        ];
        number_of_points = len(points);

        for (position_index = [0: number_of_points + ARRAY_BASE_CORRECTION]) {
            next_position_index = next_position_index(position_index);

            edge(points[position_index], points[next_position_index]);
        }        
    }
    
    translate([OFFSET_X, OFFSET_Y, OFFSET_Z])
        unlocated_star();
}


star();
petagon_group();
paws();
body();


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
