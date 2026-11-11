local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ReactModule = require(CorePackages.Packages.React)
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local RobloxEventReceiver = require(CorePackages.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver
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
local UseStoreFunction = RoactUtilsModule.Hooks.RoactRodux.useStore
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseNetworkingFunction = AvatarExperienceCommonModule.Hooks.useNetworking
local UseUnifiedImpressionExposerFunction = AvatarExperienceCommonModule.Hooks.useUnifiedImpressionExposer
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ConstantsModule = require(Modules.LuaApp.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local GetOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)
local GetUserInventoryV2Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local FFlagAXAvatarEditorStoresContext = AvatarExperienceFlagsModule.FFlagAXAvatarEditorStoresContext
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXFixEmptyMakeupLooks = AvatarExperienceFlagsModule.FFlagAXFixEmptyMakeupLooks
local FFlagAXRecommendedItemsImpressionExposureLogging = AvatarExperienceFlagsModule.FFlagAXRecommendedItemsImpressionExposureLogging
local FFlagAXTTIEditorEnableMilestones = AvatarExperienceFlagsModule.FFlagAXTTIEditorEnableMilestones
local EditorInventoryTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).EditorInventoryTTIMilestoneManager
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local AXYouMayAlsoLikeLooksExposureLogging = FFlagAXRecommendedItemsImpressionExposureLogging and game:DefineFastFlag("AXYouMayAlsoLikeLooksExposureLogging", false)
local AXYouMayAlsoLikeLooksExposureLayer = game:DefineFastString("AXYouMayAlsoLikeLooksExposureLayer", require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers.AvatarExperienceUACustomizeView)
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXOutfitPageRevamp = AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp

local function selectPageFinished(p1)
	return p1.AvatarExperience.AvatarEditor.PageFinished
