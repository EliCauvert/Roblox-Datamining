local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local makeMomentViewBeganFieldsModule = require(script.Parent.makeMomentViewBeganFields)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames

return function(p1, p2, p3)
	-- upvalues: analytics (ref), makeMomentViewBeganFieldsModule (ref), eventNames (ref)
	analytics.reportMomentsViewBegan(p2)
	local var1 = makeMomentViewBeganFieldsModule(p1, p2, p3)
	
	if var1 ~= nil then
		analytics.fireAnalyticsEvent(eventNames.MomentViewBegan, var1)
	end
end