function a=insilico_cell_creation()
subpop=cell(0);


%subpopulation 1
subpop{1}=Subpopulation();
subpop{1}.placement=Random_Placement();
% subpop{1}.placement=Clustered_Placement();
% set(subpop{1}.placement,'boundary',100,'cluster_width',100);


add_object(subpop{1},'nucleus');
subpop{1}.objects.nucleus.model=Nucleus_Model;
set(subpop{1}.objects.nucleus.model,'radius',1,'eccentricity',0.8);

add_object(subpop{1},'cytoplasm');
subpop{1}.objects.cytoplasm.model=Centered_Cytoplasm_Model;
set(subpop{1}.objects.cytoplasm.model,'radius',15,'eccentricity',0.9,'randomness',0.05,'centered_around',subpop{1}.objects.nucleus);


add_object(subpop{1},'lipid_droplets');
subpop{1}.objects.lipid_droplets.model=Lipid_Droplet_Model;
set(subpop{1}.objects.lipid_droplets.model,'droplet_radius',5,...
    'number_of_droplets',5,'number_of_clusters',2,...
    'nucleus',subpop{1}.objects.nucleus);


set(subpop{1}.objects.lipid_droplets.model,'droplet_radius',5,...
    'number_of_droplets',5,'number_of_clusters',2,...
    'nucleus',subpop{1}.objects.nucleus,'cytoplasm',subpop{1}.objects.cytoplasm);


add_object(subpop{1},'fiber');
subpop{1}.objects.fiber.model=Microtubule_Fibre_Model;
set(subpop{1}.objects.fiber.model,'nucleus',subpop{1}.objects.nucleus,...
    'cytoplasm',subpop{1}.objects.cytoplasm);

markers1=subpop{1}.markers;

add_marker(subpop{1},'DAPI',Colors.Blue);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.nucleus.AddOperation(op);

op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.cytoplasm.AddOperation(op);
op=Constant_Dependant_Marker_Level();
set(op,'marker',markers1.DAPI.cytoplasm,'region',subpop{1}.objects.nucleus,'slope',0.5);
markers1.DAPI.nucleus.AddOperation(op);

add_marker(subpop{1},'Actin',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.Actin.cytoplasm.AddOperation(op);
% op=Perlin_Texture();
% markers1.Actin.cytoplasm.AddOperation(op);
% op=Cell_Density_Dependant_Marker_Level();
% set(op,'falloff_type','Linear','falloff_coefficient',10,'increasing_or_decreasing','Decreasing');
% markers1.Actin.cytoplasm.AddOperation(op);
% op=Angular_Marker_Gradient();
% set(op,'center','Furthest From Edge','falloff_type','Exponential','angular_width',180);
% markers1.Actin.cytoplasm.AddOperation(op);
set(op,'mean_level',1,'sd_level',0);
markers1.Actin.lipid_droplets.AddOperation(op);



add_marker(subpop{1},'MT',Colors.Red);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.MT.nucleus.AddOperation(op);
% op=Constant_Marker_Level();
% set(op,'mean_level',0,'sd_level',0);
% markers1.MT.cytoplasm.AddOperation(op);
% op=Constant_Marker_Level();
% set(op,'mean_level',0,'sd_level',0);
% markers1.MT.lipid_droplets.AddOperation(op);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.MT.fiber.AddOperation(op);


subpop{1}.compositing=Default_Compositing();
set(subpop{1}.compositing,'container_weight',0);

%----------------------------------------------------------------------------------
%subpopulation 2
%-----------------------------------------------------------------------------------
subpop{2}=Subpopulation();
subpop{2}.placement=Random_Placement();
%set(subpop{2}.placement,'boundary',100);


add_object(subpop{2},'nucleus');
subpop{2}.objects.nucleus.model=Nucleus_Model;
set(subpop{2}.objects.nucleus.model,'radius',1,'eccentricity',0);

add_object(subpop{2},'cytoplasm');
subpop{2}.objects.cytoplasm.model=Centered_Cytoplasm_Model;
set(subpop{2}.objects.cytoplasm.model,'radius',25,'eccentricity',0,'centered_around',subpop{2}.objects.nucleus);





markers1=subpop{2}.markers;

add_marker(subpop{2},'DAPI',Colors.Blue);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.DAPI.cytoplasm.AddOperation(op);

op=Constant_Dependant_Marker_Level();
set(op,'marker',markers1.DAPI.cytoplasm,'region',subpop{2}.objects.nucleus,'slope',0.5);
markers1.DAPI.nucleus.AddOperation(op);

add_marker(subpop{2},'Actin',Colors.Green);
op=Constant_Marker_Level();
 set(op,'mean_level',1,'sd_level',0);
 markers1.Actin.cytoplasm.AddOperation(op);

add_marker(subpop{2},'MT',Colors.Green);
op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0); 
 markers1.MT.nucleus.AddOperation(op);

op=Constant_Marker_Level();
set(op,'mean_level',1,'sd_level',0);
markers1.Actin.nucleus.AddOperation(op);

subpop{2}.compositing=Default_Compositing();
set(subpop{2}.compositing,'container_weight',0);




simucell_data.population_fractions=[0.3,0.7];
simucell_data.number_of_cells=20;
simucell_data.simucell_image_size=[700,700];

simucell_data.subpopulations=subpop;
%simucell_data.overlap=overlap;
% 
% [obv_del,all_del]=simucell_data.subpopulations{1}.calculate_all_dependancies(...
%     simucell_data.subpopulations{1}.objects.lipid_droplets);
% 
% [obv_del,all_del]=simucell_data.subpopulations{1}.calculate_all_dependancies(...
%     simucell_data.subpopulations{1}.markers.DAPI);
% 
a=simucell_engine(simucell_data);

end
