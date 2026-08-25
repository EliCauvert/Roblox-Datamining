local roduxModule = require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux)
local raiseActionAsEventMiddlewareModule = require(script.Parent.RaiseActionAsEventMiddleware)
local reducersModule = require(script.Parent.Reducers)

return function(p0)
	-- upvalues: roduxModule (ref), reducersModule (ref), raiseActionAsEventMiddlewareModule (ref)
	return roduxModule.Store.new(roduxModule.combineReducers(reducersModule), p0, {
		roduxModule.thunkMiddleware,
		raiseActionAsEventMiddlewareModule
	})
end