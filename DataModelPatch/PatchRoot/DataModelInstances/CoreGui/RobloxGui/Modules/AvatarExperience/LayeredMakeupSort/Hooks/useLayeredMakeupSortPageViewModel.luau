local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local MakeAvatarBackButtonModule = require(Modules.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton)
local SetLastSavedSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort)
local SetCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local SelectEquippedLayeredMakeupOrderedModule = require(Modules.AvatarExperience.LayeredMakeupSort.Selectors.selectEquippedLayeredMakeupOrdered)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SelectEquippedAssets = AvatarExperienceCommonModule.State.Selectors.selectEquippedAssets
local SelectTopBarHeight = AvatarExperienceCommonModule.State.Selectors.selectTopBarHeight
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local UnlockCharacterUpdatesModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local _ = require(Modules.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortPage)

return function(p1)
	-- upvalues: UseIsSpatialFunction (copy), UseDispatchFunction (copy), UseIsGamepadFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceModule (copy), AnalyticsModule1 (copy), AnalyticsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), UseSelectorFunction (copy), SelectEquippedLayeredMakeupOrderedModule (copy), SelectIsPortraitModule (copy), SelectEquippedAssets (copy), SelectTopBarHeight (copy), UnlockCharacterUpdatesModule (copy), SendRefinementAnalyticsModule (copy), SetEntryPageModule (copy), AvatarScreen (copy), LogOnOverlayClosedFunction (copy), MakeAvatarBackButtonModule (copy), SetLastSavedSortModule (copy), SetCurrentSortModule (copy), SetFullViewModule (copy), FullView (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseIsGamepadResult = UseIsGamepadFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule1)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseLocalizationResult = UseLocalizationFunction({
		makeupSorting = "Feature.Avatar.Title.MakeupSortPage",
		noItemText = "Feature.Avatar.Message.LayeredMakeupSortNoEquipped"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSelectorResult = UseSelectorFunction(SelectEquippedLayeredMakeupOrderedModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectIsPortraitModule)
	local UseSelectorResult2 = UseSelectorFunction(SelectEquippedAssets)
	local UseSelectorResult3 = if UseIsSpatialResult then 0 else UseSelectorFunction(SelectTopBarHeight)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), UnlockCharacterUpdatesModule (upval), p1 (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), SetEntryPageModule (upval), AvatarScreen (upval)
		UseDispatchResult(UnlockCharacterUpdatesModule())
		p1.navigation.pop()
		UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineGoBack))
		UseDispatchResult(SetEntryPageModule(AvatarScreen.None))
	end, {
		UseDispatchResult,
		p1.navigation,
		UseRoactServiceModuleResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseIsGamepadResult (copy), UseAvatarRouteResult (copy), AvatarScreen (upval), LogOnOverlayClosedFunction (upval), p1 (copy)
		p1.navigation.navigate(AvatarScreen.ResetLayeredItemsSortPrompt, {
			onOverlayClosed = function()
				-- upvalues: UseIsGamepadResult (upval), UseAvatarRouteResult (upval), AvatarScreen (upval), LogOnOverlayClosedFunction (upval)
				if UseIsGamepadResult and UseAvatarRouteResult.opaque.name == AvatarScreen.LayeredMakeupSort then
					LogOnOverlayClosedFunction("LayeredMakeupSort")
				end
			end
		})
	end, { p1.navigation, UseIsGamepadResult, UseAvatarRouteResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MakeAvatarBackButtonModule (upval), UseResult1 (copy)
		return MakeAvatarBackButtonModule(UseResult1)
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseRefResult (copy), UseSelectorResult (copy), UseSelectorResult2 (copy), UseDispatchResult (copy), SetLastSavedSortModule (upval), SetCurrentSortModule (upval), SetFullViewModule (upval), UseRoactServiceModuleResult1 (copy), FullView (upval)
		if UseAvatarRouteResult.opaque.name == AvatarScreen.LayeredMakeupSort and UseRefResult.current ~= AvatarScreen.LayeredMakeupSort then
			local List = {}
			
			for _, value in UseSelectorResult do
				if UseSelectorResult2[value.typeId] and UseSelectorResult2[value.typeId][value.id] then
					value.equipped = true
				end
				table.insert(List, value)
			end
			UseDispatchResult(SetLastSavedSortModule(List))
			UseDispatchResult(SetCurrentSortModule(UseSelectorResult))
			UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult1, AvatarScreen.LayeredMakeupSort, FullView.SceneFullView))
		end
	end, {
		UseAvatarRouteResult,
		UseSelectorResult,
		UseSelectorResult2,
		UseRoactServiceModuleResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseAvatarRouteResult (copy)
		UseRefResult.current = UseAvatarRouteResult.opaque.name
	end, { UseAvatarRouteResult.opaque.name })
	
	return {
		isSpatial = UseIsSpatialResult,
		isGamepad = UseIsGamepadResult,
		isDragging = UseStateResult,
		isPortrait = UseSelectorResult1,
		topBarHeight = UseSelectorResult3,
		onDragChange = UseResult,
		onGoBack = UseResult1,
		onOpenResetPrompt = UseResult2,
		backButton = UseMemoResult,
		localized = UseLocalizationResult,
		equippedLayeredMakeupAssetIdsOrdered = UseSelectorResult
	}
end