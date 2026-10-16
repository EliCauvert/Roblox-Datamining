local AuthenticationStatus = script:FindFirstAncestor("AuthenticationStatus")
local Parent = AuthenticationStatus.Parent
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local SetAuthenticationStatusModule = require(AuthenticationStatus.Actions.SetAuthenticationStatus)
local CryoModule = require(Parent.Cryo)

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: LoginStatus (copy), SetAuthenticationStatusModule (copy), CryoModule (copy)
	local P0 = p1 or { status = LoginStatus.UNKNOWN }
	
	if p2.type == SetAuthenticationStatusModule.name then
		P0 = CryoModule.Dictionary.join(P0, { status = p2.status })
	end
	return P0
end