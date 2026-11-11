local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local ConstantsModule = require(ProfileQRCode.Common.Constants)
local DashModule = require(ProfileQRCode.Parent.Dash)
local DefaultTestUserIdModule = require(script.Parent.DefaultTestUserId)
local FirstFriendRequesterUserIdModule = require(script.Parent.FirstFriendRequesterUserId)
local SecondFriendRequesterUserIdModule = require(script.Parent.SecondFriendRequesterUserId)

return function(p1)
	-- upvalues: DashModule (copy), ConstantsModule (copy), DefaultTestUserIdModule (copy), FirstFriendRequesterUserIdModule (copy), SecondFriendRequesterUserIdModule (copy)
	return DashModule.join({
		LocalUserId = "123",
		ScreenSize = Vector2.new(1000, 500),
		[ConstantsModule.RODUX_KEY] = {
			Users = {
				byUserId = {
					[DefaultTestUserIdModule] = { displayName = "bigMalc", username = "malcolmtucker" },
					[FirstFriendRequesterUserIdModule] = { displayName = "Apollo", username = "captapollo" },
					[SecondFriendRequesterUserIdModule] = { displayName = "Starbuck", username = "ltstarbuck" }
				}
			},
			NetworkStatus = {},
			ShareUrl = { shortUrl = "www.bbc.co.uk", linkId = "123456" }
		}
	}, p1)
end