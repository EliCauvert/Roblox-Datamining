local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local _ = require(script.Parent.ChatOverflowMenuView)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(Frame)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusNavigationUtilsModule (copy), EventMap (copy)
	local OnCloseMenuFunction = Frame.onCloseMenu
	
	return {
		menuItems = Frame.menuItems,
		isMenuOpen = Frame.isMenuOpen,
		onToggleMenu = Frame.onToggleMenu,
		onCloseMenu = OnCloseMenuFunction,
		menuRef = FocusNavigationUtilsModule.useFocusRoot({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = Frame.isMenuOpen and #Frame.menuItems > 0,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseMenuFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p1)
							-- upvalues: OnCloseMenuFunction (upval)
							OnCloseMenuFunction()
							p1:cancel()
						end)
					}
				}
			end, { OnCloseMenuFunction })
		}),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}
end