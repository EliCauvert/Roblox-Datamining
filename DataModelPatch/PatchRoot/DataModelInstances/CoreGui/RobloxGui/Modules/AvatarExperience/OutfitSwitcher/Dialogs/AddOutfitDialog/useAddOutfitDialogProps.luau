local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(script.Parent.Parent.Shared.BaseDialogWithTextbox)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseCheckDuplicateOutfitNameModule = require(Modules.AvatarExperience.OutfitSwitcher.Hooks.useCheckDuplicateOutfitName)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local config = {
	[ConstantsModule.OutfitTypes.Avatar] = {
		title = "Feature.Avatar.Label.Title.AvatarName",
		add = "Feature.Avatar.Label.Add",
		cancel = "Feature.Avatar.Action.Cancel",
		nameInvalid = "Feature.Avatar.Label.CostumeWarning"
	},
	[ConstantsModule.OutfitTypes.Makeup] = {
		title = "Feature.Avatar.Title.SaveMakeupLook",
		add = "Feature.Avatar.Label.Add",
		cancel = "Feature.Avatar.Action.Cancel",
		nameInvalid = "Feature.Avatar.Label.CostumeWarning"
	}
}

return function()
	-- upvalues: UseNavigationFunction (copy), ConstantsModule (copy), MutedErrorFunction (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), NavigationUtilsModule (copy), UseCheckDuplicateOutfitNameModule (copy), AvatarScreen (copy)
	local UseNavigationResult = UseNavigationFunction()
	local OutfitTypeParam = UseNavigationResult.getParam("outfitType")
	
	if not OutfitTypeParam then
		OutfitTypeParam = ConstantsModule.OutfitTypes.Avatar
		MutedErrorFunction("outfitType is missing")
	end
	local OnCompleteParam: (any, any) -> () = UseNavigationResult.getParam("onComplete")
	
	if not OnCompleteParam then
		OnCompleteParam = function(_, _) end
		
		MutedErrorFunction("onComplete is missing")
	end
	local DefaultNameParam = UseNavigationResult.getParam("defaultName")
	local UseLocalizationResult = UseLocalizationFunction(config[OutfitTypeParam])
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
	end, { UseNavigationResult })
	local UseCheckDuplicateOutfitNameModuleResult = UseCheckDuplicateOutfitNameModule(OutfitTypeParam, AvatarScreen.AddOutfitDialog)
	
	return {
		titleText = UseLocalizationResult.title,
		confirmButtonText = UseLocalizationResult.add,
		cancelButtonText = UseLocalizationResult.cancel,
		onClose = UseResult,
		onConfirm = ReactModule.useCallback(function(p1)
			-- upvalues: UseCheckDuplicateOutfitNameModuleResult (copy), OnCompleteParam (ref), UseResult (copy)
			if not UseCheckDuplicateOutfitNameModuleResult(p1, OnCompleteParam) then
				OnCompleteParam(p1, UseResult)
			end
		end, {
			OnCompleteParam,
			UseCheckDuplicateOutfitNameModuleResult,
			UseResult
		}),
		defaultText = DefaultNameParam,
		isTextValid = ReactModule.useCallback(function(Text: string)
			-- upvalues: UseLocalizationResult (copy)
			if not string.match(Text, "%S") then
				return false, nil
			elseif string.match(Text, "^[0-9a-zA-Z%s]+$") then
				return true, nil
			else
				return false, UseLocalizationResult.nameInvalid
			end
		end, { UseLocalizationResult.nameInvalid })
	}
end