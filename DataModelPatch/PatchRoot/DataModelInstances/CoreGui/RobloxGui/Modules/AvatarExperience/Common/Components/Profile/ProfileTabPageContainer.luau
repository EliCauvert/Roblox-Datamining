local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ProfileTabPageViewModule = require(Modules.AvatarExperience.Common.Components.Profile.ProfileTabPageView)
local UseProfileTabPageViewModelModule = require(Modules.AvatarExperience.Common.Components.Profile.useProfileTabPageViewModel)

return function(p1)
	-- upvalues: UseProfileTabPageViewModelModule (copy), ReactModule (copy), ProfileTabPageViewModule (copy)
	return ReactModule.createElement(ProfileTabPageViewModule, (UseProfileTabPageViewModelModule(p1)))
end