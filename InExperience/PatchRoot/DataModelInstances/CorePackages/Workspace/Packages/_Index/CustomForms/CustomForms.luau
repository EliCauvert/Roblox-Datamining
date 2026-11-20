local RegisterCustomFormsModule = require(script.Sdui.registerCustomForms)

return {
	["jest.config"] = script["jest.config"],
	registerCustomFormActions = RegisterCustomFormsModule.registerCustomFormActions,
	registerCustomFormComponents = RegisterCustomFormsModule.registerCustomFormComponents,
	getSduiCustomFormVerticalRegistry = require(script.Sdui.getSduiCustomFormVerticalRegistry)
}