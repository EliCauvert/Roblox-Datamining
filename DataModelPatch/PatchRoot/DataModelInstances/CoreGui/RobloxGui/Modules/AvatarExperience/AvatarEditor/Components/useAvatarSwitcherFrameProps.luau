local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local FoundationModule = require(CorePackages.Packages.Foundation)
local GridMetrics = require(CorePackages.Packages.UIBlox).App.Grid.GridMetrics
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local FFlagAEGetEditableOutfitsTypeModule = require(Modules.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local UseAvatarEditorStoresFunction = AvatarExperienceSlotBasedEditorModule.Context.useAvatarEditorStores
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseNetworkingFunction = AvatarExperienceCommonModule.Hooks.useNetworking
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local GetOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)
local GetUserInventoryV2Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2)
local FFlagAXAvatarEditorStoresContext = AvatarExperienceFlagsModule.FFlagAXAvatarEditorStoresContext
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local EditableCharacterKey = ConstantsModule1.EditableCharacterKey

local function selectPageFinished(p1)
	return p1.AvatarExperience.AvatarEditor.PageFinished
end

local function selectOwnedItemIdsWearing(p1)
	-- upvalues: EditableCharacterKey (copy), UtilsModule (copy)
	local OutfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	local BodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales
	local OwnedItemIdsBySubtype = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
	local ItemIdsToIsWearing = {}
	local HasItemEquipped = false
	local Copy = if OwnedItemIdsBySubtype then table.clone(OwnedItemIdsBySubtype[EditableCharacterKey] or {}) else {}
	for _, value in Copy do
		local OutfitInfo = OutfitInfos[value]
		
		if OutfitInfo then
			local IsWearingOutfitNoState = UtilsModule.isWearingOutfitNoState(OutfitInfo, AvatarType, BodyColor3s, EquippedAssets, AvatarScales)
			ItemIdsToIsWearing[value] = IsWearingOutfitNoState
			
			if IsWearingOutfitNoState then
				HasItemEquipped = true
			end
		end
	end
	return {
		ownedItemIds = Copy,
		itemIdsToIsWearing = ItemIdsToIsWearing,
		hasItemEquipped = HasItemEquipped
	}
end

local function selectScreenSize(p2)
	return p2.ScreenSize
end

local function selectAnalyticsMetadata(p2)
	return p2.AvatarExperience.AnalyticsMetadata
end

local function selectFetchStatus(p2)
	-- upvalues: PerformFetch (copy), EditableCharacterKey (copy)
	return PerformFetch.GetStatus(p2, EditableCharacterKey)
end

local function shouldRenderSettingsTile(p2): boolean
	return p2 == "AVATAR_SWITCHER_SETTINGS_TILE"
