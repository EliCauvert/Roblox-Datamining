local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local InputDialogViewModule = require(script.Parent.InputDialogView)
local UseInputDialogViewModelModule = require(script.Parent.useInputDialogViewModel)

return function(p1) --[[ Line: 10 | Named "InputDialogContainer" ]]
	-- upvalues: UseInputDialogViewModelModule (copy), ReactModule (copy), InputDialogViewModule (copy)
	return ReactModule.createElement(InputDialogViewModule, (UseInputDialogViewModelModule(p1)))
end