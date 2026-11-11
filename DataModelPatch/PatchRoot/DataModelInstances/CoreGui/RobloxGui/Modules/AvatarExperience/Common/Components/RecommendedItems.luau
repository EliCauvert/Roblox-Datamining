local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local AvatarExperienceUIKitModule = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local GetRecommendedItemsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetRecommendedItems)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local ScrollingAppCarousel = require(CorePackages.Workspace.Packages.AppBlox).ScrollingAppCarousel
local RecommendedItemCardModule = require(Modules.AvatarExperience.AvatarEditor.Components.RecommendedItemCard)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local ReducerUtils = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Utils.ReducerUtils
local AXEditorRecommendationCarouselModule = require(Modules.AvatarExperience.Experiments.AXEditorRecommendationCarousel)
local GetFFlagAXEnableRecommendationTypeAllInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXLogNilCategoryAndSubcategorySelection = AvatarExperienceFlagsModule.FFlagAXLogNilCategoryAndSubcategorySelection
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseNavigateToCatalogCategoryFunction = require(Modules.AvatarExperience.Catalog.Hooks.useNavigateToCatalogCategory).useNavigateToCatalogCategory
local AXYouMayAlsoLikeExposureLogging = game:DefineFastFlag("AXYouMayAlsoLikeExposureLogging", false)
local AXHideEmptyRecommendations = game:DefineFastFlag("AXHideEmptyRecommendations", false)
local FFlagAXRootSlotBasedEditorFlag = AvatarExperienceFlagsModule.FFlagAXRootSlotBasedEditorFlag
local FFlagAXAvatarTabLooksYouMayAlsoLike = AvatarExperienceFlagsModule.FFlagAXAvatarTabLooksYouMayAlsoLike
local AXRecommendedItemsExposureLogging = game:DefineFastFlag("AXRecommendedItemsExposureLogging", false)
local FStringAXRecommendedItemsExposureLayer = AvatarExperienceFlagsModule.FStringAXRecommendedItemsExposureLayer
local FFlagAXRecommendedItemsImpressionExposureLogging = AvatarExperienceFlagsModule.FFlagAXRecommendedItemsImpressionExposureLogging
local config = {
	TILE_WIDTH = 100,
	TILE_HEIGHT = 180,
	CAROUSEL_HEIGHT = 240,
	CAROUSEL_ITEM_PADDING = 10,
	WIDGET_LAYOUT_PADDING = 20,
	CAROUSEL_POSITION = { leftPosition = 28, rightPosition = 15 }
}
local RecommendedItems = RoactModule.PureComponent:extend("RecommendedItems")
RecommendedItems.validateProps = TModule.strictInterface({
	categoryInfo = TModule.table,
	LayoutOrder = TModule.optional(TModule.number),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	baseRef = TModule.optional(TModule.table),
	listFrameRef = TModule.optional(TModule.table),
	itemDetailsPeekViewRefs = TModule.table,
	sendShopForMoreAnalytics = TModule.callback,
	impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then TModule.optional(TModule.string) else nil,
	screenSize = TModule.Vector2,
	itemType = TModule.string,
	dataStatus = TModule.string,
	items = TModule.table,
	setCatalogIndicies = TModule.callback,
	getRecommendedItems = TModule.callback,
	navigateWithLock = TModule.callback,
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	catalogAnalytics = TModule.table,
	networking = TModule.callback,
	doesMatchingCatalogCategoryExist = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then TModule.optional(TModule.boolean) else nil,
	onShopForMore = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then TModule.optional(TModule.callback) else nil
})

