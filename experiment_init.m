function exp = experiment_init(model, layer, imageName_tar,imageName_sour,varargin)
% Initialize an experiment
imageDir = [];
[imageDir_tar,imageName_tar,imageExt_tar] = fileparts(imageName_tar) ;
[imageDir_sour,imageName_sour,imageExt_sour] = fileparts(imageName_sour) ;
if isempty(imageDir), imageDir = './data/images' ; end
exp.expDir = fullfile('./data/') ;
exp.name = imageName_tar;
exp.model = model ;
exp.layer = layer ;
exp.name_tar = imageName_tar ;
exp.name_sour = imageName_sour;
exp.useHoggle = false ;
exp.path_target = fullfile(imageDir_tar, [imageName_tar, imageExt_tar]) ;
exp.path_source = fullfile(imageDir_sour, [imageName_sour, imageExt_sour]) ;
exp.opts.dropout = 0 ;
exp.opts.neigh = +inf ;
exp.opts.filterGroup = NaN ;
exp.opts.objective = 'l2' ;
exp.opts.learningRate = 5e-5;%0.1 * ones(1,100) ;
exp.opts.maxNumIterations = +inf ;
exp.opts.beta = 2;
exp.opts.lambdaTV = 0 ;
exp.opts.lambdaL2 = 0.1 ;
exp.opts.TVbeta = 2;
exp.opts.numRepeats = 1 ;
exp.opts.optim_method = 'gradient-descent';
exp.opts.content_weight = 3e0;
exp.opts.style_weight = 2e2;%[2e3 2e3 2e3 2e3 2e3];
exp.opts.MaxIter=1000;
[exp,varargin] = vl_argparse(exp, varargin) ;
exp.opts = vl_argparse(exp.opts, varargin) ;


