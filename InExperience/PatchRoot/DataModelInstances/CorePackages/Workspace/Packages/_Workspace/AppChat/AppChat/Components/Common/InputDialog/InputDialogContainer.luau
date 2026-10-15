local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local inputDialogViewModule = require(script.Parent.InputDialogView)
local useInputDialogViewModelModule = require(script.Parent.useInputDialogViewModel)

return function(p1)
	-- upvalues: useInputDialogViewModelModule (ref), reactModule (ref), inputDialogViewModule (ref)
	return reactModule.createElement(inputDialogViewModule, useInputDialogViewModelModule(p1))
end