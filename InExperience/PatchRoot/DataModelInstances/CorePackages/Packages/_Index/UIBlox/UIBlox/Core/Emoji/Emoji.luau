local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local EmojiModule = require(Parent.Enum.Emoji)
local ConstantsModule = require(Parent.constants)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

local function _(p1)
	-- upvalues: EmojiModule (copy), ConstantsModule (copy)
	return if EmojiModule.isEnumValue(p1) then ConstantsModule[p1.rawValue()] else ""
end

return function(p1)
	-- upvalues: ReactModule (copy), EmojiModule (copy), ConstantsModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local Emoji = p1.emoji
	
	return ReactModule.createElement(if p1.onActivated then "TextButton" else "TextLabel", {
		Size = UDim2.fromScale(0, 1),
		Text = if EmojiModule.isEnumValue(Emoji) then ConstantsModule[Emoji.rawValue()] else "",
		TextColor3 = Color3.fromHex("#fff"),
		AutomaticSize = Enum.AutomaticSize.X,
		Font = if FoundationFontFaceMigration then nil else p1.textFont,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.textFont) else nil,
		TextSize = p1.textSize,
		Position = p1.Position,
		BackgroundTransparency = 1,
		[ReactModule.Event.Activated] = p1.onActivated
	})
end