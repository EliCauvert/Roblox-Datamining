local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(script.Parent.Parent.Shared.BaseDialog)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseOnAddOutfitModule = require(Modules.AvatarExperience.OutfitSwitcher.Hooks.useOnAddOutfit)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError

return function()
	-- upvalues: UseNavigationFunction (copy), ConstantsModule (copy), MutedErrorFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), UseOnAddOutfitModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local OutfitTypeParam = UseNavigationResult.getParam("outfitType")
	
	if not OutfitTypeParam then
		OutfitTypeParam = ConstantsModule.OutfitTypes.Avatar
		MutedErrorFunction("outfitType is required")
	end
	local DuplicateOutfitNameParam = UseNavigationResult.getParam("duplicateOutfitName")
	
	if not DuplicateOutfitNameParam then
		DuplicateOutfitNameParam = ""
		MutedErrorFunction("duplicateOutfitName is required")
	end
	local SaveAsNewParam = UseNavigationResult.getParam("saveAsNew")
	
	if SaveAsNewParam == nil then
		SaveAsNewParam = true
		MutedErrorFunction("saveAsNew is required")
	end
	local OnOverlayClosedParam: () -> () = UseNavigationResult.getParam("onOverlayClosed")
	
	if not OnOverlayClosedParam then
		OnOverlayClosedParam = function() end
		
		MutedErrorFunction("onOverlayClosed is required")
	end
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = "Feature.Avatar.Action.Cancel",
		title = if OutfitTypeParam == ConstantsModule.OutfitTypes.Avatar then "Feature.Avatar.Label.Title.DuplicateAvatar" else "Feature.Avatar.Title.DuplicateMakeupLook",
		subtitle = if OutfitTypeParam == ConstantsModule.OutfitTypes.Avatar then {
			"Feature.Avatar.Message.AddAvatarAgain",
			prevAvatar = DuplicateOutfitNameParam
		} else {
			"Feature.Avatar.Label.DuplicateMakeupLookDialog",
			lookName = DuplicateOutfitNameParam
		},
		add = if SaveAsNewParam then "Feature.Avatar.Label.Add" else "Feature.Avatar.Label.Replace"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
	end, { UseNavigationResult })
	local UseOnAddOutfitModuleResult = UseOnAddOutfitModule(UseNavigationResult, OutfitTypeParam, OnOverlayClosedParam, true)
	
	return {
		titleText = UseLocalizationResult.title,
		bodyText = UseLocalizationResult.subtitle,
		cancelButtonText = UseLocalizationResult.cancel,
		confirmButtonText = UseLocalizationResult.add,
		onClose = UseResult,
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: SaveAsNewParam (ref), UseOnAddOutfitModuleResult (copy)
			if SaveAsNewParam then
				UseOnAddOutfitModuleResult()
				
				return
			else
				UseOnAddOutfitModuleResult()
			end
		end, { UseOnAddOutfitModuleResult, SaveAsNewParam })
	}
end