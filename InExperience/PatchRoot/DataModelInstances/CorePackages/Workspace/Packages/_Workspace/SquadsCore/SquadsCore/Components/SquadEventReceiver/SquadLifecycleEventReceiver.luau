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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContextModule (ref), useSquadStateModule (ref), setTimeout (ref), fetchActiveSquadModule (ref), activeSquadInitPollingDelaySeconds (ref), clearTimeout (ref), squadViewFlagsModule (ref), activeSquadPollingCardIntervalSeconds (ref), activeSquadPollingLobbyIntervalSeconds (ref), activeSquadPollingIdleIntervalSeconds (ref), setInterval (ref), clearInterval (ref), realtimeDeliveryModule (ref), constantsModule (ref), loggerModule (ref), serializeTableModule (ref), roduxSquadsModule (ref), squadStateModule (ref), messageBusService (ref), realtimeMessageId (ref)
	local var1 = useDispatch()
	local var2 = tonumber(useLocalUserId()) or 0
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useContext(squadExternalContractContextModule).useSquadViewFlags()
	local var6 = useSquadStateModule()
	local var7, var8 = reactModule.useState(-1)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref), setTimeout (copy), var1 (ref), fetchActiveSquadModule (copy), activeSquadInitPollingDelaySeconds (copy), clearTimeout (copy)
		var4(false)
		local var9 = if p1.currentSquadId ~= "" then nil else setTimeout(function()
			-- upvalues: var1 (copy), fetchActiveSquadModule (copy), var4 (copy)
			var1(fetchActiveSquadModule())
			var4(true)
		end, activeSquadInitPollingDelaySeconds * 1000)
		
		return function()
			-- upvalues: var9 (ref), clearTimeout (copy)
			if var9 then
				clearTimeout(var9)
			end
		end
	end, { p1.currentSquadId })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), squadViewFlagsModule (copy), activeSquadPollingCardIntervalSeconds (copy), activeSquadPollingLobbyIntervalSeconds (copy), activeSquadPollingIdleIntervalSeconds (copy), var3 (ref), p1 (ref), setInterval (copy), var1 (ref), fetchActiveSquadModule (copy), clearInterval (copy)
		local _ = nil
		local var9 = if var3 and p1.currentSquadId ~= "" then setInterval(function()
			-- upvalues: var1 (copy), fetchActiveSquadModule (copy)
			var1(fetchActiveSquadModule())
		end, (if bit32.band(var5, squadViewFlagsModule.SquadSystemMessage) ~= 0 then if bit32.band(var5, squadViewFlagsModule.SquadLobby) ~= 0 then activeSquadPollingIdleIntervalSeconds else activeSquadPollingLobbyIntervalSeconds else activeSquadPollingCardIntervalSeconds) * 1000) else nil
		
		return function()
			-- upvalues: var9 (write), clearInterval (copy)
			if var9 then
				clearInterval(var9)
			end
		end
	end, { p1.currentSquadId, var5, var7, var3 })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var1 (ref), fetchActiveSquadModule (copy), var8 (ref)
		if var7 < p2 then
			var1(fetchActiveSquadModule()):andThen(function()
				-- upvalues: var8 (copy), p2 (ref)
				var8(p2)
			end)
		end
	end, { var1, fetchActiveSquadModule, var8, var7 })
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2)
		-- upvalues: constantsModule (copy), loggerModule (copy), serializeTableModule (copy), p1 (ref), var2 (ref), var1 (ref), roduxSquadsModule (copy), var9 (ref), var6 (ref), squadStateModule (copy)
		if p2.ChannelType == constantsModule.SQUAD_CHANNEL_TYPE then
			loggerModule:debug("Squad RTN received. Detail: {}, CurrentSquadId: {}, LocalUserId: {}", serializeTableModule(p2), p1.currentSquadId, var2)
			
			if p1.currentSquadId == p2.ChannelId then
				if p2.Type == constantsModule.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_DELETED_DETAIL_TYPE then
					var1(roduxSquadsModule.Actions.CurrentSquadUpdated(nil))
					
					return
				elseif p2.Type == constantsModule.CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE or (p2.Type == constantsModule.CHANNEL_UPDATED_DETAIL_TYPE or p2.Type == constantsModule.CHANNEL_PARTICIPANT_INVITED_DETAIL_TYPE) then
					var9(p2.SequenceNumber)
					
					return
				end
			elseif var6 ~= squadStateModule.Initializing then
				if p2.Type == constantsModule.CHANNEL_CREATED_DETAIL_TYPE and (p2.Actor and (p2.Actor.Type == "User" and p2.Actor.Id == tostring(var2))) then
					var9(p2.SequenceNumber)
					
					return
				elseif p2.Type == constantsModule.CHANNEL_LOCAL_USER_ADDED_DETAIL_TYPE then
					var9(p2.SequenceNumber)
				end
			end
		end
	end, {
		p1.currentSquadId,
		var1,
		var2,
		var9,
		var6
	})
	reactModule.useEffect(function()
		-- upvalues: messageBusService (copy), realtimeMessageId (copy), p1 (ref), var1 (ref), fetchActiveSquadModule (copy)
		local var10 = messageBusService:Subscribe(realtimeMessageId, function()
			-- upvalues: p1 (copy), var1 (copy), fetchActiveSquadModule (copy)
			if p1.currentSquadId ~= "" then
				var1(fetchActiveSquadModule())
			end
		end, false, true)
		
		return function()
			-- upvalues: var10 (ref)
			if var10 then
				var10:Disconnect()
			end
		end
	end, { p1.currentSquadId, var1 })
	
	return nil
end