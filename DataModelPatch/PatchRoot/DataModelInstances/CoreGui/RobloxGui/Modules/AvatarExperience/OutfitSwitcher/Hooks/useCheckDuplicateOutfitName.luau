local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ReactModule = require(CorePackages.Packages.React)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation

local function v7(p1)
	return p1.AvatarExperience.AvatarEditor.OutfitInfos
end

local function v8(p1)
	return p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
end

return function(OutfitType, BackScreen)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), v7 (copy), v8 (copy), ReactModule (copy), UtilsModule (copy), NavigateWithLockFunction (copy), NavigationUtilsModule (copy), AvatarScreen (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(v7)
	local UseSelectorResult1 = UseSelectorFunction(v8)
	
	return ReactModule.useCallback(function(OutfitName, OnComplete): boolean
		-- upvalues: UtilsModule (upval), UseSelectorResult1 (copy), UseSelectorResult (copy), OutfitType (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), BackScreen (copy)
		if UtilsModule.isDuplicateOutfitName(UseSelectorResult1, UseSelectorResult, OutfitName, OutfitType) then
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (upval), AvatarScreen (upval), OutfitName (copy), OutfitType (upval), OnComplete (copy), BackScreen (upval)
				NavigationUtilsModule.navigateToNextOverlay(UseNavigationResult, AvatarScreen.DuplicateOutfitNameDialog, {
					outfitName = OutfitName,
					outfitType = OutfitType,
					onComplete = OnComplete,
					backScreen = BackScreen
				})
			end))
			
			return true
		else
			return false
		end
	end, {
		OutfitType, UseSelectorResult1, UseSelectorResult, UseNavigationResult,
		UseDispatchResult, BackScreen
	})
end