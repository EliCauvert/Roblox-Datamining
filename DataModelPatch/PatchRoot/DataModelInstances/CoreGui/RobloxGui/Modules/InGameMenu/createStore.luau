local Rodux = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Rodux
local Parent = script.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local ReducerModule = require(Parent.reducer)

return function()
	-- upvalues: Rodux (copy), GlobalConfigModule (copy), ReducerModule (copy)
	local List = { Rodux.thunkMiddleware }
	
	if GlobalConfigModule.logStore then
		table.insert(List, Rodux.loggerMiddleware)
	end
	return Rodux.Store.new(ReducerModule, nil, List)
end