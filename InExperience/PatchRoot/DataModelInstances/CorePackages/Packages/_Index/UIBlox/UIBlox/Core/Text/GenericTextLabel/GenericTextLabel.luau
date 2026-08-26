local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent.Core.Style.Validator.validateTypographyInfo)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local validateColorTokenModule = require(parent.Core.Style.Validator.validateColorToken)
local withStyleModule = require(parent.Core.Style.withStyle)
local UIBloxConfigModule = require(parent.UIBloxConfig)
local genericTextLabel = roactModule.PureComponent:extend("GenericTextLabel")
genericTextLabel.validateProps = tModule.interface({
	maxSize = tModule.optional(tModule.Vector2),
	fontStyle = tModule.union(validateFontInfoModule, validateTypographyInfoModule),
	colorStyle = tModule.union(validateColorInfoModule, validateColorTokenModule),
	fluidSizing = tModule.optional(tModule.boolean),
	openTypeFeatures = tModule.optional(tModule.string)
})
genericTextLabel.defaultProps = {
	fluidSizing = false,
	openTypeFeatures = nil,
	maxSize = Vector2.new(10000, 10000)
}

function genericTextLabel.render(p1)
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), cryoModule (ref), roactModule (ref), UIBloxConfigModule (ref)
	local text = p1.props.Text
	local fluidSizing = p1.props.fluidSizing
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), text (ref), getTextSizeModule (copy), cryoModule (copy), roactModule (copy), fluidSizing (ref), UIBloxConfigModule (copy)
		local fontStyle = p1.props.fontStyle
		local colorStyle = p1.props.colorStyle
		local color = colorStyle.Color or colorStyle.Color3
		local transparency = colorStyle.Transparency
		local richText = p1.props.RichText
		local baseSize = p2.Font.BaseSize
		local var1 = if fontStyle.RelativeMinSize then baseSize * fontStyle.RelativeMinSize else fontStyle.FontSize
		local var2 = if fontStyle.RelativeSize then baseSize * fontStyle.RelativeSize else fontStyle.FontSize
		local font = fontStyle.Font
		local size = p1.props.Size
		
		if size == nil then
			local var3 = text
			
			if p1.props.TextTruncate == Enum.TextTruncate.AtEnd then
				var3 ..= "..."
			end
			local var4 = getTextSizeModule(var3, if p1.props.LineHeight then var2 * p1.props.LineHeight else var2, font, p1.props.maxSize)
			size = UDim2.new(0, var4.X, 0, var4.Y)
		end
		local var5 = cryoModule.Dictionary.join(p1.props, {
			[roactModule.Children] = cryoModule.None,
			fluidSizing = cryoModule.None,
			fontStyle = cryoModule.None,
			openTypeFeatures = cryoModule.None,
			colorStyle = cryoModule.None,
			maxSize = cryoModule.None,
			Size = if p1.props.AutomaticSize == nil or p1.props.AutomaticSize == Enum.AutomaticSize.None then size else nil,
			Text = text,
			Font = font,
			TextSize = p1.props.TextSize or var2,
			AutomaticSize = p1.props.AutomaticSize or nil,
			TextColor3 = color,
			TextTransparency = transparency,
			TextWrapped = p1.props.TextWrapped == nil or p1.props.TextWrapped,
			TextScaled = fluidSizing,
			BackgroundTransparency = 1,
			RichText = richText
		})
		
		if UIBloxConfigModule.enableOpenTypeSupport and p1.props.openTypeFeatures then
			var5 = cryoModule.Dictionary.join(var5, { OpenTypeFeatures = p1.props.openTypeFeatures })
		end
		return roactModule.createElement("TextLabel", var5, cryoModule.Dictionary.join({
			UITextSizeConstraint = fluidSizing and roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var2, MinTextSize = var1 } or nil)
		}, p1.props[roactModule.Children] or {}))
	end)
end

return genericTextLabel