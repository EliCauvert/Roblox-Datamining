return {
	Enums = require(script.Common.Enums),
	IDVApiProvider = require(script.Utils.IDVApiProvider),
	usePollIDVStatus = require(script.Hooks.usePollIDVStatus),
	GetFIntIDVPollDelay = require(script.Flags.GetFIntIDVPollDelay),
	GetFIntIDVMaxRetries = require(script.Flags.GetFIntIDVMaxRetries),
	QRDeepLinkDialog = require(script.Components.QRDeepLinkDialog),
	["jest.config"] = script["jest.config"]
}