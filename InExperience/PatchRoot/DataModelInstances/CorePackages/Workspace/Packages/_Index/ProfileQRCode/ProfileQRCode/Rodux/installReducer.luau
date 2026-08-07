local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local roduxModule = require(profileQRCode.Parent.Rodux)
local configuredUsersModule = require(script.Parent.configuredUsers)
local configuredRoduxNetworkingModule = require(profileQRCode.Networking.configuredRoduxNetworking)
local shareUrlReducerModule = require(script.Parent.ShareUrlReducer)

return function() --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), configuredUsersModule (ref), configuredRoduxNetworkingModule (ref), shareUrlReducerModule (ref)
	return roduxModule.combineReducers({
		Users = configuredUsersModule(),
		NetworkStatus = configuredRoduxNetworkingModule.installReducer(),
		ShareUrl = shareUrlReducerModule
	})
end