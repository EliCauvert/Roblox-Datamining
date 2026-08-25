local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local makeMomentViewBeganFieldsModule = require(script.Parent.makeMomentViewBeganFields)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability

return function(p0, p1)
	-- upvalues: fFlagMomentsRealtimeObservability (ref), analytics (ref), makeMomentViewBeganFieldsModule (ref), eventNames (ref)
	if fFlagMomentsRealtimeObservability then
		analytics.reportMomentsViewBegan(p1)
	end
	local var2 = makeMomentViewBeganFieldsModule(p0, p1)
	
	if var2 ~= nil then
		analytics.fireAnalyticsEvent(eventNames.MomentViewBegan, var2)
	end
end