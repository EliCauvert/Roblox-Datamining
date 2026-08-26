local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local foundationModule = require(parent_2.Foundation)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local imagesModule = require(parent_1.App.ImageSet.Images)
local skeleton = foundationModule.Skeleton
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeUDim2Module = require(parent.ImageSet.getIconSizeUDim2)
local itemSplitTileFooter = roactModule.PureComponent:extend("ItemSplitTileFooter")
itemSplitTileFooter.validateProps = tModule.strictInterface({
	priceText = tModule.optional(tModule.string),
	isOwned = tModule.optional(tModule.boolean),
	layoutOrder = tModule.optional(tModule.number)
})

function itemSplitTileFooter.render(p1)
	-- upvalues: imagesModule (ref), withStyleModule (ref), getIconSizeUDim2Module (ref), iconSizeModule (ref), roactModule (ref), skeleton (ref), imageSetComponentModule (ref)
	local priceText = p1.props.priceText
	local isOwned = p1.props.isOwned
	local var1 = if isOwned then imagesModule["icons/status/item/owned"] else imagesModule["icons/common/robux_small"]
	
	return withStyleModule(function(p2)
		-- upvalues: priceText (ref), isOwned (ref), getIconSizeUDim2Module (copy), iconSizeModule (copy), roactModule (copy), p1 (ref), skeleton (copy), imageSetComponentModule (copy), var1 (ref)
		local font = p2.Font.Body.Font
		local var2 = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local theme = p2.Theme
		local var3 = priceText and (priceText and tonumber(priceText:sub(1, 1)) or priceText == "--" or isOwned)
		local var4 = getIconSizeUDim2Module(iconSizeModule.Small)
		local var5 = if var3 then var4.Width.Offset + 4 else 0
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var2),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Shimmer = if not priceText then roactModule.createElement(skeleton, { Size = UDim2.new(0.8, 0, 0, var2) }) else nil,
			Icon = var3 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = var1,
				ImageColor3 = theme.TextMuted.Color,
				ImageTransparency = theme.TextMuted.Transparency,
				Size = var4,
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}),
			TextLabel = priceText and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, var5, 0, 0),
				Size = UDim2.new(1, -var5, 1, 0),
				Font = font,
				TextColor3 = theme.TextMuted.Color,
				TextTransparency = theme.TextMuted.Transparency,
				TextSize = var2,
				Text = priceText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return itemSplitTileFooter