local roduxModule = require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux)
local raiseActionAsEventMiddlewareModule = require(script.Parent.RaiseActionAsEventMiddleware)
local reducersModule = require(script.Parent.Reducers)

return function(p1)
	-- upvalues: roduxModule (ref), reducersModule (ref), raiseActionAsEventMiddlewareModule (ref)
	return roduxModule.Store.new(roduxModule.combineReducers(reducersModule), p1, {
		roduxModule.thunkMiddleware,
		raiseActionAsEventMiddlewareModule
	})
end