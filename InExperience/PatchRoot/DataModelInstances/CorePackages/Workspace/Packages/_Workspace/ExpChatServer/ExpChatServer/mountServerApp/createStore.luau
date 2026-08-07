local roduxModule = require(script:FindFirstAncestor("ExpChatServer").Parent.Rodux)
local installReducerModule = require(script.Parent.installReducer)

return function() --[[ line: 6 | named "createStore" ]]
	-- upvalues: roduxModule (ref), installReducerModule (ref)
	return roduxModule.Store.new(installReducerModule, nil, { roduxModule.thunkMiddleware })
end