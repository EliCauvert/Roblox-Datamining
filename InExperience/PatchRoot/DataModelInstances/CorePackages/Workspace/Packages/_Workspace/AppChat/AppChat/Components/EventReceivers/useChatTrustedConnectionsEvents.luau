local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(Parent.React)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local RefreshConversationUnfilteredThreadsDetailsModule = require(AppChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local ReloadMessagesForConversationsModule = require(AppChat.Conversations.Thunks.reloadMessagesForConversations)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local TrustedConnections = require(script.Parent.Constants).TrustedConnections
local _ = require(script.Parent.TrustedConnectionsNotificationTypes)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ConversationModerationTypeChangedModule = require(AppChat.Conversations.Actions.ConversationModerationTypeChanged)
local CryoModule = require(Parent.Cryo)
local NewResult = require(AppChat.Logger):new(script.Name)
local FFlagAppChatConversationTrustedFriendUpsellBanner = require(Parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), UseGetConversationFromIdModule (copy), UseIsInExperienceModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), ConversationChannelsModule (copy), RefreshConversationUnfilteredThreadsDetailsModule (copy), CryoModule (copy), ConversationModerationTypeChangedModule (copy), ReloadMessagesForConversationsModule (copy), RealtimeDeliveryModule (copy), TrustedConnections (copy), NewResult (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ChatAppReducer.Conversations
	end)
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1.activeConversationId)
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseGetConversationFromIdModuleResult (copy), ConversationChannelsModule (upval), UseDispatchResult (copy), RefreshConversationUnfilteredThreadsDetailsModule (upval), UseIsInExperienceModuleResult (copy)
		if UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.participants and UseGetConversationFromIdModuleResult.type == ConversationChannelsModule.Type.OneToOne and p2 then
			for _, participant in UseGetConversationFromIdModuleResult.participants do
				if participant == p2 then
					UseDispatchResult(RefreshConversationUnfilteredThreadsDetailsModule(UseGetConversationFromIdModuleResult.id, UseIsInExperienceModuleResult))
					break
				end
			end
		end
	end, {
		UseDispatchResult,
		UseGetConversationFromIdModuleResult,
		UseIsInExperienceModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseSelectorResult (copy), ConversationChannelsModule (upval), CryoModule (upval), UseDispatchResult (copy), ConversationModerationTypeChangedModule (upval)
		for _, value in UseSelectorResult do
			if value.type == ConversationChannelsModule.Type.OneToOne and value.participants and value.source == ConversationChannelsModule.Source.Friends and CryoModule.List.find(value.participants, p3) then
				UseDispatchResult(ConversationModerationTypeChangedModule(value.id, p4))
				break
			end
		end
	end, { UseDispatchResult, UseSelectorResult })
	local UseResult2 = ReactModule.useCallback(function(p5)
		-- upvalues: UseSelectorResult (copy), CryoModule (upval), UseDispatchResult (copy), ReloadMessagesForConversationsModule (upval)
		local Ids = {}
		
		for _, value in UseSelectorResult do
			if value.participants and CryoModule.List.find(value.participants, p5) then
				table.insert(Ids, value.id)
			end
		end
		if #Ids ~= 0 then
			UseDispatchResult(ReloadMessagesForConversationsModule(Ids))
			
			return
		end
	end, { UseDispatchResult, UseSelectorResult })
	RealtimeDeliveryModule.useRealtimeNamespace(TrustedConnections.Namespace, function(Mouse)
		-- upvalues: NewResult (upval), TrustedConnections (upval), UseLocalUserIdResult (copy), UseResult (copy), UseResult1 (copy), ConversationChannelsModule (upval), UseResult2 (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (upval)
		NewResult:debug("Received Realtime Event " .. TrustedConnections.Namespace .. " -> Actor: " .. tostring(Mouse.Actor) .. ", Target: " .. tostring(Mouse.Target) .. ", EventType: " .. tostring(Mouse.EventType))
		local Text = tostring(Mouse.Actor)
		local Text1 = tostring(Mouse.Target)
		local EventType = Mouse.EventType
		
		if EventType == TrustedConnections.EventTypes.TrustedConnectionCreated or EventType == TrustedConnections.EventTypes.TrustedConnectionDeleted then
			local Text2: string = if Text == UseLocalUserIdResult then Text1 else Text
			
			if EventType == TrustedConnections.EventTypes.TrustedConnectionCreated then
				UseResult(Text2)
				UseResult1(Text2, ConversationChannelsModule.ModerationType.TrustedComms)
			else
				UseResult1(Text2, ConversationChannelsModule.ModerationType.Moderated)
			end
			UseResult2(Text2)
			
			return
		elseif EventType ~= TrustedConnections.EventTypes.TrustedConnectionRequestSent then
			NewResult:debug("EventType: " .. tostring(EventType) .. " is not suppoprted.")
		elseif Text ~= UseLocalUserIdResult then
			UseResult(Text)
			
			return
		else
			if FFlagAppChatConversationTrustedFriendUpsellBanner then
				UseResult(Text1)
				
				return
			end
		end
	end, { UseLocalUserIdResult, UseResult, UseResult1, UseResult2 })
end