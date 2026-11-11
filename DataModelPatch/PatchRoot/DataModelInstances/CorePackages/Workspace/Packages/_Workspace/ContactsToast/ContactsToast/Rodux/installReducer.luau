local ContactsToast = script:FindFirstAncestor("ContactsToast")
local RoduxModule = require(ContactsToast.Parent.Rodux)
local ConfiguredUsersModule = require(script.Parent.configuredUsers)
local ConfiguredRoduxNetworkingModule = require(ContactsToast.Networking.configuredRoduxNetworking)

return function()
	-- upvalues: RoduxModule (copy), ConfiguredUsersModule (copy), ConfiguredRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({
		Users = ConfiguredUsersModule(),
		NetworkStatus = ConfiguredRoduxNetworkingModule.installReducer()
	})
end