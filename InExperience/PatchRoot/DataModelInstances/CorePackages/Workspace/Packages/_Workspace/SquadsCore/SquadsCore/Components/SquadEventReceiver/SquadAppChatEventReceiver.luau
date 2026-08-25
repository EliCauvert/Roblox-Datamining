local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local constantsModule = require(squadsCore.Common.Constants)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local useCurrentSquadParentChannelIdModule = require(squadsCore.Hooks.useCurrentSquadParentChannelId)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local fFlagSquadAppChatRTNFix = require(parent.SharedFlags).FFlagSquadAppChatRTNFix

return function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), fFlagSquadAppChatRTNFix (ref), useCurrentSquadParentChannelIdModule (ref), realtimeDeliveryModule (ref), constantsModule (ref)
	local var6 = useDispatch()
	local var7 = reactModule.useContext(squadExternalContractContextModule)
	local var8 = if fFlagSquadAppChatRTNFix then useCurrentSquadParentChannelIdModule() else p0.conversationId
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p1)
		-- upvalues: fFlagSquadAppChatRTNFix (copy), p0 (ref), constantsModule (copy), var8 (ref), var7 (ref), var6 (ref)
		local var9 = if fFlagSquadAppChatRTNFix then false else p0.conversationId and p0.conversationId == p1.ChannelId
		
		if p1.ChannelType == constantsModule.SQUAD_CHANNEL_TYPE then
			if fFlagSquadAppChatRTNFix then
				var9 = var8 and var8 == p1.ParentChannelId
			end
			if p1.Type == constantsModule.CHANNEL_CREATED_DETAIL_TYPE and not var9 or p1.Type == constantsModule.CHANNEL_DELETED_DETAIL_TYPE then
				var7.fetchParentChannelDetails(var6, p1.ParentChannelId)
			end
			if p1.Type == constantsModule.CHANNEL_UPDATED_DETAIL_TYPE and p1.PreviousChannelStatus and p1.PreviousChannelStatus.ParentChannelId then
				var7.fetchParentChannelDetails(var6, p1.PreviousChannelStatus.ParentChannelId)
			end
		end
	end, { var6, var8, var7.fetchParentChannelDetails })
	
	return nil
end