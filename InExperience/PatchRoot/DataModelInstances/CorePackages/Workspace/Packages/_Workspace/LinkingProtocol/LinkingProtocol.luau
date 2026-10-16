local _ = require(script.Enums.SettingsRoute)

return {
	LinkingProtocol = require(script.LinkingProtocol),
	AdConsentAttributionAdapter = require(script.AdConsentAttributionAdapter),
	readCachedAdConsentRegion = require(script.readCachedAdConsentRegion),
	getFFlagEnableAdConsentAttribution = require(script.Flags.getFFlagEnableAdConsentAttribution),
	Enums = require(script.Enums),
	["jest.config"] = script["jest.config"]
}