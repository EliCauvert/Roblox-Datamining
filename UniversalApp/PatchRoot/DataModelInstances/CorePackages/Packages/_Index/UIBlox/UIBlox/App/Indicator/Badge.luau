local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local withStyleModule = require(parent.Core.Style.withStyle)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local imagesModule = require(parent.App.ImageSet.Images)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local badgeStatesModule = require(script.Parent.Enum.BadgeStates)
local badgeVariantModule = require(script.Parent.Enum.BadgeVariant)
local divideTransparencyModule = require(parent.Utility.divideTransparency)
local UIBloxConfigModule = require(parent.UIBloxConfig)
local circle25 = imagesModule["component_assets/circle_25"]
local circle21 = imagesModule["component_assets/circle_21"]
local badge = roactModule.PureComponent:extend("Badge")
badge.validateProps = tModule.strictInterface({
	position = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	disabled = tModule.optional(tModule.boolean),
	hasShadow = tModule.optional(tModule.boolean),
	value = tModule.union(tModule.string, tModule.integer, badgeStatesModule.isEnumValue),
	badgeVariant = tModule.optional(badgeVariantModule.isEnumValue),
	layoutOrder = tModule.optional(tModule.integer)
})
badge.defaultProps = {
	disabled = false,
	hasShadow = false,
	position = UDim2.new(0, 0, 0, 0),
	anchorPoint = Vector2.new(0, 0),
	badgeVariant = badgeVariantModule.Default
}

function badge.render(p0) --[[ line: 67 ]]
	-- upvalues: withStyleModule (ref), tModule (ref), badgeStatesModule (ref), getTextSizeModule (ref), UIBloxConfigModule (ref), badgeVariantModule (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), divideTransparencyModule (ref), circle25 (ref), circle21 (ref), genericTextLabelModule (ref)
	return withStyleModule(function(p1) --[[ line: 68 ]]
		-- upvalues: p0 (ref), tModule (copy), badgeStatesModule (copy), getTextSizeModule (copy), UIBloxConfigModule (copy), badgeVariantModule (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), divideTransparencyModule (copy), circle25 (copy), circle21 (copy), genericTextLabelModule (copy)
		local theme = p1.Theme
		local font = p1.Font
		local var12 = tostring(p0.props.value)
		
		if tModule.number(p0.props.value) and p0.props.value > 99 then
			var12 = "99+"
		elseif tModule.string(p0.props.value) and utf8.len(utf8.nfcnormalize(p0.props.value)) > 4 then
			var12 = string.sub(p0.props.value, 1, utf8.offset(p0.props.value, 4) - 1) .. "..."
		end
		if p0.props.value == badgeStatesModule.isEmpty then
			var12 = ""
		end
		local var13 = getTextSizeModule(var12, font.CaptionBody.RelativeSize * p1.Font.BaseSize, font.CaptionBody.Font, Vector2.new(10000, 10000)).X + 10 + 4
		
		if var13 < 24 then
			var13 = 24
		end
		local var14 = 24
		
		if p0.props.value == badgeStatesModule.isEmpty then
			var13 = 12
			var14 = 12
		end
		local var15 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.System.Contrast else p1.Tokens.Semantic.Color.Common.Badge
		local t = {
			Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Inverse.Content.Emphasis.Color3 else p1.Tokens.Semantic.Color.Common.BadgeContent.Color3,
			Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Inverse.Content.Emphasis.Transparency else p1.Tokens.Semantic.Color.Common.BadgeContent.Transparency
		}
		
		if p0.props.badgeVariant == badgeVariantModule.Alert then
			var15 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.System.Alert else p1.Tokens.Semantic.Color.Common.Alert
			t = {
				Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Extended.White.White_100.Color3 else p1.Tokens.Global.Color.White.Color3,
				Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Inverse.Content.Emphasis.Transparency else p1.Tokens.Semantic.Color.Common.BadgeContent.Transparency
			}
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = p0.props.position,
			AnchorPoint = p0.props.anchorPoint,
			Size = UDim2.fromOffset(var13, var14),
			LayoutOrder = p0.props.layoutOrder
		}, {
			Shadow = p0.props.hasShadow and roactModule.createElement(imageSetComponentModule.Label, {
				ZIndex = 1,
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 12, 1, 12),
				Image = imagesModule["component_assets/dropshadow_25"],
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(18, 18, 19, 19)
			}),
			Background = roactModule.createElement(imageSetComponentModule.Label, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = theme.BackgroundDefault.Color,
				ImageTransparency = divideTransparencyModule(theme.BackgroundDefault.Transparency, if p0.props.disabled then 2 else 1),
				Image = circle25,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(14, 14, 15, 15)
			}),
			Inner = roactModule.createElement(imageSetComponentModule.Label, {
				ZIndex = 3,
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, -4, 1, -4),
				ImageColor3 = var15.Color3,
				ImageTransparency = divideTransparencyModule(var15.Transparency, if p0.props.disabled then 2 else 1),
				Image = circle21,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 12, 13, 13)
			}, {
				TextLabel = roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					fontStyle = font.CaptionBody,
					colorStyle = t,
					Text = var12,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromScale(1, 1),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			})
		})
	end)
end

return badge