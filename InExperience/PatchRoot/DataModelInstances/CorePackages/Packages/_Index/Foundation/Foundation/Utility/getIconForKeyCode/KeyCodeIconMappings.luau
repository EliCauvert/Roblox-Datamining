local foundation = script:FindFirstAncestor("Foundation")
local builderIconsModule = require(foundation.Parent.BuilderIcons)
local inputPlatformModule = require(foundation.Enums.InputPlatform)
local t = {
	ButtonA = "PsX",
	ButtonB = "PsCircle",
	ButtonX = "PsSquare",
	ButtonY = "PsTriagle",
	ButtonL1 = "PsL1",
	ButtonL2 = "PsL2",
	ButtonL3 = "PsL3",
	ButtonR1 = "PsR1",
	ButtonR2 = "PsR2",
	ButtonR3 = "PsR3",
	Thumbstick1 = "PsStickLeft",
	Thumbstick2 = "PsStickRight",
	DPadDown = "PsDpadDown",
	DPadUp = "PsDpadUp",
	DPadLeft = "PsDpadLeft",
	DPadRight = "PsDpadRight",
	ButtonDown = "PsDpadDown",
	ButtonUp = "PsDpadUp",
	ButtonLeft = "PsDpadLeft",
	ButtonRight = "PsDpadRight"
}

local function _(p1, p2)
	local cloned = table.clone(p1)
	
	for i, v in p2 do
		cloned[i] = v
	end
	return cloned
end

local t_1 = {}
local pS4 = inputPlatformModule.PS4
local cloned = table.clone(t)

for i, v in {
	ButtonStart = "Ps4Options",
	ButtonSelect = "Ps4Share",
	ButtonBack = "Ps4Share"
} do
	cloned[i] = v
end
t_1[pS4] = cloned
local pS5 = inputPlatformModule.PS5
local cloned_1 = table.clone(t)

for i_1, v_1 in {
	ButtonStart = "Ps5Options",
	ButtonSelect = "Ps5Share",
	ButtonBack = "Ps5Share"
} do
	cloned_1[i_1] = v_1
end
t_1[pS5] = cloned_1
t_1[inputPlatformModule.Xbox] = {
	ButtonA = "XboxA",
	ButtonB = "XboxB",
	ButtonX = "XboxX",
	ButtonY = "XboxY",
	ButtonL1 = "XboxLb",
	ButtonL2 = "XboxLt",
	ButtonL3 = "XboxStickLeft",
	ButtonR1 = "XboxRb",
	ButtonR2 = "XboxRt",
	ButtonR3 = "XboxStickRight",
	ButtonStart = "XboxMenu",
	ButtonSelect = "XboxView",
	ButtonBack = "XboxView",
	Thumbstick1 = "XboxStickLeftDirectional",
	Thumbstick2 = "XboxStickRightDirectional",
	DPadDown = "XboxDpadDown",
	DPadUp = "XboxDpadUp",
	DPadLeft = "XboxDpadLeft",
	DPadRight = "XboxDpadRight",
	ButtonDown = "XboxDpadDown",
	ButtonUp = "XboxDpadUp",
	ButtonLeft = "XboxDpadLeft",
	ButtonRight = "XboxDpadRight"
}
t_1[inputPlatformModule.Default] = {
	Backspace = "KeyBackspace",
	CapsLock = "KeyCapsLock",
	Escape = "SquareTextEsc",
	Return = "KeyReturn",
	KeypadEnter = "KeyReturn",
	Space = "KeySpace",
	Tab = "KeyTab",
	Down = "KeyArrowDown",
	Left = "KeyArrowLeft",
	Right = "KeyArrowRight",
	Up = "KeyArrowUp",
	LeftAlt = "KeyAlt",
	RightAlt = "KeyAlt",
	LeftControl = "KeyControl",
	RightControl = "KeyControl",
	LeftMeta = "KeyCommand",
	RightMeta = "KeyCommand",
	LeftSuper = "KeyCommand",
	RightSuper = "KeyCommand",
	LeftShift = "KeyShift",
	RightShift = "KeyShift",
	Asterisk = "KeyAsterisk",
	KeypadMultiply = "KeyAsterisk",
	Backquote = "KeyGraveAccent",
	Caret = "KeyCaret",
	Comma = "KeyComma",
	Period = "KeyPeriod",
	KeypadPeriod = "KeyPeriod",
	Quote = "KeyApostrophe",
	MouseLeftButton = "MouseButtonLeft",
	MouseMiddleButton = "MouseButtonCenter",
	MouseRightButton = "MouseButtonRight",
	MouseWheel = "MouseScrollwheel"
}

local _ = function(value)
	-- upvalues: builderIconsModule (ref)
	local var1 = builderIconsModule.Icon[value]
	
	return if typeof(var1) == "string" and var1 ~= "" then var1 else nil
end

local t_2 = {}

for i_2, v_2 in t_1 do
	local t_3 = {}
	
	for i_3, v_3 in v_2 do
		local var1 = builderIconsModule.Icon[v_3]
		local var2 = if typeof(var1) == "string" and var1 ~= "" then var1 else nil
		
		if var2 then
			t_3[i_3] = var2
		end
	end
	t_2[i_2] = t_3
end
local _ = function(p3)
	-- upvalues: inputPlatformModule (ref)
	return if p3 == inputPlatformModule.Default then inputPlatformModule.Xbox else inputPlatformModule.Default
end

return {
	getIconForKeyName = function(p3, p4)
		-- upvalues: t_2 (ref), inputPlatformModule (ref)
		local var3 = t_2[p4][p3]
		
		return var3 or t_2[if p4 == inputPlatformModule.Default then inputPlatformModule.Xbox else inputPlatformModule.Default][p3]
	end,
	iconKeysByPlatform = t_1
}