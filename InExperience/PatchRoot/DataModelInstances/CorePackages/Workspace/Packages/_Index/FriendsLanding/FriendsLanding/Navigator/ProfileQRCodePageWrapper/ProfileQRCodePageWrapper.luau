local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local React = DependenciesModule.React
local Llama = DependenciesModule.llama
local ProfileQRCode = DependenciesModule.ProfileQRCode
local Contexts = DependenciesModule.SocialLuaAnalytics.Analytics.Enums.Contexts
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FFlagProfileQRCodeGamepadBackFix = ProfileQRCode.FFlagProfileQRCodeGamepadBackFix

return function(p1)
	-- upvalues: FriendsLandingContextModule (copy), FFlagProfileQRCodeGamepadBackFix (copy), React (copy), Roact (copy), ProfileQRCode (copy), Llama (copy), Contexts (copy)
	local UseResult = if FFlagProfileQRCodeGamepadBackFix then React.useCallback(function()
		-- upvalues: p1 (copy)
		p1.navigation.goBack()
	end, { p1.navigation }) else nil
	
	return Roact.createElement(ProfileQRCode.ProfileQRCodeEntryPoint, Llama.Dictionary.join(p1, {
		onClose = if FFlagProfileQRCodeGamepadBackFix then UseResult else function()
			-- upvalues: p1 (copy)
			p1.navigation.goBack()
		end,
		source = Contexts.AddFriends,
		robloxEventReceiver = FriendsLandingContextModule.useContext().robloxEventReceiver
	}))
end