function RecommendedItems.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), AvatarScreen (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), ConstantsModule (copy), UtilsModule (copy)
	p1.loadableGridViewRef = RoactModule.createRef()
	p1.shopMoreRef = RoactModule.createRef()
	
	function p1.onActivated()
		-- upvalues: FFlagAXMigrateAllTabToSduiDev (upval), p1 (copy), AvatarScreen (upval)
		if FFlagAXMigrateAllTabToSduiDev then
			p1.props.onShopForMore()
			
			return
		else
			p1.props.setCatalogIndicies(p1.props.categoryInfo, p1.props.catalogAnalytics)
			p1.props.navigateWithLock(function()
				-- upvalues: p1 (upval), AvatarScreen (upval)
				p1.props.navigation.navigate(AvatarScreen.Catalog)
				p1.props.sendShopForMoreAnalytics()
			end)
		end
	end
	
	function p1.getRecommendedItems()
		-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (upval), p1 (copy), ConstantsModule (upval), UtilsModule (upval)
		if (not GetFFlagAXEnableSlotBasedEditorModule() or p1.props.categoryInfo.RecommendationsType) and p1.props.categoryInfo.RecommendationsType ~= ConstantsModule.RecommendationsType.None then
			p1.props.getRecommendedItems(p1.props.networking, UtilsModule.getRecommendedAssetTypeIdStringFromCategoryInfo(p1.props.categoryInfo), p1.props.categoryInfo.RecommendationsType, true)
			
			return
		end
	end
end

function RecommendedItems.maybeFetchRecommendedItems(p1)
	-- upvalues: RetrievalStatusModule (copy)
	if p1.props.dataStatus ~= RetrievalStatusModule.Fetching then
		p1.getRecommendedItems()
	end
end

function RecommendedItems.didMount(p1)
	-- upvalues: AXYouMayAlsoLikeExposureLogging (copy), IxpUtilsModule (copy), AXEditorRecommendationCarouselModule (copy), AXRecommendedItemsExposureLogging (copy), ConstantsModule (copy), FStringAXRecommendedItemsExposureLayer (copy)
	p1:maybeFetchRecommendedItems()
	
	if AXYouMayAlsoLikeExposureLogging then
		IxpUtilsModule.logExperimentExposure(AXEditorRecommendationCarouselModule)
	end
	if AXRecommendedItemsExposureLogging and p1.props.categoryInfo.RecommendationsType ~= ConstantsModule.RecommendationsType.All and p1.props.categoryInfo.RecommendationsType ~= ConstantsModule.RecommendationsType.None then
		IxpUtilsModule.logLayerExposure(FStringAXRecommendedItemsExposureLayer)
	end
end

function RecommendedItems.didUpdate(p1, p2)
	-- upvalues: AvatarScreen (copy), UtilsModule (copy)
	if p1.props.avatarRoute.current.name == AvatarScreen.AvatarEditor and UtilsModule.getRecommendedKey(p2.categoryInfo) ~= UtilsModule.getRecommendedKey(p1.props.categoryInfo) then
		p1:maybeFetchRecommendedItems()
	end
end

