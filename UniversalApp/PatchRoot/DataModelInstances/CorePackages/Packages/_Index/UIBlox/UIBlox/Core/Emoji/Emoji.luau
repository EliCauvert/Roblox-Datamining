local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.React)
local emojiModule = require(parent.Enum.Emoji)
local constantsModule = require(parent.constants)

local function _(p0)
	-- upvalues: emojiModule (ref), constantsModule (ref)
	return if emojiModule.isEnumValue(p0) then constantsModule[p0.rawValue()] else ""
end

return function(p1)
	-- upvalues: reactModule (ref), emojiModule (ref), constantsModule (ref)
	local createElement = reactModule.createElement
	local var3 = if p1.onActivated then "TextButton" else "TextLabel"
	local t = { Size = UDim2.fromScale(0, 1) }
	local emoji = p1.emoji
	t.Text = if emojiModule.isEnumValue(emoji) then constantsModule[emoji.rawValue()] else ""
	t.TextColor3 = Color3.fromHex("#fff")
	t.AutomaticSize = Enum.AutomaticSize.X
	t.Font = p1.textFont
	t.TextSize = p1.textSize
	t.Position = p1.Position
	t.BackgroundTransparency = 1
	t[reactModule.Event.Activated] = p1.onActivated
	
	return createElement(var3, t)
end