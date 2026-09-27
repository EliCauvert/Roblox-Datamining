local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local chatLandingTelemetryEventsModule = require(appChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatSearchResultTypeModule = require(appChat.Analytics.Enums.ChatSearchResultType)
local _ = require(appChat.Hooks.useConversationSearch)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)

return function(p1, p2)
	-- upvalues: useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), reactModule (ref), chatLandingTelemetryEventsModule (ref), chatSearchResultTypeModule (ref)
	local var1 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local var2 = reactModule.useRef(var1.emit)
	var2.current = var1.emit
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef({ query = "", startedAt = 0 })
	local var5 = reactModule.useRef({ query = "", startedAt = 0 })
	local debouncedQuery = p1.debouncedQuery
	
	if var5.current.query ~= debouncedQuery then
		var4.current = {
			query = debouncedQuery,
			startedAt = if debouncedQuery == "" then 0 else os.clock()
		}
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), var4 (ref)
		var5.current = var4.current
	end, { debouncedQuery })
	local var6 = if p2 ~= nil then #p1.items else p2
	local hasError = p1.hasError
	local var7 = debouncedQuery ~= "" and (p1.isActive and not p1.isAwaitingResults)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), debouncedQuery (ref), var3 (ref), var2 (ref), chatLandingTelemetryEventsModule (copy), var6 (ref), hasError (ref), chatSearchResultTypeModule (copy), var5 (ref)
		if var7 then
			if var3.current == debouncedQuery then
				return
			end
			var3.current = debouncedQuery
			var2.current(chatLandingTelemetryEventsModule.SearchResultsRendered, {
				searchResultCount = var6,
				searchResultType = if hasError then chatSearchResultTypeModule.Error elseif var6 == 0 then chatSearchResultTypeModule.NoResults else chatSearchResultTypeModule.Results,
				searchLatencyMs = math.round((os.clock() - var5.current.startedAt) * 1000)
			})
			
			return
		elseif debouncedQuery == "" then
			var3.current = nil
		end
	end, { var7, debouncedQuery, var6, hasError })
end