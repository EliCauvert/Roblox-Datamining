local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local UseItemCardRowPropsModule = require(AvatarExperienceInspectAndBuy.Components.useItemCardRowProps)
local _ = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local CatalogRowItemCard = require(Parent.AXCommon).Components.CatalogItemCard.CatalogRowItemCard

return function(Frame) --[[ Line: 19 ]]
	-- upvalues: UseItemCardRowPropsModule (copy), ReactModule (copy), CatalogRowItemCard (copy)
	return ReactModule.createElement(CatalogRowItemCard, (UseItemCardRowPropsModule(Frame.item, Frame.LayoutOrder, Frame.view, Frame.onItemCardActivated, Frame.itemCardWidth)))
end