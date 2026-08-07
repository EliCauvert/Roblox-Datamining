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

return function(p0) --[[ line: 22 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), realtimeDeliveryModule (ref), constantsModule (ref), loggerModule (ref), serializeTableModule (ref), roduxSquadsModule (ref), fetchActiveSquadModule (ref)
	local var9 = useDispatch()
	local var10 = reactModule.useContext(squadExternalContractContextModule)
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p1) --[[ line: 27 ]]
		-- upvalues: constantsModule (copy), p0 (ref), loggerModule (copy), serializeTableModule (copy), var9 (ref), roduxSquadsModule (copy), fetchActiveSquadModule (copy)
		if table.find(constantsModule.PARENT_CHANNEL_TYPES, p1.ChannelType) and (p0.currentParentChannelId and p0.currentParentChannelId == p1.ChannelId) then
			loggerModule:debug("Parent squad channel RTN received. Detail: {}, CurrentParentChannelId: {}", serializeTableModule(p1), p0.currentParentChannelId)
			
			if p1.Type == constantsModule.CHANNEL_DELETED_DETAIL_TYPE or p1.Type == constantsModule.CHANNEL_ARCHIVED_DETAIL_TYPE or p1.Type == constantsModule.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE then
				var9(roduxSquadsModule.Actions.CurrentSquadUpdated(nil))
				
				return
			elseif p1.Type == constantsModule.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE then
				var9(fetchActiveSquadModule())
			end
		end
	end, {
		var9,
		p0.currentParentChannelId,
		var10.fetchParentChannelDetails
	})
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: p0 (ref), var10 (ref), var9 (ref)
		if p0.currentParentChannelId and p0.currentParentChannelId ~= "" then
			var10.fetchParentChannelDetails(var9, p0.currentParentChannelId)
		end
	end, {
		var9,
		p0.currentParentChannelId,
		var10.fetchParentChannelDetails
	})
	
	return nil
end