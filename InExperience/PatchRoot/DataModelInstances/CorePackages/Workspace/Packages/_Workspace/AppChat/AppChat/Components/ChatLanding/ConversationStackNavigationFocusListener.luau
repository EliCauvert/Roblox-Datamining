local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local parent = appChat.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactUtilsModule = require(parent.RoactUtils)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local mutedError = require(parent.Loggers).mutedError
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local leaveSquad = require(parent.SquadsCore.Thunks).leaveSquad
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local t = {
	[Enum.KeyCode.ButtonX] = focusNavigationEventNameEnum.SquadJoin,
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p0) --[[ line: 35 | named "ConversationStackNavigationFocusListener" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), reactFocusNavigationModule (ref), squadExternalContractContext (ref), useCurrentSquadParentChannelId (ref), enumScreensModule (ref), leaveSquad (ref), squadPromptType (ref), mutedError (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), t (ref)
	local var9 = useDispatch()
	local var10 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var11 = reactModule.useContext(squadExternalContractContext)
	local var12 = useCurrentSquadParentChannelId()
	local var13 = reactModule.useCallback(function(p1) --[[ line: 41 ]]
		-- upvalues: p0 (ref), var10 (ref)
		local conversationStackNavigator = p0.navigation.getChildNavigation("ConversationStackNavigator")
		
		if var10 and conversationStackNavigator and conversationStackNavigator.state.index == 1 then
			local value = var10.focusedGuiObject:getValue()
			
			if value ~= nil and value:IsDescendantOf(p0.rightContainerRef.current) then
				var10:focusGuiObject(p0.leftContainerRef.current, true)
				p1:cancel()
			end
		end
	end, {
		p0.navigation,
		p0.leftContainerRef,
		p0.rightContainerRef,
		var10
	})
	local var14 = reactModule.useCallback(function(p2) --[[ line: 54 ]]
		-- upvalues: p0 (ref), enumScreensModule (copy), var12 (ref), var9 (ref), leaveSquad (copy), squadPromptType (copy), var11 (ref), mutedError (copy)
		local conversationStackNavigator = p0.navigation.getChildNavigation("ConversationStackNavigator")
		
		if conversationStackNavigator and conversationStackNavigator.state.index == 1 then
			local var18 = conversationStackNavigator.state.routes[1]
			
			if var18.routeName == enumScreensModule.ChatConversation and var18.params then
				local conversationId = var18.params.conversationId
				
				if not conversationId then
					mutedError("ConversationStackNavigationFocusListener: Missing conversationId for ChatConversation.")
					
					return
				elseif var12 == nil or var12 == conversationId then
					p0.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
				else
					var9(leaveSquad(squadPromptType.JoinAnotherSquad, var11.setSquadPrompt, function() --[[ line: 64 ]]
						-- upvalues: p0 (copy), enumScreensModule (copy), conversationId (ref)
						p0.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
					end, var11.squadLocation, true))
				end
				p2:cancel()
				
				return
			else
				mutedError("ConversationStackNavigationFocusListener: Found" .. tostring(var18.routeName) .. " at root.")
			end
		end
	end, {
		var12,
		var9,
		p0.navigation,
		var11.setSquadPrompt,
		var11.squadLocation
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ref = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 86 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var13 (ref), var14 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var13) },
				[focusNavigationEventNameEnum.SquadJoin] = { handler = inputHandlersModule.onRelease(var14) }
			}
		end, { var13, var14 }), reactFocusNavigationModule.useEventMap(t))
	}, p0.children)
end