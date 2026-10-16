local RoduxModule = require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux)
local RaiseActionAsEventMiddlewareModule = require(script.Parent.RaiseActionAsEventMiddleware)
local ReducersModule = require(script.Parent.Reducers)

return function(p1) --[[ Line: 7 | Named "createStore" ]]
	-- upvalues: RoduxModule (copy), ReducersModule (copy), RaiseActionAsEventMiddlewareModule (copy)
	return RoduxModule.Store.new(RoduxModule.combineReducers(ReducersModule), p1, {
		RoduxModule.thunkMiddleware,
		RaiseActionAsEventMiddlewareModule
	})
end