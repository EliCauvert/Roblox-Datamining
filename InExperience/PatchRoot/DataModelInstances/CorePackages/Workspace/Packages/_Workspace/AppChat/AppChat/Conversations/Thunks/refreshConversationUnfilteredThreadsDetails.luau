local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NewResult = require(AppChat.Logger):new(script.Name)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local _ = require(AppChat.Models.ConversationChannels)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local FFlagAppChatConversationTrustedFriendUpsellBanner = require(Parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local SeedConversationTopModalFromRequestModule = if FFlagAppChatConversationTrustedFriendUpsellBanner then require(AppChat.Sdui.seedConversationTopModalFromRequest) else nil

return function(p1, IsInExperience) --[[ Line: 21 ]]
	-- upvalues: GetDeepValue2Module (copy), NewResult (copy), GetOtherParticipantsModule (copy), AppChatNetworkingModule (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (copy), SeedConversationTopModalFromRequestModule (copy)
	return function(p2) --[[ Line: 22 ]]
		-- upvalues: GetDeepValue2Module (upval), p1 (copy), NewResult (upval), GetOtherParticipantsModule (upval), AppChatNetworkingModule (upval), IsInExperience (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (upval), SeedConversationTopModalFromRequestModule (upval)
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
		if DeepValue2Module.source ~= "channels" and DeepValue2Module.source ~= "friends" then
			NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Conversation {p1} has invalid source {DeepValue2Module.source}`)
			
			return
		end
		local DispatchResult = p2:dispatch(AppChatNetworkingModule.rodux.GetModalSequence.API({
			modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
			isInExperience = IsInExperience,
			conversationId = if DeepValue2Module.source == "channels" then v1 else nil,
			friendId = if DeepValue2Module.source == "friends" then v1 else nil
		}))
		
		if FFlagAppChatConversationTrustedFriendUpsellBanner then
			DispatchResult = SeedConversationTopModalFromRequestModule(DispatchResult, p1)
		end
		DispatchResult:catch(function(Err) --[[ Line: 56 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationTopModal request. Error: {tostring(Err)}`)
		end)
		p2:dispatch(AppChatNetworkingModule.rodux.GetModalSequence.API({
			modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
			isInExperience = IsInExperience,
			conversationId = if DeepValue2Module.source == "channels" then v1 else nil,
			friendId = if DeepValue2Module.source == "friends" then v1 else nil
		})):catch(function(Err) --[[ Line: 71 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning(`refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationOverlay request. Error: {tostring(Err)}`)
		end)
	end
end