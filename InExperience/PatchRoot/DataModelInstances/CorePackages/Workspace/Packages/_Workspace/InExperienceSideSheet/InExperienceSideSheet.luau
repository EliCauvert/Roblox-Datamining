return {
	Enums = require(script.Common.Enums),
	Constants = require(script.Common.Constants),
	SideSheet = require(script.SideSheet),
	AccountUpsell = require(script.Components.AccountUpsell),
	RobuxWidget = require(script.Parent.RoactUtils).Components.createLazyComponent(function()
		return require(script.RobuxWidget)
	end),
	toggleSideSheet = require(script.Utils.toggleSideSheet),
	getSideSheetVisibility = require(script.Utils.getSideSheetVisibility),
	registerSideSheetIntegrations = require(script.Utils.registerSideSheetIntegrations),
	setIsRespawnEnabled = require(script.Utils.setIsRespawnEnabled),
	["jest.config"] = script["jest.config"]
}