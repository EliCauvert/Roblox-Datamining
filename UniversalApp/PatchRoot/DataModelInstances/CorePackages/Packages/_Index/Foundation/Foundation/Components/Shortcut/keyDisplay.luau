local foundation = script:FindFirstAncestor("Foundation")
local userInputService = require(foundation.Utility.Wrappers.Services).UserInputService
local _ = require(foundation.Enums.InputPlatform)
local getIconForKeyCodeModule = require(foundation.Utility.getIconForKeyCode)
local t = {}

for i, v in Enum.KeyCode:GetEnumItems() do
	t[v.Name] = v
end
local t_1 = {
	RightAlt = "LeftAlt",
	RightControl = "LeftControl",
	RightMeta = "LeftMeta",
	RightShift = "LeftShift",
	RightSuper = "LeftSuper"
}
local t_2 = {
	BackSlash = "\\",
	Backquote = "`",
	Comma = ",",
	Equals = "=",
	LeftBracket = "[",
	Minus = "-",
	PageDown = "Page Down",
	PageUp = "Page Up",
	Period = ".",
	Quote = "'",
	RightBracket = "]",
	Semicolon = ";",
	Slash = "/",
	QuotedDouble = "\"",
	Hash = "#",
	Dollar = "$",
	Percent = "%",
	Ampersand = "&",
	LeftParenthesis = "(",
	RightParenthesis = ")",
	Plus = "+",
	LessThan = "<",
	GreaterThan = ">",
	Question = "?",
	At = "@",
	Underscore = "_",
	Colon = ":",
	Pipe = "|",
	LeftCurly = "{",
	RightCurly = "}",
	Tilde = "~",
	Euro = "\226\130\172",
	MouseLeftButton = "Left mouse button",
	MouseMiddleButton = "Middle mouse button",
	MouseRightButton = "Right mouse button",
	MouseWheel = "Mouse wheel",
	Thumbstick1Up = "Left stick up",
	Thumbstick1Down = "Left stick down",
	Thumbstick1Left = "Left stick left",
	Thumbstick1Right = "Left stick right",
	Thumbstick2Up = "Right stick up",
	Thumbstick2Down = "Right stick down",
	Thumbstick2Left = "Right stick left",
	Thumbstick2Right = "Right stick right"
}
local t_3 = {
	MouseDelta = true,
	MousePosition = true,
	None = true,
	TouchPosition = true,
	TrackpadPan = true,
	TrackpadPinch = true,
	Unknown = true
}

i = function(p1)
	local name = p1.Name
	
	return if name:match("^Button") == nil then if name:match("^DPad") == nil then name:match("^Thumbstick") ~= nil else true else true
end

local function _(p1)
	-- upvalues: t_1 (ref), t (ref)
	local name = t_1[p1.Name]
	
	return if name == nil then p1 else t[name] or p1
end

local _ = function(p1)
	-- upvalues: userInputService (ref)
	local ok, status = pcall(function()
		-- upvalues: userInputService (copy), p1 (ref)
		return userInputService:GetStringForKeyCode(p1)
	end)
	
	return if ok and typeof(status) == "string" and status ~= "" then status else nil
end

return {
	isNonDisplayable = function(p1)
		-- upvalues: t_3 (ref)
		return t_3[p1.Name] == true
	end,
	resolveKey = function(p1, p2)
		-- upvalues: t_3 (ref), t_1 (ref), t (ref), getIconForKeyCodeModule (ref), t_2 (ref), userInputService (ref)
		if t_3[p1.Name] == true then
			return nil
		end
		local name = t_1[p1.Name]
		local var1 = if name == nil then p1 else t[name] or p1
		local var2 = getIconForKeyCodeModule(var1, p2)
		
		if var2 then
			local name_1 = var1.Name
			
			return if if name_1:match("^Button") == nil then if name_1:match("^DPad") == nil then name_1:match("^Thumbstick") ~= nil else true else true then { kind = "GamepadIcon", icon = var2 } else { kind = "Icon", icon = var2 }
		end
		local name_1 = t_2[var1.Name]
		
		if name_1 then
			return { kind = "Text", text = name_1 }
		end
		local t_4 = { kind = "Text" }
		local ok, status = pcall(function()
			-- upvalues: userInputService (copy), var1 (ref)
			return userInputService:GetStringForKeyCode(var1)
		end)
		t_4.text = (if ok and typeof(status) == "string" and status ~= "" then status else nil) or var1.Name
		
		return t_4
	end
}