local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local FFlagAXThumbTypeNilCheck = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXThumbTypeNilCheck
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local BaseItemCard = RoactModule.PureComponent:extend("BaseItemCard")
BaseItemCard.validateProps = TModule.strictInterface({
	itemId = TModule.optional(TModule.string),
	itemType = TModule.optional(TModule.string),
	gridInformation = TModule.optional(TModule.table),
	onActivated = TModule.callback,
	hideItemTitle = TModule.optional(TModule.boolean),
	itemData = TModule.optional(TModule.table)
})

function BaseItemCard.render(p1)
	-- upvalues: RoactModule (copy), CatalogUtilsModule (copy), FFlagAXThumbTypeNilCheck (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ReactModule (copy), CatalogItemCard (copy), ItemCardThumbnail (copy)
	local ItemData = p1.props.itemData
	local ItemId = p1.props.itemId
	local ItemType = p1.props.itemType
	p1.textButtonRef = RoactModule.createRef()
	local Url = nil
	local Name = nil
	
	if ItemType and ItemId then
		local RbxThumbType = CatalogUtilsModule.GetRbxThumbType(ItemType)
		Url = if FFlagAXThumbTypeNilCheck and RbxThumbType then GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, RbxThumbType, 150) else GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, RbxThumbType, 150)
	end
	if ItemData then
		Name = ItemData.name
	end
	return ReactModule.createElement(CatalogItemCard, {
		ref = p1.textButtonRef,
		onActivated = p1.props.onActivated,
		presentationSlot = if Url then ReactModule.createElement(ItemCardThumbnail, { url = Url }) else nil,
		title = Name,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
end

function BaseItemCard.addUnifiedEventLogging(p1)
	-- upvalues: AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogConstants (copy)
	local ItemData = p1.props.itemData
	AddUnifiedEventLoggingFunction(p1.textButtonRef, {
		action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
		itemId = p1.props.itemId,
		itemType = if p1.props.itemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE,
		assetType = if FFlagAXMISEnableMultiShoppingUnifiedEvents and ItemData then ItemData.assetType else nil,
		bundleType = if FFlagAXMISEnableMultiShoppingUnifiedEvents and ItemData then ItemData.bundleType else nil,
		price = if ItemData and ItemData.priceInRobux then ItemData.priceInRobux else nil,
		gridPositionRow = if p1.props.gridInformation then p1.props.gridInformation.row else nil,
		gridPositionColumn = if p1.props.gridInformation then p1.props.gridInformation.column else nil
	}, {
		hasDeferredActions = true,
		isSelected = not FFlagAXMISEnableMultiShoppingUnifiedEvents and nil,
		sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
	})
end

if not FFlagAXMISEnableMultiShoppingUnifiedEvents then
	function BaseItemCard.didMount(p1)
		p1:addUnifiedEventLogging()
	end
end
if FFlagAXMISEnableMultiShoppingUnifiedEvents then
	function BaseItemCard.didUpdate(p1, p2)
		if p2.itemId ~= p1.props.itemId or p2.itemType ~= p1.props.itemType then
			p1:addUnifiedEventLogging()
		end
	end
end
return (RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy)
	return {
		itemData = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, p2.itemType)
	}
end)(BaseItemCard))