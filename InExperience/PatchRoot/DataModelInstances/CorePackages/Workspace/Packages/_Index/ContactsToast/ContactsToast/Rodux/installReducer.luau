local contactsToast = script:FindFirstAncestor("ContactsToast")
local roduxModule = require(contactsToast.Parent.Rodux)
local configuredUsersModule = require(script.Parent.configuredUsers)
local configuredRoduxNetworkingModule = require(contactsToast.Networking.configuredRoduxNetworking)

return function() --[[ line: 12 ]]
	-- upvalues: roduxModule (ref), configuredUsersModule (ref), configuredRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		Users = configuredUsersModule(),
		NetworkStatus = configuredRoduxNetworkingModule.installReducer()
	})
end