function RecommendedItems.renderWithProviders(p1, p2, p3)
	-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), ConstantsModule (copy), ConstantsModule1 (copy), UtilsModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Button (copy), Focusable (copy), ButtonType (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXRecommendedItemsImpressionExposureLogging (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), RecommendedItemCardModule (copy), FitFrameVertical (copy), RoactFitComponents (copy), AXHideEmptyRecommendations (copy), LoadableGridViewModule (copy)
	local Items = p1.props.items
	local ItemType = p1.props.itemType
	local Key = p1.props.avatarRoute.current.key
	local v1 = #Items == 0
	local ScreenSize = p1.props.screenSize
	local _Font = p2.Font
	local Theme = p2.Theme
	local HeadingSmallFont = if FFlagAXRootSlotBasedEditorFlag then _Font.HeadingSmall.Font else _Font.Header2.Font
	local ScaledBaseSize = _Font.BaseSize * (if FFlagAXRootSlotBasedEditorFlag then _Font.HeadingSmall.RelativeSize else _Font.Header2.RelativeSize)
	local IsRecommendationsTypeMatch = if FFlagAXAvatarTabLooksYouMayAlsoLike then p1.props.categoryInfo.RecommendationsType == ConstantsModule.RecommendationsType.AvatarLooks else nil
	local LookItemTile = if IsRecommendationsTypeMatch then ConstantsModule1.ItemTileType.LookItemTile elseif FFlagAXRootSlotBasedEditorFlag then ConstantsModule1.ItemTileType.AvatarEditorTile else ConstantsModule1.ItemTileType.CatalogItemTile
	local GridItemHeightGetterWithOptionsResult = if FFlagAXAvatarTabLooksYouMayAlsoLike then UtilsModule.GridItemHeightGetterWithOptions({
		itemTileType = LookItemTile,
		fontHeight = ScaledBaseSize + p2.Tokens.Size.Size_300,
		itemPriceEnabled = IsRecommendationsTypeMatch
	}) else UtilsModule.GridItemHeightGetter(LookItemTile, if FFlagAXRootSlotBasedEditorFlag then ScaledBaseSize + (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_300 else p2.Tokens.Global.Space_150) else ScaledBaseSize)
	local Element = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then Button else Focusable[Button], {
		buttonType = ButtonType.Secondary,
		layoutOrder = 3,
		size = UDim2.new(1, 0, 0, 48),
		text = p3.shopForMore,
		onActivated = p1.onActivated,
		[RoactModule.Ref] = p1.shopMoreRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else v1 and p1.props.NextSelectionUp or p1.loadableGridViewRef
	})
	local DoesMatchingCatalogCategoryExist = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then p1.props.doesMatchingCatalogCategoryExist else nil
	local ImpressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.props.impressionsTag else nil
	local Name = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.props.categoryInfo.Name else nil
	local RenderItem = if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then function(p4, Index, p5)
		-- upvalues: RoactModule (upval), RecommendedItemCardModule (upval), p1 (copy), FFlagAXRecommendedItemsImpressionExposureLogging (upval), ImpressionsTag (copy), Name (copy)
		return RoactModule.createElement(RecommendedItemCardModule, {
			itemId = p4.itemId,
			index = Index,
			itemType = p4.itemType,
			getRecommendedItems = p1.getRecommendedItems,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.listFrameRef,
			impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then ImpressionsTag else nil,
			impressionsCategory = if FFlagAXRecommendedItemsImpressionExposureLogging then Name else nil,
			gridInformation = if p5 then {
				gridPositionRow = p5.row,
				gridPositionColumn = p5.column
			} else nil
		})
	end else function(ItemId, Index, p4)
		-- upvalues: RoactModule (upval), RecommendedItemCardModule (upval), ItemType (copy), p1 (copy), FFlagAXRecommendedItemsImpressionExposureLogging (upval), ImpressionsTag (copy), Name (copy)
		return RoactModule.createElement(RecommendedItemCardModule, {
			itemId = ItemId,
			index = Index,
			itemType = ItemType,
			getRecommendedItems = p1.getRecommendedItems,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.listFrameRef,
			impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then ImpressionsTag else nil,
			impressionsCategory = if FFlagAXRecommendedItemsImpressionExposureLogging then Name else nil,
			gridInformation = if p4 then {
				gridPositionRow = p4.row,
				gridPositionColumn = p4.column
			} else nil
		})
	end
	local NumRecommendedItems = ConstantsModule1.NumRecommendedItems
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then FitFrameVertical else Focusable[FitFrameVertical], {
		width = UDim.new(1, 0),
		contentPadding = UDim.new(0, 10),
		margin = if FFlagAXRootSlotBasedEditorFlag then RoactFitComponents.Rect.quad(24, 0, 15, 0) else RoactFitComponents.Rect.quad(24, 15, 15, 15),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = Theme.BackgroundUIContrast.Transparency,
		BackgroundColor3 = Theme.BackgroundUIContrast.Color,
		BorderSizePixel = 0,
		LayoutOrder = p1.props.LayoutOrder,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else v1 and p1.shopMoreRef or p1.loadableGridViewRef,
		[RoactModule.Ref] = p1.props.baseRef
	}, {
		YouMayAlsoLikeTextLabel = if AXHideEmptyRecommendations and v1 then nil else RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 24),
			Font = HeadingSmallFont,
			TextColor3 = Theme.TextEmphasis.Color,
			Text = p3.youMayAlsoLike,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		GridView = if AXHideEmptyRecommendations and v1 then nil else RoactModule.createElement(LoadableGridViewModule, {
			LayoutOrder = 2,
			items = Items,
			totalNumItems = NumRecommendedItems,
			getItemHeight = GridItemHeightGetterWithOptionsResult,
			windowHeight = ScreenSize.Y,
			renderItem = RenderItem,
			[RoactModule.Ref] = p1.loadableGridViewRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.shopMoreRef,
			NextSelectionRight = Key and p1.props.itemDetailsPeekViewRefs[Key]
		}),
		ShopForMoreButton = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then if DoesMatchingCatalogCategoryExist then Element else nil else Element
	})
