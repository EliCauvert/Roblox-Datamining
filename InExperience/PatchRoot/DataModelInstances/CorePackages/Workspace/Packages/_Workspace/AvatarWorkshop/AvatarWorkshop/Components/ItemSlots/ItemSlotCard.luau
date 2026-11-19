local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local ItemSlotCardBaseModule = require(script.Parent.ItemSlotCardBase)
local AssetSlotModule = require(script.Parent.AssetSlot)
local BodySlotModule = require(script.Parent.BodySlot)

return function(Frame)
	-- upvalues: ReactModule (copy), AssetSlotModule (copy), BodySlotModule (copy), ItemSlotCardBaseModule (copy)
	local Element = nil
	local NoAssetId = false
	
	if Frame.slotType == "Asset" then
		local SlotContent = Frame.slotContent
		Element = ReactModule.createElement(AssetSlotModule, {
			assetId = SlotContent.assetId,
			placeholderIcon = SlotContent.placeholderIcon
		})
		NoAssetId = SlotContent.assetId == nil
	elseif Frame.slotType == "Body" then
		local SlotContent = Frame.slotContent
		Element = ReactModule.createElement(BodySlotModule, {
			head = SlotContent.head,
			torso = SlotContent.torso,
			rightArm = SlotContent.rightArm,
			leftArm = SlotContent.leftArm,
			rightLeg = SlotContent.rightLeg,
			leftLeg = SlotContent.leftLeg
		})
	end
	return ReactModule.createElement(ItemSlotCardBaseModule, {
		title = Frame.text,
		selected = Frame.selected,
		transparent = NoAssetId,
		onActivated = function()
			-- upvalues: Frame (copy)
			Frame.onActivated(Frame.id)
		end,
		LayoutOrder = Frame.LayoutOrder
	}, { SlotContent = Element })
end