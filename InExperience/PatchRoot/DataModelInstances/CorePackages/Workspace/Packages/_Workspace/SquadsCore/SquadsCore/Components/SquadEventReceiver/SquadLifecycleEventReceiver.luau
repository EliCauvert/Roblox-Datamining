local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local MessageBusService = game:GetService("MessageBusService")
local ConstantsModule = require(SquadsCore.Common.Constants)
local LoggerModule = require(SquadsCore.Logger)
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadStateModule = require(SquadsCore.Enums.SquadState)
local SquadViewFlagsModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadViewFlags)
local FetchActiveSquadModule = require(SquadsCore.Thunks.fetchActiveSquad)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local UseSquadStateModule = require(SquadsCore.Hooks.useSquadState)
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ClearIntervalFunction = LuauPolyfillModule.clearInterval
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetIntervalFunction = LuauPolyfillModule.setInterval
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ActiveSquadPollingCardIntervalSeconds = game:DefineFastInt("ActiveSquadPollingCardIntervalSeconds", 30)
local ActiveSquadPollingLobbyIntervalSeconds = game:DefineFastInt("ActiveSquadPollingLobbyIntervalSeconds", 60)
local ActiveSquadPollingIdleIntervalSeconds = game:DefineFastInt("ActiveSquadPollingIdleIntervalSeconds", 120)
local ActiveSquadInitPollingDelaySeconds = game:DefineFastInt("ActiveSquadInitPollingDelaySeconds", 3)
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")

