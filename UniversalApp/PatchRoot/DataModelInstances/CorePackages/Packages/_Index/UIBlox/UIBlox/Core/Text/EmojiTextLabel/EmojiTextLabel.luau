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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), emojiModule_1 (ref), getTextSizeModule (ref), reactModule (ref), genericTextLabelModule (ref), emojiModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = emojiModule_1.isEnumValue(var1.emoji)
	local baseSize = useStyleModule().Font.BaseSize
	local colorStyle = var1.colorStyle
	local fontStyle = var1.fontStyle
	local font = fontStyle.Font
	local var3 = if fontStyle.RelativeSize then baseSize * fontStyle.RelativeSize else fontStyle.FontSize
	local maxSize = var1.maxSize
	local var4 = getTextSizeModule(var1.Text, var3, font, maxSize)
	
	return reactModule.createElement(genericTextLabelModule, cryoModule.Dictionary.join(var1, {
		emoji = cryoModule.None,
		emojiOnActivated = cryoModule.None,
		colorStyle = colorStyle,
		Size = UDim2.fromOffset(math.min(var4.X, maxSize.X - var3), var4.Y)
	}), {
		Emoji = var2 and reactModule.createElement(emojiModule, {
			emoji = var1.emoji,
			onActivated = var1.emojiOnActivated,
			textFont = font,
			textSize = var3,
			Position = UDim2.fromScale(1, 0)
		})
	})
end