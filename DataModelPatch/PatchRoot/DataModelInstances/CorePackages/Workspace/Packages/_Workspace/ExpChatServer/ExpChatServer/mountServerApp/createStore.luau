local RoduxModule = require(script:FindFirstAncestor("ExpChatServer").Parent.Rodux)
local InstallReducerModule = require(script.Parent.installReducer)

return function()
	-- upvalues: RoduxModule (copy), InstallReducerModule (copy)
	return RoduxModule.Store.new(InstallReducerModule, nil, { RoduxModule.thunkMiddleware })
end