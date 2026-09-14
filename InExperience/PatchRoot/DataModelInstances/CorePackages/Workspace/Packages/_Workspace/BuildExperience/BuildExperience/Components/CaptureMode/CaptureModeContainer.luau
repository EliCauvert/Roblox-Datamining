local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local captureModeViewModule = require(script.Parent.CaptureModeView)
local useCaptureModeViewModelModule = require(script.Parent.useCaptureModeViewModel)

return function(p1)
	-- upvalues: useCaptureModeViewModelModule (ref), reactModule (ref), captureModeViewModule (ref)
	return reactModule.createElement(captureModeViewModule, useCaptureModeViewModelModule(p1.dependencies))
end