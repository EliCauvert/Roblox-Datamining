local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local reactModule = require(parent.React)
local roactServicesContext = require(parent.RoactServices).RoactServicesContext

return function(p1)
	-- upvalues: reactModule (ref), roactServicesContext (ref)
	return p1.get(reactModule.useContext(roactServicesContext))
end