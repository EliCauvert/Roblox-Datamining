local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
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
	itemIconType = tModule.intersection(itemTileEnumsModule.ItemIconType.isEnumValue, function(p1)
		-- upvalues: t (ref)
		if t[p1] then
			return true
		end
		return false, "Unknown ItemType " .. p0
	end)
})

function itemIcon.render(p1)
	-- upvalues: t (ref), imagesModule (ref), withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), UIBloxConfigModule (ref)
	local itemIconType = t[p1.props.itemIconType]
	local var1 = itemIconType.ImageRectSize / imagesModule.ImagesResolutionScale
	
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), imageSetComponentModule (copy), itemIconType (ref), UIBloxConfigModule (copy), var1 (ref)
		local theme = p2.Theme
		local tokens = p2.Tokens
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 1),
			Image = itemIconType,
			ImageColor3 = theme.IconEmphasis.Color,
			ImageTransparency = theme.IconEmphasis.Transparency,
			Position = UDim2.new(1, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then -tokens.Size.Size_200 else -tokens.Global.Size_100, 1, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then -tokens.Size.Size_200 else -tokens.Global.Size_100),
			Size = UDim2.new(0, var1.X, 0, var1.Y)
		})
	end)
end

return itemIcon