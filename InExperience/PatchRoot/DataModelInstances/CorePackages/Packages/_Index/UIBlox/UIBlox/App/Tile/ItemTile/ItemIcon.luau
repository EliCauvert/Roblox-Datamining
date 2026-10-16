local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ItemTileEnumsModule = require(Parent.Enum.ItemTileEnums)
local ItemIcon = RoactModule.PureComponent:extend("ItemIcon")
local config = {
	[ItemTileEnumsModule.ItemIconType.AnimationBundle] = ImagesModule["icons/status/item/bundle"],
	[ItemTileEnumsModule.ItemIconType.Bundle] = ImagesModule["icons/status/item/bundle"],
	[ItemTileEnumsModule.ItemIconType.DynamicHead] = ImagesModule["icons/status/dynamicHead_small"]
}
ItemIcon.validateProps = TModule.strictInterface({
	itemIconType = TModule.intersection(ItemTileEnumsModule.ItemIconType.isEnumValue, function(Text) --[[ Line: 24 | Named "isValidItemIconType" ]]
		-- upvalues: config (copy)
		if config[Text] then
			return true
		else
			return false, "Unknown ItemType " .. Text
		end
	end)
})

function ItemIcon.render(p1) --[[ Line: 37 ]]
	-- upvalues: config (copy), ImagesModule (copy), WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy)
	local Entry = config[p1.props.itemIconType]
	local ImageRectSizeRatio = Entry.ImageRectSize / ImagesModule.ImagesResolutionScale
	
	return WithStyleModule(function(p2) --[[ Line: 43 ]]
		-- upvalues: RoactModule (upval), ImageSetComponentModule (upval), Entry (copy), ImageRectSizeRatio (copy)
		local Theme = p2.Theme
		local Tokens = p2.Tokens
		
		return RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 1),
			Image = Entry,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			Position = UDim2.new(1, -Tokens.Size.Size_200, 1, -Tokens.Size.Size_200),
			Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y)
		})
	end)
end

return ItemIcon