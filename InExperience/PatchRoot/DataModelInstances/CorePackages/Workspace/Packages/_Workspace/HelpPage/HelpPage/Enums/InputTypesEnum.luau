local t = {
	InputType = {
		KEYBOARD = "KEYBOARD",
		GAMEPAD = "GAMEPAD",
		TOUCH = "TOUCH",
		SPATIAL_GAMEPAD = "SPATIAL_GAMEPAD"
	}
}
table.freeze(t.InputType)
table.freeze(t)

return t