local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function(p0)
	-- upvalues: useDispatch (ref), useGetConversationFromIdModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), appChatNetworkingModule (ref)
	local var4 = useDispatch()
	local var5 = useGetConversationFromIdModule(p0)
	local var6 = useGetOneToOneFriendIdFromConversationIdModule(p0)
	
	return function(p1, p2, p3, p4)
		-- upvalues: var5 (ref), var6 (ref), var4 (ref), appChatNetworkingModule (copy), p0 (ref)
		return if var5 and var5.source == "friends" and var6 then var4(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(p1, p2, p3, p4, nil, var6)) else var4(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(p1, p2, p3, p4, p0))
	end
end