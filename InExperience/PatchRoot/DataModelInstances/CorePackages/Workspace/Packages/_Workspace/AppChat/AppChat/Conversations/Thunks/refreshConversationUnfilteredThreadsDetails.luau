local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local name = require(appChat.Logger):new(script.Name)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local _ = require(appChat.Models.ConversationChannels)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local var1 = if fFlagAppChatConversationTrustedFriendUpsellBanner then require(appChat.Sdui.seedConversationTopModalFromRequest) else nil

return function(p1, p2)
	-- upvalues: getDeepValue2Module (ref), name (ref), getOtherParticipantsModule (ref), appChatNetworkingModule (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), var1 (ref)
	return function(p3)
		-- upvalues: getDeepValue2Module (copy), p1 (ref), name (copy), getOtherParticipantsModule (copy), appChatNetworkingModule (copy), p2 (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (copy)
		local state = p3:getState()
		local var2 = getDeepValue2Module(state, `ChatAppReducer.Conversations.{p1}`)
		
		if not var2 then
			name:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} not found`)
			
			return
		end
		local var3 = p1
		local localUserId = state.LocalUserId
		
		if var2.source == "friends" then
			local var4 = getOtherParticipantsModule(var2, localUserId)
			
			if #var4 ~= 1 then
				name:warning(`refreshConversationUnfilteredThreadsDetails: Friends Conversation {p1} has invalid number of participants {#var4}`)
				
				return
			end
			var3 = var4[1]
		end
		if var2.source ~= "channels" and var2.source ~= "friends" then
			name:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} has invalid source {var2.source}`)
			
			return
		end
		local var5 = p3:dispatch(appChatNetworkingModule.rodux.GetModalSequence.API({
			modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
			isInExperience = p2,
			conversationId = if var2.source == "channels" then var3 else nil,
			friendId = if var2.source == "friends" then var3 else nil
		}))
		
		if fFlagAppChatConversationTrustedFriendUpsellBanner then
			var5 = var1(var5, p1)
		end
		var5:catch(function(p4)
			-- upvalues: name (copy)
			name:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationTopModal request. Error: {tostring(p4)}`)
		end)
		p3:dispatch(appChatNetworkingModule.rodux.GetModalSequence.API({
			modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
			isInExperience = p2,
			conversationId = if var2.source == "channels" then var3 else nil,
			friendId = if var2.source == "friends" then var3 else nil
		})):catch(function(p4)
			-- upvalues: name (copy)
			name:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationOverlay request. Error: {tostring(p4)}`)
		end)
	end
end