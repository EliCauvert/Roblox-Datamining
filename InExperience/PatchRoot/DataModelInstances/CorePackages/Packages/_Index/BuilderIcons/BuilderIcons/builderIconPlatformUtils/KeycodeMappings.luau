local platformModule = require(script.Parent.Platform)
local iconModule = require(script.Parent.Parent.Icon)

local function _(p0, p1)
	for i, v in p1 do
		p0[i] = v
	end
	return p0
end

local t = {
	ButtonA = iconModule.PsX,
	ButtonB = iconModule.PsCircle,
	ButtonX = iconModule.PsSquare,
	ButtonY = iconModule.PsTriagle,
	ButtonL1 = iconModule.PsL1,
	ButtonL2 = iconModule.PsL2,
	ButtonL3 = iconModule.PsL3,
	ButtonR1 = iconModule.PsR1,
	ButtonR2 = iconModule.PsR2,
	ButtonR3 = iconModule.PsR3,
	Thumbstick1 = iconModule.PsStickLeft,
	Thumbstick2 = iconModule.PsStickRight,
	DPadDown = iconModule.PsDpadDown,
	DPadUp = iconModule.PsDpadUp,
	DPadLeft = iconModule.PsDpadLeft,
	DPadRight = iconModule.PsDpadRight
}
local t_1 = {}
local pS4 = platformModule.PS4

for i, v in {
	ButtonStart = iconModule.Ps4Options,
	ButtonSelect = iconModule.Ps4Share
} do
	t[i] = v
end
t_1[pS4] = t
local pS5 = platformModule.PS5

for i_1, v_1 in {
	ButtonStart = iconModule.Ps5Options,
	ButtonSelect = iconModule.Ps5Share
} do
	t[i_1] = v_1
end
t_1[pS5] = t
t_1[platformModule.Xbox] = {
	ButtonA = iconModule.XboxA,
	ButtonB = iconModule.XboxB,
	ButtonX = iconModule.XboxX,
	ButtonY = iconModule.XboxY,
	ButtonL1 = iconModule.XboxLb,
	ButtonL2 = iconModule.XboxLt,
	ButtonL3 = iconModule.XboxStickLeft,
	ButtonR1 = iconModule.XboxRb,
	ButtonR2 = iconModule.XboxRt,
	ButtonR3 = iconModule.XboxStickRight,
	ButtonStart = iconModule.XboxMenu,
	ButtonSelect = iconModule.XboxView,
	Thumbstick1 = iconModule.XboxStickLeftDirectional,
	Thumbstick2 = iconModule.XboxStickRightDirectional,
	DPadDown = iconModule.XboxDpadDown,
	DPadUp = iconModule.XboxDpadUp,
	DPadLeft = iconModule.XboxDpadLeft,
	DPadRight = iconModule.XboxDpadRight
}
t_1[platformModule.Default] = {
	LeftAlt = iconModule.KeyAlt,
	RightAlt = iconModule.KeyAlt,
	Down = iconModule.KeyArrowDown,
	Up = iconModule.KeyArrowUp,
	Left = iconModule.KeyArrowLeft,
	Right = iconModule.KeyArrowRight,
	Asterisk = iconModule.KeyAsterisk,
	Backspace = iconModule.KeyBackspace,
	CapsLock = iconModule.KeyCapsLock,
	Caret = iconModule.KeyCaret,
	Comma = iconModule.KeyComma,
	LeftControl = iconModule.KeyControl,
	RightControl = iconModule.KeyControl,
	Backquote = iconModule.KeyGraveAccent,
	Period = iconModule.KeyPeriod,
	Return = iconModule.KeyReturn,
	LeftShift = iconModule.KeyShift,
	RightShift = iconModule.KeyShift,
	Space = iconModule.KeySpace,
	Tab = iconModule.KeyTab
}

return t_1