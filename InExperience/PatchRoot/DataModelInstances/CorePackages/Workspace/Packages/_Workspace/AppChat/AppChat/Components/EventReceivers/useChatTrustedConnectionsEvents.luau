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

return function(p0)
	-- upvalues: useDispatch (ref), useSelector (ref), useGetConversationFromIdModule (ref), useIsInExperienceModule (ref), useLocalUserId (ref), reactModule (ref), conversationChannelsModule (ref), refreshConversationUnfilteredThreadsDetailsModule (ref), cryoModule (ref), conversationModerationTypeChangedModule (ref), reloadMessagesForConversationsModule (ref), realtimeDeliveryModule (ref), trustedConnections (ref), name (ref)
	local var11 = useDispatch()
	local var12 = useSelector(function(p1)
		return p1.ChatAppReducer.Conversations
	end)
	local var13 = useGetConversationFromIdModule(p0.activeConversationId)
	local var14 = useIsInExperienceModule()
	local var15 = useLocalUserId()
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), conversationChannelsModule (copy), var11 (ref), refreshConversationUnfilteredThreadsDetailsModule (copy), var14 (ref)
		if var13 and var13.participants and (var13.type == conversationChannelsModule.Type.OneToOne and p2) then
			for i, v in var13.participants do
				if v == p2 then
					var11(refreshConversationUnfilteredThreadsDetailsModule(var13.id, var14))
					
					return
				end
			end
		end
	end, { var11, var13, var14 })
	local var17 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var12 (ref), conversationChannelsModule (copy), cryoModule (copy), var11 (ref), conversationModerationTypeChangedModule (copy)
		for i, v in var12 do
			if v.type == conversationChannelsModule.Type.OneToOne and v.participants and (v.source == conversationChannelsModule.Source.Friends and cryoModule.List.find(v.participants, p3)) then
				var11(conversationModerationTypeChangedModule(v.id, p4))
				
				return
			end
		end
	end, { var11, var12 })
	local var18 = reactModule.useCallback(function(p5)
		-- upvalues: var12 (ref), cryoModule (copy), var11 (ref), reloadMessagesForConversationsModule (copy)
		local t = {}
		
		for i, v in var12 do
			if v.participants and cryoModule.List.find(v.participants, p5) then
				table.insert(t, v.id)
			end
		end
		if #t == 0 then
			return
		end
		var11(reloadMessagesForConversationsModule(t))
	end, { var11, var12 })
	realtimeDeliveryModule.useRealtimeNamespace(trustedConnections.Namespace, function(p6)
		-- upvalues: name (copy), trustedConnections (copy), var15 (ref), var16 (ref), var17 (ref), conversationChannelsModule (copy), var18 (ref)
		name:debug("Received Realtime Event " .. trustedConnections.Namespace .. " -> Actor: " .. tostring(p6.Actor) .. ", Target: " .. tostring(p6.Target) .. ", EventType: " .. tostring(p6.EventType))
		local var20 = tostring(p6.Actor)
		local var21 = tostring(p6.Target)
		local eventType = p6.EventType
		
		if eventType == trustedConnections.EventTypes.TrustedConnectionCreated or eventType == trustedConnections.EventTypes.TrustedConnectionDeleted then
			local var22 = if var20 == var15 then var21 else var20
			
			if eventType == trustedConnections.EventTypes.TrustedConnectionCreated then
				var16(var22)
				var17(var22, conversationChannelsModule.ModerationType.TrustedComms)
			else
				var17(var22, conversationChannelsModule.ModerationType.Moderated)
			end
			var18(var22)
			
			return
		elseif eventType == trustedConnections.EventTypes.TrustedConnectionRequestSent then
			if var20 == var15 then
				return
			else
				var16(var20)
				
				return
			end
		else
			name:debug("EventType: " .. tostring(eventType) .. " is not suppoprted.")
		end
	end, { var15, var16, var17, var18 })
end