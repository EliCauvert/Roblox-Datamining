local universalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local featureRestrictionDisplaySignalModule = require(universalFeatureRestrictions.Signals.featureRestrictionDisplaySignal)
local _ = require(universalFeatureRestrictions.Common.AbuseVector)

return function(p1, p2)
	-- upvalues: featureRestrictionDisplaySignalModule (ref)
	featureRestrictionDisplaySignalModule:fire({ abuseVector = p1, options = p2 })
end