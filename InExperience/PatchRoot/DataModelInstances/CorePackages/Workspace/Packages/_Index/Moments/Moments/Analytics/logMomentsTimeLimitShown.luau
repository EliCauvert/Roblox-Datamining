local Analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames

return function(p1: number)
	-- upvalues: Analytics (copy), EventNames (copy)
	local MomentsOff: string = if p1 == 0 then "moments_off" else "time_up"
	Analytics.fireAnalyticsEvent(EventNames.MomentsTimeLimitShown, {
		limitState = MomentsOff,
		limitMinutes = tostring((math.floor(p1 / 60)))
	})
	Analytics.reportMomentsTimeLimitShown(MomentsOff)
end