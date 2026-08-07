local roduxModule = require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux)
local raiseActionAsEventMiddlewareModule = require(script.Parent.RaiseActionAsEventMiddleware)
local reducersModule = require(script.Parent.Reducers)

return function(p0) --[[ line: 7 | named "createStore" ]]
	-- upvalues: roduxModule (ref), reducersModule (ref), raiseActionAsEventMiddlewareModule (ref)
	return roduxModule.Store.new(roduxModule.combineReducers(reducersModule), p0, {
		roduxModule.thunkMiddleware,
		raiseActionAsEventMiddlewareModule
	})
end