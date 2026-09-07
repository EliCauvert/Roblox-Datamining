local parent = script:FindFirstAncestor("ExpChat").Parent
local roduxModule = require(parent.Rodux)
local raiseActionAsEventMiddleware = require(parent.ExpChatShared).RaiseActionAsEventMiddleware
local installReducerModule = require(script.Parent.installReducer)

return function(p1)
	-- upvalues: roduxModule (ref), installReducerModule (ref), raiseActionAsEventMiddleware (ref)
	return roduxModule.Store.new(installReducerModule, p1, {
		roduxModule.thunkMiddleware,
		raiseActionAsEventMiddleware
	})
end