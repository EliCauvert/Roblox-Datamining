local universalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local parent = universalFeatureRestrictions.Parent
local _ = require(universalFeatureRestrictions.Common.AbuseVector)
local featureRestrictionDisplayDirectSignalModule = require(universalFeatureRestrictions.Signals.featureRestrictionDisplayDirectSignal)
local _ = require(parent.ModerationCommon.Types)

return function(p1, p2, p3)
	-- upvalues: featureRestrictionDisplayDirectSignalModule (ref)
	featureRestrictionDisplayDirectSignalModule:fire({ abuseVector = p1, moderationDetail = p2, options = p3 })
end