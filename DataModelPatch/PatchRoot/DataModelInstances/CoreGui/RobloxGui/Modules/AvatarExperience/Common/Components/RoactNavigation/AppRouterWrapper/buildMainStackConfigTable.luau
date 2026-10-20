local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RedirectToAppRouterScreenModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.RedirectToAppRouterScreen)
local RedirectToAvatarScreenModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.RedirectToAvatarScreen)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarPromptDescriptorsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors)
local AvatarExperienceWrapperScreensModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapperScreens)
local WithAppRouterParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.withAppRouterParams)

return function(Key)
	-- upvalues: AvatarExperienceWrapperScreensModule (copy), WithAppRouterParamsModule (copy), AvatarScreen (copy), RedirectToAppRouterScreenModule (copy), RedirectToAvatarScreenModule (copy), AvatarPromptDescriptorsModule (copy), CryoModule (copy)
	local t = {}
	
	if not AvatarExperienceWrapperScreensModule[Key] then
		error("Initial route is not supported by AvatarExperienceWrapper: " .. tostring(Key))
	end
	local WithAppRouterParamsModuleResult = WithAppRouterParamsModule(AvatarExperienceWrapperScreensModule[Key])
	
	local function _(Key, p1)
		-- upvalues: t (copy)
		if not t[Key] then
			t[Key] = p1
		end
	end
	
	local _ = function(Key)
		-- upvalues: t (copy)
		t[Key] = nil
	end
	
	for _, value in AvatarScreen do
		local RedirectToAppRouterScreenModule1 = AvatarExperienceWrapperScreensModule[value] ~= nil and RedirectToAppRouterScreenModule or RedirectToAvatarScreenModule
		
		if not t[value] then
			t[value] = RedirectToAppRouterScreenModule1
		end
	end
	for _, value1 in AvatarPromptDescriptorsModule do
		for i, _ in value1 do
			t[i] = nil
		end
	end
	t[AvatarScreen.AvatarExperienceMainStackNavigator] = nil
	t[Key] = nil
	
	return (CryoModule.List.join({ { [Key] = WithAppRouterParamsModuleResult } }, CryoModule.List.map(CryoModule.Dictionary.keys(t), function(p1)
		-- upvalues: t (copy)
		return { [p1] = t[p1] }
	end)))
end