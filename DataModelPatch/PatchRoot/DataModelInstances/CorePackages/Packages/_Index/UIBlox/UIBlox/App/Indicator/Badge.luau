local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local ImagesModule = require(Parent.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local BadgeStatesModule = require(script.Parent.Enum.BadgeStates)
local BadgeVariantModule = require(script.Parent.Enum.BadgeVariant)
local DivideTransparencyModule = require(Parent.Utility.divideTransparency)
local ComponentAssetsCircle25 = ImagesModule["component_assets/circle_25"]
local ComponentAssetsCircle21 = ImagesModule["component_assets/circle_21"]
local Badge = RoactModule.PureComponent:extend("Badge")
Badge.validateProps = TModule.strictInterface({
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	disabled = TModule.optional(TModule.boolean),
	hasShadow = TModule.optional(TModule.boolean),
	value = TModule.union(TModule.string, TModule.integer, BadgeStatesModule.isEnumValue),
	badgeVariant = TModule.optional(BadgeVariantModule.isEnumValue),
	layoutOrder = TModule.optional(TModule.integer)
})
Badge.defaultProps = {
	disabled = false,
	hasShadow = false,
	position = UDim2.new(0, 0, 0, 0),
	anchorPoint = Vector2.new(0, 0),
	badgeVariant = BadgeVariantModule.Default
}

function Badge.render(p1)
	-- upvalues: WithStyleModule (copy), TModule (copy), BadgeStatesModule (copy), GetTextSizeModule (copy), BadgeVariantModule (copy), RoactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), DivideTransparencyModule (copy), ComponentAssetsCircle25 (copy), ComponentAssetsCircle21 (copy), GenericTextLabelModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), TModule (upval), BadgeStatesModule (upval), GetTextSizeModule (upval), BadgeVariantModule (upval), RoactModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), DivideTransparencyModule (upval), ComponentAssetsCircle25 (upval), ComponentAssetsCircle21 (upval), GenericTextLabelModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Text: string = if TModule.number(p1.props.value) and p1.props.value > 99 then if p1.props.value == BadgeStatesModule.isEmpty then "" else "99+" elseif TModule.string(p1.props.value) and utf8.len(utf8.nfcnormalize(p1.props.value)) > 4 then if p1.props.value == BadgeStatesModule.isEmpty then "" else string.sub(p1.props.value, 1, utf8.offset(p1.props.value, 4) - 1) .. "..." elseif p1.props.value == BadgeStatesModule.isEmpty then "" else tostring(p1.props.value)
		local NewX = GetTextSizeModule(Text, _Font.CaptionBody.RelativeSize * p2.Font.BaseSize, _Font.CaptionBody.Font, Vector2.new(10000, 10000)).X + 10 + 4
		
		if NewX < 24 then
			NewX = 24
		end
		local YOffset = 24
		
		if p1.props.value == BadgeStatesModule.isEmpty then
			NewX = 12
			YOffset = 12
		end
		local Badge = p2.Tokens.Semantic.Color.Common.Badge
		local ColorStyle = {
			Color = p2.Tokens.Semantic.Color.Common.BadgeContent.Color3,
			Transparency = p2.Tokens.Semantic.Color.Common.BadgeContent.Transparency
		}
		
		if p1.props.badgeVariant == BadgeVariantModule.Alert then
			Badge = p2.Tokens.Semantic.Color.Common.Alert
			ColorStyle = {
				Color = p2.Tokens.Global.Color.White.Color3,
				Transparency = p2.Tokens.Semantic.Color.Common.BadgeContent.Transparency
			}
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			Size = UDim2.fromOffset(NewX, YOffset),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Shadow = p1.props.hasShadow and RoactModule.createElement(ImageSetComponentModule.Label, {
				ZIndex = 1,
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 12, 1, 12),
				Image = ImagesModule["component_assets/dropshadow_25"],
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(18, 18, 19, 19)
			}),
			Background = RoactModule.createElement(ImageSetComponentModule.Label, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = Theme.BackgroundDefault.Color,
				ImageTransparency = DivideTransparencyModule(Theme.BackgroundDefault.Transparency, if p1.props.disabled then 2 else 1),
				Image = ComponentAssetsCircle25,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(14, 14, 15, 15)
			}),
			Inner = RoactModule.createElement(ImageSetComponentModule.Label, {
				ZIndex = 3,
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, -4, 1, -4),
				ImageColor3 = Badge.Color3,
				ImageTransparency = DivideTransparencyModule(Badge.Transparency, if p1.props.disabled then 2 else 1),
				Image = ComponentAssetsCircle21,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 12, 13, 13)
			}, {
				TextLabel = RoactModule.createElement(GenericTextLabelModule, {
					BackgroundTransparency = 1,
					fontStyle = _Font.CaptionBody,
					colorStyle = ColorStyle,
					Text = Text,
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

return Badge