local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local _ = require(script.Parent.Parent.Shared.BaseDialog)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError

return function()
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), ConstantsModule (copy), MutedErrorFunction (copy), AvatarScreen (copy), UseLocalizationFunction (copy), ReactModule (copy), NavigateWithLockFunction (copy), NavigationUtilsModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local OutfitTypeParam = UseNavigationResult.getParam("outfitType")
	
	if not OutfitTypeParam then
		OutfitTypeParam = ConstantsModule.OutfitTypes.Avatar
		MutedErrorFunction("outfitType is required")
	end
	local OutfitNameParam = UseNavigationResult.getParam("outfitName")
	
	if not OutfitNameParam then
		OutfitNameParam = ""
		MutedErrorFunction("outfitName is required")
	end
	local OnCompleteParam: (any, any) -> () = UseNavigationResult.getParam("onComplete")
	
	if not OnCompleteParam then
		OnCompleteParam = function(_, _) end
		
		MutedErrorFunction("onComplete is required")
	end
	local BackScreenParam = UseNavigationResult.getParam("backScreen")
	
	if not BackScreenParam then
		BackScreenParam = AvatarScreen.AddOutfitDialog
		MutedErrorFunction("backScreen is required")
	end
	local FeatureAvatarHeadingUsedName = UseLocalizationFunction({
		title = "Feature.Avatar.Heading.UsedName",
		body = "Feature.Avatar.Label.UsedNameLong",
		confirm = "Feature.Avatar.Action.Save",
		cancel = "Feature.Avatar.Label.Back"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
	end, { UseNavigationResult })
	
	return {
		titleText = FeatureAvatarHeadingUsedName.title,
		bodyText = FeatureAvatarHeadingUsedName.body,
		confirmButtonText = FeatureAvatarHeadingUsedName.confirm,
		cancelButtonText = FeatureAvatarHeadingUsedName.cancel,
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: OnCompleteParam (ref), OutfitNameParam (ref), UseResult (copy)
			OnCompleteParam(OutfitNameParam, UseResult)
		end, { OnCompleteParam, OutfitNameParam, UseResult }),
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), NavigateWithLockFunction (upval), NavigationUtilsModule (upval), UseNavigationResult (copy), BackScreenParam (ref), OutfitTypeParam (ref), OutfitNameParam (ref), OnCompleteParam (ref)
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (upval), BackScreenParam (upval), OutfitTypeParam (upval), OutfitNameParam (upval), OnCompleteParam (upval)
				NavigationUtilsModule.navigateToNextOverlay(UseNavigationResult, BackScreenParam, {
					outfitType = OutfitTypeParam,
					defaultName = OutfitNameParam,
					onComplete = OnCompleteParam
				})
			end))
		end, {
			UseNavigationResult, OutfitTypeParam, OutfitNameParam, OnCompleteParam,
			BackScreenParam, UseDispatchResult
		})
	}
end