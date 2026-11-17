local Parent = script.Parent
local _ = require(Parent.Chrome)
local _ = require(Parent.Signals)
local FlagsModule = require(script.Flags)

return {
	Enums = require(script.Common.Enums),
	Constants = require(script.Common.Constants),
	Analytics = require(script.Analytics.AnalyticsConstants),
	Flags = FlagsModule,
	SideSheet = require(script.SideSheet),
	AccountUpsell = require(script.Components.AccountUpsell),
	RobuxWidget = require(Parent.RoactUtils).Components.createLazyComponent(function()
		return require(script.RobuxWidget)
	end),
	toggleSideSheet = require(script.Utils.toggleSideSheet),
	getDidSideSheetOpenWithPeoplePage = function(p1)
		return require(script.Utils.getDidSideSheetOpenWithPeoplePage)(p1)
	end,
	setDidSideSheetOpenWithPeoplePage = function(p1)
		require(script.Stores.GetSideSheetConfigStore)(false).setDidSideSheetOpenWithPeoplePage(p1)
	end,
	getHasRoomForPeoplePage = function(p1, p2)
		-- upvalues: FlagsModule (copy)
		return if FlagsModule.FFlagKeepSideSheetOpenBesideMenu then require(script.Utils.getHasRoomForPeoplePage)(p1, p2) else require(script.Utils.getHasRoomForPeoplePage)()
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
	setupInGameMenuPeoplePageActions = function(p1)
		require(script.Utils.setupInGameMenuPeoplePageActions)(p1)
	end,
	setupPeoplePageOpenTracking = function(p1)
		require(script.Utils.setupPeoplePageOpenTracking)(p1)
	end,
	closePeoplePageWhenNoRoomBesideSideSheet = function(p1)
		return require(script.Utils.closePeoplePageWhenNoRoomBesideSideSheet)(p1)
	end,
	doesMenuPageCloseSideSheet = function(p1)
		return require(script.Utils.doesMenuPageCloseSideSheet)(p1)
	end,
	doesMenuStayOpenAloneOnSideSheetRelease = function(p1, p2, p3)
		return require(script.Utils.sideSheetBesideMenuPolicy).doesMenuStayOpenAloneOnSideSheetRelease(p1, p2, p3)
	end,
	getAreaBesideSideSheet = function(p1, p2)
		return require(script.Utils.sideSheetBesideMenuPolicy).getAreaBesideSideSheet(p1, p2)
	end,
	getBesideSideSheetWindowArea = function()
		return require(script.Utils.sideSheetBesideMenuPolicy).getBesideSideSheetWindowArea()
	end,
	getClaimedWindowAreaBesideSideSheet = function(p1)
		return require(script.Utils.getClaimedWindowAreaBesideSideSheet)(p1)
	end,
	getWindowPositionBesideSideSheet = function(p1, p2, p3, p4)
		return require(script.Utils.sideSheetBesideMenuPolicy).getWindowPositionBesideSideSheet(p1, p2, p3, p4)
	end,
	getWindowShownBesideSideSheet = function(p1)
		return require(script.Stores.GetSideSheetConfigStore)(false).getWindowShownBesideSideSheet(p1)
	end,
	isWindowBesideSideSheet = function(p1)
		return require(script.Utils.sideSheetBesideMenuPolicy).isWindowBesideSideSheet(p1)
	end,
	getIsMenuShownBesideSideSheet = function(p1)
		return require(script.Stores.GetSideSheetConfigStore)(p1).getIsMenuShownBesideSideSheet(p1)
	end,
	setIsMenuShownBesideSideSheet = function(p1)
		require(script.Stores.GetSideSheetConfigStore)(false).setIsMenuShownBesideSideSheet(p1)
	end,
	setWindowShownBesideSideSheet = function(p1)
		require(script.Stores.GetSideSheetConfigStore)(false).setWindowShownBesideSideSheet(p1)
	end,
	setupMenuBesideSideSheet = function(p1)
		require(script.Utils.setupMenuBesideSideSheet)(p1)
	end,
	setIsRespawnEnabled = require(script.Utils.setIsRespawnEnabled),
	logSidesheetClosed = function(p1)
		require(script.Analytics.SidesheetAnalytics).logSidesheetClosed(p1)
	end,
	["jest.config"] = script["jest.config"]
}