end

function RecommendedItems.renderCarouselWithProviders(p1, _, p2)
	-- upvalues: FFlagAXRecommendedItemsImpressionExposureLogging (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), RoactModule (copy), RecommendedItemCardModule (copy), config (copy), AXHideEmptyRecommendations (copy), WidgetHeader (copy), ScrollingAppCarousel (copy), Button (copy), ButtonType (copy), WidgetLayout (copy)
	local Items = p1.props.items
	local ItemType = p1.props.itemType
	local v1 = #Items == 0
	local ImpressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.props.impressionsTag else nil
	local Callback = if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then function(p3, Index)
		-- upvalues: RoactModule (upval), RecommendedItemCardModule (upval), p1 (copy), FFlagAXRecommendedItemsImpressionExposureLogging (upval), ImpressionsTag (copy)
		return RoactModule.createElement(RecommendedItemCardModule, {
			itemId = p3.itemId,
			index = Index,
			itemType = p3.itemType,
			getRecommendedItems = p1.getRecommendedItems,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.listFrameRef,
			impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then ImpressionsTag else nil
		})
	end else function(ItemId, Index)
		-- upvalues: RoactModule (upval), RecommendedItemCardModule (upval), ItemType (copy), p1 (copy), FFlagAXRecommendedItemsImpressionExposureLogging (upval), ImpressionsTag (copy)
		return RoactModule.createElement(RecommendedItemCardModule, {
			itemId = ItemId,
			index = Index,
			itemType = ItemType,
			getRecommendedItems = p1.getRecommendedItems,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.listFrameRef,
			impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then ImpressionsTag else nil
		})
	end
	local Items1 = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, config.CAROUSEL_ITEM_PADDING),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	
	for i = 1, #Items do
		table.insert(Items1, RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = i,
			Size = UDim2.new(0, config.TILE_WIDTH, 0, config.TILE_HEIGHT)
		}, Callback(Items[i], i)))
	end
	local Element = if AXHideEmptyRecommendations and v1 then nil else RoactModule.createElement(WidgetHeader, { LayoutOrder = 1, titleText = p2.youMayAlsoLike })
	local ContentSlot = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
	}
	
	if not AXHideEmptyRecommendations or not v1 then
		ContentSlot.carousel = RoactModule.createElement(ScrollingAppCarousel, {
			index = 1,
			carouselMargin = 0,
			items = Items1,
			styleProps = config.CAROUSEL_POSITION,
			itemCount = #Items1,
			itemWidth = config.TILE_WIDTH,
			itemPadding = config.CAROUSEL_ITEM_PADDING,
			carouselHeight = config.CAROUSEL_HEIGHT,
			canvasWidth = (config.TILE_WIDTH + config.CAROUSEL_ITEM_PADDING) * #Items1 - config.CAROUSEL_ITEM_PADDING,
			onChangeCanvasPosition = function() end
		})
	end
	ContentSlot.shopMore = RoactModule.createElement(Button, {
		layoutOrder = 3,
		buttonType = ButtonType.Secondary,
		size = UDim2.new(1, 0, 0, 48),
		text = p2.shopForMore,
		onActivated = p1.onActivated,
		[RoactModule.Ref] = p1.shopMoreRef,
		NextSelectionUp = v1 and p1.props.NextSelectionUp or p1.loadableGridViewRef
	})
	
	return RoactModule.createElement(WidgetLayout, {
		LayoutOrder = p1.props.LayoutOrder,
		padding = {
			left = UDim.new(0, config.WIDGET_LAYOUT_PADDING),
			right = UDim.new(0, config.WIDGET_LAYOUT_PADDING)
		},
		headerSlot = Element,
		contentSlot = ContentSlot
	})
