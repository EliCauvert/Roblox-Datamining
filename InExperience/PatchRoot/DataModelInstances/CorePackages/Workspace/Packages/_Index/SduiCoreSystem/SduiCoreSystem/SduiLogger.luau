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

local function _(p1, p2)
	return `{p1}_{p2.name}_{p2.componentType}_{p2.parserName}_{p2.propName}`
end

local t_4 = {}

return {
	clearSeenErrors = function()
		-- upvalues: t_4 (write)
		t_4 = {}
	end,
	reportError = function(p1, p2, p3, p4)
		-- upvalues: loggingProtocolModule (ref), t_4 (write), t_1 (ref), t (ref), cryoModule (ref), tutilsModule (ref)
		p4 = p4 or loggingProtocolModule.default
		assert(p4, "loggingProtocol must exist")
		local var1 = `{p1}_{p2.name}_{p2.componentType}_{p2.parserName}_{p2.propName}`
		
		if t_4[var1] then return end
		t_4[var1] = true
		p4:logRobloxTelemetryCounter(t_1, 1, {
			errorType = p1,
			name = if p2 then p2.name else nil,
			componentType = if p2 then p2.componentType else nil,
			propName = if p2 then p2.propName else nil,
			parserName = if p2 then p2.parserName else nil,
			page = p3
		})
		p4:logRobloxTelemetryEvent(t, {
			"addSessionInfo",
			loggingProtocolModule.StandardizedFields.addOsInfo
		}, cryoModule.Dictionary.union({ errorType = p1, page = p3 }, p2 or {}), p3)
		
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn(`Discovery server-driven ui error \n{p1} \n{tutilsModule.toString(p2)}`)
		end
	end,
	reportCounter = function(p1, p2, p3, p4)
		-- upvalues: loggingProtocolModule (ref), tutilsModule (ref)
		p4 = p4 or loggingProtocolModule.default
		assert(p4, "loggingProtocol must exist")
		p4:logRobloxTelemetryCounter({
			throttlingPercentage = 0,
			description = "Counters related to discovery server-driven ui",
			eventName = `DiscoverySdui_Counter_{p1}`,
			backends = { loggingProtocolModule.TelemetryBackends.Counter },
			lastUpdated = { 25, 2, 5 }
		}, 1, if p2 then {
			name = if p2 then p2.name else nil,
			componentType = if p2 then p2.componentType else nil,
			propName = if p2 then p2.propName else nil,
			parserName = if p2 then p2.parserName else nil
		} else nil)
		
		if not p3 and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
			warn(`Discovery server-driven ui counter \n{p1} \n{tutilsModule.toString(p2)}`)
		end
	end,
	reportTimers = function(p1, p2, p3)
		-- upvalues: loggingProtocolModule (ref), t_2 (ref)
		p3 = p3 or loggingProtocolModule.default
		assert(p3, "loggingProtocol must exist")
		
		for i, v in p1 do
			p3:logRobloxTelemetryEvent(t_2, {
				"addSessionInfo",
				loggingProtocolModule.StandardizedFields.addOsInfo
			}, {
				flow = i,
				durationMs = v.durationMs,
				count = v.count,
				failed = v.failed
			}, p2)
		end
	end,
	reportOmniFeedStats = function(p4, p5, p6, p7, p8)
		-- upvalues: loggingProtocolModule (ref), t_3 (ref)
		p8 = p8 or loggingProtocolModule.default
		assert(p8, "loggingProtocol must exist")
		
		if not p4 then return end
		local var1, items
		p5 = p5 or {}
		local t = {}
		local t_1 = {}
		
		for i, v in p4 do
			if v.topicId then
				local isSdui = v.treatmentType == "sdui"
				t_1[v.topicId] = isSdui
				
				if isSdui then
					var1 = 0
					local feedItems = p5.feed and (p5.feed.props and p5.feed.props.feedItems)
					
					if feedItems then
						for i_2, v_1 in feedItems do
							if v_1.feedItemKey == v.feedItemKey then
								items = v_1.props and v_1.props.items
								
								if items then
									var1 = #items
									break
								elseif not v_1.props or not v_1.props.item then
									break
								end
								var1 = 1
								break
							end
						end
					end
					t[v.topicId] = (t[v.topicId] or 0) + var1
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
		t_2.appPage = p6
		t_2.sduiResponseRequestId = p7
		p8:logRobloxTelemetryEvent(t_3, {
			"addSessionInfo",
			loggingProtocolModule.StandardizedFields.addOsInfo
		}, t_2, p6)
	end
}