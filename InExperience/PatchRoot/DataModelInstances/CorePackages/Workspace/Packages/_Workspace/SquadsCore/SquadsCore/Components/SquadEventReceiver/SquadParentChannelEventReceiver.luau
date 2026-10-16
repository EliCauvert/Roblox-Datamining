local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local ConstantsModule = require(SquadsCore.Common.Constants)
local LoggerModule = require(SquadsCore.Logger)
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local FetchActiveSquadModule = require(SquadsCore.Thunks.fetchActiveSquad)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function(p1) --[[ Line: 22 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy), LoggerModule (copy), SerializeTableModule (copy), RoduxSquadsModule (copy), FetchActiveSquadModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2) --[[ Line: 27 ]]
		-- upvalues: ConstantsModule (upval), p1 (copy), LoggerModule (upval), SerializeTableModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval), FetchActiveSquadModule (upval)
		if table.find(ConstantsModule.PARENT_CHANNEL_TYPES, p2.ChannelType) and (p1.currentParentChannelId and p1.currentParentChannelId == p2.ChannelId) then
			LoggerModule:debug("Parent squad channel RTN received. Detail: {}, CurrentParentChannelId: {}", SerializeTableModule(p2), p1.currentParentChannelId)
			
			if p2.Type == ConstantsModule.CHANNEL_DELETED_DETAIL_TYPE or p2.Type == ConstantsModule.CHANNEL_ARCHIVED_DETAIL_TYPE or p2.Type == ConstantsModule.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE then
				UseDispatchResult(RoduxSquadsModule.Actions.CurrentSquadUpdated(nil))
				
				return
			end
			if p2.Type == ConstantsModule.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE then
				UseDispatchResult(FetchActiveSquadModule())
			end
		end
	end, {
		UseDispatchResult,
		p1.currentParentChannelId,
		UseContextResult.fetchParentChannelDetails
	})
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: p1 (copy), UseContextResult (copy), UseDispatchResult (copy)
		if p1.currentParentChannelId and p1.currentParentChannelId ~= "" then
			UseContextResult.fetchParentChannelDetails(UseDispatchResult, p1.currentParentChannelId)
		end
	end, {
		UseDispatchResult,
		p1.currentParentChannelId,
		UseContextResult.fetchParentChannelDetails
	})
	
	return nil
end