end

function RecommendedItems.render(p3)
	-- upvalues: AXEditorRecommendationCarouselModule (copy), IxpUtilsModule (copy), WithStyleFunction (copy), WithLocalizationFunction (copy)
	local TestVariable = if AXEditorRecommendationCarouselModule.isEnabled() then IxpUtilsModule.readTestVariable(AXEditorRecommendationCarouselModule.EnableAvatarEditorRecommendationCarousel) else nil
	
	return WithStyleFunction(function(p4)
		-- upvalues: WithLocalizationFunction (upval), TestVariable (copy), p3 (copy)
		return WithLocalizationFunction({
			shopForMore = "Feature.Avatar.Action.ShopForMore",
			youMayAlsoLike = "Feature.Catalog.Label.Recommendations"
		})(function(p5)
			-- upvalues: TestVariable (upval), p3 (upval), p4 (copy)
			return if TestVariable then p3:renderCarouselWithProviders(p4, p5) else p3:renderWithProviders(p4, p5)
		end)
	end)
end

local function mapStateToProps(p3, p4)
	-- upvalues: UtilsModule (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), ConstantsModule (copy), ConstantsModule1 (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), ReducerUtils (copy), PerformFetch (copy)
	local RecommendedKey = UtilsModule.getRecommendedKey(p4.categoryInfo)
	local Look = if FFlagAXAvatarTabLooksYouMayAlsoLike and RecommendedKey == ConstantsModule.RecommendationsType.AvatarLooks then ConstantsModule1.ItemType.Look elseif RecommendedKey == ConstantsModule.RecommendationsType.BodyParts or RecommendedKey == ConstantsModule.RecommendationsType.AvatarAnimations or RecommendedKey == ConstantsModule.RecommendationsType.Shoes or RecommendedKey == ConstantsModule.RecommendationsType.DynamicHeads then ConstantsModule1.ItemType.Bundle else ConstantsModule1.ItemType.Asset
	
	if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then
		RecommendedKey = ReducerUtils.generateRecommendedItemsKey(RecommendedKey, p4.categoryInfo.RecommendationsType)
	end
	return {
		dataStatus = PerformFetch.GetStatus(p3, ConstantsModule1.RecommendedItemsKey .. tostring(RecommendedKey)),
		screenSize = p3.ScreenSize,
		itemType = Look,
		items = p3.AvatarExperience.AvatarEditor.RecommendedItems[RecommendedKey] or {}
	}
end

