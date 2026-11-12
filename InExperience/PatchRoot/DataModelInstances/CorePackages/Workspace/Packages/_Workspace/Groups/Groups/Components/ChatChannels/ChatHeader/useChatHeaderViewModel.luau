local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local UserLibModule = require(Parent.UserLib)
local _ = require(script.Parent.ChatHeaderView)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(Frame)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusNavigationUtilsModule (copy), EventMap (copy), UserLibModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UseResult (copy)
		local List = {}
		local OverflowActions = Frame.overflowActions or {}
		for i, overflowAction in OverflowActions do
			table.insert(List, {
				id = tostring(i),
				text = overflowAction.title,
				onActivated = function()
					-- upvalues: UseResult (upval), overflowAction (copy)
					UseResult()
					overflowAction.action()
				end
			})
		end
		return List
	end, { Frame.overflowActions, UseResult })
	local v1 = #UseMemoResult > 0
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseStateResult2 (copy)
		if not v1 then
			UseStateResult2(false)
		end
	end, { v1 })
	local IsUser = Frame.iconType == "user"
	
	return {
		title = Frame.title,
		subtitle = Frame.subtitle,
		icon = if IsUser then UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions(tostring(Frame.iconTargetId), UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot, 150) else `rbxassetid://{Frame.iconTargetId}`,
		isUserIcon = IsUser,
		ctaButton = Frame.ctaButton,
		onClick = Frame.onClick,
		menuItems = UseMemoResult,
		isMenuOpen = UseStateResult,
		onToggleMenu = UseResult1,
		onCloseMenu = UseResult,
		menuRef = FocusNavigationUtilsModule.useFocusRoot({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = UseStateResult and v1,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p1)
							-- upvalues: UseResult (upval)
							UseResult()
							p1:cancel()
						end)
					}
				}
			end, { UseResult })
		}),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--groups-chat-header"
	}
end