local Players = game:GetService("Players")
local MomentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)

return function(p1)
	-- upvalues: MomentsCommonModule (copy), Players (copy)
	MomentsCommonModule.Analytics.fireAnalyticsEvent(p1, {
		identifier = "moments_post_insights",
		userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
		timestamp = tostring(os.time())
	})
end