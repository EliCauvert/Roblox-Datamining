local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local makeMomentViewBeganFieldsModule = require(script.Parent.makeMomentViewBeganFields)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability

return function(p1, p2)
	-- upvalues: fFlagMomentsRealtimeObservability (ref), analytics (ref), makeMomentViewBeganFieldsModule (ref), eventNames (ref)
	if fFlagMomentsRealtimeObservability then
		analytics.reportMomentsViewBegan(p2)
	end
	local var1 = makeMomentViewBeganFieldsModule(p1, p2)
	
	if var1 ~= nil then
		analytics.fireAnalyticsEvent(eventNames.MomentViewBegan, var1)
	end
end