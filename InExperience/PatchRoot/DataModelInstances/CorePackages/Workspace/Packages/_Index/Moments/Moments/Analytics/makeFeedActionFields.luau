local momentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return function(p0, p1, p2, p3)
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (ref), momentsCommonModule (ref)
	if not getFFlagMomentsAnalyticsSchemaIdentity() then
		return { momentId = p0 }
	elseif p1 == nil or p1 == "" then
		momentsCommonModule.Analytics.reportMomentSkip("feed_action", if p1 == nil then "nil" else "empty", { action = p3 })
		
		return nil
	end
	return { momentId = p0, feedItemId = p1, feedSessionId = p2 or "" }
end