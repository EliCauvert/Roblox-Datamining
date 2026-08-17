local universalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local featureRestrictionDisplaySignalModule = require(universalFeatureRestrictions.Signals.featureRestrictionDisplaySignal)
local _ = require(universalFeatureRestrictions.Common.AbuseVector)

return function(p0, p1) --[[ line: 21 | named "showFeatureRestriction" ]]
	-- upvalues: featureRestrictionDisplaySignalModule (ref)
	featureRestrictionDisplaySignalModule:fire({ abuseVector = p0, options = p1 })
end