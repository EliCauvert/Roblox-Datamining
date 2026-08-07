local authenticationStatus = script:FindFirstAncestor("AuthenticationStatus")
local actionHandlers = require(authenticationStatus.Parent.SignalsMiddleware).ActionHandlers
local setAuthenticationStatusModule = require(authenticationStatus.Actions.SetAuthenticationStatus)
local getAuthenticationStatusStoreModule = require(authenticationStatus.Stores.GetAuthenticationStatusStore)

local function handleSetAuthenticationStatus(value) --[[ line: 8 ]]
	-- upvalues: getAuthenticationStatusStoreModule (ref)
	getAuthenticationStatusStoreModule(false).setAuthenticationStatus(value.status)
	
	return true
end

return function(p0) --[[ line: 13 ]]
	-- upvalues: actionHandlers (ref), setAuthenticationStatusModule (ref), handleSetAuthenticationStatus (ref)
	actionHandlers.register(p0, setAuthenticationStatusModule.name, handleSetAuthenticationStatus)
end