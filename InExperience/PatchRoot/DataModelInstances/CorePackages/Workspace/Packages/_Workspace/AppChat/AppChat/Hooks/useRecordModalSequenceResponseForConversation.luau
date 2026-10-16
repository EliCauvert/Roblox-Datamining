local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: UseDispatchFunction (copy), UseGetConversationFromIdModule (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), AppChatNetworkingModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1)
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(p1)
	
	return function(p2, p3, p4, p5) --[[ Line: 18 ]]
		-- upvalues: UseGetConversationFromIdModuleResult (copy), UseGetOneToOneFriendIdFromConversationIdModuleResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), p1 (copy)
		return if UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.source == "friends" and UseGetOneToOneFriendIdFromConversationIdModuleResult then UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(p2, p3, p4, p5, nil, UseGetOneToOneFriendIdFromConversationIdModuleResult)) else UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(p2, p3, p4, p5, p1))
	end
end