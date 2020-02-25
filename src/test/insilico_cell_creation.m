function a=insilico_cell_creation()
subpop=cell(0);

%-------------------------
% Subpopulation 1
%-------------------------

subpop{1}=Subpopulation();
%set placement
%subpop{1}.placement=Random_Placement();
%set(subpop{1}.placement,'boundary',50);
 %subpop{1}.placement=Clustered_Placement();
 %set(subpop{1}.placement,'boundary',100,'cluster_width',100);

subpop{1}.placement=Nearby_Placement();
set(subpop{1}.placement,'distance_to_existing',20);
%set(subpop{1}.placement,'clustering_probability',0.8);

%set objects
add_object(subpop{1},'nucleus');
subpop{1}.objects.nucleus.model=Nucleus_Model;
set(subpop{1}.objects.nucleus.model,'radius',1,'eccentricity',0);

add_object(subpop{1},'cytoplasm');
subpop{1}.objects.cytoplasm.model=Centered_Cytoplasm_Model;
set(subpop{1}.objects.cytoplasm.model,'radius',15,...
    'eccentricity',0.9,'randomness',0.05,'centered_around',subpop{1}.objects.nucleus);

%set markers 
markers1=subpop{1}.markers;

add_marker(subpop{1},'DAPI',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.nucleus.AddOperation(op);

op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.cytoplasm.AddOperation(op);

add_marker(subpop{1},'Actin',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.Actin.cytoplasm.AddOperation(op);

add_marker(subpop{1},'MT',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.MT.nucleus.AddOperation(op);


subpop{1}.compositing=Default_Compositing();
set(subpop{1}.compositing,'container_weight',0);

%----------------------------------------------------------------------------------
%subpopulation 2
%-----------------------------------------------------------------------------------
subpop{2}=Subpopulation();
subpop{2}.placement=Random_Placement();
set(subpop{2}.placement,'boundary',50);

%subpop{2}.placement=Nearby_Placement();
%set(subpop{2}.placement,'distance_to_existing',10);
%set(subpop{2}.placement,'clustering_probability',0.8);
%set(subpop{2}.placement,'boundary',50);

add_object(subpop{2},'nucleus');
subpop{2}.objects.nucleus.model=Nucleus_Model;
set(subpop{2}.objects.nucleus.model,'radius',1,'eccentricity',0);

add_object(subpop{2},'cytoplasm');
subpop{2}.objects.cytoplasm.model=Centered_Cytoplasm_Model;
set(subpop{2}.objects.cytoplasm.model,'radius',30,...
'eccentricity',0.2,'randomness',0.2,'centered_around',subpop{2}.objects.nucleus);

%markers 
markers1=subpop{2}.markers;

add_marker(subpop{2},'DAPI',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.cytoplasm.AddOperation(op);

op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.nucleus.AddOperation(op);

add_marker(subpop{2},'Actin',Colors.Green);
op=Constant_Marker_Level();
 set(op,'mean_level',1,'sd_level',0);
 markers1.Actin.cytoplasm.AddOperation(op);

 op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.Actin.nucleus.AddOperation(op);
 
add_marker(subpop{2},'MT',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0); 
 markers1.MT.nucleus.AddOperation(op);

subpop{2}.compositing=Default_Compositing();
set(subpop{2}.compositing,'container_weight',0);

%general settings
simucell_data.population_fractions=[0.5,0.5];
simucell_data.number_of_cells=30;
simucell_data.simucell_image_size=[700,700];

simucell_data.subpopulations=subpop;

a=simucell_engine(simucell_data);

end
