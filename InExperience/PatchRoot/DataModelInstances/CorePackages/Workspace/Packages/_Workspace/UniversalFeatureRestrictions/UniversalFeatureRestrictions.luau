return {
	showFeatureRestriction = require(script.Utils.showFeatureRestriction),
	showFeatureRestrictionDirect = require(script.Utils.showFeatureRestrictionDirect),
	AbuseVector = require(script.Common.AbuseVector),
	Signals = {
		featureRestrictionDisplaySignal = require(script.Signals.featureRestrictionDisplaySignal),
		featureRestrictionDisplayDirectSignal = require(script.Signals.featureRestrictionDisplayDirectSignal)
	},
	["jest.config"] = script["jest.config"]
}