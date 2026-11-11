local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local CatalogItemCardItemInfoEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardItemInfoEnum
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local InventoryItemType = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemType
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local AXNoShimmerImpressions = game:DefineFastFlag("AXNoShimmerImpressions", false)
local FFlagAXBackgroundsInOutfitThumbnails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXBackgroundsInOutfitThumbnails

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), AXNoShimmerImpressions (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), InventoryItemType (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogConstants (copy), FFlagAXBackgroundsInOutfitThumbnails (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), CatalogItemCard (copy), CatalogItemCardItemInfoEnum (copy), FoundationModule (copy), ItemCardThumbnail (copy), FFlagAXInventoryDurablesSupport (copy)
	local UseLocalizationResult = UseLocalizationFunction({ details = "Feature.Avatar.Label.DetailsButton" })
	local UseRefResult = nil
	UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: AXNoShimmerImpressions (upval), p1 (copy), AddUnifiedEventLoggingFunction (upval), UseRefResult (ref), UnifiedEventLogEnums (upval), InventoryItemType (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogConstants (upval)
		if not AXNoShimmerImpressions or p1.itemId and p1.assetType then
			AddUnifiedEventLoggingFunction(UseRefResult, {
				action = if p1.isSelected then UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED else UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				itemId = p1.itemId,
				itemType = if p1.inventoryItemType == InventoryItemType.Asset then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE,
				gridPositionRow = if p1.gridInformation then p1.gridInformation.row else nil,
				gridPositionColumn = if p1.gridInformation then p1.gridInformation.column else nil,
				assetType = p1.assetType
			}, {
				hasDeferredActions = not FFlagAXMISEnableMultiShoppingUnifiedEvents or nil,
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
			
			return
		end
	end, {
		p1.isSelected,
		p1.gridInformation,
		if AXNoShimmerImpressions then p1.itemId else nil,
		if AXNoShimmerImpressions then p1.assetType else nil,
		if AXNoShimmerImpressions then p1.inventoryItemType else nil
	})
	local Asset = if p1.inventoryItemType == InventoryItemType.Asset then "Asset" elseif p1.inventoryItemType == InventoryItemType.Outfit then "Outfit" else nil
	local RbxthumbWithTypeSizeAndOptions = if FFlagAXBackgroundsInOutfitThumbnails then if Asset then GetRbxthumbWithTypeSizeAndOptionsFunction(p1.itemId, Asset, 150) else nil else `rbxthumb://type={Asset}&id={p1.itemId}&w=150&h=150`
	
	if p1.moderationStatus and RbxthumbWithTypeSizeAndOptions then
		RbxthumbWithTypeSizeAndOptions ..= "&filters=" .. p1.updateCounter or 0
	end
	return ReactModule.createElement(CatalogItemCard, {
		Size = UDim2.fromScale(1, 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		isSelected = p1.isSelected,
		title = if p1.hideName then nil else p1.itemName,
		itemInfo = if p1.showDynamicHeadIcon then CatalogItemCardItemInfoEnum.DynamicHead else nil,
		onActivated = p1.onActivated,
		overlayButtonText = UseLocalizationResult.details,
		onOverlayButtonActivated = p1.onDetailsButtonActivated,
		ref = UseRefResult,
		presentationSlot = ReactModule.createElement(FoundationModule.View, {
			tag = `size-full clip radius-medium {p1.impressionsTag}`,
			ref = p1.thumbnailRef
		}, {
			Thumbnail = Asset and ReactModule.createElement(ItemCardThumbnail, { url = RbxthumbWithTypeSizeAndOptions })
		}),
		itemStatus = p1.itemStatus,
		expirationTime = if FFlagAXInventoryDurablesSupport then p1.expirationTime else nil
	})
end