local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local TModule = require(Parent1.t)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local UIBloxConfigModule = require(Parent.UIBloxConfig)
local GenericTextLabel = RoactModule.PureComponent:extend("GenericTextLabel")
GenericTextLabel.validateProps = TModule.interface({
	maxSize = TModule.optional(TModule.Vector2),
	fontStyle = TModule.union(require(Parent.Core.Style.Validator.validateFontInfo), (require(Parent.Core.Style.Validator.validateTypographyInfo))),
	colorStyle = TModule.union(require(Parent.Core.Style.Validator.validateColorInfo), (require(Parent.Core.Style.Validator.validateColorToken))),
	fluidSizing = TModule.optional(TModule.boolean),
	openTypeFeatures = TModule.optional(TModule.string)
})
GenericTextLabel.defaultProps = {
	fluidSizing = false,
	openTypeFeatures = nil,
	maxSize = Vector2.new(10000, 10000)
}

function GenericTextLabel.render(p1)
	-- upvalues: WithStyleModule (copy), GetTextSizeModule (copy), CryoModule (copy), RoactModule (copy), UIBloxConfigModule (copy)
	local Text = p1.props.Text
	local FluidSizing = p1.props.fluidSizing
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), Text (copy), GetTextSizeModule (upval), CryoModule (upval), RoactModule (upval), FluidSizing (copy), UIBloxConfigModule (upval)
		local FontStyle = p1.props.fontStyle
		local ColorStyle = p1.props.colorStyle
		local Color = ColorStyle.Color or ColorStyle.Color3
		local Transparency = ColorStyle.Transparency
		local RichText = p1.props.RichText
		local BaseSize = p2.Font.BaseSize
		local ScaledBaseSize = if FontStyle.RelativeMinSize then BaseSize * FontStyle.RelativeMinSize else FontStyle.FontSize
		local ScaledBaseSize1 = if FontStyle.RelativeSize then BaseSize * FontStyle.RelativeSize else FontStyle.FontSize
		local FontStyleFont = FontStyle.Font
		local Size = p1.props.Size
		
		if Size == nil then
			local Text1: string = Text
			
			if p1.props.TextTruncate == Enum.TextTruncate.AtEnd then
				Text1 ..= "..."
			end
			local TextSizeModule = GetTextSizeModule(Text1, if p1.props.LineHeight then ScaledBaseSize1 * p1.props.LineHeight else ScaledBaseSize1, FontStyleFont, p1.props.maxSize)
			Size = UDim2.new(0, TextSizeModule.X, 0, TextSizeModule.Y)
		end
		local JoinResult = CryoModule.Dictionary.join(p1.props, {
			[RoactModule.Children] = CryoModule.None,
			fluidSizing = CryoModule.None,
			fontStyle = CryoModule.None,
			openTypeFeatures = CryoModule.None,
			colorStyle = CryoModule.None,
			maxSize = CryoModule.None,
			Size = if p1.props.AutomaticSize == nil or p1.props.AutomaticSize == Enum.AutomaticSize.None then Size else nil,
			Text = Text,
			Font = FontStyleFont,
			TextSize = p1.props.TextSize or ScaledBaseSize1,
			AutomaticSize = p1.props.AutomaticSize or nil,
			TextColor3 = Color,
			TextTransparency = Transparency,
			TextWrapped = p1.props.TextWrapped == nil or p1.props.TextWrapped,
			TextScaled = FluidSizing,
			BackgroundTransparency = 1,
			RichText = RichText
		})
		
		if UIBloxConfigModule.enableOpenTypeSupport and p1.props.openTypeFeatures then
			JoinResult = CryoModule.Dictionary.join(JoinResult, { OpenTypeFeatures = p1.props.openTypeFeatures })
		end
		return RoactModule.createElement("TextLabel", JoinResult, CryoModule.Dictionary.join({
			UITextSizeConstraint = FluidSizing and RoactModule.createElement("UITextSizeConstraint", {
				MaxTextSize = ScaledBaseSize1,
				MinTextSize = ScaledBaseSize
			} or nil)
		}, p1.props[RoactModule.Children] or {}))
	end)
end

return GenericTextLabel