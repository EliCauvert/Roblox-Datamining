-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:02 2026 Pacific Standard Time.

local focusNavigationModule = require(script.Parent.FocusNavigation)
local focusBehaviorHooksModule = require(script.FocusBehaviorHooks)

return {
	FocusNavigationService = focusNavigationModule.FocusNavigationService,
	EngineInterface = focusNavigationModule.EngineInterface,
	FocusNavigationContext = require(script.FocusNavigationContext),
	useActiveEventMap = require(script.useActiveEventMap),
	useFocusedGuiObject = require(script.useFocusedGuiObject),
	useFocusGuiObject = require(script.useFocusGuiObject),
	useEventMap = require(script.useEventMap),
	useEventHandler = require(script.useEventHandler),
	useEventHandlerMap = require(script.useEventHandlerMap),
	useContainerFocusBehavior = require(script.useContainerFocusBehavior),
	useDefaultFocusBehavior = focusBehaviorHooksModule.useDefaultFocusBehavior,
	useMostRecentFocusBehavior = focusBehaviorHooksModule.useMostRecentFocusBehavior,
	useMostRecentOrDefaultFocusBehavior = focusBehaviorHooksModule.useMostRecentOrDefaultFocusBehavior,
	useDispatchSyntheticEvent = require(script.useDispatchSyntheticEvent)
}