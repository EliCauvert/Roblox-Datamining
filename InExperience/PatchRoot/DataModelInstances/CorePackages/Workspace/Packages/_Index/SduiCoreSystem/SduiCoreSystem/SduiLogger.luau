local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local loggingProtocolModule = require(parent.LoggingProtocol)
local tutilsModule = require(parent.tutils)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiErrors)
local discoverySduiErrorHundredthsPercent = game:DefineFastInt("DiscoverySduiErrorHundredthsPercent", 0)
local discoverySduiTimerEventsHundredthsPercent = game:DefineFastInt("DiscoverySduiTimerEventsHundredthsPercent", 0)
local discoveryFeedStatsHundredthsPercent = game:DefineFastInt("DiscoveryFeedStatsHundredthsPercent", 0)
local luaAppSduiErrorPage = game:DefineFastFlag("LuaAppSduiErrorPage", false)
local t = {
	eventName = "DiscoverySdui_ErrorDetails",
	description = "Error details related to discovery server-driven ui",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = discoverySduiErrorHundredthsPercent,
	lastUpdated = { 24, 11, 4 }
}
local t_1 = {
	eventName = "DiscoverySdui_ErrorCounter",
	throttlingPercentage = 0,
	description = "Error related to discovery server-driven ui",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 12, 14 }
}
local t_2 = {
	eventName = "DiscoverySdui_Timers",
	description = "Timers related to discovery server-driven ui",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = discoverySduiTimerEventsHundredthsPercent,
	lastUpdated = { 25, 3, 14 }
}
local t_3 = {
	eventName = "DiscoverySdui_FeedStats",
	description = "Stats for feed response. Number of items per collection",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = discoveryFeedStatsHundredthsPercent,
	lastUpdated = { 25, 5, 27 }
}

local function _(p0, p1) --[[ line: 70 | named "makeErrorKey" ]]
	return `{p0}_{p1.name}_{p1.componentType}_{p1.parserName}_{p1.propName}`
end

local t_4 = {}

return {
	clearSeenErrors = function() --[[ line: 76 ]]
		-- upvalues: t_4 (write)
		t_4 = {}
	end,
	reportError = function(p2, p3, p4, p5) --[[ line: 80 ]]
		-- upvalues: loggingProtocolModule (ref), t_4 (write), t_1 (ref), t (ref), cryoModule (ref), luaAppSduiErrorPage (ref), tutilsModule (ref)
		p5 = p5 or loggingProtocolModule.default
		assert(p5, "loggingProtocol must exist")
		local var14 = `{p2}_{p3.name}_{p3.componentType}_{p3.parserName}_{p3.propName}`
		
		if t_4[var14] then return end
		t_4[var14] = true
		p5:logRobloxTelemetryCounter(t_1, 1, {
			errorType = p2,
			name = if p3 then p3.name else nil,
			componentType = if p3 then p3.componentType else nil,
			propName = if p3 then p3.propName else nil,
			parserName = if p3 then p3.parserName else nil,
			page = p4
		})
		p5:logRobloxTelemetryEvent(t, {
			"addSessionInfo",
			loggingProtocolModule.StandardizedFields.addOsInfo
		}, cryoModule.Dictionary.union({
			errorType = p2,
			page = if luaAppSduiErrorPage then p4 else nil
		}, p3 or {}), p4)
		
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn(`Discovery server-driven ui error \n{p2} \n{tutilsModule.toString(p3)}`)
		end
	end,
	reportCounter = function(p6, p7, p8, p9) --[[ line: 128 ]]
		-- upvalues: loggingProtocolModule (ref), tutilsModule (ref)
		p9 = p9 or loggingProtocolModule.default
		assert(p9, "loggingProtocol must exist")
		p9:logRobloxTelemetryCounter({
			throttlingPercentage = 0,
			description = "Counters related to discovery server-driven ui",
			eventName = `DiscoverySdui_Counter_{p6}`,
			backends = { loggingProtocolModule.TelemetryBackends.Counter },
			lastUpdated = { 25, 2, 5 }
		}, 1, if p7 then {
			name = if p7 then p7.name else nil,
			componentType = if p7 then p7.componentType else nil,
			propName = if p7 then p7.propName else nil,
			parserName = if p7 then p7.parserName else nil
		} else nil)
		
		if not p8 and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
			warn(`Discovery server-driven ui counter \n{p6} \n{tutilsModule.toString(p7)}`)
		end
	end,
	reportTimers = function(p10, p11, p12) --[[ line: 164 ]]
		-- upvalues: loggingProtocolModule (ref), t_2 (ref)
		p12 = p12 or loggingProtocolModule.default
		assert(p12, "loggingProtocol must exist")
		
		for i, v in p10 do
			p12:logRobloxTelemetryEvent(t_2, {
				"addSessionInfo",
				loggingProtocolModule.StandardizedFields.addOsInfo
			}, {
				flow = i,
				durationMs = v.durationMs,
				count = v.count,
				failed = v.failed
			}, p11)
		end
	end,
	reportOmniFeedStats = function(p13, p14, p15, p16, p17) --[[ line: 190 ]]
		-- upvalues: loggingProtocolModule (ref), t_3 (ref)
		p17 = p17 or loggingProtocolModule.default
		assert(p17, "loggingProtocol must exist")
		
		if not p13 then return end
		local var23, items
		p14 = p14 or {}
		local t = {}
		local t_1 = {}
		
		for i, v in p13 do
			if v.topicId then
				local isSdui = v.treatmentType == "sdui"
				t_1[v.topicId] = isSdui
				
				if isSdui then
					var23 = 0
					local feedItems = p14.feed and (p14.feed.props and p14.feed.props.feedItems)
					
					if feedItems then
						for i_2, v_1 in feedItems do
							if v_1.feedItemKey == v.feedItemKey then
								items = v_1.props and v_1.props.items
								
								if items then
									var23 = #items
									break
								elseif not v_1.props or not v_1.props.item then
									break
								end
								var23 = 1
								break
							end
						end
					end
					t[v.topicId] = (t[v.topicId] or 0) + var23
				else
					t[v.topicId] = (t[v.topicId] or 0) + (if v.recommendationList then #v.recommendationList else 0)
				end
			end
		end
		local t_2 = {}
		
		for v, v_1 in t do
			t_2[`{v}_item_count`] = v_1
			t_2[`{v}_is_sdui`] = if t_1[v] then 1 else 0
		end
		t_2.appPage = p15
		t_2.sduiResponseRequestId = p16
		p17:logRobloxTelemetryEvent(t_3, {
			"addSessionInfo",
			loggingProtocolModule.StandardizedFields.addOsInfo
		}, t_2, p15)
	end
}