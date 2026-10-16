local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local ProfileQRCode = DependenciesModule.ProfileQRCode
local Contexts = DependenciesModule.SocialLuaAnalytics.Analytics.Enums.Contexts
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: FriendsLandingContextModule (copy), Roact (copy), ProfileQRCode (copy), Llama (copy), Contexts (copy)
	return Roact.createElement(ProfileQRCode.ProfileQRCodeEntryPoint, Llama.Dictionary.join(p1, {
		onClose = function() --[[ Line: 16 ]]
			-- upvalues: p1 (copy)
			p1.navigation.goBack()
		end,
		source = Contexts.AddFriends,
		robloxEventReceiver = FriendsLandingContextModule.useContext().robloxEventReceiver
	}))
end