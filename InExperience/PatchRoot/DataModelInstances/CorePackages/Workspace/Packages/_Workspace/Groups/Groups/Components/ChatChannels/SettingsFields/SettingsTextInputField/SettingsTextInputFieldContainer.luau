local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local SettingsTextInputFieldViewModule = require(script.Parent.SettingsTextInputFieldView)
local UseSettingsTextInputFieldViewModelModule = require(script.Parent.useSettingsTextInputFieldViewModel)

return function(p1)
	-- upvalues: UseSettingsTextInputFieldViewModelModule (copy), ReactModule (copy), SettingsTextInputFieldViewModule (copy)
	return ReactModule.createElement(SettingsTextInputFieldViewModule, (UseSettingsTextInputFieldViewModelModule(p1)))
end