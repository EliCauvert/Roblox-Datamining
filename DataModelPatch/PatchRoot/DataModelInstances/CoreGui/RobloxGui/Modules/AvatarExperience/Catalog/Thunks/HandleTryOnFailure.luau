local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local RemoveFromTryOnFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.RemoveFromTryOn
local GetTryOnItemReducerKeyFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getTryOnItemReducerKey
local config = {
	toastMessage = "Feature.Avatar.Label.TryOnFail",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

return function(p1)
	-- upvalues: ArgCheckModule (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule (copy), RemoveFromTryOnFunction (copy), SetCurrentToastMessageModule (copy), config (copy)
	ArgCheckModule.isType(p1, "string", "HandleTryOnFailure request expects bundleId")
	
	return function(p2)
		-- upvalues: GetTryOnItemReducerKeyFunction (upval), p1 (copy), ConstantsModule (upval), RemoveFromTryOnFunction (upval), SetCurrentToastMessageModule (upval), config (upval)
		if p2:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[GetTryOnItemReducerKeyFunction(p1, ConstantsModule.ItemType.Bundle)] then
			p2:dispatch(RemoveFromTryOnFunction(p1))
			p2:dispatch(SetCurrentToastMessageModule(config))
		end
	end
end