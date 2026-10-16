local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatSearchResultTypeModule = require(AppChat.Analytics.Enums.ChatSearchResultType)
local _ = require(AppChat.Hooks.useConversationSearch)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)

return function(p1, p2) --[[ Line: 22 | Named "useChatSearchResultsTelemetry" ]]
	-- upvalues: UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), ReactModule (copy), ChatLandingTelemetryEventsModule (copy), ChatSearchResultTypeModule (copy)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult.emit)
	UseRefResult.current = UseTelemetryModuleResult.emit
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({ query = "", startedAt = 0 })
	local UseRefResult3 = ReactModule.useRef({ query = "", startedAt = 0 })
	local DebouncedQuery = p1.debouncedQuery
	
	if UseRefResult3.current.query ~= DebouncedQuery then
		UseRefResult2.current = {
			query = DebouncedQuery,
			startedAt = if DebouncedQuery == "" then 0 else os.clock()
		}
	end
	ReactModule.useLayoutEffect(function() --[[ Line: 40 ]]
		-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy)
		UseRefResult3.current = UseRefResult2.current
	end, { DebouncedQuery })
	local CountItems = if p2 == nil then #p1.items else p2
	local HasError = p1.hasError
	local NoIsAwaitingResults: boolean = DebouncedQuery ~= "" and (p1.isActive and not p1.isAwaitingResults)
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: NoIsAwaitingResults (copy), DebouncedQuery (copy), UseRefResult1 (copy), UseRefResult (copy), ChatLandingTelemetryEventsModule (upval), CountItems (copy), HasError (copy), ChatSearchResultTypeModule (upval), UseRefResult3 (copy)
		if NoIsAwaitingResults then
			if UseRefResult1.current ~= DebouncedQuery then
				UseRefResult1.current = DebouncedQuery
				UseRefResult.current(ChatLandingTelemetryEventsModule.SearchResultsRendered, {
					searchResultCount = CountItems,
					searchResultType = if HasError then ChatSearchResultTypeModule.Error elseif CountItems == 0 then ChatSearchResultTypeModule.NoResults else ChatSearchResultTypeModule.Results,
					searchLatencyMs = math.round((os.clock() - UseRefResult3.current.startedAt) * 1000)
				})
				
				return
			end
			return
		elseif DebouncedQuery == "" then
			UseRefResult1.current = nil
		end
	end, {
		NoIsAwaitingResults,
		DebouncedQuery,
		CountItems,
		HasError
	})
end