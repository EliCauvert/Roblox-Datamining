local PlatformModule = require(script.Parent.Platform)
local IconModule = require(script.Parent.Parent.Icon)

local function _(p1, List)
	for i, value in List do
		p1[i] = value
	end
	return p1
end

local config = {
	ButtonA = IconModule.PsX,
	ButtonB = IconModule.PsCircle,
	ButtonX = IconModule.PsSquare,
	ButtonY = IconModule.PsTriagle,
	ButtonL1 = IconModule.PsL1,
	ButtonL2 = IconModule.PsL2,
	ButtonL3 = IconModule.PsL3,
	ButtonR1 = IconModule.PsR1,
	ButtonR2 = IconModule.PsR2,
	ButtonR3 = IconModule.PsR3,
	Thumbstick1 = IconModule.PsStickLeft,
	Thumbstick2 = IconModule.PsStickRight,
	DPadDown = IconModule.PsDpadDown,
	DPadUp = IconModule.PsDpadUp,
	DPadLeft = IconModule.PsDpadLeft,
	DPadRight = IconModule.PsDpadRight
}
local KeycodeMappingsModule = {}
local PS4 = PlatformModule.PS4

for i, value in {
	ButtonStart = IconModule.Ps4Options,
	ButtonSelect = IconModule.Ps4Share
} do
	config[i] = value
end
KeycodeMappingsModule[PS4] = config
local PS5 = PlatformModule.PS5

for i1, value1 in {
	ButtonStart = IconModule.Ps5Options,
	ButtonSelect = IconModule.Ps5Share
} do
	config[i1] = value1
end
KeycodeMappingsModule[PS5] = config
KeycodeMappingsModule[PlatformModule.Xbox] = {
	ButtonA = IconModule.XboxA,
	ButtonB = IconModule.XboxB,
	ButtonX = IconModule.XboxX,
	ButtonY = IconModule.XboxY,
	ButtonL1 = IconModule.XboxLb,
	ButtonL2 = IconModule.XboxLt,
	ButtonL3 = IconModule.XboxStickLeft,
	ButtonR1 = IconModule.XboxRb,
	ButtonR2 = IconModule.XboxRt,
	ButtonR3 = IconModule.XboxStickRight,
	ButtonStart = IconModule.XboxMenu,
	ButtonSelect = IconModule.XboxView,
	Thumbstick1 = IconModule.XboxStickLeftDirectional,
	Thumbstick2 = IconModule.XboxStickRightDirectional,
	DPadDown = IconModule.XboxDpadDown,
	DPadUp = IconModule.XboxDpadUp,
	DPadLeft = IconModule.XboxDpadLeft,
	DPadRight = IconModule.XboxDpadRight
}
KeycodeMappingsModule[PlatformModule.Default] = {
	LeftAlt = IconModule.KeyAlt,
	RightAlt = IconModule.KeyAlt,
	Down = IconModule.KeyArrowDown,
	Up = IconModule.KeyArrowUp,
	Left = IconModule.KeyArrowLeft,
	Right = IconModule.KeyArrowRight,
	Asterisk = IconModule.KeyAsterisk,
	Backspace = IconModule.KeyBackspace,
	CapsLock = IconModule.KeyCapsLock,
	Caret = IconModule.KeyCaret,
	Comma = IconModule.KeyComma,
	LeftControl = IconModule.KeyControl,
	RightControl = IconModule.KeyControl,
	Backquote = IconModule.KeyGraveAccent,
	Period = IconModule.KeyPeriod,
	Return = IconModule.KeyReturn,
	LeftShift = IconModule.KeyShift,
	RightShift = IconModule.KeyShift,
	Space = IconModule.KeySpace,
	Tab = IconModule.KeyTab
}

return KeycodeMappingsModule