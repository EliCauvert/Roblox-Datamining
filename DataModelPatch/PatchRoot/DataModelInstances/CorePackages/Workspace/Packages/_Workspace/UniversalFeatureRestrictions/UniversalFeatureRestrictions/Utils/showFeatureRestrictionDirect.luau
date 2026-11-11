local UniversalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local _ = require(UniversalFeatureRestrictions.Common.AbuseVector)
local FeatureRestrictionDisplayDirectSignalModule = require(UniversalFeatureRestrictions.Signals.featureRestrictionDisplayDirectSignal)
local _ = require(UniversalFeatureRestrictions.Parent.ModerationCommon.Types)

return function(AbuseVector, ModerationDetail, Options)
	-- upvalues: FeatureRestrictionDisplayDirectSignalModule (copy)
	FeatureRestrictionDisplayDirectSignalModule:fire({
		abuseVector = AbuseVector,
		moderationDetail = ModerationDetail,
		options = Options
	})
end