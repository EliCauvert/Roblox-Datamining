local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local hostAnalyticsListenerModule = require(momentsCreation.Analytics.hostAnalyticsListener)
local fireAnalyticsEvent = require(momentsCreation.Parent.MomentsCommon).Analytics.fireAnalyticsEvent

return function(p1, p2)
	-- upvalues: fireAnalyticsEvent (ref), hostAnalyticsListenerModule (ref)
	fireAnalyticsEvent(p1, p2)
	local var1 = hostAnalyticsListenerModule.get()
	
	if var1 ~= nil then
		var1(p1, p2)
	end
end