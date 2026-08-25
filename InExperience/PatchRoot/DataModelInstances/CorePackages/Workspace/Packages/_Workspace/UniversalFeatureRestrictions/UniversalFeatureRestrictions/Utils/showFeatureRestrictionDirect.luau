local universalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local parent = universalFeatureRestrictions.Parent
local _ = require(universalFeatureRestrictions.Common.AbuseVector)
local featureRestrictionDisplayDirectSignalModule = require(universalFeatureRestrictions.Signals.featureRestrictionDisplayDirectSignal)
local _ = require(parent.ModerationCommon.Types)

return function(p0, p1, p2)
	-- upvalues: featureRestrictionDisplayDirectSignalModule (ref)
	featureRestrictionDisplayDirectSignalModule:fire({ abuseVector = p0, moderationDetail = p1, options = p2 })
end