local _ = require(script.Common.FocusNavHelper)
local fFlagPlayerListUseFocusNavHookModule = require(script.Flags.FFlagPlayerListUseFocusNavHook)

return {
	["jest.config"] = script["jest.config"],
	LeaderboardStoreInstanceManager = require(script.Common.LeaderboardStoreInstanceManager),
	LeaderboardStoreContext = require(script.Common.LeaderboardStoreContext),
	PlayerListVisibilityStore = require(script.Common.PlayerListVisibilityStore),
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
		FFlagPlayerListReskin = require(script.Flags.FFlagPlayerListReskin)
	},
	Hooks = {
		useLeaderboardStore = require(script.Hooks.useLeaderboardStore),
		usePlayerListFocusNavigation = if fFlagPlayerListUseFocusNavHookModule then require(script.Hooks.usePlayerListFocusNavigation) else nil
	},
	Common = {
		LayoutValuesContext = require(script.Common.LayoutValuesContext),
		CreateLayoutValues = require(script.Common.CreateLayoutValues),
		useLayoutValues = require(script.Common.useLayoutValues),
		useSignalMapState = require(script.Common.useSignalMapState),
		FormatStatString = require(script.Common.FormatStatString),
		Constants = require(script.Common.Constants),
		PlayerListVisibilityStore = require(script.Common.PlayerListVisibilityStore),
		computeStatColumns = require(script.Common.computeStatColumns)
	},
	Container = {
		PlayerListContainer = require(script.Components.Containers.PlayerListContainer)
	},
	PlayerContextualMenuStore = require(script.Common.PlayerContextualMenuStore),
	builderIcon = require(script.Common.builderIcon),
	resolveDisplayName = require(script.Common.resolveDisplayName),
	getHeadshotThumbnail = require(script.Common.getHeadshotThumbnail),
	Presentation = {
		EntryFrameView = require(script.Components.Presentation.EntryFrameView),
		StatEntryView = require(script.Components.Presentation.StatEntryView),
		PlayerListPanel = require(script.Components.Presentation.PlayerListPanel),
		PlayerContextualMenuView = require(script.Components.Presentation.PlayerContextualMenuView),
		LeaderboardScrim = require(script.Components.Presentation.LeaderboardScrim)
	}
}