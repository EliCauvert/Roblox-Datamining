local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local name = require(appChat.Logger):new(script.Name)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local _ = require(appChat.Models.ConversationChannels)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)

return function(p0, p1)
	-- upvalues: getDeepValue2Module (ref), name (ref), getOtherParticipantsModule (ref), appChatNetworkingModule (ref)
	return function(p2)
		-- upvalues: getDeepValue2Module (copy), p0 (ref), name (copy), getOtherParticipantsModule (copy), appChatNetworkingModule (copy), p1 (ref)
		local state = p2:getState()
		local var6 = getDeepValue2Module(state, `ChatAppReducer.Conversations.{p0}`)
		
		if not var6 then
			name:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p0} not found`)
			
			return
		end
		local var7 = p0
		local localUserId = state.LocalUserId
		
		if var6.source == "friends" then
			local var8 = getOtherParticipantsModule(var6, localUserId)
			
			if #var8 ~= 1 then
				name:warning(`refreshConversationUnfilteredThreadsDetails: Friends Conversation {p0} has invalid number of participants {#var8}`)
				
				return
			end
			var7 = var8[1]
		end
		if var6.source == "channels" or var6.source == "friends" then
			p2:dispatch(appChatNetworkingModule.rodux.GetModalSequence.API({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
				isInExperience = p1,
				conversationId = if var6.source == "channels" then var7 else nil,
				friendId = if var6.source == "friends" then var7 else nil
			})):catch(function(p3)
				-- upvalues: name (copy)
				name:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationTopModal request. Error: {tostring(p3)}`)
			end)
			p2:dispatch(appChatNetworkingModule.rodux.GetModalSequence.API({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = p1,
				conversationId = if var6.source == "channels" then var7 else nil,
				friendId = if var6.source == "friends" then var7 else nil
			})):catch(function(p4)
				-- upvalues: name (copy)
				name:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationOverlay request. Error: {tostring(p4)}`)
			end)
			
			return
		end
		name:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p0} has invalid source {var6.source}`)
	end
end