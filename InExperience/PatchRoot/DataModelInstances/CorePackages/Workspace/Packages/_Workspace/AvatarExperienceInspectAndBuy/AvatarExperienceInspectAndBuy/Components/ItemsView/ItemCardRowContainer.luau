local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local AXCommonModule = require(parent.AXCommon)
local _ = require(avatarExperienceInspectAndBuy.Types)
local useItemCardRowPropsModule = require(avatarExperienceInspectAndBuy.Components.useItemCardRowProps)
local _ = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local catalogRowItemCard = AXCommonModule.Components.CatalogItemCard.CatalogRowItemCard

return function(p1)
	-- upvalues: useItemCardRowPropsModule (ref), reactModule (ref), catalogRowItemCard (ref)
	return reactModule.createElement(catalogRowItemCard, useItemCardRowPropsModule(p1.item, p1.LayoutOrder, p1.view, p1.onItemCardActivated, p1.itemCardWidth))
end