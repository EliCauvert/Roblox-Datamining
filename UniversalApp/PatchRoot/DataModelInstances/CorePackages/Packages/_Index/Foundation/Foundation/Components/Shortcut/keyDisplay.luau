local Foundation = script:FindFirstAncestor("Foundation")
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService
local _ = require(Foundation.Enums.InputPlatform)
local GetIconForKeyCodeModule = require(Foundation.Utility.getIconForKeyCode)
local t = {}

for _, enumItem in Enum.KeyCode:GetEnumItems() do
	t[enumItem.Name] = enumItem
end
local config = {
	RightAlt = "LeftAlt",
	RightControl = "LeftControl",
	RightMeta = "LeftMeta",
	RightShift = "LeftShift",
	RightSuper = "LeftSuper"
}
local config1 = {
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
	Euro = "€",
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
local config2 = {
	MouseDelta = true,
	MousePosition = true,
	None = true,
	TouchPosition = true,
	TrackpadPan = true,
	TrackpadPinch = true,
	Unknown = true
}

local function _(p1): boolean --[[ Line: 93 | Named "isGamepadKeyCode" ]]
	local Name = p1.Name
	
	return Name:match("^Button") ~= nil or Name:match("^DPad") ~= nil or Name:match("^Thumbstick") ~= nil
end

local _ = function(p1) --[[ Line: 98 | Named "normalizeModifier" ]]
	-- upvalues: config (copy), t (copy)
	local Entry = config[p1.Name]
	
	return if Entry == nil then p1 else t[Entry] or p1
end

local _ = function(p1) --[[ Line: 108 | Named "getStringForKeyCode" ]]
	-- upvalues: UserInputService (copy)
	local Success, Result = pcall(function() --[[ Line: 109 ]]
		-- upvalues: UserInputService (upval), p1 (copy)
		return UserInputService:GetStringForKeyCode(p1)
	end)
	
	return if Success and typeof(Result) == "string" and Result ~= "" then Result else nil
end

return {
	isNonDisplayable = function(p1): boolean --[[ Line: 120 ]]
		-- upvalues: config2 (copy)
		return config2[p1.Name] == true
	end,
	resolveKey = function(p1, p2) --[[ Line: 124 ]]
		-- upvalues: config2 (copy), config (copy), t (copy), GetIconForKeyCodeModule (copy), config1 (copy), UserInputService (copy)
		if config2[p1.Name] == true then
			return nil
		end
		local Entry = config[p1.Name]
		local Entry1 = if Entry == nil then p1 else t[Entry] or p1
		local IconForKeyCodeModule = GetIconForKeyCodeModule(Entry1, p2)
		
		if IconForKeyCodeModule then
			local Name = Entry1.Name
			local HasButton: boolean = Name:match("^Button") ~= nil or Name:match("^DPad") ~= nil or Name:match("^Thumbstick") ~= nil
			
			return if HasButton then { kind = "GamepadIcon", icon = IconForKeyCodeModule } else { kind = "Icon", icon = IconForKeyCodeModule }
		end
		local Entry2 = config1[Entry1.Name]
		
		if Entry2 then
			return { kind = "Text", text = Entry2 }
		else
			local Success, Result = pcall(function() --[[ Line: 109 ]]
				-- upvalues: UserInputService (upval), Entry1 (copy)
				return UserInputService:GetStringForKeyCode(Entry1)
			end)
			
			return {
				kind = "Text",
				text = (if Success and typeof(Result) == "string" and Result ~= "" then Result else nil) or Entry1.Name
			}
		end
	end
}