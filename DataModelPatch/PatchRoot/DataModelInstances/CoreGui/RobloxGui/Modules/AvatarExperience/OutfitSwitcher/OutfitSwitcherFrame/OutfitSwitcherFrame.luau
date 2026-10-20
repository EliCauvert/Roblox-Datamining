local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.useOutfitSwitcherFrameProps)
local FFlagAXOutfitPageRevamp = AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local Grid = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid
local AvatarSwitcherScrollingContentModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarSwitcherScrollingContent)
local AvatarTileContainerModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarTile.AvatarTileContainer)
local SettingsTileContainerModule = if FFlagAXOutfitPageRevamp then require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherSettingsTile.SettingsTileContainer) else require(Modules.AvatarExperience.AvatarSwitcher.SettingsTile.SettingsTileContainer)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local OrganicEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local FStringAXImpressionsEventNameModule = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local LoadMoreButtonModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton)
local RecommendedItemsModule = require(Modules.AvatarExperience.Common.Components.RecommendedItems)
local UseCategoryInfoModule = require(Modules.AvatarExperience.Common.Hooks.useCategoryInfo)
local EmptyPageModule = require(Modules.AvatarExperience.AvatarEditor.Components.EmptyPage)
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local FFlagAXRecommendedItemsImpressionExposureLogging = AvatarExperienceFlagsModule.FFlagAXRecommendedItemsImpressionExposureLogging
local FFlagAXFixEmptyMakeupLooks = AvatarExperienceFlagsModule.FFlagAXFixEmptyMakeupLooks
local FFlagAXRecommendedItemsImpressionExposureLogging1 = game:DefineFastFlag("AXOutfitSwitcherImpressionLogging", false) and FFlagAXRecommendedItemsImpressionExposureLogging

