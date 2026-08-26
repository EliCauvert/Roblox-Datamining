local authenticationStatus = script:FindFirstAncestor("AuthenticationStatus")
local parent = authenticationStatus.Parent
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local setAuthenticationStatusModule = require(authenticationStatus.Actions.SetAuthenticationStatus)
local cryoModule = require(parent.Cryo)

return function(p1, p2)
	-- upvalues: loginStatus (ref), setAuthenticationStatusModule (ref), cryoModule (ref)
	p1 = p1 or { status = loginStatus.UNKNOWN }
	
	if p2.type == setAuthenticationStatusModule.name then
		p1 = cryoModule.Dictionary.join(p1, { status = p2.status })
	end
	return p1
end