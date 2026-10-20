local Parent = script:FindFirstAncestor("Moments").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local ThreeDotsHorizontal = require(Parent.BuilderIcons).Icon.ThreeDotsHorizontal
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(Frame)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), FoundationModule (copy), PopoverSide (copy), PopoverAlign (copy), ThreeDotsHorizontal (copy), InputSize (copy)
	local OnCloseFunction = Frame.onClose
	
	return ReactModule.createElement(FoundationModule.Menu, {
		isOpen = Frame.isOpen,
		items = Frame.items,
		side = if Frame.anchorRef == nil then PopoverSide.Bottom else PopoverSide.Top,
		align = PopoverAlign.End,
		anchorRef = Frame.anchorRef,
		onPressedOutside = OnCloseFunction,
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = Frame.isOpen,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p1)
							-- upvalues: OnCloseFunction (upval)
							OnCloseFunction()
							p1:cancel()
						end)
					}
				}
			end, { OnCloseFunction })
		}),
		LayoutOrder = Frame.LayoutOrder,
		testId = `moments-comment-actions-menu-{Frame.commentId}`
	}, if Frame.anchorRef == nil then {
		Button = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = ThreeDotsHorizontal,
			size = InputSize.XSmall,
			onActivated = Frame.onButtonActivated,
			testId = `moments-comment-actions-button-{Frame.commentId}`
		})
	} else nil)
end