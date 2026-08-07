return {
	DiscoverabilityOverlay = require(script.Components.DiscoverabilityOverlay),
	DiscoverabilityWithAudit = require(script.Components.DiscoverabilityWithAudit),
	FetchUserSettingsMetadata = require(script.Networking.FetchUserSettingsMetadata),
	installReducer = require(script.installReducer),
	dependencies = require(script.dependencies),
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	Analytics = require(script.Analytics),
	Flags = require(script.Flags),
	["jest.config"] = script["jest.config"]
}