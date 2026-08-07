-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:00 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local imagesModule = require(parent_1.App.ImageSet.Images)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local itemTileEnumsModule = require(parent.Enum.ItemTileEnums)
local itemIcon = roactModule.PureComponent:extend("ItemIcon")
local t = {
	[itemTileEnumsModule.ItemIconType.AnimationBundle] = imagesModule["icons/status/item/bundle"],
	[itemTileEnumsModule.ItemIconType.Bundle] = imagesModule["icons/status/item/bundle"],
	[itemTileEnumsModule.ItemIconType.DynamicHead] = imagesModule["icons/status/dynamicHead_small"]
}
itemIcon.validateProps = tModule.strictInterface({
	itemIconType = tModule.intersection(itemTileEnumsModule.ItemIconType.isEnumValue, function(p0) --[[ line: 24 | named "isValidItemIconType" ]]
		-- upvalues: t (ref)
		if t[p0] then
			return true
		end
		return false, "Unknown ItemType " .. p0
	end)
})

function itemIcon.render(p1) --[[ line: 37 ]]
	-- upvalues: t (ref), imagesModule (ref), withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local itemIconType = t[p1.props.itemIconType]
	local var8 = itemIconType.ImageRectSize / imagesModule.ImagesResolutionScale
	
	return withStyleModule(function(p2) --[[ line: 43 ]]
		-- upvalues: roactModule (copy), imageSetComponentModule (copy), itemIconType (ref), var8 (ref)
		local theme = p2.Theme
		local tokens = p2.Tokens
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 1),
			Image = itemIconType,
			ImageColor3 = theme.IconEmphasis.Color,
			ImageTransparency = theme.IconEmphasis.Transparency,
			Position = UDim2.new(1, -tokens.Global.Size_100, 1, -tokens.Global.Size_100),
			Size = UDim2.new(0, var8.X, 0, var8.Y)
		})
	end)
end

return itemIcon