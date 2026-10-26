local _ = require(script.Parent.CustomFormContainer)

return function()
	return {
		isEditable = true,
		submitLabel = "Submit",
		requiredErrorMessage = "Choose an option",
		submissionErrorMessage = "Could not submit",
		disabledMessage = "You cannot submit this form",
		layoutOrder = 1,
		testId = "custom-form",
		definition = {
			formId = "form_001",
			title = "Choose a session",
			sections = {
				{
					id = "section_01",
					header = "Your choices",
					fields = {
						{
							fieldId = "field_radio",
							fieldType = "Radio",
							label = "When?",
							options = {
								{ optionId = "option_am", label = "Morning" },
								{ optionId = "option_pm", label = "Afternoon" }
							}
						},
						{
							fieldId = "field_checkbox",
							fieldType = "Checkbox",
							label = "Which topics?",
							options = {
								{ optionId = "option_build", label = "Building" },
								{ optionId = "option_code", label = "Coding" }
							}
						}
					}
				}
			}
		}
	}
end