local function mapDispatchToProps(Callback)
	-- upvalues: GetRecommendedItemsModule (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXLogNilCategoryAndSubcategorySelection (copy), MutedErrorModule (copy), SetCategoryAndSubcategoryModule (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), UtilsModule (copy), NavigateWithLockFunction (copy)
	return {
		getRecommendedItems = function(p3, p4, p5)
			-- upvalues: Callback (copy), GetRecommendedItemsModule (upval)
			Callback(GetRecommendedItemsModule(p3, p4, p5))
		end,
		setCatalogIndicies = function(p3, p4)
			-- upvalues: FFlagAXCatalogCategoriesSDUI (upval), FFlagAXMigrateAllTabToSduiDev (upval), FFlagAXLogNilCategoryAndSubcategorySelection (upval), MutedErrorModule (upval), Callback (copy), SetCategoryAndSubcategoryModule (upval), FFlagAXRemoveCatalogCategoryNavKey (upval), UtilsModule (upval)
			if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then
				local CategoryId = p3.MatchingCatalogPageIds.CategoryId
				local SubcategoryId = p3.MatchingCatalogPageIds.SubcategoryId
				
				if FFlagAXLogNilCategoryAndSubcategorySelection then
					MutedErrorModule("Navigating to missing catalog category for", p3.Name)
				end
				Callback(SetCategoryAndSubcategoryModule(CategoryId, SubcategoryId, p4))
				
				return
			else
				local CategoryKey = p3.MatchingCatalogPage.CategoryKey
				local SubcategoryKey = p3.MatchingCatalogPage.SubcategoryKey
				
				if FFlagAXRemoveCatalogCategoryNavKey then
					local RawValueResult = CategoryKey:rawValue()
					local RawValueResult1 = if SubcategoryKey then SubcategoryKey:rawValue() else nil
					
					if FFlagAXLogNilCategoryAndSubcategorySelection then
						MutedErrorModule("Navigating to missing catalog category for", p3.Name)
					end
					Callback(SetCategoryAndSubcategoryModule(RawValueResult, RawValueResult1, p4))
					
					return
				else
					local CategoryIdsFromNavKey, CategoryIdsFromNavKey2 = UtilsModule.GetCategoryIdsFromNavKey(CategoryKey, SubcategoryKey)
					
					if FFlagAXLogNilCategoryAndSubcategorySelection then
						MutedErrorModule("Navigating to missing catalog category for", p3.Name)
					end
					Callback(SetCategoryAndSubcategoryModule(CategoryIdsFromNavKey, CategoryIdsFromNavKey2, p4))
				end
			end
		end,
		navigateWithLock = function(p3)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p3))
		end
	}
end

local WithAvatarRouteModuleResult = WithAvatarRouteModule((WithNavigationFunction((RoactServices.connect({
	catalogAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule
})(RecommendedItems)))))

if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then
	WithAvatarRouteModuleResult = RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(WithAvatarRouteModuleResult)
	
	return function(Tbl)
		-- upvalues: GetCatalogCategoriesStoreModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseNavigateToCatalogCategoryFunction (copy), ReactModule (copy), WithAvatarRouteModuleResult (ref)
		local CatalogCategoriesStore = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore()
		local MatchingCatalogPageIds = Tbl.categoryInfo and Tbl.categoryInfo.MatchingCatalogPageIds
		local CategoryId = MatchingCatalogPageIds and MatchingCatalogPageIds.CategoryId
		local SubcategoryId = MatchingCatalogPageIds and MatchingCatalogPageIds.SubcategoryId
		local UseDoesCatalogCategoryExistFunction = GetCatalogCategoriesStoreModule.useDoesCatalogCategoryExist
		assert(UseDoesCatalogCategoryExistFunction, "useDoesCatalogCategoryExist should be defined when FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev is enabled")
		local UseDoesCatalogCategoryExistResult = UseDoesCatalogCategoryExistFunction(CatalogCategoriesStore, CategoryId, SubcategoryId)
		local UseResult = nil
		
		if FFlagAXMigrateAllTabToSduiDev then
			local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
			local UseNavigateToCatalogCategoryResult = UseNavigateToCatalogCategoryFunction()
			local SendShopForMoreAnalytics = Tbl.sendShopForMoreAnalytics
			UseResult = ReactModule.useCallback(function()
				-- upvalues: UseNavigateToCatalogCategoryResult (copy), MatchingCatalogPageIds (copy), UseRoactServiceModuleResult (copy), SendShopForMoreAnalytics (copy)
				UseNavigateToCatalogCategoryResult(MatchingCatalogPageIds, {
					analytics = UseRoactServiceModuleResult,
					onAfterNavigate = SendShopForMoreAnalytics
				})
			end, {
				UseNavigateToCatalogCategoryResult,
				MatchingCatalogPageIds,
				UseRoactServiceModuleResult,
				SendShopForMoreAnalytics
			})
		end
		local Copy = table.clone(Tbl)
		Copy.doesMatchingCatalogCategoryExist = UseDoesCatalogCategoryExistResult
		Copy.onShopForMore = UseResult
		
		return ReactModule.createElement(WithAvatarRouteModuleResult, Copy)
	end
else
	return RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(WithAvatarRouteModuleResult)
end