local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local foundationModule = require(parent_1.Foundation)
local withStyleModule = require(parent.Core.Style.withStyle)
local imagesModule = require(parent.App.ImageSet.Images)
local skeleton = foundationModule.Skeleton
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local itemTileFooter = roactModule.PureComponent:extend("ItemTileFooter")
itemTileFooter.validateProps = tModule.strictInterface({
	priceText = tModule.optional(tModule.string),
	isOwned = tModule.optional(tModule.boolean)
})

function itemTileFooter.render(p1)
	-- upvalues: imagesModule (ref), withStyleModule (ref), roactModule (ref), skeleton (ref), imageSetComponentModule (ref)
	local priceText = p1.props.priceText
	local isOwned = p1.props.isOwned
	local var1 = if isOwned then imagesModule["icons/status/item/owned"] else imagesModule["icons/common/robux_small"]
	
	return withStyleModule(function(p2)
		-- upvalues: var1 (write), imagesModule (copy), priceText (ref), isOwned (ref), roactModule (copy), skeleton (copy), imageSetComponentModule (copy)
		local font = p2.Font.SubHeader1.Font
		local var2 = p2.Font.BaseSize * p2.Font.SubHeader1.RelativeSize
		local theme = p2.Theme
		local var3 = var1.ImageRectSize / imagesModule.ImagesResolutionScale
		local var4 = priceText and (priceText and tonumber(priceText:sub(1, 1)) or isOwned)
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Shimmer = not priceText and roactModule.createElement(skeleton, { Size = UDim2.new(0.8, 0, 0, var2) }),
			icon = var4 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = var1,
				ImageColor3 = theme.IconEmphasis.Color,
				ImageTransparency = theme.IconEmphasis.Transparency,
				Size = UDim2.new(0, var3.X, 0, var3.Y)
			}),
			TextLabel = priceText and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(1, -(if var4 then var3.X + 4 else 0), 1, 0),
				Font = font,
				TextColor3 = theme.SecondaryContent.Color,
				TextTransparency = theme.SecondaryContent.Transparency,
				TextSize = var2,
				Text = priceText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return itemTileFooter