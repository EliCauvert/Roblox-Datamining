local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local FoundationFontFaceMigration = require(Parent1.Foundation).Utility.Flags.FoundationFontFaceMigration
local _ = require(Parent.App.Style.StyleTypes)
local _ = require(Parent.Core.Style.Validator.validateFontInfo)
local _ = require(Parent.Core.Style.Validator.validateColorInfo)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent.Core.Text.GetFontFromFontStyle)
local Emoji = Parent.Core.Emoji
local EmojiModule = require(Emoji.Emoji)
local EmojiModule1 = require(Emoji.Enum.Emoji)
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local config = { fluidSizing = false, maxSize = Vector2.new(10000, 10000) }

return function(p1) --[[ Line: 50 | Named "EmojiTextLabel" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), EmojiModule1 (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy), ReactModule (copy), GenericTextLabelModule (copy), EmojiModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local IsEnumValue = EmojiModule1.isEnumValue(JoinResult.emoji)
	local BaseSize = UseStyleModule().Font.BaseSize
	local ColorStyle = JoinResult.colorStyle
	local FontStyle = JoinResult.fontStyle
	local FontFromFontStyleModule = if FoundationFontFaceMigration then GetFontFromFontStyleModule(FontStyle) else FontStyle.Font
	local ScaledBaseSize = if FontStyle.RelativeSize then BaseSize * FontStyle.RelativeSize else FontStyle.FontSize
	local MaxSize = JoinResult.maxSize
	local TextSizeModule = GetTextSizeModule(JoinResult.Text, ScaledBaseSize, FontFromFontStyleModule, MaxSize)
	
	return ReactModule.createElement(GenericTextLabelModule, CryoModule.Dictionary.join(JoinResult, {
		emoji = CryoModule.None,
		emojiOnActivated = CryoModule.None,
		colorStyle = ColorStyle,
		Size = UDim2.fromOffset(math.min(TextSizeModule.X, MaxSize.X - ScaledBaseSize), TextSizeModule.Y)
	}), {
		Emoji = IsEnumValue and ReactModule.createElement(EmojiModule, {
			emoji = JoinResult.emoji,
			onActivated = JoinResult.emojiOnActivated,
			textFont = FontFromFontStyleModule,
			textSize = ScaledBaseSize,
			Position = UDim2.fromScale(1, 0)
		})
	})
end