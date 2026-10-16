local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local ReactModule = require(Parent.React)
local RoactServicesContext = require(Parent.RoactServices).RoactServicesContext

return function(p1) --[[ Line: 23 | Named "useRoactService" ]]
	-- upvalues: ReactModule (copy), RoactServicesContext (copy)
	return (p1.get((ReactModule.useContext(RoactServicesContext))))
end