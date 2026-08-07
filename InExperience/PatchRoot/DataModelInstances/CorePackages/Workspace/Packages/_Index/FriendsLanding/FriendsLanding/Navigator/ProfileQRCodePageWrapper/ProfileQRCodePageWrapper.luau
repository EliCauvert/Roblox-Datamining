local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local profileQRCode = dependenciesModule.ProfileQRCode
local contexts = dependenciesModule.SocialLuaAnalytics.Analytics.Enums.Contexts
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)

return function(p0) --[[ line: 10 ]]
	-- upvalues: friendsLandingContextModule (ref), roact (ref), profileQRCode (ref), llama (ref), contexts (ref)
	return roact.createElement(profileQRCode.ProfileQRCodeEntryPoint, llama.Dictionary.join(p0, {
		onClose = function() --[[ line: 16 ]]
			-- upvalues: p0 (ref)
			p0.navigation.goBack()
		end,
		source = contexts.AddFriends,
		robloxEventReceiver = friendsLandingContextModule.useContext().robloxEventReceiver
	}))
end