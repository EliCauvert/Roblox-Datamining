local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogItemCardContainerModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRecommendedItemsImpressionExposureLogging = AvatarExperienceFlagsModule.FFlagAXRecommendedItemsImpressionExposureLogging
local FFlagAXAvatarTabLooksYouMayAlsoLike = AvatarExperienceFlagsModule.FFlagAXAvatarTabLooksYouMayAlsoLike
local RecommendedItemCard = RoactModule.PureComponent:extend("RecommendedItemCard")

function RecommendedItemCard.didUpdate(p1, p2)
	-- upvalues: RetrievalStatusModule (copy)
	local GetRecommendedItemsFunction: () -> () = p1.props.getRecommendedItems
	local ClearTryOnsFunction: () -> () = p1.props.clearTryOns
	
	if p2.purchasingStatus == RetrievalStatusModule.Fetching and p1.props.purchasingStatus == RetrievalStatusModule.Done then
		GetRecommendedItemsFunction()
		ClearTryOnsFunction()
	end
end

function RecommendedItemCard.render(p1)
	-- upvalues: FFlagAXRecommendedItemsImpressionExposureLogging (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), ConstantsModule (copy), RoactModule (copy), CatalogItemCardContainerModule (copy), CatalogConstantsModule (copy)
	local ItemId = p1.props.itemId
	local ItemType = p1.props.itemType
	local ImpressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.props.impressionsTag else nil
	local ImpressionsCategory = if FFlagAXRecommendedItemsImpressionExposureLogging then p1.props.impressionsCategory else nil
	local IsItemTypeMatch = if FFlagAXAvatarTabLooksYouMayAlsoLike then ItemType == ConstantsModule.ItemType.Look else nil
	
	return RoactModule.createElement(CatalogItemCardContainerModule, {
		isTitleVisible = true,
		isPriceVisible = true,
		itemId = ItemId,
		itemType = ItemType,
		index = p1.props.index,
		analyticsItemCountPerPage = ConstantsModule.NumRecommendedItems,
		analyticsContext = CatalogConstantsModule.AnalyticsContext.AvatarEditorRecommendedItem,
		itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
		resultsListRef = p1.props.resultsListRef,
		gridInformation = p1.props.gridInformation,
		impressionsTag = if FFlagAXRecommendedItemsImpressionExposureLogging then ImpressionsTag else nil,
		impressionsCategory = if FFlagAXRecommendedItemsImpressionExposureLogging then ImpressionsCategory else nil,
		impressionsId = if FFlagAXRecommendedItemsImpressionExposureLogging and ImpressionsTag then tostring(ItemId) else nil,
		impressionsSchema = if FFlagAXRecommendedItemsImpressionExposureLogging and ImpressionsTag then "defaultItem" else nil,
		isOrganic = if FFlagAXRecommendedItemsImpressionExposureLogging and ImpressionsTag then true elseif FFlagAXAvatarTabLooksYouMayAlsoLike then IsItemTypeMatch else nil,
		lookData = if FFlagAXAvatarTabLooksYouMayAlsoLike and IsItemTypeMatch then p1.props.lookData else nil,
		thumbailAspectRatio = if FFlagAXAvatarTabLooksYouMayAlsoLike and IsItemTypeMatch then ConstantsModule.LookTileAspectRatio else nil,
		thumbnailSize = if FFlagAXAvatarTabLooksYouMayAlsoLike and IsItemTypeMatch then "w=300&h=450" else nil
	})
end

return RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), ConstantsModule (copy)
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, p2.itemType)
	local Text: string = ItemDataModuleResult and ItemDataModuleResult.product and tostring(ItemDataModuleResult.product.id) or ""
	local Status = if Text then PerformFetch.GetStatus(p1, CatalogConstantsModule.PurchaseProductKey .. Text) else nil
	local v1 = nil
	
	if FFlagAXAvatarTabLooksYouMayAlsoLike and p2.itemType == ConstantsModule.ItemType.Look then
		local Look = p1.AvatarExperience.Common.Widgets.HydratedWidgetData.Look
		v1 = Look and Look[p2.itemId]
	end
	return {
		purchasingStatus = Status,
		lookData = if FFlagAXAvatarTabLooksYouMayAlsoLike then v1 else nil
	}
end, function(Callback)
	-- upvalues: ClearTryOnsFunction (copy)
	return {
		clearTryOns = function()
			-- upvalues: Callback (copy), ClearTryOnsFunction (upval)
			Callback(ClearTryOnsFunction())
		end
	}
end)(RecommendedItemCard)