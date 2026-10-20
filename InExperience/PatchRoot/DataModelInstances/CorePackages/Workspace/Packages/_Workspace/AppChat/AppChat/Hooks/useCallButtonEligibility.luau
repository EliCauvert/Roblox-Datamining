local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(AppChat.Models.ConversationChannels)
local FetchLatestConversationDetailsModule = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local ConversationRoduxSeedModule = require(AppChat.Utils.ConversationRoduxSeed)
local FFlagFriendsCallingClientGateDEV = require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local GetConversationStoreModule = if FFlagAppChatConversationStoreModule then require(AppChat.Stores.GetConversationStore) else nil

return function(Id)
	-- upvalues: FFlagFriendsCallingClientGateDEV (copy), FFlagAppChatConversationStoreModule (copy), ReactModule (copy), SignalsModule (copy), GetConversationStoreModule (copy), SignalsReactModule (copy), UseGetConversationFromIdModule (copy), ConversationRoduxSeedModule (copy), UseDispatchFunction (copy), FetchLatestConversationDetailsModule (copy)
	local UseSignalStateResult = if FFlagFriendsCallingClientGateDEV then if FFlagAppChatConversationStoreModule then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Id (copy), GetConversationStoreModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Id (upval), GetConversationStoreModule (upval)
			return if Id then GetConversationStoreModule(false).getConversation(Id, p1) else nil
		end)
	end, { Id or false }))) else UseGetConversationFromIdModule(Id) else nil
	local UseSignalStateResult1 = if UseSignalStateResult == nil or UseSignalStateResult.id ~= Id then nil else UseSignalStateResult
	local IsFriendsPlaceholderConversationId = ConversationRoduxSeedModule.isFriendsPlaceholderConversationId(Id)
	local CallButtonEligibility = if UseSignalStateResult1 and not IsFriendsPlaceholderConversationId then UseSignalStateResult1.callButtonEligibility else nil
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: FFlagFriendsCallingClientGateDEV (upval), Id (copy), IsFriendsPlaceholderConversationId (copy), CallButtonEligibility (copy), UseDispatchResult (copy), FetchLatestConversationDetailsModule (upval)
		if FFlagFriendsCallingClientGateDEV and Id and not IsFriendsPlaceholderConversationId and CallButtonEligibility == nil then
			UseDispatchResult(FetchLatestConversationDetailsModule(Id))
		end
	end, {
		UseDispatchResult,
		Id or false,
		CallButtonEligibility or false,
		IsFriendsPlaceholderConversationId
	})
	
	return CallButtonEligibility
end