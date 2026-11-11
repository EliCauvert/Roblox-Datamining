local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCard
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local UseRequestModule = require(Modules.AvatarExperience.Common.Hooks.useRequest)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local WithTextSizeOffsetFunction = UIBloxModule.Core.Style.withTextSizeOffset
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.AvatarEditor.Reducers.UserInventoryRecommendations)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local SetOwnedItemIdsBySubtypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local ConstantsModule = require(Modules.LuaApp.Constants)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local EmptyPageModule = require(Modules.AvatarExperience.AvatarEditor.Components.EmptyPage)
local FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation
local AvatarEditorItemCardModule = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then require(Modules.AvatarExperience.AvatarEditor.Components.AvatarEditorItemCard) else require(Modules.AvatarExperience.AvatarEditor.Components.ItemCard_DEPRECATED)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AXRefreshScrollingFrameWithLoadMoreModule = require(Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local RecommendedItemsModule = require(Modules.AvatarExperience.Common.Components.RecommendedItems)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local GetUserInventoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventory)
local GetUserInventoryV2Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2)
local GetOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local SelectOwnedItemIdToIsWearingModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectOwnedItemIdToIsWearing)
local SendShopForMoreAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local SignalConnectionModule = require(Modules.LuaApp.Components.SignalConnection)
local WasLastInputGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).wasLastInputGamepad
local _ = require(Modules.AvatarExperience.Common.Types)
local WithAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.withAdaptiveScrolling
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local OrganicEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local UseUnifiedEventImpressionsReporterFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter
local AXCatalogHeadCategoryCombineIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP)
local FStringAXImpressionsEventNameModule = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local RequestStatusEnumModule = require(Modules.AvatarExperience.Common.Enum.RequestStatusEnum)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local FixItemListHasMoreItems = game:DefineFastFlag("FixItemListHasMoreItems", false)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXItemDetailsIxpExposure = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure
local FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXAdaptiveScrollingFixForward = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAdaptiveScrollingFixForward
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXTTIEditorEnableMilestones = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones
local IsTenFootInterface = GuiService:IsTenFootInterface()
local ShimmerCardsToDisplay = ConstantsModule1.ShimmerCardsToDisplay
local AddOutfitButton = ConstantsModule2.AddOutfitButton
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local ForwardRefResult = ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), ItemCard (copy), RoactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ImageSetLabel (copy), Images (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(ItemCard, {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onActivated = p1.onActivated,
		ref = Ref,
		headerSlot = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Common.Shimmer else UseTokensResult.Semantic.Color.Common.Placeholder).Color3,
			BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Common.Shimmer else UseTokensResult.Semantic.Color.Common.Placeholder).Transparency,
			ClipsDescendants = true,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize.X)
			end,
			Size = UseBindingResult:map(function(YOffset): UDim2
				return UDim2.new(1, 0, 0, YOffset)
			end)
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium)
			}),
			Image = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ImageTransparency = 0,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = Images["icons/menu/customize"],
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(0, 36, 0, 36),
				ScaleType = Enum.ScaleType.Stretch
			})
		})
	})
end)
local ForwardRefResult1 = ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseLocalizationFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({ loadMore = "Feature.Catalog.Action.LoadMore" })
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
		ref = Ref,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown,
		LayoutOrder = Frame.LayoutOrder
	}, {
		LoadMoreButton = ReactModule.createElement(Button, {
			onActivated = Frame.onActivated,
			text = UseLocalizationResult.loadMore,
			standardSize = StandardButtonSize.Regular,
			buttonType = ButtonType.Secondary,
			size = UDim2.fromScale(1, 1),
			anchorPoint = Vector2.new(0.5, 0.5),
			position = UDim2.fromScale(0.5, 0.5)
		})
	})
end)

local function _(p1): boolean
	return not p1
end

local ItemsList = RoactModule.PureComponent:extend("ItemsList")

function ItemsList.init(p1)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), Signal (copy), FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation (copy), FFlagAXTTIEditorEnableMilestones (copy), ConstantsModule1 (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), ConstantsModule2 (copy)
	p1.state = {
		listWidth = 0,
		restorePreviousChildFocus = true,
		hasItemFromCurrentPageEquipped = false,
		loadableGridViewWidth = 0,
		ownedItemIdToIsWearing = {}
	}
	p1.lastYPosition = 0
	p1.isMounted = false
	p1.listFrameRef = p1.props.forwardRef or RoactModule.createRef()
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.loadableGridViewRef = RoactModule.createRef()
	p1.recommendedItemsRef = RoactModule.createRef()
	p1.loadMoreRef = RoactModule.createRef()
	p1.emptyStateRef = RoactModule.createRef()
	p1.itemDetailsPeekViewRefs = RoactGamepadModule.createRefCache()
	p1.requestImpressionsSignal = Signal.new()
	p1.addOutfitButtonRef = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then RoactModule.createRef() else nil
	p1.resultsListRef = RoactModule.createRef()
	
	function p1.onLoadableGridViewAbsoluteSizeChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.loadableGridViewWidth ~= Frame.AbsoluteSize.X then
			p1:setState({ loadableGridViewWidth = Frame.AbsoluteSize.X })
		end
	end
	
	function p1.checkSetListWidth(Frame)
		-- upvalues: p1 (copy)
		if Frame and Frame:IsDescendantOf(game) then
			p1:setState({ listWidth = Frame.AbsoluteSize.X })
		end
	end
	
	function p1.loadMoreUserInventoryItems()
		-- upvalues: p1 (copy), FFlagAXTTIEditorEnableMilestones (upval), ConstantsModule1 (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), AXCatalogHeadCategoryCombineIXPModule (upval), ConstantsModule2 (upval)
		local CategoryInfo = p1.props.categoryInfo
		local Networking = p1.props.networking
		local IsOutfitsPage = p1.props.isOutfitsPage
		local AssetTypeKey = p1.props.assetTypeKey
		local IsPageTypeMatch = if FFlagAXTTIEditorEnableMilestones then CategoryInfo.PageType == ConstantsModule1.PageType.Emotes else nil
		
		if GetFFlagAXEnableSlotBasedEditorModule() and CategoryInfo.UseGetInventoryV2 or not IsOutfitsPage then
			return p1.props.getUserInventoryV2(Networking, CategoryInfo, p1.props.nextPageCursorKey, if FFlagAXTTIEditorEnableMilestones then IsPageTypeMatch else nil)
		elseif AXCatalogHeadCategoryCombineIXPModule.isEnabled() and p1.props.enableHeadCategoryCombine and CategoryInfo.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead and CategoryInfo.AssetTypeIdStrings then
			return p1.props.getUserInventoryV2(Networking, CategoryInfo, p1.props.nextPageCursorKey, if FFlagAXTTIEditorEnableMilestones then IsPageTypeMatch else nil)
		elseif IsOutfitsPage then
			local OutfitType = CategoryInfo.OutfitType
			
			return p1.props.getOutfits(AssetTypeKey, AssetTypeKey == ConstantsModule2.EditableCharacterKey, AssetTypeKey .. (OutfitType or ""), OutfitType)
		else
			return p1.props.getUserInventory(CategoryInfo)
		end
	end
	
	function p1.onFocusGained()
		-- upvalues: p1 (copy)
		p1:setState({ restorePreviousChildFocus = true })
	end
	
	function p1.setParentRestorePreviousChildFocus(RestorePreviousChildFocus)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ restorePreviousChildFocus = RestorePreviousChildFocus })
			
			return
		end
	end
	
	function p1.sendShopForMoreAnalytics()
		-- upvalues: p1 (copy)
		p1.props.sendShopForMoreAnalytics(p1.props.avatarEditorAnalytics)
	end
	
	function p1.scrollBackToTop()
		-- upvalues: p1 (copy)
		local Current = p1.scrollingFrameRef.current
		
		if Current then
			Current:ScrollToTop()
		end
	end
