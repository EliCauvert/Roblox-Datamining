return {
	Enums = require(script.Common.Enums),
	Constants = require(script.Common.Constants),
	Flags = require(script.Flags),
	SideSheet = require(script.SideSheet),
	AccountUpsell = require(script.Components.AccountUpsell),
	RobuxWidget = require(script.Parent.RoactUtils).Components.createLazyComponent(function() --[[ Line: 61 ]]
		return require(script.RobuxWidget)
	end),
	toggleSideSheet = require(script.Utils.toggleSideSheet),
	getDidSideSheetOpenWithPeoplePage = function(p1) --[[ Line: 15 ]]
		return require(script.Utils.getDidSideSheetOpenWithPeoplePage)(p1)
	end,
	getHasRoomForPeoplePage = function() --[[ Line: 19 ]]
		return require(script.Utils.getHasRoomForPeoplePage)()
	end,
	getIsPeoplePageOpen = function(p1) --[[ Line: 23 ]]
		return require(script.Utils.getIsPeoplePageOpen)(p1)
	end,
	getSideSheetAnimationDuration = function() --[[ Line: 27 ]]
		return require(script.Utils.getSideSheetAnimationDuration)()
	end,
	getSideSheetDrawerWidth = function(p1) --[[ Line: 31 ]]
		return require(script.Utils.getSideSheetDrawerWidth)(p1)
	end,
	getSideSheetMenuPageHeight = function(p1, p2) --[[ Line: 35 ]]
		return require(script.Utils.getSideSheetMenuPageHeight)(p1, p2)
	end,
	getSideSheetMenuPageWidth = function(p1, p2, p3) --[[ Line: 39 ]]
		return require(script.Utils.getSideSheetMenuPageWidth)(p1, p2, p3)
	end,
	getSideSheetVisibility = require(script.Utils.getSideSheetVisibility),
	registerInGameMenuPeoplePageActions = require(script.Utils.registerInGameMenuPeoplePageActions),
	registerSideSheetIntegrations = require(script.Utils.registerSideSheetIntegrations),
	setupInGameMenuPeoplePageActions = function(p1) --[[ Line: 43 ]]
		require(script.Utils.setupInGameMenuPeoplePageActions)(p1)
	end,
	setupPeoplePageOpenTracking = function(p1) --[[ Line: 47 ]]
		require(script.Utils.setupPeoplePageOpenTracking)(p1)
	end,
	closePeoplePageWhenNoRoomBesideSideSheet = function(p1) --[[ Line: 51 ]]
		return require(script.Utils.closePeoplePageWhenNoRoomBesideSideSheet)(p1)
	end,
	setIsRespawnEnabled = require(script.Utils.setIsRespawnEnabled),
	["jest.config"] = script["jest.config"]
}