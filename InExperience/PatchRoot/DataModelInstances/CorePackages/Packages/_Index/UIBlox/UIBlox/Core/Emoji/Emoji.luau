local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local emojiModule = require(parent.Enum.Emoji)
local constantsModule = require(parent.constants)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

local function _(p1)
	-- upvalues: emojiModule (ref), constantsModule (ref)
	return if emojiModule.isEnumValue(p1) then constantsModule[p1.rawValue()] else ""
end

return function(p1)
	-- upvalues: reactModule (ref), emojiModule (ref), constantsModule (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref)
	local createElement = reactModule.createElement
	local var1 = if p1.onActivated then "TextButton" else "TextLabel"
	local t = { Size = UDim2.fromScale(0, 1) }
	local emoji = p1.emoji
	t.Text = if emojiModule.isEnumValue(emoji) then constantsModule[emoji.rawValue()] else ""
	t.TextColor3 = Color3.fromHex("#fff")
	t.AutomaticSize = Enum.AutomaticSize.X
	t.Font = if foundationFontFaceMigration then nil else p1.textFont
	t.FontFace = if foundationFontFaceMigration then normalizeFontFace(p1.textFont) else nil
	t.TextSize = p1.textSize
	t.Position = p1.Position
	t.BackgroundTransparency = 1
	t[reactModule.Event.Activated] = p1.onActivated
	
	return createElement(var1, t)
end