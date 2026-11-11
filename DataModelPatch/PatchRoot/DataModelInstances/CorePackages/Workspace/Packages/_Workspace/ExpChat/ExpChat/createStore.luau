local Parent = script:FindFirstAncestor("ExpChat").Parent
local RoduxModule = require(Parent.Rodux)
local RaiseActionAsEventMiddleware = require(Parent.ExpChatShared).RaiseActionAsEventMiddleware
local InstallReducerModule = require(script.Parent.installReducer)

return function(p1)
	-- upvalues: RoduxModule (copy), InstallReducerModule (copy), RaiseActionAsEventMiddleware (copy)
	return RoduxModule.Store.new(InstallReducerModule, p1, {
		RoduxModule.thunkMiddleware,
		RaiseActionAsEventMiddleware
	})
end