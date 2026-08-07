-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:00 2026 Pacific Standard Time.

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

function itemSplitTileFooter.render(p0) --[[ line: 33 ]]
	-- upvalues: imagesModule (ref), withStyleModule (ref), getIconSizeUDim2Module (ref), iconSizeModule (ref), roactModule (ref), skeleton (ref), imageSetComponentModule (ref)
	local priceText = p0.props.priceText
	local isOwned = p0.props.isOwned
	local var9 = if isOwned then imagesModule["icons/status/item/owned"] else imagesModule["icons/common/robux_small"]
	
	return withStyleModule(function(p1) --[[ line: 38 ]]
		-- upvalues: priceText (ref), isOwned (ref), getIconSizeUDim2Module (copy), iconSizeModule (copy), roactModule (copy), p0 (ref), skeleton (copy), imageSetComponentModule (copy), var9 (ref)
		local font = p1.Font.Body.Font
		local var10 = p1.Font.BaseSize * p1.Font.Body.RelativeSize
		local theme = p1.Theme
		local var11 = priceText and (priceText and tonumber(priceText:sub(1, 1)) or priceText == "--" or isOwned)
		local var12 = getIconSizeUDim2Module(iconSizeModule.Small)
		local var13 = if var11 then var12.Width.Offset + 4 else 0
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var10),
			LayoutOrder = p0.props.layoutOrder
		}, {
			Shimmer = if not priceText then roactModule.createElement(skeleton, { Size = UDim2.new(0.8, 0, 0, var10) }) else nil,
			Icon = var11 and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = var9,
				ImageColor3 = theme.TextMuted.Color,
				ImageTransparency = theme.TextMuted.Transparency,
				Size = var12,
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}),
			TextLabel = priceText and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, var13, 0, 0),
				Size = UDim2.new(1, -var13, 1, 0),
				Font = font,
				TextColor3 = theme.TextMuted.Color,
				TextTransparency = theme.TextMuted.Transparency,
				TextSize = var10,
				Text = priceText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return itemSplitTileFooter