end

function ItemsList.renderNonOutfitItemCard(p1, ItemId, p2, TitleFontStyle, GridInformation)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), AvatarEditorItemCardModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	local Key: string = p1.props.avatarRoute.current.key
	
	return RoactModule.createElement(AvatarEditorItemCardModule, {
		isOutfit = false,
		impressionsSchema = "defaultItem",
		itemId = ItemId,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2,
		isWearingAssetOrOutfit = p1.props.ownedItemIdToIsWearing[ItemId],
		titleFontStyle = TitleFontStyle,
		itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
		resultsListRef = p1.resultsListRef,
		impressionsTag = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else ""),
		gridInformation = GridInformation
	})
end

function ItemsList.getShowAddOutfitButton(p1): boolean
	-- upvalues: IsTenFootInterface (copy), ConstantsModule2 (copy)
	return not IsTenFootInterface and p1.props.assetTypeKey == ConstantsModule2.EditableCharacterKey
end

function ItemsList.renderNonOutfitItemCardWithOverlay(p1, p2, p3, TitleFontStyle, ItemId, GridInformation)
	-- upvalues: RoactModule (copy)
	if typeof(ItemId) == "table" then
		ItemId = nil
	end
	return if p1.props.darkenItemsGrid then RoactModule.createFragment({
		GamepadDarkOverlay = RoactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = p3.Theme.Overlay.Transparency,
			BackgroundColor3 = p3.Theme.Overlay.Color
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) })
		}),
		ItemCard = p1:renderNonOutfitItemCard(ItemId, p2, TitleFontStyle, GridInformation)
	}) else p1:renderNonOutfitItemCard(ItemId, p2, TitleFontStyle, GridInformation)
end

function ItemsList.renderGenericItemCard(p1, p2, p3, TitleFontStyle, ItemId, GridInformation)
	-- upvalues: ConstantsModule2 (copy)
	return if p1.props.outfitOrAsset[ItemId] == ConstantsModule2.OutfitOrAsset.Outfit then p1:renderOutfitItemCard(ItemId, TitleFontStyle, GridInformation) else p1:renderNonOutfitItemCardWithOverlay(p2, p3, TitleFontStyle, ItemId, GridInformation)
end

if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then
	function ItemsList.openCreateOrUpdateCostumeMenu(p1)
		-- upvalues: AvatarScreen (copy)
		local Value = p1.addOutfitButtonRef:getValue()
		
		if Value then
			local NewAbsolutePosition = Value.AbsolutePosition + Value.AbsoluteSize * Vector2.new(0.5, 0.5)
			p1.props.navigateWithLock(function()
				-- upvalues: p1 (copy), AvatarScreen (upval), NewAbsolutePosition (copy)
				p1.props.navigation.navigate(AvatarScreen.CreateOrUpdateOutfitMenu, { saveTilePosition = NewAbsolutePosition })
			end)
			
			return
		end
	end
end
function ItemsList.renderOutfitItemCard(p1, ItemId, TitleFontStyle, GridInformation)
	-- upvalues: FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation (copy), AddOutfitButton (copy), ReactModule (copy), ForwardRefResult (copy), ConstantsModule (copy), RoactModule (copy), AvatarEditorItemCardModule (copy)
	if typeof(ItemId) == "table" then
		ItemId = nil
	end
	if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation and ItemId == AddOutfitButton then
		return ReactModule.createElement(ForwardRefResult, {
			ref = p1.addOutfitButtonRef,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1:openCreateOrUpdateCostumeMenu()
			end
		})
	else
		local Key: string = p1.props.avatarRoute.current.key
		
		return RoactModule.createElement(AvatarEditorItemCardModule, {
			isOutfit = true,
			impressionsSchema = "defaultItem",
			itemId = ItemId,
			isWearingAssetOrOutfit = p1.props.ownedItemIdToIsWearing[ItemId],
			hasItemFromCurrentPageEquipped = p1.props.hasItemFromCurrentPageEquipped,
			titleFontStyle = TitleFontStyle,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			resultsListRef = p1.resultsListRef,
			impressionsTag = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else ""),
			gridInformation = GridInformation
		})
	end
end

function ItemsList.renderRecommendedItems(p1, CategoryInfo, _, ForwardRef, LoadMoreRef)
	-- upvalues: ConstantsModule2 (copy), RoactModule (copy), RecommendedItemsModule (copy)
	return if CategoryInfo.RecommendationsType and (CategoryInfo.RecommendationsType ~= ConstantsModule2.RecommendationsType.None and p1.props.pageFinished) then RoactModule.createElement(RecommendedItemsModule, {
		LayoutOrder = 4,
		categoryInfo = CategoryInfo,
		sendShopForMoreAnalytics = p1.sendShopForMoreAnalytics,
		baseRef = p1.recommendedItemsRef,
		NextSelectionUp = if p1.props.darkenItemsGrid then nil else LoadMoreRef,
		itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
		listFrameRef = ForwardRef or p1.listFrameRef
	}) else nil
