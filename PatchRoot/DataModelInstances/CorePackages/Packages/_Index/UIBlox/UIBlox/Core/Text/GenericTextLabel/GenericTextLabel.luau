-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

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

function genericTextLabel.render(p0) --[[ line: 48 ]]
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), cryoModule (ref), roactModule (ref), UIBloxConfigModule (ref)
	local text = p0.props.Text
	local fluidSizing = p0.props.fluidSizing
	
	return withStyleModule(function(p1) --[[ line: 52 ]]
		-- upvalues: p0 (ref), text (ref), getTextSizeModule (copy), cryoModule (copy), roactModule (copy), fluidSizing (ref), UIBloxConfigModule (copy)
		local fontStyle = p0.props.fontStyle
		local colorStyle = p0.props.colorStyle
		local color = colorStyle.Color or colorStyle.Color3
		local transparency = colorStyle.Transparency
		local richText = p0.props.RichText
		local baseSize = p1.Font.BaseSize
		local var12 = if fontStyle.RelativeMinSize then baseSize * fontStyle.RelativeMinSize else fontStyle.FontSize
		local var13 = if fontStyle.RelativeSize then baseSize * fontStyle.RelativeSize else fontStyle.FontSize
		local font = fontStyle.Font
		local size = p0.props.Size
		
		if size == nil then
			local var14 = text
			
			if p0.props.TextTruncate == Enum.TextTruncate.AtEnd then
				var14 ..= "..."
			end
			local var15 = getTextSizeModule(var14, if p0.props.LineHeight then var13 * p0.props.LineHeight else var13, font, p0.props.maxSize)
			size = UDim2.new(0, var15.X, 0, var15.Y)
		end
		local var16 = cryoModule.Dictionary.join(p0.props, {
			[roactModule.Children] = cryoModule.None,
			fluidSizing = cryoModule.None,
			fontStyle = cryoModule.None,
			openTypeFeatures = cryoModule.None,
			colorStyle = cryoModule.None,
			maxSize = cryoModule.None,
			Size = if p0.props.AutomaticSize == nil or p0.props.AutomaticSize == Enum.AutomaticSize.None then size else nil,
			Text = text,
			Font = font,
			TextSize = p0.props.TextSize or var13,
			AutomaticSize = p0.props.AutomaticSize or nil,
			TextColor3 = color,
			TextTransparency = transparency,
			TextWrapped = p0.props.TextWrapped == nil or p0.props.TextWrapped,
			TextScaled = fluidSizing,
			BackgroundTransparency = 1,
			RichText = richText
		})
		
		if UIBloxConfigModule.enableOpenTypeSupport and p0.props.openTypeFeatures then
			var16 = cryoModule.Dictionary.join(var16, { OpenTypeFeatures = p0.props.openTypeFeatures })
		end
		return roactModule.createElement("TextLabel", var16, cryoModule.Dictionary.join({
			UITextSizeConstraint = fluidSizing and roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var13, MinTextSize = var12 } or nil)
		}, p0.props[roactModule.Children] or {}))
	end)
end

return genericTextLabel