local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local TModule = require(Parent1.t)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local GetWrappedTextWithIconModule = require(Parent.Core.Text.GetWrappedTextWithIcon)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ImageTextLabel = RoactModule.PureComponent:extend("ImageTextLabel")
ImageTextLabel.validateProps = TModule.interface({
	imageProps = TModule.optional(TModule.interface({ Size = TModule.UDim2 })),
	genericTextLabelProps = TModule.interface({
		Text = TModule.string,
		fontStyle = TModule.union(require(Parent.Core.Style.Validator.validateFontInfo), (require(Parent.Core.Style.Validator.validateTypographyInfo))),
		colorStyle = require(Parent.Core.Style.Validator.validateColorInfo),
		fluidSizing = TModule.optional(TModule.boolean),
		AnchorPoint = TModule.None,
		Position = TModule.None,
		Size = TModule.None,
		TextXAlignment = TModule.None,
		TextYAlignment = TModule.None,
		TextScaled = TModule.None,
		maxSize = TModule.None,
		richText = TModule.optional(TModule.boolean)
	}),
	frameProps = TModule.optional(TModule.interface({ Size = TModule.None })),
	maxSize = TModule.optional(TModule.Vector2),
	padding = TModule.optional(TModule.number)
})
ImageTextLabel.defaultProps = {
	padding = 0,
	maxSize = Vector2.new(10000, 10000),
	frameProps = {}
}

function ImageTextLabel.render(p1)
	-- upvalues: WithStyleModule (copy), GetWrappedTextWithIconModule (copy), GetTextSizeModule (copy), RoactModule (copy), CryoModule (copy), ImageSetComponentModule (copy), GenericTextLabelModule (copy)
	local GenericTextLabelProps = p1.props.genericTextLabelProps
	local ImageProps = p1.props.imageProps
	local FrameProps = p1.props.frameProps
	local Padding = p1.props.padding
	local Text = p1.props.genericTextLabelProps.Text
	local MaxSize = p1.props.maxSize
	local UseMaxHeight = p1.props.useMaxHeight
	local RichText = p1.props.richText
	
	return WithStyleModule(function(p2)
		-- upvalues: GenericTextLabelProps (copy), ImageProps (copy), Text (ref), GetWrappedTextWithIconModule (upval), Padding (copy), GetTextSizeModule (upval), MaxSize (copy), UseMaxHeight (copy), RoactModule (upval), CryoModule (upval), FrameProps (copy), ImageSetComponentModule (upval), GenericTextLabelModule (upval), p1 (copy), RichText (copy)
		local FontStyle = GenericTextLabelProps.fontStyle
		local BaseSize = p2.Font.BaseSize
		local ScaledBaseSize = if FontStyle.RelativeSize then BaseSize * FontStyle.RelativeSize else FontStyle.FontSize
		local FontStyleFont = FontStyle.Font
		
		if ImageProps then
			Text = GetWrappedTextWithIconModule(Text, ScaledBaseSize, FontStyleFont, ImageProps.Size.X.Offset, Padding)
		end
		local TextSizeModule = GetTextSizeModule(Text, ScaledBaseSize, FontStyleFont, Vector2.new(MaxSize.X, MaxSize.Y))
		
		return RoactModule.createElement("Frame", CryoModule.Dictionary.join(FrameProps, {
			Size = UDim2.new(0, TextSizeModule.X, 0, UseMaxHeight and MaxSize.Y or TextSizeModule.Y)
		}), {
			Icon = if ImageProps then RoactModule.createElement(ImageSetComponentModule.Label, ImageProps) else nil,
			Name = RoactModule.createElement(GenericTextLabelModule, CryoModule.Dictionary.join(GenericTextLabelProps, {
				Text = Text,
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				TextXAlignment = GenericTextLabelProps.TextXAlignment or Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				fluidSizing = not ImageProps and p1.props.fluidSizing,
				maxSize = MaxSize,
				RichText = RichText
			}))
		})
	end)
end

return ImageTextLabel