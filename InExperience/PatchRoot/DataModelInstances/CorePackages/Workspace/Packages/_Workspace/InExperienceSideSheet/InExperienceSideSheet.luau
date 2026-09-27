return {
	Enums = require(script.Common.Enums),
	Constants = require(script.Common.Constants),
	Flags = require(script.Flags),
	SideSheet = require(script.SideSheet),
	AccountUpsell = require(script.Components.AccountUpsell),
	RobuxWidget = require(script.Parent.RoactUtils).Components.createLazyComponent(function()
		return require(script.RobuxWidget)
	end),
	toggleSideSheet = require(script.Utils.toggleSideSheet),
	getDidSideSheetOpenWithPeoplePage = function(p1)
		return require(script.Utils.getDidSideSheetOpenWithPeoplePage)(p1)
	end,
	getHasRoomForPeoplePage = function()
		return require(script.Utils.getHasRoomForPeoplePage)()
	end,
	getIsPeoplePageOpen = function(p1)
		return require(script.Utils.getIsPeoplePageOpen)(p1)
	end,
	getSideSheetAnimationDuration = function()
		return require(script.Utils.getSideSheetAnimationDuration)()
	end,
	getSideSheetDrawerWidth = function(p1)
		return require(script.Utils.getSideSheetDrawerWidth)(p1)
	end,
	getSideSheetMenuPageHeight = function(p1, p2)
		return require(script.Utils.getSideSheetMenuPageHeight)(p1, p2)
	end,
	getSideSheetMenuPageWidth = function(p1, p2, p3)
		return require(script.Utils.getSideSheetMenuPageWidth)(p1, p2, p3)
	end,
	getSideSheetVisibility = require(script.Utils.getSideSheetVisibility),
	registerInGameMenuPeoplePageActions = require(script.Utils.registerInGameMenuPeoplePageActions),
	registerSideSheetIntegrations = require(script.Utils.registerSideSheetIntegrations),
	setupInGameMenuPeoplePageActions = function(value)
		require(script.Utils.setupInGameMenuPeoplePageActions)(value)
	end,
	setupPeoplePageOpenTracking = function(value)
		require(script.Utils.setupPeoplePageOpenTracking)(value)
	end,
	setIsRespawnEnabled = require(script.Utils.setIsRespawnEnabled),
	["jest.config"] = script["jest.config"]
}