end

function ItemsList.renderItemsList(p1, p2, p3)
	-- upvalues: RetrievalStatusModule (copy), ConstantsModule2 (copy), AddOutfitButton (copy), CryoModule (copy), ShimmerCardsToDisplay (copy), WithStyleFunction (copy), FFlagAXRootSlotBasedEditorFlag (copy), GridMetrics (copy), ConstantsModule1 (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), ConstantsModule (copy), UtilsModule (copy), ReactModule (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), AvatarScreen (copy), FFlagAXAdaptiveScrollingFixForward (copy), RoactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), SignalConnectionModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FitFrameVertical (copy), Focusable (copy), LoadableGridViewModule (copy), EmptyPageModule (copy), OrganicEventImpressionsReporterModule (copy), FStringAXImpressionsEventNameModule (copy), ImpressionEnums (copy), TagBasedImpressionsDetector (copy), ForwardRefResult1 (copy), WasLastInputGamepadFunction (copy), LoadingBarWithThemeModule (copy)
	local CategoryInfo = p1.props.categoryInfo
	local DataStatus = p1.props.dataStatus
	local HasMoreUserInventoryItems = p1.props.hasMoreUserInventoryItems
	local ScreenSize = p1.props.screenSize
	local OwnedItemIds = p1.state.ownedItemIds
	local ItemsContainsOutfits = p1.state.itemsContainsOutfits
	local ListWidth = p1.state.listWidth
	local Flag: boolean = if OwnedItemIds then #OwnedItemIds > 0 else false
	local NoFlag: boolean = DataStatus == RetrievalStatusModule.Fetching and not Flag
	local IsDataStatusMatch: boolean = DataStatus == RetrievalStatusModule.NotStarted or NoFlag
	local ItemsGridSidePadding = if ConstantsModule2.ItemsGridSidePadding < ListWidth then ConstantsModule2.ItemsGridSidePadding else 0
	local JoinResult = OwnedItemIds
	
	if OwnedItemIds and ItemsContainsOutfits and OwnedItemIds[1] ~= AddOutfitButton and p1:getShowAddOutfitButton() then
		JoinResult = CryoModule.List.join({ AddOutfitButton }, OwnedItemIds)
		Flag = true
	end
	local CountJoinResult = JoinResult and #JoinResult or ShimmerCardsToDisplay
	local v1: boolean = p1.props.ownedItemIdsBySubtype[p1.props.assetTypeKey] ~= nil and #p1.props.ownedItemIdsBySubtype[p1.props.assetTypeKey] > 0
	
	if IsDataStatusMatch then
		JoinResult = nil
		CountJoinResult = ShimmerCardsToDisplay
	elseif not JoinResult and v1 then
		CountJoinResult = ShimmerCardsToDisplay
	end
	local Flag1: boolean = Flag or (IsDataStatusMatch or v1)
	local AdaptiveScrolling = p1.props.adaptiveScrolling or {}
	p1.requestImpressionsSignal:fire()
	
	return WithStyleFunction(function(p4)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (upval), GridMetrics (upval), ConstantsModule2 (upval), p1 (copy), ConstantsModule1 (upval), p3 (copy), ItemsContainsOutfits (copy), p2 (copy), GetFFlagAXEnableSlotBasedEditorModule (upval), AXCatalogHeadCategoryCombineIXPModule (upval), CategoryInfo (copy), ConstantsModule (upval), UtilsModule (upval), NoFlag (copy), IsDataStatusMatch (copy), HasMoreUserInventoryItems (copy), Flag1 (copy), ReactModule (upval), AXRefreshScrollingFrameWithLoadMoreModule (upval), AvatarScreen (upval), AdaptiveScrolling (copy), FFlagAXAdaptiveScrollingFixForward (upval), RoactModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), SignalConnectionModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), FitFrameVertical (upval), Focusable (upval), ItemsGridSidePadding (copy), LoadableGridViewModule (upval), JoinResult (ref), CountJoinResult (ref), ScreenSize (copy), EmptyPageModule (upval), OrganicEventImpressionsReporterModule (upval), FStringAXImpressionsEventNameModule (upval), ImpressionEnums (upval), TagBasedImpressionsDetector (upval), ForwardRefResult1 (upval), WasLastInputGamepadFunction (upval), LoadingBarWithThemeModule (upval), Flag (ref)
		local CaptionHeader = nil
		local _Font = p4.Font
		CaptionHeader = if FFlagAXRootSlotBasedEditorFlag then _Font.CaptionHeader else _Font.Header2
		local ScaledRelativeSize = CaptionHeader.RelativeSize * _Font.BaseSize
		
		if GridMetrics.makeCustomMetricsGetter(ConstantsModule2.ItemsGridMetrics)(p1.state.loadableGridViewWidth, ConstantsModule1.LoadableGridViewCellPadding).itemWidth / ScaledRelativeSize < ConstantsModule1.MinTileWidthToFontHeightRatio then
			CaptionHeader = _Font.CaptionBody
			ScaledRelativeSize = CaptionHeader.RelativeSize * _Font.BaseSize
		end
		local NewScaledRelativeSize = ScaledRelativeSize + (p3 or 0)
		local RenderItem: (any, any, any) -> any = if ItemsContainsOutfits then function(ItemId, _, GridInformation)
			-- upvalues: p1 (upval), CaptionHeader (ref)
			return p1:renderOutfitItemCard(ItemId, CaptionHeader, GridInformation)
		end else function(ItemId, _, GridInformation)
			-- upvalues: p1 (upval), p2 (upval), p4 (copy), CaptionHeader (ref)
			return p1:renderNonOutfitItemCardWithOverlay(p2, p4, CaptionHeader, ItemId, GridInformation)
		end
		
		if (GetFFlagAXEnableSlotBasedEditorModule() or AXCatalogHeadCategoryCombineIXPModule.isEnabled() and p1.props.enableHeadCategoryCombine) and CategoryInfo.UseGetInventoryV2 then
			RenderItem = function(ItemId, _, GridInformation)
				-- upvalues: p1 (upval), p2 (upval), p4 (copy), CaptionHeader (ref)
				return p1:renderGenericItemCard(p2, p4, CaptionHeader, ItemId, GridInformation)
			end
		end
		local Key: string = p1.props.avatarRoute.current.key
		local GridItemHeightGetterResult = if p1.props.categoryInfo.HideTextUnderTile then UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.AvatarEditorTile) else UtilsModule.GridItemHeightGetter(ConstantsModule1.ItemTileType.AvatarEditorTile, NewScaledRelativeSize)
		local BackToTopSignal = p1.props.backToTopSignal
		local EnableContinuousLoad = p1.props.enableContinuousLoad
		local IsFetchingMore = p1.props.isFetchingMore or (NoFlag or IsDataStatusMatch)
		local HasMoreUserInventoryItems1 = not IsFetchingMore and HasMoreUserInventoryItems
		local NoEnableContinuousLoad: boolean = HasMoreUserInventoryItems1 and not EnableContinuousLoad
		local PageFinished = CategoryInfo.RecommendationsType and (CategoryInfo.RecommendationsType ~= ConstantsModule2.RecommendationsType.None and p1.props.pageFinished)
		
		return ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			createEndOfScrollElement = false,
			parentAppPage = AvatarScreen.AvatarEditor,
			ScrollingEnabled = if AdaptiveScrolling.scrollingEnabledBinding then AdaptiveScrolling.scrollingEnabledBinding:map(function(p5)
				return p5
			end) elseif FFlagAXAdaptiveScrollingFixForward then true else AdaptiveScrolling.scrollingEnabled,
			[RoactModule.Ref] = p1.scrollingFrameRef,
			onCanvasPositionChanged = function(ScrollFrame)
				-- upvalues: p1 (upval), AdaptiveScrolling (upval)
				p1.requestImpressionsSignal:fire()
				local Y = ScrollFrame.CanvasPosition.Y
				
				if AdaptiveScrolling and AdaptiveScrolling.onCanvasYChanged then
					AdaptiveScrolling.onCanvasYChanged(Y)
				end
			end,
			onThresholdReached = if HasMoreUserInventoryItems1 and EnableContinuousLoad then p1.props.loadMoreItems else nil
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p4.Tokens.Size.Size_800 else p4.Tokens.Global.Space_400)
			}),
			BackToTopSignal = if BackToTopSignal then ReactModule.createElement(SignalConnectionModule, { signal = BackToTopSignal, callback = p1.scrollBackToTop }) else nil,
			ListWrapper = ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then FitFrameVertical else Focusable[FitFrameVertical], {
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				BackgroundTransparency = p1.props.darkenItemsGrid and p4.Theme.Overlay.Transparency or 1,
				BackgroundColor3 = p1.props.darkenItemsGrid and p4.Theme.Overlay.Color or nil,
				margin = {
					top = ConstantsModule2.ItemsGridTopPadding,
					bottom = ConstantsModule2.ItemsGridBottomPadding,
					left = ItemsGridSidePadding / 2,
					right = ItemsGridSidePadding / 2
				},
				ref = p1.loadableGridViewRef,
				defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.resultsListRef
			}, {
				LoadableGridView = Flag1 and ReactModule.createElement(LoadableGridViewModule, {
					getItemMetrics = GridMetrics.makeCustomMetricsGetter(ConstantsModule2.ItemsGridMetrics),
					items = JoinResult,
					totalNumItems = CountJoinResult,
					renderItem = RenderItem,
					getItemHeight = GridItemHeightGetterResult,
					windowHeight = ScreenSize.Y,
					NextSelectionDown = if NoEnableContinuousLoad then p1.loadMoreRef else p1.recommendedItemsRef,
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionRight = Key and p1.itemDetailsPeekViewRefs[Key],
					onFocusGained = if p1.state.restorePreviousChildFocus then nil else p1.onFocusGained or nil,
					restorePreviousChildFocus = p1.state.restorePreviousChildFocus,
					onAbsoluteSizeChanged = p1.onLoadableGridViewAbsoluteSizeChanged,
					ref = p1.resultsListRef
				}) or ReactModule.createElement(EmptyPageModule, {
					page = CategoryInfo,
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = if NoEnableContinuousLoad then p1.loadMoreRef else p1.recommendedItemsRef
				}),
				ImpressionsReporter = RoactModule.createElement(OrganicEventImpressionsReporterModule, {
					eventName = "marketplaceOrganicFELog",
					impressionsSchema = "defaultItem",
					requestId = "",
					parentRef = p1.loadableGridViewRef,
					pageFilter = function(): boolean
						-- upvalues: Key (copy), p1 (upval)
						return Key == p1.props.navigation.state.key
					end,
					onRequestImpressionsSignal = p1.requestImpressionsSignal,
					eventContext = FStringAXImpressionsEventNameModule(),
					impressionsTag = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else ""),
					surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
					searchUuid = p1.props.searchUuid
				}),
				UnifiedImpressionsReporter = ReactModule.createElement(TagBasedImpressionsDetector, {
					parentRef = p1.loadableGridViewRef,
					pageFilter = function(): boolean
						-- upvalues: Key (copy), p1 (upval)
						return Key == p1.props.navigation.state.key
					end,
					requestImpressionsSignal = p1.requestImpressionsSignal,
					extensions = p1.props.tagBasedImpressionsDetectorExtensions
				}),
				LoadMoreButton = if NoEnableContinuousLoad then ReactModule.createElement(ForwardRefResult1, {
					LayoutOrder = 3,
					onActivated = function()
						-- upvalues: WasLastInputGamepadFunction (upval), p1 (upval), Flag1 (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p2 (upval)
						if WasLastInputGamepadFunction() then
							p1:setState({ restorePreviousChildFocus = true })
							
							if Flag1 then
								if FFlagAXMigrateAXToGlobalAutofocus then
									if p1.props.focusGuiObject and p1.resultsListRef.current then
										p1.props.focusGuiObject(p1.resultsListRef.current)
									end
								else
									p2.moveFocusTo(p1.resultsListRef)
								end
							end
						end
						p1.props.loadMoreItems()
					end,
					ref = p1.loadMoreRef,
					NextSelectionDown = if PageFinished then p1.recommendedItemsRef else nil,
					NextSelectionUp = if Flag1 then p1.resultsListRef else p1.props.NextSelectionUp
				}) else nil,
				LoadingBar = if IsFetchingMore then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then p4.Tokens.Size.Size_1400 else p4.Tokens.Global.Size_700)
				}, {
					LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
				}) else nil
			}),
			RecommendedItems = p1:renderRecommendedItems(CategoryInfo, Flag, p1.props.forwardRef, if NoEnableContinuousLoad then p1.loadMoreRef elseif Flag1 then p1.loadableGridViewRef else p1.props.NextSelectionUp)
		})
	end)
