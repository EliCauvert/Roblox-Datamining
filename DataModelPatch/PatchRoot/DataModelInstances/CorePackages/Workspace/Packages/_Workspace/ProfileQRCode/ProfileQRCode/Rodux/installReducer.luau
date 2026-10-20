local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local RoduxModule = require(ProfileQRCode.Parent.Rodux)
local ConfiguredUsersModule = require(script.Parent.configuredUsers)
local ConfiguredRoduxNetworkingModule = require(ProfileQRCode.Networking.configuredRoduxNetworking)
local ShareUrlReducerModule = require(script.Parent.ShareUrlReducer)

return function()
	-- upvalues: RoduxModule (copy), ConfiguredUsersModule (copy), ConfiguredRoduxNetworkingModule (copy), ShareUrlReducerModule (copy)
	return RoduxModule.combineReducers({
		Users = ConfiguredUsersModule(),
		NetworkStatus = ConfiguredRoduxNetworkingModule.installReducer(),
		ShareUrl = ShareUrlReducerModule
	})
end