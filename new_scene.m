function new_scene(option, w, rect, lang)
    if ~exist('lang','var')
        lang = 'eng';
    end
    switch lang
        case 'eng'
            new_scene_eng(option, w, rect);
        case 'hun'
            new_scene_hun(option, w, rect);
        otherwise
            error([lang, ' language is not defined.'])
    end
