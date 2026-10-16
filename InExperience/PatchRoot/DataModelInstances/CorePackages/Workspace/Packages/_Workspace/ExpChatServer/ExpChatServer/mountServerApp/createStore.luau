local RoduxModule = require(script:FindFirstAncestor("ExpChatServer").Parent.Rodux)
local InstallReducerModule = require(script.Parent.installReducer)

return function() --[[ Line: 6 | Named "createStore" ]]
	-- upvalues: RoduxModule (copy), InstallReducerModule (copy)
	return RoduxModule.Store.new(InstallReducerModule, nil, { RoduxModule.thunkMiddleware })
end