local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local chatActiveFilterModule = require(appChat.Analytics.Enums.ChatActiveFilter)
local chatLandingTelemetryEventsModule = require(appChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)

return function(p1, p2)
	-- upvalues: chatLandingTelemetryStateModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), reactModule (ref), cryoModule (ref), httpService (ref), chatActiveFilterModule (ref), chatLandingTelemetryEventsModule (ref)
	local var1 = chatLandingTelemetryStateModule.useMergeState()
	local var2 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(var2.emit)
	var5.current = var2.emit
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var1 (ref), cryoModule (copy)
		if var3.current == nil then
			return
		end
		var3.current = nil
		var1({
			searchSessionId = cryoModule.None,
			activeFilters = cryoModule.None
		})
	end, { var1 })
	
	if p1 and var3.current == nil then
		var3.current = httpService:GenerateGUID(false)
		var1({
			searchSessionId = var3.current,
			activeFilters = {
				if p2 then chatActiveFilterModule.SearchServer else chatActiveFilterModule.SearchClient
			}
		})
	elseif not p1 then
		var6()
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var4 (ref), var5 (ref), chatLandingTelemetryEventsModule (copy)
		if not p1 then return end
		local current = var3.current
		
		if current == nil or var4.current == current then
			return
		end
		var4.current = current
		var5.current(chatLandingTelemetryEventsModule.SearchStarted, {})
	end, { p1, p2, var1, var6 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return var6
	end, {})
end