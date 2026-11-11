local AuthenticationStatus = script:FindFirstAncestor("AuthenticationStatus")
local ActionHandlers = require(AuthenticationStatus.Parent.SignalsMiddleware).ActionHandlers
local SetAuthenticationStatusModule = require(AuthenticationStatus.Actions.SetAuthenticationStatus)
local GetAuthenticationStatusStoreModule = require(AuthenticationStatus.Stores.GetAuthenticationStatusStore)

local function handleSetAuthenticationStatus(p1): boolean
	-- upvalues: GetAuthenticationStatusStoreModule (copy)
	GetAuthenticationStatusStoreModule(false).setAuthenticationStatus(p1.status)
	
	return false
end

return function(p1)
	-- upvalues: ActionHandlers (copy), SetAuthenticationStatusModule (copy), handleSetAuthenticationStatus (copy)
	ActionHandlers.register(p1, SetAuthenticationStatusModule.name, handleSetAuthenticationStatus)
end