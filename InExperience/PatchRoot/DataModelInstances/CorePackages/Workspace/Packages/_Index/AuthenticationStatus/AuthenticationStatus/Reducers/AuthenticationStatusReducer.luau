local authenticationStatus = script:FindFirstAncestor("AuthenticationStatus")
local parent = authenticationStatus.Parent
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local setAuthenticationStatusModule = require(authenticationStatus.Actions.SetAuthenticationStatus)
local cryoModule = require(parent.Cryo)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: loginStatus (ref), setAuthenticationStatusModule (ref), cryoModule (ref)
	p0 = p0 or { status = loginStatus.UNKNOWN }
	
	if p1.type == setAuthenticationStatusModule.name then
		p0 = cryoModule.Dictionary.join(p0, { status = p1.status })
	end
	return p0
end