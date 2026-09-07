local momentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return function(p1, p2, p3, p4)
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (ref), momentsCommonModule (ref)
	if not getFFlagMomentsAnalyticsSchemaIdentity() then
		return { momentId = p1 }
	elseif p2 == nil or p2 == "" then
		momentsCommonModule.Analytics.reportMomentSkip("feed_action", if p2 == nil then "nil" else "empty", { action = p4 })
		
		return nil
	end
	return { momentId = p1, feedItemId = p2, feedSessionId = p3 or "" }
end