end

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), FoundationModule (copy), FFlagAXInventoryDurablesSupport (copy), UseSelectorFunction (copy), UtilsModule1 (copy), FFlagAXAvatarEditorStoresContext (copy), UseAvatarEditorStoresFunction (copy), UseSlotBasedEditorContextFunction (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), UseNetworkingFunction (copy), UseAppPolicyModule (copy), selectScreenSize (copy), GetUseSelectorDeepEqualsFunction (copy), selectPageFinished (copy), SelectIsFullViewModule (copy), selectOwnedItemIdsWearing (copy), selectFetchStatus (copy), EditableCharacterKey (copy), RetrievalStatusModule (copy), ReactModule (copy), ConstantsModule2 (copy), FullView (copy), GridMetrics (copy), GetOutfitsModule (copy), ConstantsModule1 (copy), FFlagAEGetEditableOutfitsTypeModule (copy), GetUserInventoryV2Module (copy), selectAnalyticsMetadata (copy), ConstantsModule (copy), Signal (copy), shouldRenderSettingsTile (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseSelectorResult = if FFlagAXInventoryDurablesSupport then UseSelectorFunction(UtilsModule1.getAvatarEditorCategoryInfoFromState) else nil
	local v1 = nil
	local v2 = nil
	
	if FFlagAXInventoryDurablesSupport then
		if FFlagAXAvatarEditorStoresContext then
			v1 = UseAvatarEditorStoresFunction()
		else
			v2 = UseSlotBasedEditorContextFunction()
		end
	end
	local CategoryInventoryStore = if FFlagAXInventoryDurablesSupport and UseSelectorResult then if FFlagAXAvatarEditorStoresContext then v1.categoryInventoryStores[UseSelectorResult.NavigationKey] else v2.categoryInventoryStores[UseSelectorResult.NavigationKey] else nil
	local UseNetworkingResult = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then UseNetworkingFunction() else nil
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getEnableContinuousLoad()
	end)
	local UseSelectorResult1 = UseSelectorFunction(selectScreenSize, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(selectPageFinished, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: SelectIsFullViewModule (upval), UseAvatarRouteResult (copy)
		return SelectIsFullViewModule(p2, UseAvatarRouteResult.opaque.name)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(selectOwnedItemIdsWearing, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult5 = UseSelectorFunction(selectFetchStatus, GetUseSelectorDeepEqualsFunction())
	local ItemIdsToIsWearing = UseSelectorResult4.itemIdsToIsWearing
	local HasItemEquipped = UseSelectorResult4.hasItemEquipped
	local Inverted = not UseSelectorResult2[EditableCharacterKey]
	local IsNotUseSelectorResultMatch: boolean = not UseAppPolicyModuleResult and (Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult1.X * ConstantsModule2.LandscapeNavWidth)
	local Largest = math.max(0, UseStateResult - UseTokensResult.Gap.Small * 2)
	local IsUseSelectorResultMatch = UseSelectorResult3 == FullView.SceneFullView
	local IsUseSelectorResultMatch1 = UseSelectorResult3 == FullView.UIFullView
	local XLarge = UseTokensResult.Gap.XLarge
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GridMetrics (upval), Largest (copy), XLarge (copy)
		local MetricsForFixedColumns = GridMetrics.getMetricsForFixedColumns(math.max(Largest, 0), XLarge, 4)
		local MediumMetrics = GridMetrics.getMediumMetrics(math.max(Largest, 0), XLarge)
		
		if MediumMetrics.itemsPerRow < MetricsForFixedColumns.itemsPerRow then
			MediumMetrics = MetricsForFixedColumns
		end
		return MediumMetrics
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, { UseStateResult2 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult4 (copy)
		if UseSelectorResult4.ownedItemIds then
			local Copy = table.clone(UseSelectorResult4.ownedItemIds)
			table.insert(Copy, 1, "AVATAR_SWITCHER_SETTINGS_TILE")
			
			return Copy
		else
			return {}
		end
	end, { UseSelectorResult4.ownedItemIds })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Inverted (copy), UseSelectorResult5 (copy), RetrievalStatusModule (upval), UseDispatchResult (copy), GetOutfitsModule (upval), ConstantsModule1 (upval), EditableCharacterKey (upval), FFlagAEGetEditableOutfitsTypeModule (upval), ConstantsModule2 (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), UseNetworkingResult (ref), FFlagAXInventoryDurablesSupport (upval), CategoryInventoryStore (copy), GetUserInventoryV2Module (upval), UseSelectorResult (copy)
		if Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching then
			UseDispatchResult(GetOutfitsModule(ConstantsModule1.EditableCharacterKey, true, EditableCharacterKey, if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule2.OutfitTypes.Avatar else nil, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then UseNetworkingResult else nil))
			
			if FFlagAXInventoryDurablesSupport and UseNetworkingResult and CategoryInventoryStore then
				UseDispatchResult(GetUserInventoryV2Module(UseNetworkingResult, UseSelectorResult, nil, CategoryInventoryStore))
			end
		end
	end, {
		UseDispatchResult, Inverted, UseSelectorResult5,
		if FFlagAXInventoryDurablesSupport then UseNetworkingResult else nil,
		if FFlagAXInventoryDurablesSupport then UseSelectorResult else nil,
		if FFlagAXInventoryDurablesSupport then CategoryInventoryStore else nil
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseResult1 (copy)
		if UseAppPolicyModuleResult then
			UseResult1()
		end
	end, { UseAppPolicyModuleResult, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		UseResult1()
	end, {
		if FFlagAXInventoryDurablesSupport then UseResult1 else nil
	})
	local Key: string = UseAvatarRouteResult.current.key
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	
	return {
		fetchMoreOutfits = UseResult1,
		gridMetrics = UseMemoResult,
		hasItemFromCurrentPageEquipped = HasItemEquipped,
		isSceneFullView = IsUseSelectorResultMatch,
		isUIFullView = IsUseSelectorResultMatch1,
		itemIds = UseMemoResult1,
		itemIdsToIsWearing = ItemIdsToIsWearing,
		onAbsoluteSizeChanged = UseResult,
		onScrollingFrameThresholdReached = UseResult2,
		shouldRenderSettingsTile = shouldRenderSettingsTile,
		impressionsTag = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else ""),
		analyticsMetadata = UseSelectorFunction(selectAnalyticsMetadata),
		requestImpressionsSignal = UseMemoResult2,
		impressionsPageFilter = ReactModule.useCallback(function(): boolean
			-- upvalues: Key (copy), UseNavigationResult (copy)
			return Key == UseNavigationResult.state.key
		end, { Key, UseNavigationResult.state.key }),
		onCanvasPositionChanged = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult2 (copy)
			UseMemoResult2:fire()
		end, { UseMemoResult2 }),
		searchUuid = EditableCharacterKey,
		showLoadMoreButton = IsNotUseSelectorResultMatch
	}
end