local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local name = require(appChat.Logger):new(script.Name)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local _ = require(appChat.Models.ConversationChannels)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)

return function(p1, p2)
	-- upvalues: getDeepValue2Module (ref), name (ref), getOtherParticipantsModule (ref), appChatNetworkingModule (ref)
	return function(p3)
		-- upvalues: getDeepValue2Module (copy), p1 (ref), name (copy), getOtherParticipantsModule (copy), appChatNetworkingModule (copy), p2 (ref)
		local state = p3:getState()
		local var1 = getDeepValue2Module(state, `ChatAppReducer.Conversations.{p1}`)
		
		if not var1 then
			name:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} not found`)
			
			return
		end
		local var2 = p1
		local localUserId = state.LocalUserId
		
		if var1.source == "friends" then
			local var3 = getOtherParticipantsModule(var1, localUserId)
			
			if #var3 ~= 1 then
				name:warning(`refreshConversationUnfilteredThreadsDetails: Friends Conversation {p1} has invalid number of participants {#var3}`)
				
				return
			end
			var2 = var3[1]
		end
		if var1.source == "channels" or var1.source == "friends" then
			p3:dispatch(appChatNetworkingModule.rodux.GetModalSequence.API({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
				isInExperience = p2,
				conversationId = if var1.source == "channels" then var2 else nil,
				friendId = if var1.source == "friends" then var2 else nil
			})):catch(function(p4)
				-- upvalues: name (copy)
				name:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationTopModal request. Error: {tostring(p4)}`)
			end)
			p3:dispatch(appChatNetworkingModule.rodux.GetModalSequence.API({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = p2,
				conversationId = if var1.source == "channels" then var2 else nil,
				friendId = if var1.source == "friends" then var2 else nil
			})):catch(function(p4)
				-- upvalues: name (copy)
				name:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationOverlay request. Error: {tostring(p4)}`)
			end)
			
			return
		end
		name:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} has invalid source {var1.source}`)
	end
end