end

function ItemsList.render(p1)
	-- upvalues: WithTextSizeOffsetFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy)
	return WithTextSizeOffsetFunction(function(p2)
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy), RoactGamepadModule (upval)
		return if FFlagAXMigrateAXToGlobalAutofocus then p1:renderWithProviders(nil, p2) else RoactGamepadModule.withFocusController(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p3, p2)
		end)
	end)
end

function ItemsList.renderWithProviders(p1, p2, p3)
	-- upvalues: RetrievalStatusModule (copy), WithLocalizationFunction (copy), RoactModule (copy), EmptyState (copy), WasLastInputGamepadFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad (copy), Focusable (copy), AvatarScreen (copy), RoactGamepadModule (copy)
	local IsDataStatusMatch = p1.props.dataStatus == RetrievalStatusModule.Failed
	local v1 = WithLocalizationFunction({ noItemsFound = "Feature.Catalog.Response.NoItemsFound" })(function(p4)
		-- upvalues: RoactModule (upval), EmptyState (upval), p1 (copy), WasLastInputGamepadFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p2 (copy)
		return RoactModule.createElement(EmptyState, {
			onActivated = function()
				-- upvalues: p1 (upval), WasLastInputGamepadFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p2 (upval)
				p1.loadMoreUserInventoryItems()
				
				if WasLastInputGamepadFunction() then
					p1:setState({ restorePreviousChildFocus = false })
					
					if not FFlagAXMigrateAXToGlobalAutofocus then
						p2.moveFocusTo(p1.props.NextSelectionUp)
					elseif p1.props.focusGuiObject and p1.props.NextSelectionUp and p1.props.NextSelectionUp.current then
						p1.props.focusGuiObject()
						
						return
					end
				end
			end or p1.loadMoreUserInventoryItems,
			text = p4.noItemsFound,
			[RoactModule.Ref] = p1.emptyStateRef,
			NextSelectionUp = p1.props.NextSelectionUp
		})
	end)
	local v2: boolean = p1.props.ownedItemIdsBySubtype[p1.props.assetTypeKey] ~= nil and #p1.props.ownedItemIdsBySubtype[p1.props.assetTypeKey] > 0
	local ShowAddOutfitButton = p1:getShowAddOutfitButton()
	local EmptyStateRef = if IsDataStatusMatch then p1.emptyStateRef elseif v2 or ShowAddOutfitButton then p1.loadableGridViewRef else p1.recommendedItemsRef
	local Name = p1.props.avatarRoute.current.name
	local ForwardRef = p1.props.forwardRef
	
	return if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Ref] = p1.props.focusNavigationRef
	}, RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Change.AbsoluteSize] = p1.checkSetListWidth,
		[RoactModule.Event.AncestryChanged] = p1.checkSetListWidth,
		[RoactModule.Ref] = ForwardRef or p1.listFrameRef,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else EmptyStateRef,
		restorePreviousChildFocus = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.state.restorePreviousChildFocus,
		onFocusChanged = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.onFocusChanged
	}, {
		FailedState = IsDataStatusMatch and v1,
		ItemsList = not IsDataStatusMatch and p1:renderItemsList(p2, p3)
	})) else RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Change.AbsoluteSize] = p1.checkSetListWidth,
		[RoactModule.Event.AncestryChanged] = p1.checkSetListWidth,
		[RoactModule.Ref] = ForwardRef or p1.listFrameRef,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else EmptyStateRef,
		restorePreviousChildFocus = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.state.restorePreviousChildFocus,
		inputBindings = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif Name == AvatarScreen.ItemDetails then nil else {
			NavUp = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: p1 (copy), p2 (copy)
				if p1.props.NextSelectionUp then
					p2.moveFocusTo(p1.props.NextSelectionUp)
					
					return
				end
				if p1.props.buttonBInputRef then
					p2.moveFocusTo(p1.props.buttonBInputRef)
				end
			end)
		} or nil,
		onFocusChanged = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.onFocusChanged
	}, {
		FailedState = IsDataStatusMatch and v1,
		ItemsList = not IsDataStatusMatch and p1:renderItemsList(p2, p3)
	})
