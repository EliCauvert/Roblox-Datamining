local AppChat = script:FindFirstAncestor("AppChat")
local NewResult = require(AppChat.Logger):new(script.Name)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local _ = require(AppChat.Models.ConversationChannels)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)

return function(p1, IsInExperience)
	-- upvalues: GetDeepValue2Module (copy), NewResult (copy), GetOtherParticipantsModule (copy), AppChatNetworkingModule (copy)
	return function(p2)
		-- upvalues: GetDeepValue2Module (upval), p1 (copy), NewResult (upval), GetOtherParticipantsModule (upval), AppChatNetworkingModule (upval), IsInExperience (copy)
		local State = p2:getState()
		local DeepValue2Module = GetDeepValue2Module(State, `ChatAppReducer.Conversations.{p1}`)
		
		if not DeepValue2Module then
			NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} not found`)
			
			return
		end
		local v1 = p1
		local LocalUserId = State.LocalUserId
		
		if DeepValue2Module.source == "friends" then
			local OtherParticipantsModule = GetOtherParticipantsModule(DeepValue2Module, LocalUserId)
			
			if #OtherParticipantsModule ~= 1 then
				NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Friends Conversation {p1} has invalid number of participants {#OtherParticipantsModule}`)
				
				return
			end
			v1 = OtherParticipantsModule[1]
		end
		if DeepValue2Module.source == "channels" or DeepValue2Module.source == "friends" then
			p2:dispatch(AppChatNetworkingModule.rodux.GetModalSequence.API({
				modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
				isInExperience = IsInExperience,
				conversationId = if DeepValue2Module.source == "channels" then v1 else nil,
				friendId = if DeepValue2Module.source == "friends" then v1 else nil
			})):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationTopModal request. Error: {tostring(Err)}`)
			end)
			p2:dispatch(AppChatNetworkingModule.rodux.GetModalSequence.API({
				modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = IsInExperience,
				conversationId = if DeepValue2Module.source == "channels" then v1 else nil,
				friendId = if DeepValue2Module.source == "friends" then v1 else nil
			})):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationOverlay request. Error: {tostring(Err)}`)
			end)
			
			return
		else
			NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} has invalid source {DeepValue2Module.source}`)
		end
	end
end