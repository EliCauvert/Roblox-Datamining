local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local TutilsModule = require(Parent.tutils)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiErrors)
local FFlagLuaAppAddHasOneByTwoField = require(Parent.SharedFlags).FFlagLuaAppAddHasOneByTwoField
local FFlagLuaAppAddHasOneByTwoFieldSdui = require(Parent.SharedFlags).FFlagLuaAppAddHasOneByTwoFieldSdui
local config = {
	eventName = "DiscoverySdui_ErrorDetails",
	description = "Error details related to discovery server-driven ui",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoverySduiErrorHundredthsPercent", 0),
	lastUpdated = { 24, 11, 4 }
}
local config1 = {
	eventName = "DiscoverySdui_ErrorCounter",
	throttlingPercentage = 0,
	description = "Error related to discovery server-driven ui",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 12, 14 }
}
local config2 = {
	eventName = "DiscoverySdui_Timers",
	description = "Timers related to discovery server-driven ui",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoverySduiTimerEventsHundredthsPercent", 0),
	lastUpdated = { 25, 3, 14 }
}
local config3 = {
	eventName = "DiscoverySdui_FeedStats",
	description = "Stats for feed response. Number of items per collection",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryFeedStatsHundredthsPercent", 0),
	lastUpdated = { 25, 5, 27 }
}

local function _(p1, p2): string
	return `{p1}_{p2.name}_{p2.componentType}_{p2.parserName}_{p2.propName}`
end

local t = {}

return {
	clearSeenErrors = function()
		-- upvalues: t (ref)
		t = {}
	end,
	reportError = function(ErrorType, p1, Page, p2)
		-- upvalues: LoggingProtocolModule (copy), t (ref), config1 (copy), config (copy), CryoModule (copy), TutilsModule (copy)
		local P5 = p2 or LoggingProtocolModule.default
		assert(P5, "loggingProtocol must exist")
		local Text: string = `{ErrorType}_{p1.name}_{p1.componentType}_{p1.parserName}_{p1.propName}`
		
		if t[Text] then return end
		t[Text] = true
		P5:logRobloxTelemetryCounter(config1, 1, {
			errorType = ErrorType,
			name = if p1 then p1.name else nil,
			componentType = if p1 then p1.componentType else nil,
			propName = if p1 then p1.propName else nil,
			parserName = if p1 then p1.parserName else nil,
			page = Page
		})
		P5:logRobloxTelemetryEvent(config, {
			"addSessionInfo",
			LoggingProtocolModule.StandardizedFields.addOsInfo
		}, CryoModule.Dictionary.union({ errorType = ErrorType, page = Page }, p1 or {}), Page)
		
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn(`Discovery server-driven ui error \n{ErrorType} \n{TutilsModule.toString(p1)}`)
		end
	end,
	reportCounter = function(p1, p2, p3, p4)
		-- upvalues: LoggingProtocolModule (copy), TutilsModule (copy)
		local P9 = p4 or LoggingProtocolModule.default
		assert(P9, "loggingProtocol must exist")
		P9:logRobloxTelemetryCounter({
			throttlingPercentage = 0,
			description = "Counters related to discovery server-driven ui",
			eventName = `DiscoverySdui_Counter_{p1}`,
			backends = { LoggingProtocolModule.TelemetryBackends.Counter },
			lastUpdated = { 25, 2, 5 }
		}, 1, if p2 then {
			name = if p2 then p2.name else nil,
			componentType = if p2 then p2.componentType else nil,
			propName = if p2 then p2.propName else nil,
			parserName = if p2 then p2.parserName else nil
		} else nil)
		
		if not p3 and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
			warn(`Discovery server-driven ui counter \n{p1} \n{TutilsModule.toString(p2)}`)
		end
	end,
	reportTimers = function(List, p1, p2)
		-- upvalues: LoggingProtocolModule (copy), config2 (copy)
		local P12 = p2 or LoggingProtocolModule.default
		assert(P12, "loggingProtocol must exist")
		
		for Flow, value in List do
			P12:logRobloxTelemetryEvent(config2, {
				"addSessionInfo",
				LoggingProtocolModule.StandardizedFields.addOsInfo
			}, {
				flow = Flow,
				durationMs = value.durationMs,
				count = value.count,
				failed = value.failed
			}, p1)
		end
	end,
	reportOmniFeedStats = function(List, p3, AppPage, SduiResponseRequestId, p4, HasOneByTwo)
		-- upvalues: LoggingProtocolModule (copy), FFlagLuaAppAddHasOneByTwoField (copy), config3 (copy)
		local P17 = p4 or LoggingProtocolModule.default
		assert(P17, "loggingProtocol must exist")
		
		if not List then return end
		local P14 = p3 or {}
		local t = {}
		local t1 = {}
		local Items = nil
		local Count = nil
		
		for _, value in List do
			if value.topicId then
				local IsSdui = value.treatmentType == "sdui"
				t1[value.topicId] = IsSdui
				
				if IsSdui then
					Count = 0
					local FeedItems = P14.feed and (P14.feed.props and P14.feed.props.feedItems)
					
					if FeedItems then
						for _, feedItem in FeedItems do
							if feedItem.feedItemKey == value.feedItemKey then
								Items = feedItem.props and feedItem.props.items
								
								if Items then
									Count = #Items
									break
								else
									if not feedItem.props or not feedItem.props.item then break end
									Count = 1
									break
								end
							end
						end
					end
					t[value.topicId] = (t[value.topicId] or 0) + Count
					continue
				else
					t[value.topicId] = (t[value.topicId] or 0) + (value.recommendationList and #value.recommendationList or 0)
				end
			end
		end
		local t2 = {}
		
		for i, value1 in t do
			t2[`{i}_item_count`] = value1
			t2[`{i}_is_sdui`] = if t1[i] then 1 else 0
		end
		t2.appPage = AppPage
		t2.sduiResponseRequestId = SduiResponseRequestId
		
		if FFlagLuaAppAddHasOneByTwoField then
			t2.hasOneByTwo = HasOneByTwo
		end
		P17:logRobloxTelemetryEvent(config3, {
			"addSessionInfo",
			LoggingProtocolModule.StandardizedFields.addOsInfo
		}, t2, AppPage)
	end,
	reportSduiV2FeedStats = if require(Parent.SharedFlags).FFlagLuaAppSduiHomeFeedStats then function(List, AppPage, SduiResponseRequestId, p5, HasOneByTwo)
		-- upvalues: LoggingProtocolModule (copy), FFlagLuaAppAddHasOneByTwoFieldSdui (copy), config3 (copy)
		local P22 = p5 or LoggingProtocolModule.default
		assert(P22, "loggingProtocol must exist")
		
		if next(List) == nil then return end
		local ItemCounts = {}
		
		for i, value in List do
			if value.itemCount ~= nil then
				ItemCounts[`{i}_item_count`] = value.itemCount
			end
			ItemCounts[`{i}_is_sdui`] = 1
			ItemCounts[`{i}_position`] = value.position
		end
		ItemCounts.appPage = AppPage
		ItemCounts.sduiResponseRequestId = SduiResponseRequestId
		ItemCounts.feedSource = "SduiV2FullPage"
		
		if FFlagLuaAppAddHasOneByTwoFieldSdui then
			ItemCounts.hasOneByTwo = HasOneByTwo
		end
		P22:logRobloxTelemetryEvent(config3, {
			"addSessionInfo",
			LoggingProtocolModule.StandardizedFields.addOsInfo
		}, ItemCounts, AppPage)
	end else nil
}