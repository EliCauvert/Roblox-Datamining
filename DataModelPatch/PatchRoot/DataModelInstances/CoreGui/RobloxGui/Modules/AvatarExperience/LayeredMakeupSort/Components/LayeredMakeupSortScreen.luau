local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local LayeredMakeupSortPageModule = require(Modules.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortPage)
local UseLayeredMakeupSortPageViewModelModule = require(Modules.AvatarExperience.LayeredMakeupSort.Hooks.useLayeredMakeupSortPageViewModel)

local function LayeredMakeupSortScreen(p1)
	-- upvalues: UseLayeredMakeupSortPageViewModelModule (copy), ReactModule (copy), LayeredMakeupSortPageModule (ref)
	return ReactModule.createElement(LayeredMakeupSortPageModule, (UseLayeredMakeupSortPageViewModelModule(p1)))
end

LayeredMakeupSortPageModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(LayeredMakeupSortPageModule)

return LayeredMakeupSortScreen