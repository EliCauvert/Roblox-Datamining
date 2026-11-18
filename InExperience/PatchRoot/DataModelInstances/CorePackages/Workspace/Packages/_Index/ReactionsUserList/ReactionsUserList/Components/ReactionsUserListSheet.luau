local ReactionsUserList = script:FindFirstAncestor("ReactionsUserList")
local Parent = ReactionsUserList.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactionsUserListModule = require(ReactionsUserList.Components.ReactionsUserList)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useDefaultFocusBehavior
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), Sheet (copy), Text (copy), View (copy), ReactionsUserListModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseRefResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseRefResult (upval)
						if UseRefResult.current then
							UseRefResult.current.close()
						end
						p2:cancel()
					end)
				}
			}
		end, {})
	})))
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		sheetRef = UseRefResult,
		ref = UseDefaultFocusBehaviorResult2
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			DefaultFocus = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				ref = UseDefaultFocusBehaviorResult
			}, {
				UserList = ReactModule.createElement(ReactionsUserListModule, {
					userReactions = p1.userReactions,
					localUserId = p1.localUserId,
					tapToRemoveText = p1.tapToRemoveText,
					onRemoveReaction = p1.onRemoveReaction,
					onUserSelected = p1.onUserSelected,
					isScrollEnabled = p1.isScrollEnabled,
					layoutOrder = p1.layoutOrder
				})
			})
		})
	})
end