local keyCodeCategoriesModule = require(script.Parent.KeyCodeCategories)
local t = {
	QuotedDouble = true,
	Hash = true,
	Dollar = true,
	Percent = true,
	Ampersand = true,
	LeftParenthesis = true,
	RightParenthesis = true,
	Asterisk = true,
	Plus = true,
	LessThan = true,
	GreaterThan = true,
	Question = true,
	At = true,
	Caret = true,
	Underscore = true,
	Colon = true,
	Pipe = true,
	LeftCurly = true,
	RightCurly = true,
	Tilde = true
}
local t_1 = {
	Unknown = "Sentinel value when no key is pressed.",
	Backspace = "Deletes the character before the cursor.",
	Tab = "Tab key; moves focus between fields.",
	Clear = "Clear key. Only present on some keyboards.",
	Return = "Main Enter/Return key. Roblox uses Return, not a separate Enter KeyCode.",
	Pause = "Pause key. Only present on some keyboards.",
	Escape = "Escape key.",
	Space = "Space bar.",
	NumLock = "Num Lock on the keypad cluster.",
	ScrollLock = "Scroll Lock (ScrLk).",
	LeftMeta = "Left Meta key. Only present on some keyboards.",
	RightMeta = "Right Meta key. Only present on some keyboards.",
	LeftSuper = "Left Windows / Command key.",
	RightSuper = "Right Windows / Command key.",
	Mode = "Mode key. Only present on some keyboards.",
	Compose = "Compose key. Only present on some keyboards.",
	Help = "Help key. Only present on some keyboards.",
	Print = "Print key. Only present on some keyboards.",
	SysReq = "SysReq key. Only present on some keyboards.",
	Break = "Break key. Only present on some keyboards.",
	Menu = "Context Menu key.",
	Power = "Power key. Only present on some keyboards.",
	Euro = "Euro (\226\130\172) key. Only present on some keyboards.",
	Undo = "Undo key. Only present on some keyboards.",
	MouseLeftButton = "Primary mouse button.",
	MouseRightButton = "Secondary mouse button.",
	MouseMiddleButton = "Middle mouse button / scroll wheel click.",
	MousePosition = "Viewport pointer position for the Input Action System.",
	MouseWheel = "Scroll wheel input.",
	MouseDelta = "Pointer movement delta.",
	TouchPosition = "Touch position in the viewport for the Input Action System.",
	TrackpadPan = "Trackpad pan gesture.",
	TrackpadPinch = "Trackpad pinch gesture.",
	MouseBackButton = "Deprecated legacy mouse enum.",
	MouseNoButton = "Deprecated legacy mouse enum.",
	MouseX = "Deprecated legacy mouse enum.",
	MouseY = "Deprecated legacy mouse enum.",
	Thumbstick1Up = "Left stick pushed up.",
	Thumbstick1Down = "Left stick pushed down.",
	Thumbstick1Left = "Left stick pushed left.",
	Thumbstick1Right = "Left stick pushed right.",
	Thumbstick2Up = "Right stick pushed up.",
	Thumbstick2Down = "Right stick pushed down.",
	Thumbstick2Left = "Right stick pushed left.",
	Thumbstick2Right = "Right stick pushed right."
}
local t_2 = {
	Letters = "Single letter key on a QWERTY layout.",
	Numbers = "Top-row digit key on a QWERTY layout.",
	Keypad = "Key on the numeric keypad cluster.",
	["Function keys"] = "Function key row (F1\226\128\147F15).",
	Arrows = "Arrow key.",
	Navigation = "Navigation/editing key.",
	Modifiers = "Modifier key (Shift, Ctrl, Alt, Caps Lock).",
	Punctuation = "Punctuation key on the main keyboard.",
	Gamepad = "Gamepad button, stick, or D-pad input.",
	["Mouse and touch"] = "Pointer, scroll, or touch input rather than a keyboard key.",
	Other = "Misc keyboard/input enum without a dedicated category.",
	Deprecated = "Deprecated legacy enum value."
}

return {
	getKeyCodeNote = function(p1)
		-- upvalues: keyCodeCategoriesModule (ref), t_1 (ref), t (ref), t_2 (ref)
		local keyCodeName = keyCodeCategoriesModule.getKeyCodeName(p1)
		
		if t_1[keyCodeName] then
			return t_1[keyCodeName]
		elseif keyCodeName:match("^World%d+$") then
			return "Deprecated legacy SDL2 placeholder (World0\226\128\147World95). Not reliably emitted by modern input."
		elseif t[keyCodeName] then
			return "Shifted symbol KeyCode. Prefer detecting the base key plus Shift; rarely emitted on its own."
		end
		local category = keyCodeCategoriesModule.getCategory(p1)
		
		return if category == "Other" or category == "Deprecated" then t_2[category] else nil
	end
}