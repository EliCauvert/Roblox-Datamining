local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UsePhotoboothScenesPropsModule = require(Modules.AvatarExperience.Photobooth.Components.Scenes.usePhotoboothScenesProps)
local PhotoboothScenesModule = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothScenes)

return function(p1)
	-- upvalues: UsePhotoboothScenesPropsModule (copy), ReactModule (copy), PhotoboothScenesModule (copy)
	return ReactModule.createElement(PhotoboothScenesModule, (UsePhotoboothScenesPropsModule(p1.Position, p1.onTileClicked)))
end