end

local function getOwnedItemIds(OwnedItemIdsBySubtype, InitialEquippedAssets, AssetTypeKey)
	local t = {}
	
	if not AssetTypeKey then
		return t
	end
	local OwnedItemIdsBySubtypeEntry = OwnedItemIdsBySubtype[AssetTypeKey]
	
	if not OwnedItemIdsBySubtypeEntry then
		return t
	end
	if not InitialEquippedAssets or #InitialEquippedAssets == 0 then
		return OwnedItemIdsBySubtypeEntry
	end
	local t1 = {}
	local Count = 0
	
	for i = 1, #InitialEquippedAssets do
		local InitialEquippedAsset = InitialEquippedAssets[i]
		t1[InitialEquippedAsset] = true
		t[i] = InitialEquippedAsset
		Count = i
	end
	for i1 = 1, #OwnedItemIdsBySubtypeEntry do
		local OwnedItemIdsBySubtypeEntry1 = OwnedItemIdsBySubtypeEntry[i1]
		
		if not t1[OwnedItemIdsBySubtypeEntry1] then
			Count += 1
			t[Count] = OwnedItemIdsBySubtypeEntry1
		end
	end
	return t
end

function ItemsList.getEquippedOutfit(p1, AssetTypeKey)
	-- upvalues: UtilsModule1 (copy)
	local OutfitInfos = p1.props.outfitInfos
	local AvatarType = p1.props.avatarType
	local BodyColor3s = p1.props.bodyColor3s
	local EquippedAssets = p1.props.equippedAssets
	local Scales = p1.props.scales
	local OwnedItemIdsBySubtypeEntry = p1.props.ownedItemIdsBySubtype[AssetTypeKey]
	
	if not OwnedItemIdsBySubtypeEntry then
		return nil
	end
	for _, value in OwnedItemIdsBySubtypeEntry do
		local OutfitInfo = OutfitInfos[tostring(value)]
		
		if OutfitInfo and UtilsModule1.isWearingOutfitNoState(OutfitInfo, AvatarType, BodyColor3s, EquippedAssets, Scales) then
			return value
		end
	end
	return nil
