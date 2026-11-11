local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local PhotoboothPageModule = require(Modules.AvatarExperience.Photobooth.PhotoboothPage)
local UsePhotoboothPagePropsModule = require(Modules.AvatarExperience.Photobooth.usePhotoboothPageProps)

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UsePhotoboothPagePropsModule (copy), ReactModule (copy), PhotoboothPageModule (copy)
	return ReactModule.createElement(PhotoboothPageModule, (UsePhotoboothPagePropsModule()))
end))