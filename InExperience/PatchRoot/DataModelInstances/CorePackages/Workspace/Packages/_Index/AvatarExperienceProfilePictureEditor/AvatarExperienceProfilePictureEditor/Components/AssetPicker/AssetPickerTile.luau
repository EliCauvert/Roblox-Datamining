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

local function buildPresentationSlot(p0, p1) --[[ line: 40 ]]
	-- upvalues: reactModule (ref), icon (ref), iconSize (ref), itemCardThumbnail (ref), view (ref)
	local var5 = nil
	local var6 = false
	
	if p0 then
		var6 = true
		var5 = reactModule.createElement(icon, { name = p0, size = iconSize.Large })
	elseif p1 then
		var5 = reactModule.createElement(itemCardThumbnail, { url = p1 })
	end
	return if var5 == nil then nil else reactModule.createElement(view, {
		tag = {
			["align-x-center align-y-center size-full padding-small"] = var6,
			["size-full padding-small"] = not var6
		}
	}, { Content = var5 })
end

return function(value) --[[ line: 73 | named "AssetPickerTile" ]]
	-- upvalues: reactModule (ref), catalogItemCard (ref), buildPresentationSlot (ref)
	local item = value.item
	local var7 = item.id == value.selectedId
	local onDetailsActivated = value.onDetailsActivated
	local var8 = var7 and onDetailsActivated ~= nil
	
	return reactModule.createElement(catalogItemCard, {
		headerAspectRatio = 1,
		title = item.label,
		presentationSlot = buildPresentationSlot(item.iconName, item.image),
		priceLineContent = item.priceLineContent,
		isSelected = var7,
		onActivated = function() --[[ line: 84 ]]
			-- upvalues: value (ref), item (ref)
			value.onSelect(item.id)
		end,
		onOverlayButtonActivated = if var8 and onDetailsActivated then function() --[[ line: 88 ]]
			-- upvalues: onDetailsActivated (ref), item (ref)
			onDetailsActivated(item.id)
		end else nil,
		overlayButtonText = if var8 then value.labels.details else nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = value.layoutOrder
	})
end