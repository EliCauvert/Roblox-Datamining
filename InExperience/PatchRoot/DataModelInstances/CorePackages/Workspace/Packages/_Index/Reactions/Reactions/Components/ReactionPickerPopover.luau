local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local ReactionPickerModule = require(Reactions.Components.ReactionPicker)
local _ = require(Reactions.Enums.ReactionSize)
local _ = require(Reactions.Enums.ReactionType)
local UsePressGesturesModule = require(Reactions.Hooks.usePressGestures)
local UseReactionDragSelectModule = require(Reactions.Hooks.useReactionDragSelect)
local ToGuiSpaceModule = require(Reactions.Utils.toGuiSpace)
local Popover = FoundationModule.Popover
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local EventMap = {
	[Enum.KeyCode.ButtonB] = "NavigateBack",
	[Enum.KeyCode.Escape] = "NavigateBack"
}

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseReactionDragSelectModule (copy), UsePressGesturesModule (copy), ToGuiSpaceModule (copy), ReactModule (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Popover (copy), PopoverSide (copy), Radius (copy), ReactionPickerModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseReactionDragSelectModuleResult = UseReactionDragSelectModule(p1.onReactionSelected)
	local OnOpenFunction = p1.onOpen
	local OnDoubleTapFunction = p1.onDoubleTap
	UsePressGesturesModule(p1.anchorRef, {
		onTap = p1.onTap or OnOpenFunction,
		onDoubleTap = if OnDoubleTapFunction then function(p2)
			-- upvalues: p1 (copy), OnDoubleTapFunction (copy), ToGuiSpaceModule (upval)
			local Current = p1.anchorRef.current
			OnDoubleTapFunction(if typeof(Current) == "Instance" then ToGuiSpaceModule(p2, Current) else p2)
		end else nil,
		onHold = if OnOpenFunction then function()
			-- upvalues: p1 (copy), OnOpenFunction (copy)
			if not p1.isOpen then
				OnOpenFunction()
			end
		end else nil,
		onHoldMoved = UseReactionDragSelectModuleResult.onDragMoved,
		onHoldEnded = UseReactionDragSelectModuleResult.onDragEnded,
		holdDuration = p1.holdDuration
	})
	local OnDismissFunction = p1.onDismiss
	
	return ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = false,
			side = p1.side or PopoverSide.Top,
			align = p1.align,
			radius = p1.radius or Radius.Circle,
			backgroundStyle = UseTokensResult.Color.None,
			onPressedOutside = OnDismissFunction,
			ref = UseFocusRootFunction({
				isAutoFocusRoot = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
				isFocusable = p1.isOpen,
				eventMap = EventMap,
				eventHandlers = ReactModule.useMemo(function()
					-- upvalues: InputHandlersModule (upval), OnDismissFunction (copy)
					return {
						NavigateBack = {
							handler = InputHandlersModule.onRelease(function()
								-- upvalues: OnDismissFunction (upval)
								if OnDismissFunction then
									OnDismissFunction()
								end
							end)
						}
					}
				end, { OnDismissFunction })
			})
		}, {
			Picker = ReactModule.createElement(ReactionPickerModule, {
				onReactionSelected = p1.onReactionSelected,
				selectedReactions = p1.selectedReactions,
				reactions = p1.reactions,
				reactionSize = p1.reactionSize,
				radius = p1.radius,
				backgroundStyle = p1.backgroundStyle,
				hoveredReaction = UseReactionDragSelectModuleResult.hoveredReaction,
				getButtonRef = UseReactionDragSelectModuleResult.getButtonRef,
				testId = p1.testId
			})
		})
	})
end