local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(appChat.Models.ConversationChannels)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local conversationRoduxSeedModule = require(appChat.Utils.ConversationRoduxSeed)
local fFlagFriendsCallingClientGateDEV = require(parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local fFlagAppChatConversationStoreModule = require(appChat.Flags.FFlagAppChatConversationStore)
local var1 = if fFlagAppChatConversationStoreModule then require(appChat.Stores.GetConversationStore) else nil

return function(p1)
	-- upvalues: fFlagFriendsCallingClientGateDEV (ref), fFlagAppChatConversationStoreModule (ref), reactModule (ref), signalsModule (ref), var1 (ref), signalsReactModule (ref), useGetConversationFromIdModule (ref), conversationRoduxSeedModule (ref), useDispatch (ref), fetchLatestConversationDetailsModule (ref)
	local var2 = if fFlagFriendsCallingClientGateDEV then if fFlagAppChatConversationStoreModule then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), var1 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), var1 (copy)
			return if p1 then var1(false).getConversation(p1, p2) else nil
		end)
	end, { p1 or false })) else useGetConversationFromIdModule(p1) else nil
	local var3 = if var2 == nil or var2.id ~= p1 then nil else var2
	local var4 = conversationRoduxSeedModule.isFriendsPlaceholderConversationId(p1)
	local var5 = if var3 and not var4 then var3.callButtonEligibility else nil
	local var6 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: fFlagFriendsCallingClientGateDEV (copy), p1 (ref), var4 (ref), var5 (ref), var6 (ref), fetchLatestConversationDetailsModule (copy)
		if fFlagFriendsCallingClientGateDEV and p1 and (not var4 and var5 == nil) then
			var6(fetchLatestConversationDetailsModule(p1))
		end
	end, { var6, p1 or false, var5 or false, var4 })
	
	return var5
end