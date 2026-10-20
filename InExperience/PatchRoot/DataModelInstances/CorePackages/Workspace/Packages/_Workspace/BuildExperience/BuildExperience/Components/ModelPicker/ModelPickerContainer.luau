local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local _ = require(script.Parent.ModelPickerTypes)
local ModelPickerViewModule = require(script.Parent.ModelPickerView)
local UseModelPickerViewModelModule = require(script.Parent.useModelPickerViewModel)

return function(p1)
	-- upvalues: UseModelPickerViewModelModule (copy), ReactModule (copy), ModelPickerViewModule (copy)
	return ReactModule.createElement(ModelPickerViewModule, (UseModelPickerViewModelModule(p1)))
end