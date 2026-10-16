local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ChatActiveFilterModule = require(AppChat.Analytics.Enums.ChatActiveFilter)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)

return function(p1, p2) --[[ Line: 25 | Named "useChatSearchSession" ]]
	-- upvalues: ChatLandingTelemetryStateModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), ReactModule (copy), CryoModule (copy), HttpService (copy), ChatActiveFilterModule (copy), ChatLandingTelemetryEventsModule (copy)
	local UseMergeStateResult: (any) -> () = ChatLandingTelemetryStateModule.useMergeState()
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(UseTelemetryModuleResult.emit)
	UseRefResult2.current = UseTelemetryModuleResult.emit
	local UseResult: () -> () = ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: UseRefResult (copy), UseMergeStateResult (copy), CryoModule (upval)
		if UseRefResult.current ~= nil then
			UseRefResult.current = nil
			UseMergeStateResult({
				searchSessionId = CryoModule.None,
				activeFilters = CryoModule.None
			})
			
			return
		end
	end, { UseMergeStateResult })
	
	if p1 and UseRefResult.current == nil then
		UseRefResult.current = HttpService:GenerateGUID(false)
		UseMergeStateResult({
			searchSessionId = UseRefResult.current,
			activeFilters = {
				if p2 then ChatActiveFilterModule.SearchServer else ChatActiveFilterModule.SearchClient
			}
		})
	elseif not p1 then
		UseResult()
	end
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
		if not p1 then return end
		local Current = UseRefResult.current
		
		if Current ~= nil and UseRefResult1.current ~= Current then
			UseRefResult1.current = Current
			UseRefResult2.current(ChatLandingTelemetryEventsModule.SearchStarted, {})
			
			return
		end
	end, { p1, p2, UseMergeStateResult, UseResult })
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: UseResult (copy)
		return UseResult
	end, {})
end