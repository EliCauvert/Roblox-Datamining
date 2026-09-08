local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local view = foundationModule.View
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local catalogItemCard = avatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local itemCardThumbnail = avatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnail

local function buildPresentationSlot(p1, p2)
	-- upvalues: reactModule (ref), icon (ref), iconSize (ref), itemCardThumbnail (ref), view (ref)
	local var1 = nil
	local var2 = false
	
	if p1 then
		var2 = true
		var1 = reactModule.createElement(icon, { name = p1, size = iconSize.Large })
	elseif p2 then
		var1 = reactModule.createElement(itemCardThumbnail, { url = p2 })
	end
	return if var1 == nil then nil else reactModule.createElement(view, {
		tag = {
			["align-x-center align-y-center size-full padding-small"] = var2,
			["size-full padding-small"] = not var2
		}
	}, { Content = var1 })
end

return function(value)
	-- upvalues: reactModule (ref), catalogItemCard (ref), buildPresentationSlot (ref)
	local item = value.item
	local var1 = item.id == value.selectedId
	local onDetailsActivated = value.onDetailsActivated
	local var2 = var1 and onDetailsActivated ~= nil
	
	return reactModule.createElement(catalogItemCard, {
		headerAspectRatio = 1,
		title = item.label,
		presentationSlot = buildPresentationSlot(item.iconName, item.image),
		priceLineContent = item.priceLineContent,
		isSelected = var1,
		onActivated = function()
			-- upvalues: value (ref), item (ref)
			value.onSelect(item.id)
		end,
		onOverlayButtonActivated = if var2 and onDetailsActivated then function()
			-- upvalues: onDetailsActivated (ref), item (ref)
			onDetailsActivated(item.id)
		end else nil,
		overlayButtonText = if var2 then value.labels.details else nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = value.layoutOrder
	})
end