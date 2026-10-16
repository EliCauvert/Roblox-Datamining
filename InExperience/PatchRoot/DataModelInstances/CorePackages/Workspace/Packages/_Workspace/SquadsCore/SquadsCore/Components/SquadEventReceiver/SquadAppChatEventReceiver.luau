local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local ConstantsModule = require(SquadsCore.Common.Constants)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local UseCurrentSquadParentChannelIdModule = require(SquadsCore.Hooks.useCurrentSquadParentChannelId)
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagSquadAppChatRTNFix = require(Parent.SharedFlags).FFlagSquadAppChatRTNFix

return function(p1) --[[ Line: 20 | Named "SquadAppChatEventReceiver" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), FFlagSquadAppChatRTNFix (copy), UseCurrentSquadParentChannelIdModule (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseCurrentSquadParentChannelIdModuleResult = if FFlagSquadAppChatRTNFix then UseCurrentSquadParentChannelIdModule() else p1.conversationId
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2) --[[ Line: 28 ]]
		-- upvalues: FFlagSquadAppChatRTNFix (upval), p1 (copy), ConstantsModule (upval), UseCurrentSquadParentChannelIdModuleResult (copy), UseContextResult (copy), UseDispatchResult (copy)
		local IsConversationIdMatch: boolean = not FFlagSquadAppChatRTNFix and (p1.conversationId and p1.conversationId == p2.ChannelId)
		
		if p2.ChannelType == ConstantsModule.SQUAD_CHANNEL_TYPE then
			if FFlagSquadAppChatRTNFix then
				IsConversationIdMatch = UseCurrentSquadParentChannelIdModuleResult and UseCurrentSquadParentChannelIdModuleResult == p2.ParentChannelId
			end
			if p2.Type == ConstantsModule.CHANNEL_CREATED_DETAIL_TYPE and not IsConversationIdMatch or p2.Type == ConstantsModule.CHANNEL_DELETED_DETAIL_TYPE then
				UseContextResult.fetchParentChannelDetails(UseDispatchResult, p2.ParentChannelId)
			end
			if p2.Type == ConstantsModule.CHANNEL_UPDATED_DETAIL_TYPE and p2.PreviousChannelStatus and p2.PreviousChannelStatus.ParentChannelId then
				UseContextResult.fetchParentChannelDetails(UseDispatchResult, p2.PreviousChannelStatus.ParentChannelId)
			end
		end
	end, {
		UseDispatchResult,
		UseCurrentSquadParentChannelIdModuleResult,
		UseContextResult.fetchParentChannelDetails
	})
	
	return nil
end