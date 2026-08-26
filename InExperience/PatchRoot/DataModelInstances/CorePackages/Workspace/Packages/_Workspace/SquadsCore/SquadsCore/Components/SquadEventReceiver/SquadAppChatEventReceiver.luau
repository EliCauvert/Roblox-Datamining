local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local constantsModule = require(squadsCore.Common.Constants)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local useCurrentSquadParentChannelIdModule = require(squadsCore.Hooks.useCurrentSquadParentChannelId)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local fFlagSquadAppChatRTNFix = require(parent.SharedFlags).FFlagSquadAppChatRTNFix

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), fFlagSquadAppChatRTNFix (ref), useCurrentSquadParentChannelIdModule (ref), realtimeDeliveryModule (ref), constantsModule (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	local var3 = if fFlagSquadAppChatRTNFix then useCurrentSquadParentChannelIdModule() else p1.conversationId
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2)
		-- upvalues: fFlagSquadAppChatRTNFix (copy), p1 (ref), constantsModule (copy), var3 (ref), var2 (ref), var1 (ref)
		local var4 = if fFlagSquadAppChatRTNFix then false else p1.conversationId and p1.conversationId == p2.ChannelId
		
		if p2.ChannelType == constantsModule.SQUAD_CHANNEL_TYPE then
			if fFlagSquadAppChatRTNFix then
				var4 = var3 and var3 == p2.ParentChannelId
			end
			if p2.Type == constantsModule.CHANNEL_CREATED_DETAIL_TYPE and not var4 or p2.Type == constantsModule.CHANNEL_DELETED_DETAIL_TYPE then
				var2.fetchParentChannelDetails(var1, p2.ParentChannelId)
			end
			if p2.Type == constantsModule.CHANNEL_UPDATED_DETAIL_TYPE and p2.PreviousChannelStatus and p2.PreviousChannelStatus.ParentChannelId then
				var2.fetchParentChannelDetails(var1, p2.PreviousChannelStatus.ParentChannelId)
			end
		end
	end, { var1, var3, var2.fetchParentChannelDetails })
	
	return nil
end