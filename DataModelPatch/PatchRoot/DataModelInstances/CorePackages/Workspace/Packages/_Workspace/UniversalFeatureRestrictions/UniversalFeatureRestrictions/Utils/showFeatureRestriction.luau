local UniversalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local FeatureRestrictionDisplaySignalModule = require(UniversalFeatureRestrictions.Signals.featureRestrictionDisplaySignal)
local _ = require(UniversalFeatureRestrictions.Common.AbuseVector)

return function(AbuseVector, Options)
	-- upvalues: FeatureRestrictionDisplaySignalModule (copy)
	FeatureRestrictionDisplaySignalModule:fire({ abuseVector = AbuseVector, options = Options })
end