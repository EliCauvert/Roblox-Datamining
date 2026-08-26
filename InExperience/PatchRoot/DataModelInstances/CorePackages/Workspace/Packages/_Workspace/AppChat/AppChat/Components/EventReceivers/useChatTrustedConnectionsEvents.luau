local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local reactModule = require(parent.React)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local refreshConversationUnfilteredThreadsDetailsModule = require(appChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local reloadMessagesForConversationsModule = require(appChat.Conversations.Thunks.reloadMessagesForConversations)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local trustedConnections = require(script.Parent.Constants).TrustedConnections
local _ = require(script.Parent.TrustedConnectionsNotificationTypes)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local conversationModerationTypeChangedModule = require(appChat.Conversations.Actions.ConversationModerationTypeChanged)
local cryoModule = require(parent.Cryo)
local name = require(appChat.Logger):new(script.Name)

return function(p1)
	-- upvalues: useDispatch (ref), useSelector (ref), useGetConversationFromIdModule (ref), useIsInExperienceModule (ref), useLocalUserId (ref), reactModule (ref), conversationChannelsModule (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), cryoModule (ref), conversationModerationTypeChangedModule (ref), reloadMessagesForConversationsModule (ref), realtimeDeliveryModule (ref), trustedConnections (ref), name (ref)
	local var1 = useDispatch()
	local var2 = useSelector(function(p2)
		return p2.ChatAppReducer.Conversations
	end)
	local var3 = useGetConversationFromIdModule(p1.activeConversationId)
	local var4 = useIsInExperienceModule()
	local var5 = useLocalUserId()
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), conversationChannelsModule (copy), var1 (ref), refreshConversationUnfilteredThreadsDetailsModule (copy), var4 (ref)
		if var3 and var3.participants and (var3.type == conversationChannelsModule.Type.OneToOne and p2) then
			for i, v in var3.participants do
				if v == p2 then
					var1(refreshConversationUnfilteredThreadsDetailsModule(var3.id, var4))
					
					return
				end
			end
		end
	end, { var1, var3, var4 })
	local var7 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var2 (ref), conversationChannelsModule (copy), cryoModule (copy), var1 (ref), conversationModerationTypeChangedModule (copy)
		for i, v in var2 do
			if v.type == conversationChannelsModule.Type.OneToOne and v.participants and (v.source == conversationChannelsModule.Source.Friends and cryoModule.List.find(v.participants, p3)) then
				var1(conversationModerationTypeChangedModule(v.id, p4))
				
				return
			end
		end
	end, { var1, var2 })
	local var8 = reactModule.useCallback(function(p5)
		-- upvalues: var2 (ref), cryoModule (copy), var1 (ref), reloadMessagesForConversationsModule (copy)
		local t = {}
		
		for i, v in var2 do
			if v.participants and cryoModule.List.find(v.participants, p5) then
				table.insert(t, v.id)
			end
		end
		if #t == 0 then
			return
		end
		var1(reloadMessagesForConversationsModule(t))
	end, { var1, var2 })
	realtimeDeliveryModule.useRealtimeNamespace(trustedConnections.Namespace, function(p6)
		-- upvalues: name (copy), trustedConnections (copy), var5 (ref), var6 (ref), var7 (ref), conversationChannelsModule (copy), var8 (ref)
		name:debug("Received Realtime Event " .. trustedConnections.Namespace .. " -> Actor: " .. tostring(p6.Actor) .. ", Target: " .. tostring(p6.Target) .. ", EventType: " .. tostring(p6.EventType))
		local var9 = tostring(p6.Actor)
		local var10 = tostring(p6.Target)
		local eventType = p6.EventType
		
		if eventType == trustedConnections.EventTypes.TrustedConnectionCreated or eventType == trustedConnections.EventTypes.TrustedConnectionDeleted then
			local var11 = if var9 == var5 then var10 else var9
			
			if eventType == trustedConnections.EventTypes.TrustedConnectionCreated then
				var6(var11)
				var7(var11, conversationChannelsModule.ModerationType.TrustedComms)
			else
				var7(var11, conversationChannelsModule.ModerationType.Moderated)
			end
			var8(var11)
			
			return
		elseif eventType == trustedConnections.EventTypes.TrustedConnectionRequestSent then
			if var9 == var5 then
				return
			else
				var6(var9)
				
				return
			end
		else
			name:debug("EventType: " .. tostring(eventType) .. " is not suppoprted.")
		end
	end, { var5, var6, var7, var8 })
end