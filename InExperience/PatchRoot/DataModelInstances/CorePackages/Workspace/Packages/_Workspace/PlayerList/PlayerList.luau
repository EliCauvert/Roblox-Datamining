local _ = require(script.Common.FocusNavHelper)
local fFlagPlayerListUseFocusNavHookModule = require(script.Flags.FFlagPlayerListUseFocusNavHook)

return {
	["jest.config"] = script["jest.config"],
	LeaderboardStoreInstanceManager = require(script.Common.LeaderboardStoreInstanceManager),
	LeaderboardStoreContext = require(script.Common.LeaderboardStoreContext),
	PlayerListVisibilityStore = require(script.Common.PlayerListVisibilityStore),
	PlayerRelationshipStore = require(script.Common.PlayerRelationshipStore),
	Flags = {
		FFlagAddNewPlayerListFocusNav = require(script.Flags.FFlagAddNewPlayerListFocusNav),
		FFlagAddNewPlayerListMobileFocusNav = require(script.Flags.FFlagAddNewPlayerListMobileFocusNav),
		FFlagRemoveNewPlayerListOverlay = require(script.Flags.FFlagRemoveNewPlayerListOverlay),
		FFlagEnableMobilePlayerListOnConsole = require(script.Flags.FFlagEnableMobilePlayerListOnConsole),
		FFlagPlayerListUseMobileOnSmallDisplay = require(script.Flags.FFlagPlayerListUseMobileOnSmallDisplay),
		FFlagPlayerListIgnoreDevGamepadBindings = require(script.Flags.FFlagPlayerListIgnoreDevGamepadBindings),
		FFlagPlayerListUseFocusNavHook = fFlagPlayerListUseFocusNavHookModule,
		FFlagPlayerListDropDownShowPlatformName = require(script.Flags.FFlagPlayerListDropDownShowPlatformName),
		FFlagPlayerListFoundationSubscriptionIcon = require(script.Flags.FFlagPlayerListFoundationSubscriptionIcon),
		FFlagPlayerListReskin = require(script.Flags.FFlagPlayerListReskin),
		FFlagPlayerListReskinConsoleFocusNav = require(script.Flags.FFlagPlayerListReskinConsoleFocusNav),
		FFlagPlayerListReskinConsoleMobileRouting = require(script.Flags.FFlagPlayerListReskinConsoleMobileRouting),
		FFlagPlayerListReskinStickySelfRow = require(script.Flags.FFlagPlayerListReskinStickySelfRow),
		FFlagPlayerListReskinMobileLayoutFix = require(script.Flags.FFlagPlayerListReskinMobileLayoutFix),
		FFlagPlayerListReskinOptimization = require(script.Flags.FFlagPlayerListReskinOptimization),
		FFlagPlayerListTwoTabs = require(script.Flags.FFlagPlayerListTwoTabs),
		FFlagPlayerListTwoTabsOnLegacy = require(script.Flags.FFlagPlayerListTwoTabsOnLegacy),
		FFlagPlayerListReskinPreferredTransparency = require(script.Flags.FFlagPlayerListReskinPreferredTransparency),
		FFlagPlayerListLocalizeGameText = require(script.Flags.FFlagPlayerListLocalizeGameText),
		FFlagEnablePlayerListExposureEvents = require(script.Flags.FFlagEnablePlayerListExposureEvents),
		FStringPlayerListIXPLayer = require(script.Flags.FStringPlayerListIXPLayer),
		FFlagPlayerListContextMenuTelemetry = require(script.Flags.FFlagPlayerListContextMenuTelemetry)
	},
	Hooks = {
		useLeaderboardStore = require(script.Hooks.useLeaderboardStore),
		useLegacyVisibilityMirror = require(script.Hooks.useLegacyVisibilityMirror),
		usePlayerListFocusNavigation = if fFlagPlayerListUseFocusNavHookModule then require(script.Hooks.usePlayerListFocusNavigation) else nil,
		usePlatformLeaderboard = require(script.Hooks.usePlatformLeaderboard)
	},
	Common = {
		LayoutValuesContext = require(script.Common.LayoutValuesContext),
		CreateLayoutValues = require(script.Common.CreateLayoutValues),
		useLayoutValues = require(script.Common.useLayoutValues),
		useSignalMapState = require(script.Common.useSignalMapState),
		FormatStatString = require(script.Common.FormatStatString),
		Constants = require(script.Common.Constants),
		PlayerListVisibilityStore = require(script.Common.PlayerListVisibilityStore),
		computeStatColumns = require(script.Common.computeStatColumns),
		PlatformLeaderboardStoreContext = require(script.Common.PlatformLeaderboardStoreContext),
		GameTextTranslatorContext = require(script.Common.GameTextTranslatorContext)
	},
	Container = {
		PlayerListContainer = require(script.Components.Containers.PlayerListContainer),
		PlatformLeaderboardContainer = require(script.Components.Containers.PlatformLeaderboardContainer)
	},
	PlayerContextualMenuStore = require(script.Common.PlayerContextualMenuStore),
	PlayerListContextMenuTelemetryAction = require(script.Common.PlayerListContextMenuTelemetryAction),
	builderIcon = require(script.Common.builderIcon),
	resolveDisplayName = require(script.Common.resolveDisplayName),
	getHeadshotThumbnail = require(script.Common.getHeadshotThumbnail),
	Presentation = {
		EntryFrameView = require(script.Components.Presentation.EntryFrameView),
		StatEntryView = require(script.Components.Presentation.StatEntryView),
		PlayerListPanel = require(script.Components.Presentation.PlayerListPanel),
		PlayerContextualMenuView = require(script.Components.Presentation.PlayerContextualMenuView),
		LeaderboardScrim = require(script.Components.Presentation.LeaderboardScrim),
		LeaderboardTabs = require(script.Components.Presentation.LeaderboardTabs),
		LeaderboardTabsBody = require(script.Components.Presentation.LeaderboardTabsBody),
		LegacyTwoTabsBody = require(script.Components.Presentation.LegacyTwoTabsBody),
		EmptyAndErrorStates = require(script.Components.Presentation.EmptyAndErrorStates),
		PlatformLeaderboardView = require(script.Components.Presentation.PlatformLeaderboardView),
		PlatformEntryView = require(script.Components.Presentation.PlatformEntryView),
		TabbedLeaderboardBody = require(script.Components.Presentation.TabbedLeaderboardBody)
	}
}