local Foundation = script:FindFirstAncestor("Foundation")
local BuilderIconsModule = require(Foundation.Parent.BuilderIcons)
local InputPlatformModule = require(Foundation.Enums.InputPlatform)
local Tbl = {
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

local function _(Tbl, List)
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end

local IconKeysByPlatform = {}
local PS4 = InputPlatformModule.PS4
local Copy = table.clone(Tbl)

for i, value in {
	ButtonStart = "Ps4Options",
	ButtonSelect = "Ps4Share",
	ButtonBack = "Ps4Share"
} do
	Copy[i] = value
end
IconKeysByPlatform[PS4] = Copy
local PS5 = InputPlatformModule.PS5
local Copy1 = table.clone(Tbl)

for i1, value1 in {
	ButtonStart = "Ps5Options",
	ButtonSelect = "Ps5Share",
	ButtonBack = "Ps5Share"
} do
	Copy1[i1] = value1
end
IconKeysByPlatform[PS5] = Copy1
IconKeysByPlatform[InputPlatformModule.Xbox] = {
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
IconKeysByPlatform[InputPlatformModule.Default] = {
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

local _ = function(p1)
	-- upvalues: BuilderIconsModule (copy)
	local IconEntry = BuilderIconsModule.Icon[p1]
	
	return if typeof(IconEntry) == "string" and IconEntry ~= "" then IconEntry else nil
end

local t = {}

for i2, value2 in IconKeysByPlatform do
	local t1 = {}
	
	for i3, value3 in value2 do
		local IconEntry = BuilderIconsModule.Icon[value3]
		local IconEntry1 = if typeof(IconEntry) == "string" and IconEntry ~= "" then IconEntry else nil
		
		if IconEntry1 then
			t1[i3] = IconEntry1
		end
	end
	t[i2] = t1
end
local _ = function(Default)
	-- upvalues: InputPlatformModule (copy)
	return if Default == InputPlatformModule.Default then InputPlatformModule.Xbox else InputPlatformModule.Default
end

return {
	getIconForKeyName = function(p1, Default)
		-- upvalues: t (copy), InputPlatformModule (copy)
		local Entry = t[Default][p1]
		
		return if Entry then Entry else t[if Default == InputPlatformModule.Default then InputPlatformModule.Xbox else InputPlatformModule.Default][p1]
	end,
	iconKeysByPlatform = IconKeysByPlatform
}