local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local FoundationModule = require(CorePackages.Packages.Foundation)
local GridMetrics = require(CorePackages.Packages.UIBlox).App.Grid.GridMetrics
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local GetUserInventoryV2Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2)
local SetSelectedEmoteSlotModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot)
local SendShopForMoreAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local EmotesCategory = require(Modules.AvatarExperience.Common.getEmotesCategory)()
local SearchUuid = EmotesCategory.SearchUuid

local function selectPageFinished(p1)
	return p1.AvatarExperience.AvatarEditor.PageFinished
end

local function selectOwnedItemIds(p1)
	-- upvalues: EmotesCategory (copy)
	return p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[EmotesCategory.SearchUuid] or {}
end

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function selectAvatarType(p1)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType
end

local function selectAnalyticsMetadata(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

local function selectFetchStatus(p1)
	-- upvalues: PerformFetch (copy), SearchUuid (copy)
	return PerformFetch.GetStatus(p1, SearchUuid)
end

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), FoundationModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), ResponsiveModule (copy), UseAppPolicyModule (copy), UseSelectorFunction (copy), selectScreenSize (copy), selectPageFinished (copy), SelectIsFullViewModule (copy), selectOwnedItemIds (copy), selectAvatarType (copy), selectFetchStatus (copy), SearchUuid (copy), RetrievalStatusModule (copy), ReactModule (copy), ConstantsModule1 (copy), FullView (copy), GridMetrics (copy), AvatarScreen (copy), SetSelectedEmoteSlotModule (copy), GetUserInventoryV2Module (copy), EmotesCategory (copy), ClearTryOnsFunction (copy), selectAnalyticsMetadata (copy), ConstantsModule (copy), Signal (copy), SendShopForMoreAnalyticsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.getEnableContinuousLoad()
	end)
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseSelectorResult1 = UseSelectorFunction(selectPageFinished)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: SelectIsFullViewModule (upval), UseAvatarRouteResult (copy)
		return SelectIsFullViewModule(p1, UseAvatarRouteResult.opaque.name)
	end)
	local UseSelectorResult3 = UseSelectorFunction(selectOwnedItemIds)
	local UseSelectorResult4 = UseSelectorFunction(selectAvatarType)
	local UseSelectorResult5 = UseSelectorFunction(selectFetchStatus)
	local Inverted = not UseSelectorResult1[SearchUuid]
	local IsNotUseSelectorResultMatch: boolean = not UseAppPolicyModuleResult and (Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching)
	local NoInverted = not Inverted
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult.X * ConstantsModule1.LandscapeNavWidth)
	local IsUseSelectorResultMatch = UseSelectorResult2 == FullView.SceneFullView
	local IsUseSelectorResultMatch1 = UseSelectorResult2 == FullView.UIFullView
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GridMetrics (upval), UseStateResult (copy), UseTokensResult (copy)
		return GridMetrics.getSmallMetrics(math.max(UseStateResult - UseTokensResult.Size.Size_400 * 2, 0), UseTokensResult.Size.Size_300)
	end, { UseStateResult, UseTokensResult })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, {})
	local UseResult1 = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useCallback(function()
		-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseFocusControllerResult (copy)
		if UsePreferredInputResult == ResponsiveModule.Input.Directional then
			UseFocusControllerResult.captureFocus()
		end
	end, { UsePreferredInputResult, UseFocusControllerResult })
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: UseSelectorResult4 (copy), ConstantsModule1 (upval), UseNavigationResult (copy), AvatarScreen (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseResult1 (copy), UseDispatchResult (copy), SetSelectedEmoteSlotModule (upval)
		if UseSelectorResult4 == ConstantsModule1.AvatarType.R6 then
			UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt",
				onOverlayClosed = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseResult1
			})
		end
		UseDispatchResult(SetSelectedEmoteSlotModule(p1))
	end, {
		UseDispatchResult,
		UseSelectorResult4,
		UseNavigationResult,
		UseResult1
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: Inverted (copy), UseSelectorResult5 (copy), RetrievalStatusModule (upval), UseDispatchResult (copy), GetUserInventoryV2Module (upval), UseRoactServiceModuleResult (copy), EmotesCategory (upval), SearchUuid (upval)
		if Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching then
			UseDispatchResult(GetUserInventoryV2Module(UseRoactServiceModuleResult, EmotesCategory, SearchUuid))
		end
	end, {
		UseDispatchResult,
		Inverted,
		UseRoactServiceModuleResult,
		UseSelectorResult5
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseResult3 (copy)
		if UseAppPolicyModuleResult then
			UseResult3()
		end
	end, { UseAppPolicyModuleResult, UseResult3 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult3 (copy)
		UseResult3()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), ClearTryOnsFunction (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), ClearTryOnsFunction (upval)
			UseDispatchResult(ClearTryOnsFunction())
		end
	end, {})
	local Key: string = UseAvatarRouteResult.current.key
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	
	return {
		fetchMoreItems = UseResult3,
		gridMetrics = UseMemoResult,
		isSceneFullView = IsUseSelectorResultMatch,
		isUIFullView = IsUseSelectorResultMatch1,
		itemIds = UseSelectorResult3,
		onAbsoluteSizeChanged = UseResult,
		onBackButtonPressed = UseResult5,
		onScrollingFrameThresholdReached = UseResult4,
		onSlotActivated = UseResult2,
		impressionsTag = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else ""),
		analyticsMetadata = UseSelectorFunction(selectAnalyticsMetadata),
		requestImpressionsSignal = UseMemoResult1,
		impressionsPageFilter = ReactModule.useCallback(function(): boolean
			-- upvalues: Key (copy), UseNavigationResult (copy)
			return Key == UseNavigationResult.state.key
		end, { Key, UseNavigationResult.state.key }),
		onCanvasPositionChanged = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult1 (copy)
			UseMemoResult1:fire()
		end, { UseMemoResult1 }),
		searchUuid = SearchUuid,
		emotesCategory = EmotesCategory,
		showLoadMoreButton = IsNotUseSelectorResultMatch,
		showRecommendedItems = NoInverted,
		sendShopForMoreAnalytics = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), SendShopForMoreAnalyticsModule (upval), UseRoactServiceModuleResult1 (copy)
			UseDispatchResult(SendShopForMoreAnalyticsModule(UseRoactServiceModuleResult1))
		end, { UseDispatchResult, UseRoactServiceModuleResult1 })
	}
end