end

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function selectAnalyticsMetadata(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

local function shouldRenderSettingsTile(p1): boolean
	return p1 == "OUTFIT_SWITCHER_SETTINGS_TILE"
end

return function(p1)
	-- upvalues: ReactModule (copy), ConstantsModule1 (copy), UtilsModule (copy), PerformFetch (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseStoreFunction (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), FoundationModule (copy), FFlagAXInventoryDurablesSupport (copy), UseSelectorFunction (copy), UtilsModule1 (copy), FFlagAXAvatarEditorStoresContext (copy), UseAvatarEditorStoresFunction (copy), UseSlotBasedEditorContextFunction (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), UseNetworkingFunction (copy), UseAppPolicyModule (copy), selectScreenSize (copy), GetUseSelectorDeepEqualsFunction (copy), selectPageFinished (copy), SelectIsFullViewModule (copy), RetrievalStatusModule (copy), FullView (copy), GridMetrics (copy), FFlagAXTTIEditorEnableMilestones (copy), GetUserInventoryV2Module (copy), GetOutfitsModule (copy), FFlagAEGetEditableOutfitsTypeModule (copy), EditorInventoryTTIMilestoneManager (copy), selectAnalyticsMetadata (copy), ConstantsModule (copy), Signal (copy), AXYouMayAlsoLikeLooksExposureLogging (copy), UseUnifiedImpressionExposerFunction (copy), AXYouMayAlsoLikeLooksExposureLayer (copy), FFlagAXEnableExpiredUserLookCheckout (copy), RobloxEventReceiver (copy), NotificationService (copy), ConstantsModule2 (copy), FetchAssetOrBundleInfoModule (copy), PromiseModule (copy), shouldRenderSettingsTile (copy), FFlagAXFixEmptyMakeupLooks (copy), FFlagAXOutfitPageRevamp (copy), FFlagAXRecommendedItemsImpressionExposureLogging (copy)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), ConstantsModule1 (upval), UtilsModule (upval)
		local OutfitInfos = p2.AvatarExperience.AvatarEditor.OutfitInfos
		local EquippedAssets = p2.AvatarExperience.AvatarEditor.Character.EquippedAssets
		local AvatarType = p2.AvatarExperience.AvatarEditor.Character.AvatarType
		local BodyColor3s = p2.AvatarExperience.AvatarEditor.Character.BodyColor3s
		local AvatarScales = p2.AvatarExperience.AvatarEditor.Character.AvatarScales
		local OwnedItemIdsBySubtype = p2.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
		local ItemIdsToIsWearing = {}
		local HasItemEquipped = false
		local Copy = if OwnedItemIdsBySubtype then table.clone(OwnedItemIdsBySubtype[p1.outfitKey] or {}) else {}
		local List = {}
		
		for _, value in Copy do
			local OutfitInfo = OutfitInfos[value]
			
			if OutfitInfo then
				if p1.outfitType == ConstantsModule1.OutfitTypes.Makeup and OutfitInfo.outfitType == ConstantsModule1.OutfitTypes.Makeup then
					table.insert(List, value)
				end
				local IsWearingOutfitNoState = UtilsModule.isWearingOutfitNoState(OutfitInfo, AvatarType, BodyColor3s, EquippedAssets, AvatarScales)
				ItemIdsToIsWearing[value] = IsWearingOutfitNoState
				
				if IsWearingOutfitNoState then
					HasItemEquipped = true
				end
			end
		end
		return {
			ownedItemIds = if p1.outfitType == ConstantsModule1.OutfitTypes.Makeup then List else Copy,
			itemIdsToIsWearing = ItemIdsToIsWearing,
			hasItemEquipped = HasItemEquipped
		}
	end, { p1.outfitKey })
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: PerformFetch (upval), p1 (copy)
		return PerformFetch.GetStatus(p3, p1.outfitKey)
	end, { p1.outfitKey })
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseStoreResult = UseStoreFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule)
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
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p3)
		return p3.getEnableContinuousLoad()
	end)
	local UseSelectorResult1 = UseSelectorFunction(selectScreenSize, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(selectPageFinished, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p3)
		-- upvalues: SelectIsFullViewModule (upval), UseAvatarRouteResult (copy)
		return SelectIsFullViewModule(p3, UseAvatarRouteResult.opaque.name)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(UseResult, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult5 = UseSelectorFunction(UseResult1, GetUseSelectorDeepEqualsFunction())
	local ItemIdsToIsWearing = UseSelectorResult4.itemIdsToIsWearing
	local HasItemEquipped = UseSelectorResult4.hasItemEquipped
	local Inverted = not UseSelectorResult2[p1.outfitKey]
	local IsNotUseSelectorResultMatch: boolean = not UseAppPolicyModuleResult and (Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult1.X * ConstantsModule1.LandscapeNavWidth)
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
	local UseResult2 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, { UseStateResult2 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult4 (copy), p1 (copy)
		if not UseSelectorResult4.ownedItemIds then
			return {}
		end
		local Copy = table.clone(UseSelectorResult4.ownedItemIds)
		
		if p1.showSettingsTile then
			table.insert(Copy, 1, "OUTFIT_SWITCHER_SETTINGS_TILE")
		end
		return Copy
	end, { UseSelectorResult4.ownedItemIds, p1.showSettingsTile })
	local UseRefResult = nil
	local UseRefResult1 = nil
	
	if FFlagAXTTIEditorEnableMilestones then
		UseRefResult = ReactModule.useRef(false)
		UseRefResult1 = ReactModule.useRef(false)
	end
	local UseResult21 = ReactModule.useCallback(function()
		-- upvalues: FFlagAXTTIEditorEnableMilestones (upval), Inverted (copy), UseSelectorResult5 (copy), RetrievalStatusModule (upval), FFlagAXInventoryDurablesSupport (upval), UseNetworkingResult (ref), CategoryInventoryStore (copy), UseRefResult (ref), UseDispatchResult (copy), GetUserInventoryV2Module (upval), UseSelectorResult (copy), GetOutfitsModule (upval), p1 (copy), FFlagAEGetEditableOutfitsTypeModule (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval)
		if FFlagAXTTIEditorEnableMilestones then
			if Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching then
				if FFlagAXInventoryDurablesSupport and UseNetworkingResult and CategoryInventoryStore then
					if FFlagAXTTIEditorEnableMilestones and UseRefResult then
						UseRefResult.current = true
					end
					UseDispatchResult(GetUserInventoryV2Module(UseNetworkingResult, UseSelectorResult, nil, CategoryInventoryStore, nil, if FFlagAXTTIEditorEnableMilestones then true else nil))
				end
				UseDispatchResult(GetOutfitsModule(p1.outfitKey, true, p1.outfitKey, if FFlagAEGetEditableOutfitsTypeModule then p1.outfitType else nil, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then UseNetworkingResult else nil, nil, nil, if FFlagAXTTIEditorEnableMilestones then true else nil))
				
				return
			end
		elseif Inverted and UseSelectorResult5 ~= RetrievalStatusModule.Fetching then
			UseDispatchResult(GetOutfitsModule(p1.outfitKey, true, p1.outfitKey, if FFlagAEGetEditableOutfitsTypeModule then p1.outfitType else nil, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then UseNetworkingResult else nil))
			
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
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyModuleResult (copy), UseResult21 (copy)
		if UseAppPolicyModuleResult then
			UseResult21()
		end
	end, { UseAppPolicyModuleResult, UseResult21 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult21 (copy)
		UseResult21()
	end, { UseResult21 })
	
	if FFlagAXTTIEditorEnableMilestones then
		local OwnedItemIds = UseSelectorResult4.ownedItemIds
		ReactModule.useEffect(function()
			-- upvalues: EditorInventoryTTIMilestoneManager (upval), UseRefResult (ref), UseRefResult1 (ref), OwnedItemIds (copy)
			if EditorInventoryTTIMilestoneManager and UseRefResult and UseRefResult.current and UseRefResult1 and not UseRefResult1.current and OwnedItemIds ~= nil and #OwnedItemIds > 0 then
				UseRefResult1.current = true
				EditorInventoryTTIMilestoneManager.endTilesTracking()
			end
		end, { OwnedItemIds })
	end
	local UseSelectorResult6 = UseSelectorFunction(selectAnalyticsMetadata)
	local Key: string = UseAvatarRouteResult.current.key
	local Text = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else "")
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseResult4 = ReactModule.useCallback(function(): boolean
		-- upvalues: Key (copy), UseNavigationResult (copy)
		return Key == UseNavigationResult.state.key
	end, { Key, UseNavigationResult.state.key })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult2 (copy)
		UseMemoResult2:fire()
	end, { UseMemoResult2 })
	local UseRefResult2 = nil
	local UseMemoResult3 = nil
	
	if AXYouMayAlsoLikeLooksExposureLogging then
		UseRefResult2 = ReactModule.useRef(nil)
		local UseUnifiedImpressionExposerResult = UseUnifiedImpressionExposerFunction(UseRefResult2, AXYouMayAlsoLikeLooksExposureLayer)
		UseMemoResult3 = ReactModule.useMemo(function()
			-- upvalues: UseUnifiedImpressionExposerResult (copy)
			return { UseUnifiedImpressionExposerResult }
		end, { UseUnifiedImpressionExposerResult })
	end
	if FFlagAXEnableExpiredUserLookCheckout then
		local UseMemoResult4 = ReactModule.useMemo(function()
			-- upvalues: RobloxEventReceiver (upval), NotificationService (upval)
			return RobloxEventReceiver.new(NotificationService)
		end, {})
		local UseRefResult3 = ReactModule.useRef(nil)
		
		if UseMemoResult4 ~= nil then
			UseRefResult3.current = UseMemoResult4:observeEvent("AvatarAssetOwnershipNotifications", function()
				-- upvalues: FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval), UseRoactServiceResult (copy), UseDispatchResult (copy), GetOutfitsModule (upval), ConstantsModule2 (upval), FFlagAEGetEditableOutfitsTypeModule (upval), ConstantsModule1 (upval), UseStoreResult (copy), FetchAssetOrBundleInfoModule (upval), UseRoactServiceResult1 (copy), PromiseModule (upval)
				local UseRoactServiceResult2 = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then UseRoactServiceResult else nil
				local UseDispatchResultResult = UseDispatchResult(GetOutfitsModule(ConstantsModule2.EditableCharacterKey, true, ConstantsModule2.EditableCharacterKey, if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule1.OutfitTypes.Avatar else nil, UseRoactServiceResult2, true, true))
				local UseDispatchResultResult1 = if ConstantsModule1.OutfitTypes.Makeup == nil then nil else UseDispatchResult(GetOutfitsModule(ConstantsModule2.MakeupOutfitKey, true, ConstantsModule2.MakeupOutfitKey, if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule1.OutfitTypes.Makeup else nil, UseRoactServiceResult2, true, true))
				local v3 = if UseDispatchResultResult1 and typeof(UseDispatchResultResult1.andThen) == "function" then UseDispatchResultResult1:andThen(function()
					-- upvalues: UseStoreResult (upval), ConstantsModule2 (upval), UseDispatchResult (upval), FetchAssetOrBundleInfoModule (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), ConstantsModule1 (upval)
					local State = UseStoreResult:getState()
					local OwnedItemIdsBySubtypeEntry = State.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[ConstantsModule2.MakeupOutfitKey]
					
					if OwnedItemIdsBySubtypeEntry == nil then return end
					local OutfitInfos = State.AvatarExperience.AvatarEditor.OutfitInfos
					local t = {}
					
					for _, value in OwnedItemIdsBySubtypeEntry do
						local OutfitInfo = OutfitInfos[value]
						
						if OutfitInfo ~= nil and OutfitInfo.assets ~= nil then
							for _, asset in OutfitInfo.assets do
								for i in asset do
									if not t[i] then
										t[i] = true
										UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceResult, UseRoactServiceResult1, i, ConstantsModule1.ItemType.Asset, true))
									end
								end
							end
						end
					end
				end) else nil
				local List = {}
				
				if UseDispatchResultResult and typeof(UseDispatchResultResult.andThen) == "function" then
					table.insert(List, UseDispatchResultResult)
				end
				if v3 and typeof(v3.andThen) == "function" then
					table.insert(List, v3)
				elseif UseDispatchResultResult1 and typeof(UseDispatchResultResult1.andThen) == "function" then
					table.insert(List, UseDispatchResultResult1)
				end
				if #List > 0 then
					PromiseModule.all(List)
				end
			end)
		end
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult3 (copy)
			return function()
				-- upvalues: UseRefResult3 (upval)
				if UseRefResult3.current ~= nil then
					UseRefResult3.current:disconnect()
					UseRefResult3.current = nil
				end
			end
		end, {})
	end
	return {
		fetchMoreOutfits = UseResult21,
		gridMetrics = UseMemoResult,
		hasItemFromCurrentPageEquipped = HasItemEquipped,
		isSceneFullView = IsUseSelectorResultMatch,
		isUIFullView = IsUseSelectorResultMatch1,
		itemIds = UseMemoResult1,
		itemIdsToIsWearing = ItemIdsToIsWearing,
		onAbsoluteSizeChanged = UseResult2,
		onScrollingFrameThresholdReached = UseResult3,
		shouldRenderSettingsTile = shouldRenderSettingsTile,
		impressionsTag = Text,
		analyticsMetadata = UseSelectorResult6,
		requestImpressionsSignal = UseMemoResult2,
		impressionsPageFilter = UseResult4,
		onCanvasPositionChanged = UseResult5,
		searchUuid = p1.outfitKey,
		showLoadMoreButton = IsNotUseSelectorResultMatch,
		outfitType = if FFlagAXFixEmptyMakeupLooks or FFlagAXOutfitPageRevamp then p1.outfitType else nil,
		recommendedItemsRef = if FFlagAXRecommendedItemsImpressionExposureLogging then UseRefResult2 else nil,
		tagBasedImpressionsDetectorExtensions = if FFlagAXRecommendedItemsImpressionExposureLogging then UseMemoResult3 else nil
	}
end