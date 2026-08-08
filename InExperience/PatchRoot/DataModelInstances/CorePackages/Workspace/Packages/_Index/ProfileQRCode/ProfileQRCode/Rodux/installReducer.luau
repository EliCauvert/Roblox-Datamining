local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local roduxModule = require(profileQRCode.Parent.Rodux)
local configuredUsersModule = require(script.Parent.configuredUsers)
local configuredRoduxNetworkingModule = require(profileQRCode.Networking.configuredRoduxNetworking)
local shareUrlReducerModule = require(script.Parent.ShareUrlReducer)
local fFlagProfileQrCodeDeprecateUserReduxModule = require(profileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)

return function() --[[ line: 16 ]]
	-- upvalues: roduxModule (ref), fFlagProfileQrCodeDeprecateUserReduxModule (ref), configuredUsersModule (ref), configuredRoduxNetworkingModule (ref), shareUrlReducerModule (ref)
	return roduxModule.combineReducers({
		Users = if fFlagProfileQrCodeDeprecateUserReduxModule then nil else configuredUsersModule(),
		NetworkStatus = configuredRoduxNetworkingModule.installReducer(),
		ShareUrl = shareUrlReducerModule
	})
end