local RegisterCustomFormsModule = require(script.Sdui.registerCustomForms)

return {
	["jest.config"] = script["jest.config"],
	SduiCustomFormsRegister = require(script.Sdui.SduiCustomFormsRegister),
	registerCustomFormActions = RegisterCustomFormsModule.registerCustomFormActions,
	registerCustomFormComponents = RegisterCustomFormsModule.registerCustomFormComponents,
	getSduiCustomFormVerticalRegistry = require(script.Sdui.getSduiCustomFormVerticalRegistry)
}