return function(p1) --[[ Line: 41 ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), UseSquadStateModule (copy), SetTimeoutFunction (copy), FetchActiveSquadModule (copy), ActiveSquadInitPollingDelaySeconds (copy), ClearTimeoutFunction (copy), SquadViewFlagsModule (copy), ActiveSquadPollingCardIntervalSeconds (copy), ActiveSquadPollingLobbyIntervalSeconds (copy), ActiveSquadPollingIdleIntervalSeconds (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy), LoggerModule (copy), SerializeTableModule (copy), RoduxSquadsModule (copy), SquadStateModule (copy), MessageBusService (copy), RealtimeMessageId (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSquadViewFlagsResult = ReactModule.useContext(SquadExternalContractContextModule).useSquadViewFlags()
	local UseSquadStateModuleResult = UseSquadStateModule()
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(-1)
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy), SetTimeoutFunction (upval), UseDispatchResult (copy), FetchActiveSquadModule (upval), ActiveSquadInitPollingDelaySeconds (upval), ClearTimeoutFunction (upval)
		UseStateResult2(false)
		local SetTimeoutResult = if p1.currentSquadId == "" then nil else SetTimeoutFunction(function() --[[ Line: 57 ]]
			-- upvalues: UseDispatchResult (upval), FetchActiveSquadModule (upval), UseStateResult2 (upval)
			UseDispatchResult(FetchActiveSquadModule())
			UseStateResult2(true)
		end, ActiveSquadInitPollingDelaySeconds * 1000)
		
		return function() --[[ Line: 63 ]]
			-- upvalues: SetTimeoutResult (copy), ClearTimeoutFunction (upval)
			if SetTimeoutResult then
				ClearTimeoutFunction(SetTimeoutResult)
			end
		end
	end, { p1.currentSquadId })
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: UseSquadViewFlagsResult (copy), SquadViewFlagsModule (upval), ActiveSquadPollingCardIntervalSeconds (upval), ActiveSquadPollingLobbyIntervalSeconds (upval), ActiveSquadPollingIdleIntervalSeconds (upval), UseStateResult (copy), p1 (copy), SetIntervalFunction (upval), UseDispatchResult (copy), FetchActiveSquadModule (upval), ClearIntervalFunction (upval)
		local ActiveSquadPollingIdleIntervalSeconds1 = if bit32.band(UseSquadViewFlagsResult, SquadViewFlagsModule.SquadSystemMessage) == 0 then if bit32.band(UseSquadViewFlagsResult, SquadViewFlagsModule.SquadLobby) == 0 then ActiveSquadPollingIdleIntervalSeconds else ActiveSquadPollingLobbyIntervalSeconds else ActiveSquadPollingCardIntervalSeconds
		local SetIntervalResult = nil
		SetIntervalResult = if UseStateResult and p1.currentSquadId ~= "" then SetIntervalFunction(function() --[[ Line: 85 ]]
			-- upvalues: UseDispatchResult (upval), FetchActiveSquadModule (upval)
			UseDispatchResult(FetchActiveSquadModule())
		end, ActiveSquadPollingIdleIntervalSeconds1 * 1000) else nil
		
		return function() --[[ Line: 90 ]]
			-- upvalues: SetIntervalResult (ref), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, {
		p1.currentSquadId,
		UseSquadViewFlagsResult,
		UseStateResult1,
		UseStateResult
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 101 ]]
		-- upvalues: UseStateResult1 (copy), UseDispatchResult (copy), FetchActiveSquadModule (upval), UseStateResult2_1 (copy)
		if UseStateResult1 < p2 then
			UseDispatchResult(FetchActiveSquadModule()):andThen(function() --[[ Line: 103 ]]
				-- upvalues: UseStateResult2_1 (upval), p2 (copy)
				UseStateResult2_1(p2)
			end)
		end
	end, {
		UseDispatchResult,
		FetchActiveSquadModule,
		UseStateResult2_1,
		UseStateResult1
	})
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2) --[[ Line: 110 ]]
		-- upvalues: ConstantsModule (upval), LoggerModule (upval), SerializeTableModule (upval), p1 (copy), Number (copy), UseDispatchResult (copy), RoduxSquadsModule (upval), UseResult (copy), UseSquadStateModuleResult (copy), SquadStateModule (upval)
		if p2.ChannelType == ConstantsModule.SQUAD_CHANNEL_TYPE then
			LoggerModule:debug("Squad RTN received. Detail: {}, CurrentSquadId: {}, LocalUserId: {}", SerializeTableModule(p2), p1.currentSquadId, Number)
			
			if p1.currentSquadId == p2.ChannelId then
				if p2.Type == ConstantsModule.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE or p2.Type == ConstantsModule.CHANNEL_DELETED_DETAIL_TYPE then
					UseDispatchResult(RoduxSquadsModule.Actions.CurrentSquadUpdated(nil))
					
					return
				end
				if p2.Type == ConstantsModule.CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE or p2.Type == ConstantsModule.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE or p2.Type == ConstantsModule.CHANNEL_UPDATED_DETAIL_TYPE or p2.Type == ConstantsModule.CHANNEL_PARTICIPANT_INVITED_DETAIL_TYPE then
					UseResult(p2.SequenceNumber)
					
					return
				end
			elseif UseSquadStateModuleResult ~= SquadStateModule.Initializing then
				local IsIdMatch: boolean = p2.Actor and (p2.Actor.Type == "User" and p2.Actor.Id == tostring(Number))
				
				if p2.Type == ConstantsModule.CHANNEL_CREATED_DETAIL_TYPE and IsIdMatch then
					UseResult(p2.SequenceNumber)
					
					return
				end
				if p2.Type == ConstantsModule.CHANNEL_LOCAL_USER_ADDED_DETAIL_TYPE then
					UseResult(p2.SequenceNumber)
				end
			end
		end
	end, {
		p1.currentSquadId,
		UseDispatchResult,
		Number,
		UseResult,
		UseSquadStateModuleResult
	})
	ReactModule.useEffect(function() --[[ Line: 166 ]]
		-- upvalues: MessageBusService (upval), RealtimeMessageId (upval), p1 (copy), UseDispatchResult (copy), FetchActiveSquadModule (upval)
		local SubscribeResult = MessageBusService:Subscribe(RealtimeMessageId, function() --[[ Line: 167 ]]
			-- upvalues: p1 (upval), UseDispatchResult (upval), FetchActiveSquadModule (upval)
			if p1.currentSquadId ~= "" then
				UseDispatchResult(FetchActiveSquadModule())
			end
		end, false, true)
		
		return function() --[[ Line: 172 ]]
			-- upvalues: SubscribeResult (copy)
			if SubscribeResult then
				SubscribeResult:Disconnect()
			end
		end
	end, { p1.currentSquadId, UseDispatchResult })
	
	return nil
end