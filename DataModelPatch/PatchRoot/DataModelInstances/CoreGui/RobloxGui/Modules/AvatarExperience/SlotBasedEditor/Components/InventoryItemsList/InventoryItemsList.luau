local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FoundationModule = require(CorePackages.Packages.Foundation)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ReactModule = require(CorePackages.Packages.React)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local AvatarExperienceUIKitModule = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local Grid = AvatarExperienceUIKitModule.GridComponents.Grid
local GetItemCountForRowFunction = AvatarExperienceUIKitModule.Utils.getItemCountForRow
local AXRefreshScrollingFrameWithLoadMoreModule = require(Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local EmptyPageModule = require(Modules.AvatarExperience.AvatarEditor.Components.EmptyPage)
local FStringAXImpressionsEventNameModule = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local OrganicEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local RecommendedItemsModule = require(Modules.AvatarExperience.Common.Components.RecommendedItems)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local LoadMoreButtonModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton)
local SubcategoryFiltersPillModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.SubcategoryFilters.SubcategoryFiltersPill)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local UseUnifiedEventImpressionsReporterFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local UseUnifiedImpressionExposerFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useUnifiedImpressionExposer
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXGeneralizeInventoryItemsList = AvatarExperienceFlagsModule.FFlagAXGeneralizeInventoryItemsList
local FFlagAXSlotsInventoryLoadableGridView = AvatarExperienceFlagsModule.FFlagAXSlotsInventoryLoadableGridView
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local FFlagAXBodyPartsPillLabel = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBodyPartsPillLabel
local AvatarEditorSubcategories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorSubcategories
local FFlagAXItemDetailsIxpExposure = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure
local FFlagAXInventoryItemsListImpressionLogging = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryItemsListImpressionLogging
local FFlagAXRecommendedItemsImpressionExposureLogging = AvatarExperienceFlagsModule.FFlagAXRecommendedItemsImpressionExposureLogging
local FFlagAXInventoryDurablesExpiredFilter = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryDurablesExpiredFilter
local FStringAXRecommendedItemsExposureLayer = AvatarExperienceFlagsModule.FStringAXRecommendedItemsExposureLayer
local FFlagAXTTIEditorEnableMilestones = AvatarExperienceFlagsModule.FFlagAXTTIEditorEnableMilestones
local EditorInventoryTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).EditorInventoryTTIMilestoneManager
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

