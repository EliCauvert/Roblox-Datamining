local UniversalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local FeatureRestrictionDisplaySignalModule = require(UniversalFeatureRestrictions.Signals.featureRestrictionDisplaySignal)
local _ = require(UniversalFeatureRestrictions.Common.AbuseVector)

return function(AbuseVector, Options) --[[ Line: 22 | Named "showFeatureRestriction" ]]
	-- upvalues: FeatureRestrictionDisplaySignalModule (copy)
	FeatureRestrictionDisplaySignalModule:fire({ abuseVector = AbuseVector, options = Options })
end