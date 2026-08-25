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

function itemTileFooter.render(p0)
	-- upvalues: imagesModule (ref), withStyleModule (ref), roactModule (ref), skeleton (ref), imageSetComponentModule (ref)
	local priceText = p0.props.priceText
	local isOwned = p0.props.isOwned
	local var7 = if isOwned then imagesModule["icons/status/item/owned"] else imagesModule["icons/common/robux_small"]
	
	return withStyleModule(function(p1)
		-- upvalues: var7 (write), imagesModule (copy), priceText (ref), isOwned (ref), roactModule (copy), skeleton (copy), imageSetComponentModule (copy)
		local font = p1.Font.SubHeader1.Font
		local var8 = p1.Font.BaseSize * p1.Font.SubHeader1.RelativeSize
		local theme = p1.Theme
		local var9 = var7.ImageRectSize / imagesModule.ImagesResolutionScale
		local var10 = priceText and (priceText and tonumber(priceText:sub(1, 1)) or isOwned)
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Shimmer = not priceText and roactModule.createElement(skeleton, { Size = UDim2.new(0.8, 0, 0, var8) }),
			icon = var10 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = var7,
				ImageColor3 = theme.IconEmphasis.Color,
				ImageTransparency = theme.IconEmphasis.Transparency,
				Size = UDim2.new(0, var9.X, 0, var9.Y)
			}),
			TextLabel = priceText and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(1, -(if var10 then var9.X + 4 else 0), 1, 0),
				Font = font,
				TextColor3 = theme.SecondaryContent.Color,
				TextTransparency = theme.SecondaryContent.Transparency,
				TextSize = var8,
				Text = priceText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return itemTileFooter