return function(p1)
	-- upvalues: FoundationModule (copy), RoactGamepadModule (copy), ReactModule (copy), FFlagAXRecommendedItemsImpressionExposureLogging (copy), UseCategoryInfoModule (copy), ResponsiveModule (copy), SettingsTileContainerModule (copy), FFlagAXOutfitPageRevamp (copy), AvatarTileContainerModule (copy), FFlagAXFixEmptyMakeupLooks (copy), AvatarSwitcherScrollingContentModule (copy), Grid (copy), EmptyPageModule (copy), ConstantsModule (copy), RecommendedItemsModule (copy), OrganicEventImpressionsReporterModule (copy), FFlagAXRecommendedItemsImpressionExposureLogging1 (copy), FStringAXImpressionsEventNameModule (copy), ImpressionEnums (copy), TagBasedImpressionsDetector (copy), LoadMoreButtonModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagAXRecommendedItemsImpressionExposureLogging then ReactModule.useRef(nil) else nil
	local UseRefResult2 = if FFlagAXRecommendedItemsImpressionExposureLogging then nil else ReactModule.useRef(nil)
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.Keys.Portrait
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), ReactModule (upval), SettingsTileContainerModule (upval), FFlagAXOutfitPageRevamp (upval), UseRefCacheResult (copy), AvatarTileContainerModule (upval)
		local Item = p2.item
		
		return if p1.shouldRenderSettingsTile(Item) then ReactModule.createElement(SettingsTileContainerModule, {
			squareAspectRatio = true,
			itemWidth = p1.gridMetrics.itemWidth,
			index = p2.index,
			outfitType = if FFlagAXOutfitPageRevamp then p1.outfitType else nil,
			ref = UseRefCacheResult[p2.index]
		}) else ReactModule.createElement(AvatarTileContainerModule, {
			impressionsSchema = "defaultItem",
			squareAspectRatio = true,
			itemWidth = p1.gridMetrics.itemWidth,
			itemId = Item,
			index = p2.index,
			ref = UseRefCacheResult[p2.index],
			isSelected = p1.itemIdsToIsWearing[Item],
			hasItemFromCurrentPageEquipped = p1.hasItemFromCurrentPageEquipped,
			impressionsTag = p1.impressionsTag,
			gridInformation = p2.gridInformation
		})
	end, {
		UseRefCacheResult, p1.gridMetrics, p1.itemIdsToIsWearing,
		p1.shouldRenderSettingsTile, p1.hasItemFromCurrentPageEquipped,
		p1.impressionsTag, if FFlagAXOutfitPageRevamp then p1.outfitType else nil
	})
	local UseResult1 = if FFlagAXFixEmptyMakeupLooks then ReactModule.useCallback(function(p2)
		return p2
	end, {}) else nil
	
	return ReactModule.createElement(AvatarSwitcherScrollingContentModule, {
		onThresholdReached = p1.onScrollingFrameThresholdReached,
		onCanvasPositionChanged = p1.onCanvasPositionChanged,
		onAbsoluteWindowSizeChanged = p1.onAbsoluteSizeChanged,
		scrollingFrameRef = if FFlagAXRecommendedItemsImpressionExposureLogging then UseRefResult1 else nil
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		OutfitSwitcherGridContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy",
			LayoutOrder = 1,
			padding = {
				left = if IsUseOrientationResultMatch then UDim.new(0, UseTokensResult.Size.Size_400) else UDim.new(0, UseTokensResult.Size.Size_250),
				right = UDim.new(0, UseTokensResult.Size.Size_250),
				bottom = UDim.new(0, UseTokensResult.Size.Size_250),
				top = UDim.new(0, UseTokensResult.Size.Size_250)
			},
			Size = UDim2.fromScale(1, 0)
		}, {
			OutfitSwitcherGrid = if FFlagAXFixEmptyMakeupLooks then if #p1.itemIds > 0 then ReactModule.createElement(Grid, {
				itemsPerRow = p1.gridMetrics.itemsPerRow,
				renderItem = UseResult,
				items = p1.itemIds,
				gapVertical = UseTokensResult.Size.Size_300,
				gapHorizontal = UseTokensResult.Size.Size_200,
				getItemId = UseResult1,
				ref = UseRefResult
			}) else ReactModule.createElement(EmptyPageModule, {
				page = {
					Title = if p1.outfitType == ConstantsModule.OutfitTypes.Makeup then "Feature.Avatar.Label.MakeupLooks" else "Feature.Avatar.Label.Looks"
				}
			}) else ReactModule.createElement(Grid, {
				itemsPerRow = p1.gridMetrics.itemsPerRow,
				renderItem = UseResult,
				items = p1.itemIds,
				gapVertical = UseTokensResult.Size.Size_300,
				gapHorizontal = UseTokensResult.Size.Size_200,
				getItemId = function(p2)
					return p2
				end,
				ref = UseRefResult
			})
		}),
		RecommendedItemsContainer = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = {
				left = UDim.new(0, UseTokensResult.Size.Size_200),
				right = UDim.new(0, UseTokensResult.Size.Size_200),
				bottom = UDim.new(0, UseTokensResult.Size.Size_200)
			}
		}, {
			RecommendedItems = ReactModule.createElement(RecommendedItemsModule, {
				categoryInfo = UseCategoryInfoModule(),
				itemDetailsPeekViewRefs = UseRefCacheResult,
				baseRef = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.recommendedItemsRef else UseRefResult2,
				listFrameRef = UseRefResult,
				impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.impressionsTag else nil,
				sendShopForMoreAnalytics = function() end
			})
		}),
		ImpressionsReporter = ReactModule.createElement(OrganicEventImpressionsReporterModule, {
			eventName = "marketplaceOrganicFELog",
			impressionsSchema = "defaultItem",
			requestId = "",
			parentRef = if FFlagAXRecommendedItemsImpressionExposureLogging1 then UseRefResult1 else UseRefResult,
			pageFilter = p1.impressionsPageFilter,
			onRequestImpressionsSignal = p1.requestImpressionsSignal,
			eventContext = FStringAXImpressionsEventNameModule(),
			impressionsTag = p1.impressionsTag,
			surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
			analyticsMetadata = p1.analyticsMetadata,
			searchUuid = p1.searchUuid
		}),
		UnifiedImpressionsReporter = if FFlagAXRecommendedItemsImpressionExposureLogging then ReactModule.createElement(TagBasedImpressionsDetector, {
			parentRef = UseRefResult1,
			pageFilter = p1.impressionsPageFilter,
			requestImpressionsSignal = p1.requestImpressionsSignal,
			extensions = p1.tagBasedImpressionsDetectorExtensions
		}) else nil,
		LoadMoreButton = if p1.showLoadMoreButton then ReactModule.createElement(LoadMoreButtonModule, { LayoutOrder = 2, onActivated = p1.fetchMoreOutfits }) else nil
	})
end