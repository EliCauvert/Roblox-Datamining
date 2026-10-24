local _ = require(script.Enums.DeepLinkSource)
local _ = require(script.Enums.SettingsRoute)
local _ = require(script.LinkingProtocolTypes)

return {
	LinkingProtocol = require(script.LinkingProtocol),
	AdConsentAttributionAdapter = require(script.AdConsentAttributionAdapter),
	readCachedAdConsentRegion = require(script.readCachedAdConsentRegion),
	getFFlagEnableAdConsentAttribution = require(script.Flags.getFFlagEnableAdConsentAttribution),
	Enums = require(script.Enums),
	["jest.config"] = script["jest.config"]
}