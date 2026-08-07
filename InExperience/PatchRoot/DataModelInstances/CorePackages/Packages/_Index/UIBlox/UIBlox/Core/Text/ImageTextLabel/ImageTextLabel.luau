local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local getWrappedTextWithIconModule = require(parent.Core.Text.GetWrappedTextWithIcon)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent.Core.Style.Validator.validateTypographyInfo)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local withStyleModule = require(parent.Core.Style.withStyle)
local imageTextLabel = roactModule.PureComponent:extend("ImageTextLabel")
imageTextLabel.validateProps = tModule.interface({
	imageProps = tModule.optional(tModule.interface({ Size = tModule.UDim2 })),
	genericTextLabelProps = tModule.interface({
		Text = tModule.string,
		fontStyle = tModule.union(validateFontInfoModule, validateTypographyInfoModule),
		colorStyle = validateColorInfoModule,
		fluidSizing = tModule.optional(tModule.boolean),
		AnchorPoint = tModule.None,
		Position = tModule.None,
		Size = tModule.None,
		TextXAlignment = tModule.None,
		TextYAlignment = tModule.None,
		TextScaled = tModule.None,
		maxSize = tModule.None,
		richText = tModule.optional(tModule.boolean)
	}),
	frameProps = tModule.optional(tModule.interface({ Size = tModule.None })),
	maxSize = tModule.optional(tModule.Vector2),
	padding = tModule.optional(tModule.number)
})
imageTextLabel.defaultProps = {
	padding = 0,
	maxSize = Vector2.new(10000, 10000),
	frameProps = {}
}

function imageTextLabel.render(p0) --[[ line: 68 ]]
	-- upvalues: withStyleModule (ref), getWrappedTextWithIconModule (ref), getTextSizeModule (ref), roactModule (ref), cryoModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref)
	local genericTextLabelProps = p0.props.genericTextLabelProps
	local imageProps = p0.props.imageProps
	local frameProps = p0.props.frameProps
	local padding = p0.props.padding
	local text = p0.props.genericTextLabelProps.Text
	local maxSize = p0.props.maxSize
	local useMaxHeight = p0.props.useMaxHeight
	local richText = p0.props.richText
	
	return withStyleModule(function(p1) --[[ line: 78 ]]
		-- upvalues: genericTextLabelProps (ref), imageProps (ref), text (write), getWrappedTextWithIconModule (copy), padding (ref), getTextSizeModule (copy), maxSize (ref), useMaxHeight (ref), roactModule (copy), cryoModule (copy), frameProps (ref), imageSetComponentModule (copy), genericTextLabelModule (copy), p0 (ref), richText (ref)
		local fontStyle = genericTextLabelProps.fontStyle
		local var12 = if fontStyle.RelativeSize then p1.Font.BaseSize * fontStyle.RelativeSize else fontStyle.FontSize
		local font = fontStyle.Font
		
		if imageProps then
			text = getWrappedTextWithIconModule(text, var12, font, imageProps.Size.X.Offset, padding)
		end
		local var13 = getTextSizeModule(text, var12, font, Vector2.new(maxSize.X, maxSize.Y))
		
		return roactModule.createElement("Frame", cryoModule.Dictionary.join(frameProps, {
			Size = UDim2.new(0, var13.X, 0, if useMaxHeight then maxSize.Y else var13.Y)
		}), {
			Icon = if imageProps then roactModule.createElement(imageSetComponentModule.Label, imageProps) else nil,
			Name = roactModule.createElement(genericTextLabelModule, cryoModule.Dictionary.join(genericTextLabelProps, {
				Text = text,
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				TextXAlignment = genericTextLabelProps.TextXAlignment or Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				fluidSizing = if imageProps then false else p0.props.fluidSizing,
				maxSize = maxSize,
				RichText = richText
			}))
		})
	end)
end

return imageTextLabel