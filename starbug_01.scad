FRONT_ROTATE = [90, 90, 90];

LOW_RESOLUTION = 5;
FINE_RESOLUTION = 10;
VERY_FINE_RESOLUTION = 100;

ARRAY_BASE_CORRECTION = -1;

WITHOUT_OFFSET = 0;
WITHOUT_ROTATE = 0;

DEFAULT_HEIGHT = 0.2;

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
                
                translate(offset)
                    cylinder(r = radio, $fn = VERY_FINE_RESOLUTION , h = DEFAULT_HEIGHT, center = true);
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


module horn() 
{
    OFFSET_X = 6.29;
    OFFSET_Z = -4.66;
    ROTATE_Y = -40;
    
    module shape()
    {        
        OFFSET_Z = 10;
        OFFSET_X_VISIBLE_FORM = 0.4;
        OFFSET_HEIGHT = 0.1;
        
        module basic_form(height) {
            RADIO = 5;
            
            cylinder(r = RADIO, h = height, $fn = VERY_FINE_RESOLUTION , center = true);
        }
        
        
        difference()
        {
            translate([WITHOUT_OFFSET, WITHOUT_OFFSET, OFFSET_Z])
                basic_form(DEFAULT_HEIGHT);
            
            mayor_height = DEFAULT_HEIGHT + OFFSET_HEIGHT;
            translate([OFFSET_X_VISIBLE_FORM, WITHOUT_OFFSET, OFFSET_Z])
                basic_form(mayor_height);
        }
    }
    
    

    translate([OFFSET_X, WITHOUT_OFFSET, OFFSET_Z])
        rotate([WITHOUT_ROTATE, ROTATE_Y, WITHOUT_ROTATE])
            shape();
}

module base() {
    hull()
    {
        MINOR_RADIO = 4;
        spacer_beteew_cylinder = 0.5;
        OFFSET_Z = -4;
        
        translate([WITHOUT_OFFSET, WITHOUT_OFFSET, OFFSET_Z + spacer_beteew_cylinder])
            cylinder(r = MINOR_RADIO, h = DEFAULT_HEIGHT, $fn = LOW_RESOLUTION, center = true);
        
        MAYOR_RADIO = 5;
        translate([WITHOUT_OFFSET, WITHOUT_OFFSET, OFFSET_Z])
            cylinder(r = MAYOR_RADIO, h = DEFAULT_HEIGHT, $fn = LOW_RESOLUTION, center = true);
    }
}

module bug() 
{
    horn();
    star();
    petagon_group();
    paws();
    body();
    base();
}

bug();