end

function ItemsList.updateItems(p2, p3)
	-- upvalues: ConstantsModule1 (copy), UtilsModule1 (copy), CryoModule (copy), getOwnedItemIds (copy), AddOutfitButton (copy)
	local AssetTypeKey = p2.props.assetTypeKey
	local CategoryInfo = p2.props.categoryInfo
	local EquippedEmote = p2.props.equippedEmote
	local EquippedAssets = p2.props.equippedAssets
	local IsOutfitsPage = p2.props.isOutfitsPage
	local InitialEquippedAssets = p2.state.initialEquippedAssets
	local OwnedItemIdsBySubtype = p2.props.ownedItemIdsBySubtype
	local IsPageTypeMatch = CategoryInfo.PageType == ConstantsModule1.PageType.Emotes
	local List = {}
	
	if p3 then
		local Config = nil
		if IsPageTypeMatch then
			Config = EquippedEmote and { [EquippedEmote.assetId] = {} } or {}
			
			if EquippedEmote then
				table.insert(List, EquippedEmote.assetId)
			end
		elseif IsOutfitsPage then
			local EquippedOutfit = p2:getEquippedOutfit(AssetTypeKey)
			Config = EquippedOutfit and { [EquippedOutfit] = {} } or {}
			
			if EquippedOutfit then
				table.insert(List, EquippedOutfit)
			end
		else
			local EquippedAssetIdsForCategory = UtilsModule1.getEquippedAssetIdsForCategory(EquippedAssets, CategoryInfo)
			Config = EquippedAssetIdsForCategory
			List = CryoModule.Dictionary.join(List, EquippedAssetIdsForCategory)
		end
		if next(Config) ~= nil then
			p2.props.dispatchSetOwnedItemIdsBySubtype(AssetTypeKey, List)
		end
		InitialEquippedAssets = Config
		p2:setState({ initialEquippedAssets = Config })
	end
	local OwnedItemIds = getOwnedItemIds(OwnedItemIdsBySubtype, InitialEquippedAssets, AssetTypeKey)
	
	if OwnedItemIds and IsOutfitsPage and OwnedItemIds[1] ~= AddOutfitButton and p2:getShowAddOutfitButton() then
		OwnedItemIds = CryoModule.List.join({ AddOutfitButton }, OwnedItemIds)
	end
	p2:setState({
		ownedItemIds = OwnedItemIds,
		itemsContainsOutfits = IsOutfitsPage
	})
end

function ItemsList.didMount(p2)
	-- upvalues: RetrievalStatusModule (copy)
	p2.isMounted = true
	p2.checkSetListWidth((p2.props.forwardRef or p2.listFrameRef).current)
	
	if p2.props.dataStatus == RetrievalStatusModule.NotStarted then
		p2.loadMoreUserInventoryItems()
		
		return
	else
		p2:updateItems(true)
	end
end

function ItemsList.willUnmount(p2)
	p2.isMounted = false
end

function ItemsList.didUpdate(p2, p3, _)
	-- upvalues: AvatarScreen (copy), RetrievalStatusModule (copy)
	local Name = p2.props.avatarRoute.opaque.name
	local Name1 = p3.avatarRoute.opaque.name
	local CategoryInfo = p2.props.categoryInfo
	local DataStatus = p2.props.dataStatus
	local DataStatus1 = p3.dataStatus
	local IsNotEmoteSlotMatch = p2.props.emoteSlot ~= p3.emoteSlot
	local IsNotAssetTypeKeyMatch = p2.props.assetTypeKey ~= p3.assetTypeKey
	local IsNotCategoryIndexMatch = p2.props.categoryIndex ~= p3.categoryIndex
	local IsNotSubcategoryIndexMatch = p2.props.subcategoryIndex ~= p3.subcategoryIndex
	local IsSubcategoryIndexMatch: boolean = p2.props.categoryIndex == 1 and p2.props.subcategoryIndex == 1
	local IsNotOwnedItemIdsBySubtypeMatch = p2.props.ownedItemIdsBySubtype ~= p3.ownedItemIdsBySubtype
	
	if (p2.props.avatarRoute.current.name == AvatarScreen.AvatarEditor or Name == AvatarScreen.AvatarEditor) and (IsNotCategoryIndexMatch or (IsNotSubcategoryIndexMatch or IsSubcategoryIndexMatch)) and CategoryInfo.RenderItemTiles and DataStatus == RetrievalStatusModule.NotStarted then
		p2.loadMoreUserInventoryItems()
	end
	if IsNotCategoryIndexMatch or IsNotSubcategoryIndexMatch then
		local Current = p2.scrollingFrameRef.current
		
		if Current then
			Current.CanvasPosition = Vector2.new(0, 0)
		end
		p2:setState({ restorePreviousChildFocus = false })
	end
	local IsDataStatusMatch: boolean = DataStatus == RetrievalStatusModule.Done and DataStatus1 == RetrievalStatusModule.Fetching
	
	if IsNotAssetTypeKeyMatch or IsNotEmoteSlotMatch or IsNotOwnedItemIdsBySubtypeMatch or IsDataStatusMatch then
		p2:updateItems(IsNotAssetTypeKeyMatch or (IsNotEmoteSlotMatch or IsDataStatusMatch))
	end
	if Name ~= Name1 and Name == AvatarScreen.AvatarEditor then
		local Value = p2.scrollingFrameRef:getValue()
		
		if Value then
			Value.CanvasPosition = Vector2.new(0, 0)
			p2.setParentRestorePreviousChildFocus(false)
		end
	end
end

