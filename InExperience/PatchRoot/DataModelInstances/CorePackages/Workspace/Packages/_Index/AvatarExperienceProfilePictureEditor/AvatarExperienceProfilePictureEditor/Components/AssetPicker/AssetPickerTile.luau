local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local CatalogItemCard = require(Parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail

local function buildPresentationSlot(Name, Url)
	-- upvalues: ReactModule (copy), Icon (copy), IconSize (copy), ItemCardThumbnail (copy), View (copy)
	local Element = nil
	local Flag = false
	
	if Name then
		Flag = true
		Element = ReactModule.createElement(Icon, { name = Name, size = IconSize.Large })
	elseif Url then
		Element = ReactModule.createElement(ItemCardThumbnail, { url = Url })
	end
	return if Element == nil then nil else ReactModule.createElement(View, {
		tag = {
			["align-x-center align-y-center size-full padding-small"] = Flag,
			["size-full padding-small"] = not Flag
		}
	}, { Content = Element })
end

return function(p1)
	-- upvalues: ReactModule (copy), CatalogItemCard (copy), buildPresentationSlot (copy)
	local Item = p1.item
	local IsIdMatch = Item.id == p1.selectedId
	local OnDetailsActivatedFunction = p1.onDetailsActivated
	local HasOnDetailsActivatedFunction: boolean = IsIdMatch and OnDetailsActivatedFunction ~= nil
	
	return ReactModule.createElement(CatalogItemCard, {
		headerAspectRatio = 1,
		title = Item.label,
		presentationSlot = buildPresentationSlot(Item.iconName, Item.image),
		priceLineContent = Item.priceLineContent,
		isSelected = IsIdMatch,
		onActivated = function()
			-- upvalues: p1 (copy), Item (copy)
			p1.onSelect(Item.id)
		end,
		onOverlayButtonActivated = if HasOnDetailsActivatedFunction and OnDetailsActivatedFunction then function()
			-- upvalues: OnDetailsActivatedFunction (copy), Item (copy)
			OnDetailsActivatedFunction(Item.id)
		end else nil,
		overlayButtonText = if HasOnDetailsActivatedFunction then p1.labels.details else nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	})
end