local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local constantsModule = require(squadsCore.Common.Constants)
local loggerModule = require(squadsCore.Logger)
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local fetchActiveSquadModule = require(squadsCore.Thunks.fetchActiveSquad)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), realtimeDeliveryModule (ref), constantsModule (ref), loggerModule (ref), serializeTableModule (ref), roduxSquadsModule (ref), fetchActiveSquadModule (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2)
		-- upvalues: constantsModule (copy), p1 (ref), loggerModule (copy), serializeTableModule (copy), var1 (ref), roduxSquadsModule (copy), fetchActiveSquadModule (copy)
		if table.find(constantsModule.PARENT_CHANNEL_TYPES, p2.ChannelType) and (p1.currentParentChannelId and p1.currentParentChannelId == p2.ChannelId) then
			loggerModule:debug("Parent squad channel RTN received. Detail: {}, CurrentParentChannelId: {}", serializeTableModule(p2), p1.currentParentChannelId)
			
			if p2.Type == constantsModule.CHANNEL_DELETED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_ARCHIVED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE then
				var1(roduxSquadsModule.Actions.CurrentSquadUpdated(nil))
				
				return
			elseif p2.Type == constantsModule.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE then
				var1(fetchActiveSquadModule())
			end
		end
	end, {
		var1,
		p1.currentParentChannelId,
		var2.fetchParentChannelDetails
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref)
		if p1.currentParentChannelId and p1.currentParentChannelId ~= "" then
			var2.fetchParentChannelDetails(var1, p1.currentParentChannelId)
		end
	end, {
		var1,
		p1.currentParentChannelId,
		var2.fetchParentChannelDetails
	})
	
	return nil
end