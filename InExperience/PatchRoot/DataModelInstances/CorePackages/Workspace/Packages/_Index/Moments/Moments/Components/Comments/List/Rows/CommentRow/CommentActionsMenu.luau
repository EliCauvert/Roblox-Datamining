local parent = script:FindFirstAncestor("Moments").Parent
local builderIconsModule = require(parent.BuilderIcons)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local threeDotsHorizontal = builderIconsModule.Icon.ThreeDotsHorizontal
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), foundationModule (ref), popoverSide (ref), popoverAlign (ref), threeDotsHorizontal (ref), inputSize (ref)
	local onClose = p1.onClose
	
	return reactModule.createElement(foundationModule.Menu, {
		isOpen = p1.isOpen,
		items = p1.items,
		side = popoverSide.Bottom,
		align = if p1.anchorRef ~= nil then popoverAlign.End else popoverAlign.Start,
		anchorRef = p1.anchorRef,
		onPressedOutside = onClose,
		ref = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = p1.isOpen,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onClose (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: onClose (copy)
							onClose()
							p2:cancel()
						end)
					}
				}
			end, { onClose })
		}),
		LayoutOrder = p1.LayoutOrder,
		testId = `moments-comment-actions-menu-{p1.commentId}`
	}, if p1.anchorRef == nil then {
		Button = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = threeDotsHorizontal,
			size = inputSize.XSmall,
			onActivated = p1.onButtonActivated,
			testId = `moments-comment-actions-button-{p1.commentId}`
		})
	} else nil)
end