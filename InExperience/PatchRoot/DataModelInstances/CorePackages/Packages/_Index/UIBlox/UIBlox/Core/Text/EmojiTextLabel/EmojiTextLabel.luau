local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local _ = require(parent.App.Style.StyleTypes)
local _ = require(parent.Core.Style.Validator.validateFontInfo)
local _ = require(parent.Core.Style.Validator.validateColorInfo)
local useStyleModule = require(parent.Core.Style.useStyle)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local emoji = parent.Core.Emoji
local emojiModule = require(emoji.Emoji)
local emojiModule_1 = require(emoji.Enum.Emoji)
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local t = { fluidSizing = false, maxSize = Vector2.new(10000, 10000) }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), emojiModule_1 (ref), getTextSizeModule (ref), reactModule (ref), genericTextLabelModule (ref), emojiModule (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = emojiModule_1.isEnumValue(var8.emoji)
	local baseSize = useStyleModule().Font.BaseSize
	local colorStyle = var8.colorStyle
	local fontStyle = var8.fontStyle
	local font = fontStyle.Font
	local var10 = if fontStyle.RelativeSize then baseSize * fontStyle.RelativeSize else fontStyle.FontSize
	local maxSize = var8.maxSize
	local var11 = getTextSizeModule(var8.Text, var10, font, maxSize)
	
	return reactModule.createElement(genericTextLabelModule, cryoModule.Dictionary.join(var8, {
		emoji = cryoModule.None,
		emojiOnActivated = cryoModule.None,
		colorStyle = colorStyle,
		Size = UDim2.fromOffset(math.min(var11.X, maxSize.X - var10), var11.Y)
	}), {
		Emoji = var9 and reactModule.createElement(emojiModule, {
			emoji = var8.emoji,
			onActivated = var8.emojiOnActivated,
			textFont = font,
			textSize = var10,
			Position = UDim2.fromScale(1, 0)
		})
	})
end