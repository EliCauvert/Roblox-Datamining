local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function(p1)
	-- upvalues: useDispatch (ref), useGetConversationFromIdModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), appChatNetworkingModule (ref)
	local var1 = useDispatch()
	local var2 = useGetConversationFromIdModule(p1)
	local var3 = useGetOneToOneFriendIdFromConversationIdModule(p1)
	
	return function(p2, p3, p4, p5)
		-- upvalues: var2 (ref), var3 (ref), var1 (ref), appChatNetworkingModule (copy), p1 (ref)
		return if var2 and var2.source == "friends" and var3 then var1(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(p2, p3, p4, p5, nil, var3)) else var1(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(p2, p3, p4, p5, p1))
	end
end