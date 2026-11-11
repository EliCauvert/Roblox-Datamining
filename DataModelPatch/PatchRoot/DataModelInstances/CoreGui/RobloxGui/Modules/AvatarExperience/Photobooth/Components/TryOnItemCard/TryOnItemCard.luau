local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local CatalogItemCardItemInfoEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardItemInfoEnum
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local InventoryItemType = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemType

return function(p1)
	-- upvalues: InventoryItemType (copy), ReactModule (copy), CatalogItemCard (copy), CatalogItemCardItemInfoEnum (copy), FoundationModule (copy), ItemCardThumbnail (copy)
	local Asset = if p1.inventoryItemType == InventoryItemType.Asset then "Asset" elseif p1.inventoryItemType == InventoryItemType.Outfit then "Outfit" else nil
	local Tokens = p1.tokens
	local Size50 = Tokens.Size.Size_50
	
	return ReactModule.createElement(CatalogItemCard, {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		isSelected = p1.isSelected,
		title = p1.itemName,
		ref = p1.ref,
		itemInfo = if p1.showDynamicHeadIcon then CatalogItemCardItemInfoEnum.DynamicHead else nil,
		onActivated = p1.onActivated,
		presentationSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full", ref = p1.thumbnailRef }, {
			UIPadding = if p1.isSelected then ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Size50),
				PaddingBottom = UDim.new(0, Size50),
				PaddingLeft = UDim.new(0, Size50),
				PaddingRight = UDim.new(0, Size50)
			}) else nil,
			InnerContent = ReactModule.createElement(FoundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				tag = `clip radius-medium {p1.impressionsTag}`,
				backgroundStyle = { Transparency = 1 }
			}, {
				UIStroke = if p1.isSelected then ReactModule.createElement("UIStroke", {
					Transparency = 0,
					Thickness = Size50,
					Color = Tokens.Color.ActionSubEmphasis.Background.Color3
				}) else nil,
				Thumbnail = Asset and ReactModule.createElement(ItemCardThumbnail, {
					url = `rbxthumb://type={Asset}&id={p1.itemId}&w=150&h=150&filter=0`
				})
			})
		})
	})
end