local WithAdaptiveScrollingResult = WithAdaptiveScrollingFunction((WithNavigationFunction((WithAvatarRouteModule((RoactRoduxModule.connect(function(p2, p3)
	-- upvalues: UtilsModule (copy), UtilsModule1 (copy), RetrievalStatusModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), PerformFetch (copy), FixItemListHasMoreItems (copy), SelectOwnedItemIdToIsWearingModule (copy), FFlagAXRootSlotBasedEditorFlag (copy), DeviceOrientationMode (copy)
	local Category = p2.AvatarExperience.AvatarEditor.Categories.category
	local Subcategory = p2.AvatarExperience.AvatarEditor.Categories.subcategory
	local SelectedSlot = p2.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot
	local SlotInfo = p2.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo
	local AvatarEditorCategoryInfoFromState = UtilsModule.getAvatarEditorCategoryInfoFromState(p2)
	local IsRenderOutfitItemTiles = AvatarEditorCategoryInfoFromState.RenderOutfitItemTiles == true
	local SelectAssetTypeKeyResult = UtilsModule1.selectAssetTypeKey(p2)
	local Failed = RetrievalStatusModule.Failed
	local HasMoreUserInventoryItems = false
	local UseGetInventoryV2 = if GetFFlagAXEnableSlotBasedEditorModule() or AXCatalogHeadCategoryCombineIXPModule.isEnabled() and p3.enableHeadCategoryCombine then AvatarEditorCategoryInfoFromState and AvatarEditorCategoryInfoFromState.UseGetInventoryV2 or not IsRenderOutfitItemTiles elseif not IsRenderOutfitItemTiles then AvatarEditorCategoryInfoFromState and AvatarEditorCategoryInfoFromState.UseGetInventoryV2 or not IsRenderOutfitItemTiles else nil
	local NextPageCursorKey = UtilsModule.getNextPageCursorKey(SelectAssetTypeKeyResult, IsRenderOutfitItemTiles, AvatarEditorCategoryInfoFromState.OutfitType)
	local SearchUuid = nil
	
	if SelectAssetTypeKeyResult then
		local _
		SearchUuid, _ = UtilsModule1.getSearchUuidAndAssetTypes(AvatarEditorCategoryInfoFromState, p2.AvatarExperience.AvatarEditor.Categories.subButton)
		
		if (GetFFlagAXEnableSlotBasedEditorModule() or AXCatalogHeadCategoryCombineIXPModule.isEnabled() and p3.enableHeadCategoryCombine or not IsRenderOutfitItemTiles) and (UseGetInventoryV2 and SearchUuid) then
			Failed = PerformFetch.GetStatus(p2, SearchUuid)
			NextPageCursorKey = SearchUuid
		else
			Failed = if IsRenderOutfitItemTiles then PerformFetch.GetStatus(p2, (UtilsModule.getPerformFetchKey(SelectAssetTypeKeyResult, IsRenderOutfitItemTiles, AvatarEditorCategoryInfoFromState.OutfitType))) else PerformFetch.GetStatus(p2, (UtilsModule.getPerformFetchKey(SelectAssetTypeKeyResult, IsRenderOutfitItemTiles, AvatarEditorCategoryInfoFromState.OutfitType)))
		end
		HasMoreUserInventoryItems = not p2.AvatarExperience.AvatarEditor.PageFinished[if FixItemListHasMoreItems then NextPageCursorKey else SelectAssetTypeKeyResult]
	end
	local SelectOwnedItemIdToIsWearingModuleResult, SelectOwnedItemIdToIsWearingModuleResult2 = SelectOwnedItemIdToIsWearingModule(p2, SelectAssetTypeKeyResult)
	
	return {
		recommendationData = nil,
		userInventoryRecommendationsFetchStatus = nil,
		pageFinished = p2.AvatarExperience.AvatarEditor.PageFinished[NextPageCursorKey],
		nextPageCursorKey = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then NextPageCursorKey else nil,
		categoryInfo = AvatarEditorCategoryInfoFromState,
		dataStatus = Failed,
		hasMoreUserInventoryItems = HasMoreUserInventoryItems,
		assetTypeKey = SelectAssetTypeKeyResult,
		categoryIndex = Category,
		subcategoryIndex = Subcategory,
		emoteSlot = SelectedSlot,
		equippedEmote = SlotInfo[SelectedSlot],
		isOutfitsPage = IsRenderOutfitItemTiles,
		ownedItemIdToIsWearing = SelectOwnedItemIdToIsWearingModuleResult,
		hasItemFromCurrentPageEquipped = SelectOwnedItemIdToIsWearingModuleResult2,
		outfitInfos = p2.AvatarExperience.AvatarEditor.OutfitInfos,
		avatarType = p2.AvatarExperience.AvatarEditor.Character.AvatarType,
		bodyColor3s = p2.AvatarExperience.AvatarEditor.Character.BodyColor3s,
		scales = p2.AvatarExperience.AvatarEditor.Character.AvatarScales,
		equippedAssets = p2.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		outfitOrAsset = p2.AvatarExperience.AvatarEditor.Character.OutfitOrAsset,
		ownedItemIdsBySubtype = p2.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype,
		screenSize = p2.ScreenSize,
		isPortrait = if FFlagAXRootSlotBasedEditorFlag then p2.DeviceOrientation == DeviceOrientationMode.Portrait else nil,
		analyticsMetadata = p2.AvatarExperience.AnalyticsMetadata,
		searchUuid = SearchUuid
	}
end, function(Callback)
	-- upvalues: GetUserInventoryModule (copy), GetUserInventoryV2Module (copy), GetOutfitsModule (copy), SendShopForMoreAnalyticsModule (copy), FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation (copy), NavigateWithLockFunction (copy), SetOwnedItemIdsBySubtypeModule (copy)
	return {
		getUserInventory = function(p4)
			-- upvalues: Callback (copy), GetUserInventoryModule (upval)
			return Callback(GetUserInventoryModule(p4))
		end,
		getUserInventoryV2 = function(p4, p5, p6, p7)
			-- upvalues: Callback (copy), GetUserInventoryV2Module (upval)
			return Callback(GetUserInventoryV2Module(p4, p5, p6, nil, nil, p7))
		end,
		getOutfits = function(p4, p5, p6, p7)
			-- upvalues: Callback (copy), GetOutfitsModule (upval)
			return Callback(GetOutfitsModule(p4, p5, p6, p7))
		end,
		sendShopForMoreAnalytics = function(p4)
			-- upvalues: Callback (copy), SendShopForMoreAnalyticsModule (upval)
			Callback(SendShopForMoreAnalyticsModule(p4))
		end,
		navigateWithLock = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then function(p4)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p4))
		end else nil,
		dispatchSetOwnedItemIdsBySubtype = function(p4, p5)
			-- upvalues: Callback (copy), SetOwnedItemIdsBySubtypeModule (upval)
			return Callback(SetOwnedItemIdsBySubtypeModule(p4, p5))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	avatarEditorAnalytics = AnalyticsModule
})(ItemsList)))))))))

if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then
	WithAdaptiveScrollingResult = IxpUtilsModule.connectTestVariables({
		enableHeadCategoryCombine = AXCatalogHeadCategoryCombineIXPModule.EnableHeadCategoryCombination
	})(WithAdaptiveScrollingResult)
