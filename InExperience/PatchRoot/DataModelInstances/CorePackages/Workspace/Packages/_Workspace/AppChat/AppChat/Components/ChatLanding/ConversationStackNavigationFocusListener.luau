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

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), reactFocusNavigationModule (ref), squadExternalContractContext (ref), useCurrentSquadParentChannelId (ref), enumScreensModule (ref), leaveSquad (ref), squadPromptType (ref), mutedError (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), t (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var3 = reactModule.useContext(squadExternalContractContext)
	local var4 = useCurrentSquadParentChannelId()
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var2 (ref)
		local conversationStackNavigator = p1.navigation.getChildNavigation("ConversationStackNavigator")
		
		if var2 and conversationStackNavigator and conversationStackNavigator.state.index == 1 then
			local value = var2.focusedGuiObject:getValue()
			
			if value ~= nil and value:IsDescendantOf(p1.rightContainerRef.current) then
				var2:focusGuiObject(p1.leftContainerRef.current, true)
				p2:cancel()
			end
		end
	end, {
		p1.navigation,
		p1.leftContainerRef,
		p1.rightContainerRef,
		var2
	})
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy), var4 (ref), var1 (ref), leaveSquad (copy), squadPromptType (copy), var3 (ref), mutedError (copy)
		local conversationStackNavigator = p1.navigation.getChildNavigation("ConversationStackNavigator")
		
		if conversationStackNavigator and conversationStackNavigator.state.index == 1 then
			local var7 = conversationStackNavigator.state.routes[1]
			
			if var7.routeName == enumScreensModule.ChatConversation and var7.params then
				local conversationId = var7.params.conversationId
				
				if not conversationId then
					mutedError("ConversationStackNavigationFocusListener: Missing conversationId for ChatConversation.")
					
					return
				elseif var4 == nil or var4 == conversationId then
					p1.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
				else
					var1(leaveSquad(squadPromptType.JoinAnotherSquad, var3.setSquadPrompt, function()
						-- upvalues: p1 (copy), enumScreensModule (copy), conversationId (ref)
						p1.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
					end, var3.squadLocation, true))
				end
				p2:cancel()
				
				return
			else
				mutedError("ConversationStackNavigationFocusListener: Found" .. tostring(var7.routeName) .. " at root.")
			end
		end
	end, {
		var4,
		var1,
		p1.navigation,
		var3.setSquadPrompt,
		var3.squadLocation
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ref = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var5 (ref), var6 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var5) },
				[focusNavigationEventNameEnum.SquadJoin] = { handler = inputHandlersModule.onRelease(var6) }
			}
		end, { var5, var6 }), reactFocusNavigationModule.useEventMap(t))
	}, p1.children)
end