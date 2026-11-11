local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local _ = require(CorePackages.Packages.Foundation)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseOnAddOutfitModule = require(Modules.AvatarExperience.OutfitSwitcher.Hooks.useOnAddOutfit)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetDuplicateOutfitOfTypeModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.GetDuplicateOutfitOfType)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local config = {
	[ConstantsModule.OutfitTypes.Avatar] = {
		add = "Feature.Avatar.Label.Title.AddNewAvatar",
		manage = "Feature.Avatar.Label.Title.ManageAvatars",
		update = "Feature.Avatar.Label.Title.UpdateAvatar"
	},
	[ConstantsModule.OutfitTypes.Makeup] = {
		add = "Feature.Avatar.Action.AddNewMakeupLook",
		manage = "Feature.Avatar.Action.ManageMakeupLooks",
		update = "Feature.Avatar.Action.UpdateExistingMakeupLook"
	}
}

return function(p1, p2)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), ResponsiveModule (copy), ReactFocusNavigationModule (copy), ReactModule (copy), UseSelectorFunction (copy), GetDuplicateOutfitOfTypeModule (copy), UseLocalizationFunction (copy), config (copy), UseOnAddOutfitModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		return p3.AvatarExperience.AvatarEditor.OutfitInfos
	end)
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p3)
		-- upvalues: GetDuplicateOutfitOfTypeModule (upval), p1 (copy)
		return GetDuplicateOutfitOfTypeModule(p3, p1.outfitType)
	end, { p1.outfitType })))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy)
		local UseSelectorResultEntry = UseSelectorResult[tostring(UseSelectorResult1)]
		
		return if UseSelectorResultEntry then UseSelectorResultEntry.name else nil
	end, { UseSelectorResult1, UseSelectorResult })
	local UseLocalizationResult = UseLocalizationFunction({
		add = config[p1.outfitType].add,
		manage = config[p1.outfitType].manage,
		update = config[p1.outfitType].update
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseFocusGuiObjectResult (copy), p2 (copy)
		if UsePreferredInputResult == ResponsiveModule.Input.Directional then
			UseFocusGuiObjectResult(p2.current)
		end
	end, { UsePreferredInputResult, UseFocusGuiObjectResult, p2 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p3): boolean
			return not p3
		end)
	end, { UseStateResult2 })
	local UseOnAddOutfitModuleResult = UseOnAddOutfitModule(UseNavigationResult, p1.outfitType, UseResult, false)
	local UseResult2 = ReactModule.useCallback(function(SaveAsNew)
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), p1 (copy), UseMemoResult (copy), UseResult (copy)
		return function()
			-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), p1 (upval), UseMemoResult (upval), SaveAsNew (copy), UseResult (upval)
			UseNavigationResult.navigate(AvatarScreen.DuplicateOutfitDialog, {
				outfitType = p1.outfitType,
				duplicateOutfitName = UseMemoResult,
				saveAsNew = SaveAsNew,
				onOverlayClosed = UseResult
			})
		end
	end, {
		UseNavigationResult,
		p1.outfitType,
		UseMemoResult,
		UseResult
	})
	
	return {
		outfitType = p1.outfitType,
		itemWidth = p1.itemWidth,
		index = p1.index,
		squareAspectRatio = p1.squareAspectRatio,
		onTileActivated = if UseStateResult then nil else UseResult1,
		onMenuItemActivated = ReactModule.useCallback(function(p3)
			-- upvalues: UseStateResult2 (copy), UseSelectorResult1 (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseResult2 (copy), UseOnAddOutfitModuleResult (copy), UseNavigationResult (copy), AvatarScreen (upval), p1 (copy)
			UseStateResult2(false)
			
			if p3 == "add" then
				if UseSelectorResult1 then
					UseDispatchResult(NavigateWithLockFunction(UseResult2(true)))
					
					return
				else
					UseOnAddOutfitModuleResult()
					
					return
				end
			elseif p3 == "manage" then
				UseDispatchResult(NavigateWithLockFunction(function()
					-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), p1 (upval)
					UseNavigationResult.navigate(AvatarScreen.ManageOutfitsPage, { outfitType = p1.outfitType })
				end))
				
				return
			else
				if p3 == "update" then
					print("updating")
				end
			end
		end, {
			UseDispatchResult, UseNavigationResult, UseResult2, UseOnAddOutfitModuleResult,
			UseStateResult2, UseSelectorResult1, p1.outfitType
		}),
		onPressedOutside = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, { UseStateResult2 }),
		items = ReactModule.useMemo(function()
			-- upvalues: UseLocalizationResult (copy)
			return {
				{ id = "add", text = UseLocalizationResult.add },
				{ id = "manage", text = UseLocalizationResult.manage },
				{ id = "update", text = UseLocalizationResult.update }
			}
		end, { UseLocalizationResult }),
		isOpen = UseStateResult
	}
end