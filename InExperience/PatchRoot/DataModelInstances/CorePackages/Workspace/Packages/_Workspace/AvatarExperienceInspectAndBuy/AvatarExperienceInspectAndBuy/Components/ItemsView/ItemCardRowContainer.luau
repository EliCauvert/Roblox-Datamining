local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local AXCommonModule = require(Parent.AXCommon)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local UseItemCardRowPropsModule = require(AvatarExperienceInspectAndBuy.Components.useItemCardRowProps)
local _ = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local CatalogRowItemCard = AXCommonModule.Components.CatalogItemCard.CatalogRowItemCard

return function(Frame)
	-- upvalues: UseItemCardRowPropsModule (copy), ReactModule (copy), CatalogRowItemCard (copy)
	return ReactModule.createElement(CatalogRowItemCard, (UseItemCardRowPropsModule(Frame.item, Frame.LayoutOrder, Frame.view, Frame.onItemCardActivated, Frame.itemCardWidth)))
end