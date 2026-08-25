local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local reactModule = require(parent.React)
local roactServicesContext = require(parent.RoactServices).RoactServicesContext

return function(p0)
	-- upvalues: reactModule (ref), roactServicesContext (ref)
	return p0.get(reactModule.useContext(roactServicesContext))
end