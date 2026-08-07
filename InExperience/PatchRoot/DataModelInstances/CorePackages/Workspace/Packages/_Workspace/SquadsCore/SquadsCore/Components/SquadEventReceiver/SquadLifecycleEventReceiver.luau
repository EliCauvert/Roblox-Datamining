local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local messageBusService = game:GetService("MessageBusService")
local constantsModule = require(squadsCore.Common.Constants)
local loggerModule = require(squadsCore.Logger)
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadStateModule = require(squadsCore.Enums.SquadState)
local squadViewFlagsModule = require(squadsCore.Components.SquadExternalContractProvider.SquadViewFlags)
local fetchActiveSquadModule = require(squadsCore.Thunks.fetchActiveSquad)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local useSquadStateModule = require(squadsCore.Hooks.useSquadState)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local luauPolyfillModule = require(parent.LuauPolyfill)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local clearInterval = luauPolyfillModule.clearInterval
local clearTimeout = luauPolyfillModule.clearTimeout
local setInterval = luauPolyfillModule.setInterval
local setTimeout = luauPolyfillModule.setTimeout
local activeSquadPollingCardIntervalSeconds = game:DefineFastInt("ActiveSquadPollingCardIntervalSeconds", 30)
local activeSquadPollingLobbyIntervalSeconds = game:DefineFastInt("ActiveSquadPollingLobbyIntervalSeconds", 60)
local activeSquadPollingIdleIntervalSeconds = game:DefineFastInt("ActiveSquadPollingIdleIntervalSeconds", 120)
local activeSquadInitPollingDelaySeconds = game:DefineFastInt("ActiveSquadInitPollingDelaySeconds", 3)
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")

return function(p0) --[[ line: 41 ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContextModule (ref), useSquadStateModule (ref), setTimeout (ref), fetchActiveSquadModule (ref), activeSquadInitPollingDelaySeconds (ref), clearTimeout (ref), squadViewFlagsModule (ref), activeSquadPollingCardIntervalSeconds (ref), activeSquadPollingLobbyIntervalSeconds (ref), activeSquadPollingIdleIntervalSeconds (ref), setInterval (ref), clearInterval (ref), realtimeDeliveryModule (ref), constantsModule (ref), loggerModule (ref), serializeTableModule (ref), roduxSquadsModule (ref), squadStateModule (ref), messageBusService (ref), realtimeMessageId (ref)
	local var19 = useDispatch()
	local var20 = tonumber(useLocalUserId()) or 0
	local var21, var22 = reactModule.useState(false)
	local var23 = reactModule.useContext(squadExternalContractContextModule).useSquadViewFlags()
	local var24 = useSquadStateModule()
	local var25, var26 = reactModule.useState(-1)
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var22 (ref), p0 (ref), setTimeout (copy), var19 (ref), fetchActiveSquadModule (copy), activeSquadInitPollingDelaySeconds (copy), clearTimeout (copy)
		var22(false)
		local var28 = if p0.currentSquadId ~= "" then nil else setTimeout(function() --[[ line: 57 ]]
			-- upvalues: var19 (copy), fetchActiveSquadModule (copy), var22 (copy)
			var19(fetchActiveSquadModule())
			var22(true)
		end, activeSquadInitPollingDelaySeconds * 1000)
		
		return function() --[[ line: 63 ]]
			-- upvalues: var28 (ref), clearTimeout (copy)
			if var28 then
				clearTimeout(var28)
			end
		end
	end, { p0.currentSquadId })
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var23 (ref), squadViewFlagsModule (copy), activeSquadPollingCardIntervalSeconds (copy), activeSquadPollingLobbyIntervalSeconds (copy), activeSquadPollingIdleIntervalSeconds (copy), var21 (ref), p0 (ref), setInterval (copy), var19 (ref), fetchActiveSquadModule (copy), clearInterval (copy)
		local _ = nil
		local var29 = if var21 and p0.currentSquadId ~= "" then setInterval(function() --[[ line: 85 ]]
			-- upvalues: var19 (copy), fetchActiveSquadModule (copy)
			var19(fetchActiveSquadModule())
		end, (if bit32.band(var23, squadViewFlagsModule.SquadSystemMessage) ~= 0 then if bit32.band(var23, squadViewFlagsModule.SquadLobby) ~= 0 then activeSquadPollingIdleIntervalSeconds else activeSquadPollingLobbyIntervalSeconds else activeSquadPollingCardIntervalSeconds) * 1000) else nil
		
		return function() --[[ line: 90 ]]
			-- upvalues: var29 (write), clearInterval (copy)
			if var29 then
				clearInterval(var29)
			end
		end
	end, { p0.currentSquadId, var23, var25, var21 })
	local var27 = reactModule.useCallback(function(p1) --[[ line: 101 ]]
		-- upvalues: var25 (ref), var19 (ref), fetchActiveSquadModule (copy), var26 (ref)
		if var25 < p1 then
			var19(fetchActiveSquadModule()):andThen(function() --[[ line: 103 ]]
				-- upvalues: var26 (copy), p1 (ref)
				var26(p1)
			end)
		end
	end, { var19, fetchActiveSquadModule, var26, var25 })
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2) --[[ line: 110 ]]
		-- upvalues: constantsModule (copy), loggerModule (copy), serializeTableModule (copy), p0 (ref), var20 (ref), var19 (ref), roduxSquadsModule (copy), var27 (ref), var24 (ref), squadStateModule (copy)
		if p2.ChannelType == constantsModule.SQUAD_CHANNEL_TYPE then
			loggerModule:debug("Squad RTN received. Detail: {}, CurrentSquadId: {}, LocalUserId: {}", serializeTableModule(p2), p0.currentSquadId, var20)
			
			if p0.currentSquadId == p2.ChannelId then
				if p2.Type == constantsModule.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_DELETED_DETAIL_TYPE then
					var19(roduxSquadsModule.Actions.CurrentSquadUpdated(nil))
					
					return
				elseif p2.Type == constantsModule.CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE or (p2.Type == constantsModule.CHANNEL_UPDATED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_PARTICIPANT_INVITED_DETAIL_TYPE) then
					var27(p2.SequenceNumber)
					
					return
				end
			elseif var24 ~= squadStateModule.Initializing then
				if p2.Type == constantsModule.CHANNEL_CREATED_DETAIL_TYPE and (p2.Actor and (p2.Actor.Type == "User" and p2.Actor.Id == tostring(var20))) then
					var27(p2.SequenceNumber)
					
					return
				elseif p2.Type == constantsModule.CHANNEL_LOCAL_USER_ADDED_DETAIL_TYPE then
					var27(p2.SequenceNumber)
				end
			end
		end
	end, {
		p0.currentSquadId,
		var19,
		var20,
		var27,
		var24
	})
	reactModule.useEffect(function() --[[ line: 166 ]]
		-- upvalues: messageBusService (copy), realtimeMessageId (copy), p0 (ref), var19 (ref), fetchActiveSquadModule (copy)
		local var30 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 167 ]]
			-- upvalues: p0 (copy), var19 (copy), fetchActiveSquadModule (copy)
			if p0.currentSquadId ~= "" then
				var19(fetchActiveSquadModule())
			end
		end, false, true)
		
		return function() --[[ line: 172 ]]
			-- upvalues: var30 (ref)
			if var30 then
				var30:Disconnect()
			end
		end
	end, { p0.currentSquadId, var19 })
	
	return nil
end