local rodux = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Rodux
local parent = script.Parent
local globalConfigModule = require(parent.GlobalConfig)
local reducerModule = require(parent.reducer)

return function()
	-- upvalues: rodux (ref), globalConfigModule (ref), reducerModule (ref)
	local list = { rodux.thunkMiddleware }
	
	if globalConfigModule.logStore then
		table.insert(list, rodux.loggerMiddleware)
	end
	return rodux.Store.new(reducerModule, nil, list)
end