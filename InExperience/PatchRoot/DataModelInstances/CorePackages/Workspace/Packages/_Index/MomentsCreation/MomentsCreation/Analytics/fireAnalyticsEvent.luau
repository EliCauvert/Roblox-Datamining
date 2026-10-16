local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local HostAnalyticsListenerModule = require(MomentsCreation.Analytics.hostAnalyticsListener)
local FireAnalyticsEventFunction = require(MomentsCreation.Parent.MomentsCommon).Analytics.fireAnalyticsEvent

return function(p1, p2) --[[ Line: 25 ]]
	-- upvalues: FireAnalyticsEventFunction (copy), HostAnalyticsListenerModule (copy)
	FireAnalyticsEventFunction(p1, p2)
	local GetResult: (any, any) -> () = HostAnalyticsListenerModule.get()
	
	if GetResult ~= nil then
		GetResult(p1, p2)
	end
end