local function v44(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), GridMetrics (copy), ResponsiveModule (copy), FFlagAXRootSlotBasedEditorFlag (copy), GetItemCountForRowFunction (copy), FFlagAXSlotsInventoryLoadableGridView (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), FFlagAXBodyPartsPillLabel (copy), UseSelectorFunction (copy), v44 (copy), FFlagAXRecommendedItemsImpressionExposureLogging (copy), ConstantsModule1 (copy), FFlagAXInventoryItemsListImpressionLogging (copy), FFlagAXItemDetailsIxpExposure (copy), UseUnifiedEventImpressionsReporterFunction (copy), UseUnifiedImpressionExposerFunction (copy), FStringAXRecommendedItemsExposureLayer (copy), FFlagAXTTIEditorEnableMilestones (copy), RetrievalStatusModule (copy), EditorInventoryTTIMilestoneManager (copy), FFlagAXInventoryDurablesExpiredFilter (copy), ConstantsModule (copy), UtilsModule (copy), EmptyState (copy), FFlagAXGeneralizeInventoryItemsList (copy), AvatarEditorSubcategories (copy), SubcategoryFiltersPillModule (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), AvatarScreen (copy), FFlagEnableLeftNavOnConsole (copy), EmptyPageModule (copy), LoadableGridViewModule (copy), Grid (copy), RecommendedItemsModule (copy), LoadMoreButtonModule (copy), LoadingBarWithThemeModule (copy), OrganicEventImpressionsReporterModule (copy), FStringAXImpressionsEventNameModule (copy), ImpressionEnums (copy), TagBasedImpressionsDetector (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local Items = p1.items
	local v1: boolean = Items and #Items == 0
	local CategoryInfo = p1.categoryInfo
	local FetchStatus = p1.fetchStatus
	local FetchUserInventoryFunction = p1.fetchUserInventory
	local HasSubcategoryFilter = p1.subcategoryFilter ~= nil
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local Largest = math.max(0, UseStateResult - UseTokensResult.Gap.Medium * 2)
	local Medium: number = UseTokensResult.Gap.Medium
	local MetricsForFixedColumns = GridMetrics.getMetricsForFixedColumns(math.max(Largest, 0), Medium, 4)
	local SmallMetrics = GridMetrics.getSmallMetrics(math.max(Largest, 0), Medium)
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.BreakpointConfig.Enum.Portrait
	
	if FFlagAXRootSlotBasedEditorFlag and IsUseOrientationResultMatch and SmallMetrics.itemsPerRow < MetricsForFixedColumns.itemsPerRow then
		SmallMetrics = MetricsForFixedColumns
	end
	local UseStyleResult = if FFlagAXSlotsInventoryLoadableGridView then UseStyleFunction() else nil
	local Largest1 = math.max(GetItemCountForRowFunction(Largest + Medium, SmallMetrics.itemWidth + Medium), 1)
	local UseLocalizationResult = UseLocalizationFunction({
		noItemsFound = "Feature.Catalog.Response.NoItemsFound",
		bodyParts = if FFlagAXBodyPartsPillLabel then "Feature.Avatar.Heading.BodyParts" else nil
	})
	local UseSelectorResult = if FFlagAXSlotsInventoryLoadableGridView then UseSelectorFunction(v44) else nil
	local IsNotRecommendationsTypeMatch = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.categoryInfo.RecommendationsType ~= ConstantsModule1.RecommendationsType.All and (p1.categoryInfo.RecommendationsType ~= ConstantsModule1.RecommendationsType.None and p1.categoryInfo.RecommendationsType ~= ConstantsModule1.RecommendationsType.AvatarLooks) else nil
	local UseRefResult3 = nil
	local UseMemoResult = nil
	
	if FFlagAXInventoryItemsListImpressionLogging and FFlagAXItemDetailsIxpExposure then
		local UseUnifiedEventImpressionsReporterResult = UseUnifiedEventImpressionsReporterFunction()
		
		if FFlagAXRecommendedItemsImpressionExposureLogging then
			UseRefResult3 = ReactModule.useRef(nil)
			local UseUnifiedImpressionExposerResult = UseUnifiedImpressionExposerFunction(UseRefResult3, FStringAXRecommendedItemsExposureLayer)
			UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: IsNotRecommendationsTypeMatch (copy), UseUnifiedEventImpressionsReporterResult (copy), UseUnifiedImpressionExposerResult (copy)
				return if IsNotRecommendationsTypeMatch then {
					UseUnifiedEventImpressionsReporterResult,
					UseUnifiedImpressionExposerResult
				} else { UseUnifiedEventImpressionsReporterResult }
			end, {
				UseUnifiedEventImpressionsReporterResult,
				UseUnifiedImpressionExposerResult,
				IsNotRecommendationsTypeMatch
			})
		else
			UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: UseUnifiedEventImpressionsReporterResult (copy)
				return { UseUnifiedEventImpressionsReporterResult }
			end, { UseUnifiedEventImpressionsReporterResult })
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		p1.requestImpressionsSignal:fire()
	end, { p1.requestImpressionsSignal })
	
	if FFlagAXTTIEditorEnableMilestones then
		local UseRefResult4 = ReactModule.useRef(nil)
		local UseRefResult5 = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: FetchStatus (copy), RetrievalStatusModule (upval), UseRefResult4 (copy), p1 (copy), FetchUserInventoryFunction (copy)
			if FetchStatus == RetrievalStatusModule.NotStarted then
				UseRefResult4.current = p1.searchUuid
				FetchUserInventoryFunction()
			end
		end, { FetchStatus, FetchUserInventoryFunction, p1.searchUuid })
		ReactModule.useEffect(function()
			-- upvalues: EditorInventoryTTIMilestoneManager (upval), FetchStatus (copy), RetrievalStatusModule (upval), Items (copy), UseRefResult4 (copy), p1 (copy), UseRefResult5 (copy)
			if EditorInventoryTTIMilestoneManager and FetchStatus == RetrievalStatusModule.Done and Items ~= nil and #Items > 0 and UseRefResult4.current == p1.searchUuid and UseRefResult5.current ~= p1.searchUuid then
				UseRefResult5.current = p1.searchUuid
				EditorInventoryTTIMilestoneManager.endTilesTracking()
			end
		end, { Items, p1.searchUuid, FetchStatus })
	else
		ReactModule.useEffect(function()
			-- upvalues: FetchStatus (copy), RetrievalStatusModule (upval), FetchUserInventoryFunction (copy)
			if FetchStatus == RetrievalStatusModule.NotStarted then
				FetchUserInventoryFunction()
			end
		end, { FetchStatus, FetchUserInventoryFunction })
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy)
		if UseRefResult2.current then
			UseRefResult2.current.CanvasPosition = Vector2.new()
		end
	end, { CategoryInfo, p1.subcategoryFilter })
	local UseResult = if FFlagAXSlotsInventoryLoadableGridView then ReactModule.useCallback(function(Item, Index, GridInformation)
		-- upvalues: p1 (copy)
		return p1.renderItem({
			item = Item,
			index = Index,
			gridInformation = GridInformation
		})
	end, { p1.renderItem }) else nil
	local ItemTileType = FFlagAXInventoryDurablesExpiredFilter and p1.itemTileType or ConstantsModule.ItemTileType.AvatarEditorTile
	local UseMemoResult1 = if FFlagAXSlotsInventoryLoadableGridView then ReactModule.useMemo(function()
		-- upvalues: UseStyleResult (copy), SmallMetrics (ref), ConstantsModule (upval), FFlagAXInventoryDurablesExpiredFilter (upval), ItemTileType (copy), CategoryInfo (copy), UtilsModule (upval)
		local UseStyleResultFont = UseStyleResult.Font
		local ScaledRelativeSize = UseStyleResultFont.CaptionBody.RelativeSize * UseStyleResultFont.BaseSize
		
		if SmallMetrics.itemWidth / ScaledRelativeSize < ConstantsModule.MinTileWidthToFontHeightRatio then
			ScaledRelativeSize = UseStyleResultFont.CaptionBody.RelativeSize * UseStyleResultFont.BaseSize
		end
		return if FFlagAXInventoryDurablesExpiredFilter then UtilsModule.GridItemHeightGetter(ItemTileType, if ItemTileType == ConstantsModule.ItemTileType.AvatarEditorTile then if CategoryInfo.ShowName then ScaledRelativeSize else nil elseif ItemTileType == ConstantsModule.ItemTileType.CatalogItemTile then ScaledRelativeSize else nil) else UtilsModule.GridItemHeightGetter(ConstantsModule.ItemTileType.AvatarEditorTile, if CategoryInfo.ShowName then ScaledRelativeSize else nil)
	end, {
		UseStyleResult,
		SmallMetrics.itemWidth,
		CategoryInfo.ShowName,
		if FFlagAXInventoryDurablesExpiredFilter then ItemTileType else nil
	}) else nil
	
	return if FetchStatus == RetrievalStatusModule.Failed then ReactModule.createElement(EmptyState, {
		onActivated = FetchUserInventoryFunction,
		text = UseLocalizationResult.noItemsFound
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAXGeneralizeInventoryItemsList then "size-full" else "size-full bg-surface-0 padding-x-medium",
		ref = UseRefResult,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	}, {
		PillsContainer = HasSubcategoryFilter and ReactModule.createElement(FoundationModule.View, { tag = "size-full-1200 auto-y row align-y-center" }, {
			FiltersPillLabel = if FFlagAXBodyPartsPillLabel and CategoryInfo.Id == AvatarEditorSubcategories.PurchasedCharacters then ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "padding-small size-30 auto-x",
				fontStyle = UseTokensResult.Typography.BodyMedium,
				Text = UseLocalizationResult.bodyParts
			}) else nil,
			FiltersPill = ReactModule.createElement(SubcategoryFiltersPillModule, {
				categoryInfo = p1.categoryInfo,
				LayoutOrder = if FFlagAXBodyPartsPillLabel then 2 else nil
			})
		}),
		ScrollingFrameContainer = ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.new(1, 0, 1, if HasSubcategoryFilter then -UseTokensResult.Size.Size_1200 else 0),
			Position = UDim2.fromOffset(0, if HasSubcategoryFilter then UseTokensResult.Size.Size_1200 else 0)
		}, {
			ItemsScrollingFrame = ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0, 0),
				parentAppPage = AvatarScreen.AvatarEditor,
				ScrollingEnabled = p1.scrollingEnabled,
				onCanvasPositionChanged = p1.onCanvasPositionChanged,
				onThresholdReached = p1.onListEndReached,
				BackgroundTransparency = if FFlagAXGeneralizeInventoryItemsList then 1 else nil,
				shouldExtendIntoSafeArea = if FFlagEnableLeftNavOnConsole then { bottom = true } else nil,
				ref = UseRefResult2
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, UseTokensResult.Gap.Medium)
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
					PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_2500),
					PaddingLeft = UDim.new(0, UseTokensResult.Size.Size_100),
					PaddingRight = UDim.new(0, UseTokensResult.Size.Size_50)
				}),
				EmptyPage = v1 and ReactModule.createElement(EmptyPageModule, { page = CategoryInfo }),
				ItemsGridContainer = not v1 and ReactModule.createElement(FoundationModule.View, { tag = "auto-y size-full-0", LayoutOrder = 1 }, {
					ItemsGrid = if FFlagAXSlotsInventoryLoadableGridView then ReactModule.createElement(LoadableGridViewModule, {
						getItemMetrics = GridMetrics.makeCustomMetricsGetter(ConstantsModule1.ItemsGridMetrics),
						items = Items,
						getItemHeight = UseMemoResult1,
						totalNumItems = Items and #Items or ConstantsModule.ShimmerCardsToDisplay,
						renderItem = UseResult,
						windowHeight = UseSelectorResult.Y,
						ref = UseRefResult1
					}) else ReactModule.createElement(Grid, {
						AutomaticSize = Enum.AutomaticSize.Y,
						itemsPerRow = Largest1,
						renderItem = p1.renderItem,
						items = Items,
						gapVertical = Medium,
						gapHorizontal = Medium,
						getItemId = function(p2): string
							-- upvalues: Largest1 (ref)
							return `{p2.itemId}{Largest1}`
						end,
						ref = UseRefResult1
					})
				}),
				RecommendedItems = p1.showRecommendedItems and ReactModule.createElement(RecommendedItemsModule, {
					LayoutOrder = 2,
					categoryInfo = CategoryInfo,
					sendShopForMoreAnalytics = p1.sendShopForMoreAnalytics,
					itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
					listFrameRef = UseRefResult,
					baseRef = if IsNotRecommendationsTypeMatch then UseRefResult3 else nil,
					impressionsTag = if IsNotRecommendationsTypeMatch then p1.impressionsTag else nil
				}),
				LoadMoreButton = if p1.showLoadMoreButton then ReactModule.createElement(LoadMoreButtonModule, { LayoutOrder = 3, onActivated = p1.fetchUserInventory }) else nil,
				LoadingBar = if p1.fetchStatus == RetrievalStatusModule.Fetching then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_700)
				}, {
					LoadingBar = ReactModule.createElement(LoadingBarWithThemeModule)
				}) else nil,
				ImpressionsReporter = ReactModule.createElement(OrganicEventImpressionsReporterModule, {
					eventName = "marketplaceOrganicFELog",
					impressionsSchema = "defaultItem",
					requestId = "",
					parentRef = UseRefResult1,
					pageFilter = p1.impressionsPageFilter,
					onRequestImpressionsSignal = p1.requestImpressionsSignal,
					eventContext = FStringAXImpressionsEventNameModule(),
					impressionsTag = p1.impressionsTag,
					surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
					analyticsMetadata = p1.analyticsMetadata,
					searchUuid = p1.searchUuid
				}),
				UnifiedImpressionsReporter = if FFlagAXInventoryItemsListImpressionLogging then ReactModule.createElement(TagBasedImpressionsDetector, {
					parentRef = if FFlagAXRecommendedItemsImpressionExposureLogging then UseRefResult2 else UseRefResult1,
					pageFilter = p1.impressionsPageFilter,
					requestImpressionsSignal = p1.requestImpressionsSignal,
					extensions = UseMemoResult
				}) else nil
			})
		})
	})
end