end
local v1 = RoactAppPolicy.connect(function(p4, _)
	return { enableContinuousLoad = p4.getEnableContinuousLoad() }
end)(WithAdaptiveScrollingResult)

local function selectCategoryInfo(p4)
	-- upvalues: UtilsModule (copy)
	return UtilsModule.getAvatarEditorCategoryInfoFromState(p4)
end

local function selectAssetTypeKey(p4)
	-- upvalues: UtilsModule1 (copy)
	return UtilsModule1.selectAssetTypeKey(p4)
end

return RoactModule.forwardRef(function(p4, ForwardRef)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad (copy), RoactGamepadModule (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), selectCategoryInfo (copy), selectAssetTypeKey (copy), IxpUtilsModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), FFlagAXItemDetailsIxpExposure (copy), UseUnifiedEventImpressionsReporterFunction (copy), ReactModule (copy), UtilsModule (copy), UtilsModule1 (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), GetUserInventoryV2Module (copy), ConstantsModule1 (copy), ConstantsModule2 (copy), GetOutfitsModule (copy), GetUserInventoryModule (copy), UseRequestModule (copy), RequestStatusEnumModule (copy), UseFocusGuiObjectFunction (copy), useFocusNavigationBindings (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local NextSelectionUp = p4.NextSelectionUp
	local ButtonBInputRef = p4.buttonBInputRef
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then RoactGamepadModule.useFocusController() else nil
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(selectCategoryInfo)
	local UseSelectorResult1 = UseSelectorFunction(selectAssetTypeKey)
	local UseTestVariablesResult = IxpUtilsModule.useTestVariables(AXCatalogHeadCategoryCombineIXPModule.EnableHeadCategoryCombination)
	local IsEnabled = AXCatalogHeadCategoryCombineIXPModule.isEnabled()
	local UseMemoResult = nil
	
	if FFlagAXItemDetailsIxpExposure then
		local UseUnifiedEventImpressionsReporterResult = UseUnifiedEventImpressionsReporterFunction()
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseUnifiedEventImpressionsReporterResult (copy)
			return { UseUnifiedEventImpressionsReporterResult }
		end, { UseUnifiedEventImpressionsReporterResult })
	end
	local UseRequestModuleResult, UseRequestModuleResult2 = UseRequestModule((ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), UtilsModule (upval), UseSelectorResult1 (copy), UtilsModule1 (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), IsEnabled (copy), UseTestVariablesResult (copy), UseDispatchResult (copy), GetUserInventoryV2Module (upval), UseRoactServiceModuleResult (copy), ConstantsModule1 (upval), ConstantsModule2 (upval), GetOutfitsModule (upval), GetUserInventoryModule (upval)
		local IsRenderOutfitItemTiles = UseSelectorResult.RenderOutfitItemTiles == true
		local NextPageCursorKey = UtilsModule.getNextPageCursorKey(UseSelectorResult1, IsRenderOutfitItemTiles, UseSelectorResult.OutfitType)
		local SearchUuidAndAssetTypes, _ = UtilsModule1.getSearchUuidAndAssetTypes(UseSelectorResult, nil)
		
		if UseSelectorResult1 and (GetFFlagAXEnableSlotBasedEditorModule() or IsEnabled and UseTestVariablesResult) and (UseSelectorResult and UseSelectorResult.UseGetInventoryV2 and SearchUuidAndAssetTypes) then
			NextPageCursorKey = SearchUuidAndAssetTypes
		end
		if GetFFlagAXEnableSlotBasedEditorModule() and UseSelectorResult.UseGetInventoryV2 or not IsRenderOutfitItemTiles then
			return UseDispatchResult(GetUserInventoryV2Module(UseRoactServiceModuleResult, UseSelectorResult, NextPageCursorKey))
		elseif IsEnabled and UseTestVariablesResult and UseSelectorResult.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead and UseSelectorResult.AssetTypeIdStrings then
			return UseDispatchResult(GetUserInventoryV2Module(UseRoactServiceModuleResult, UseSelectorResult, NextPageCursorKey))
		elseif IsRenderOutfitItemTiles then
			local OutfitType = UseSelectorResult.OutfitType
			
			return UseDispatchResult(GetOutfitsModule(UseSelectorResult1, UseSelectorResult1 == ConstantsModule2.EditableCharacterKey, UseSelectorResult1 .. (OutfitType or ""), OutfitType))
		else
			return UseDispatchResult(GetUserInventoryModule(UseSelectorResult))
		end
	end, {
		UseRoactServiceModuleResult, UseDispatchResult, UseSelectorResult,
		UseSelectorResult1, UseTestVariablesResult, IsEnabled
	})))
	local IsStatusMatch = UseRequestModuleResult.status == RequestStatusEnumModule.Pending
	local v2 = nil
	local UseFocusGuiObjectResult = if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectFunction() else nil
	
	if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then
		v2 = useFocusNavigationBindings(nil, (ReactModule.useCallback(function()
			-- upvalues: NextSelectionUp (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), UseFocusControllerResult (copy), ButtonBInputRef (copy)
			if NextSelectionUp then
				if not FFlagAXMigrateAXToGlobalAutofocus then
					UseFocusControllerResult.moveFocusTo(NextSelectionUp.current)
					
					return
				end
				if UseFocusGuiObjectResult and NextSelectionUp.current then
					UseFocusGuiObjectResult(NextSelectionUp.current)
					
					return
				end
			elseif ButtonBInputRef then
				if not FFlagAXMigrateAXToGlobalAutofocus then
					UseFocusControllerResult.moveFocusTo(ButtonBInputRef)
				elseif UseFocusGuiObjectResult and ButtonBInputRef and ButtonBInputRef.current then
					UseFocusGuiObjectResult(ButtonBInputRef.current)
					
					return
				end
			end
		end, {
			NextSelectionUp,
			ButtonBInputRef,
			if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult
		})))
	end
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p4, {
		forwardRef = ForwardRef,
		focusNavigationRef = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then v2 else nil,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus or not FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then nil else UseFocusControllerResult,
		focusGuiObject = UseFocusGuiObjectResult,
		loadMoreItems = UseRequestModuleResult2,
		isFetchingMore = IsStatusMatch,
		tagBasedImpressionsDetectorExtensions = UseMemoResult
	}))
end)