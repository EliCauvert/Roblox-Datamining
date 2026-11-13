local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SettingsFieldBaseModule = require(script.Parent.SettingsFieldBase)

return function(Frame)
	-- upvalues: ReactModule (copy), SettingsFieldBaseModule (copy), FoundationModule (copy)
	return ReactModule.createElement(SettingsFieldBaseModule, {
		title = Frame.title,
		description = Frame.description,
		trailing = ReactModule.createElement(FoundationModule.Toggle, {
			label = "",
			isChecked = Frame.value,
			onActivated = Frame.onChange,
			size = FoundationModule.Enums.InputSize.Medium,
			testId = if Frame.testId then `{Frame.testId}--toggle` else nil
		}),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end