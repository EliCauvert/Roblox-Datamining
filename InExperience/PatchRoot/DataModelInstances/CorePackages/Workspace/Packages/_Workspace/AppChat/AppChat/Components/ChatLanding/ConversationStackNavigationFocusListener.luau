local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local Parent = AppChat.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local GetFirstFocusableDescendantFunction = FocusNavigationUtilsModule.getFirstFocusableDescendant
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.SquadJoin,
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1) --[[ Line: 39 | Named "ConversationStackNavigationFocusListener" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), ReactFocusNavigationModule (copy), SquadExternalContractContext (copy), UseCurrentSquadParentChannelIdFunction (copy), FFlagAppChatConsoleFocusFixesModule (copy), GetFirstFocusableDescendantFunction (copy), EnumScreensModule (copy), LeaveSquadFunction (copy), SquadPromptType (copy), MutedErrorFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), config (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	local UseContextResult1 = ReactModule.useContext(SquadExternalContractContext)
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction()
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 45 ]]
		-- upvalues: p1 (copy), UseContextResult (copy), FFlagAppChatConsoleFocusFixesModule (upval), GetFirstFocusableDescendantFunction (upval)
		local ConversationStackNavigatorChildNavigation = p1.navigation.getChildNavigation("ConversationStackNavigator")
		
		if UseContextResult and ConversationStackNavigatorChildNavigation and ConversationStackNavigatorChildNavigation.state.index == 1 then
			local Value = UseContextResult.focusedGuiObject:getValue()
			
			if Value ~= nil and Value:IsDescendantOf(p1.rightContainerRef.current) then
				if FFlagAppChatConsoleFocusFixesModule and p1.conversationPanelRef.current and Value:IsDescendantOf(p1.conversationPanelRef.current) and p1.conversationTopBarRef.current then
					local FirstFocusableDescendant = GetFirstFocusableDescendantFunction(p1.conversationTopBarRef.current)
					
					if FirstFocusableDescendant then
						UseContextResult:focusGuiObject(FirstFocusableDescendant, true)
						p2:cancel()
						
						return
					end
				end
				UseContextResult:focusGuiObject(p1.leftContainerRef.current, true)
				p2:cancel()
			end
		end
	end, {
		p1.navigation, p1.leftContainerRef, p1.rightContainerRef,
		p1.conversationTopBarRef, p1.conversationPanelRef, UseContextResult
	})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 79 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval), UseCurrentSquadParentChannelIdResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), SquadPromptType (upval), UseContextResult1 (copy), MutedErrorFunction (upval)
		local ConversationStackNavigatorChildNavigation = p1.navigation.getChildNavigation("ConversationStackNavigator")
		
		if ConversationStackNavigatorChildNavigation and ConversationStackNavigatorChildNavigation.state.index == 1 then
			local Route = ConversationStackNavigatorChildNavigation.state.routes[1]
			
			if Route.routeName == EnumScreensModule.ChatConversation and Route.params then
				local ConversationId = Route.params.conversationId
				
				if not ConversationId then
					MutedErrorFunction("ConversationStackNavigationFocusListener: Missing conversationId for ChatConversation.")
					
					return
				end
				if UseCurrentSquadParentChannelIdResult == nil or UseCurrentSquadParentChannelIdResult == ConversationId then
					p1.navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
				else
					UseDispatchResult(LeaveSquadFunction(SquadPromptType.JoinAnotherSquad, UseContextResult1.setSquadPrompt, function() --[[ Line: 89 ]]
						-- upvalues: p1 (upval), EnumScreensModule (upval), ConversationId (copy)
						p1.navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
					end, UseContextResult1.squadLocation, true))
				end
				p2:cancel()
				
				return
			else
				MutedErrorFunction("ConversationStackNavigationFocusListener: Found" .. tostring(Route.routeName) .. " at root.")
			end
		end
	end, {
		UseCurrentSquadParentChannelIdResult,
		UseDispatchResult,
		p1.navigation,
		UseContextResult1.setSquadPrompt,
		UseContextResult1.squadLocation
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ref = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 111 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy), UseResult1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) },
				[FocusNavigationEventNameEnum.SquadJoin] = { handler = InputHandlersModule.onRelease(UseResult1) }
			}
		end, { UseResult, UseResult1 }), (ReactFocusNavigationModule.useEventMap(config)))
	}, p1.children)
end