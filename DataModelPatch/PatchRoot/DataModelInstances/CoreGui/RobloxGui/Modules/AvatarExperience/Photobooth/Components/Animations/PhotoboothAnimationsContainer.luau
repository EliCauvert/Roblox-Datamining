local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UsePhotoboothAnimationsPropsModule = require(Modules.AvatarExperience.Photobooth.Components.Animations.usePhotoboothAnimationsProps)
local PhotoboothAnimationsModule = require(Modules.AvatarExperience.Photobooth.Components.Animations.PhotoboothAnimations)

return function(p1)
	-- upvalues: UsePhotoboothAnimationsPropsModule (copy), ReactModule (copy), PhotoboothAnimationsModule (copy)
	return ReactModule.createElement(PhotoboothAnimationsModule, (UsePhotoboothAnimationsPropsModule(p1.Position, p1.onTileClicked)))
end