local InputTypesEnumModule = {
	InputType = {
		KEYBOARD = "KEYBOARD",
		GAMEPAD = "GAMEPAD",
		TOUCH = "TOUCH",
		SPATIAL_GAMEPAD = "SPATIAL_GAMEPAD"
	}
}
table.freeze(InputTypesEnumModule.InputType)
table.freeze(InputTypesEnumModule)

return InputTypesEnumModule