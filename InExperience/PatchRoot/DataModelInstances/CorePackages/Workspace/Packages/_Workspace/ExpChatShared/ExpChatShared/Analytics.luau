local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local TextChatService = game:GetService("TextChatService")
local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Dictionary = require(ExpChatShared.Parent.llama).Dictionary
local NewResult = require(ExpChatShared.Logger):new("ExpChat/" .. script.Name)
local RbxAnalyticsService1 = RbxAnalyticsService

local function withDefaultArgs(p1)
	-- upvalues: Dictionary (copy)
	return Dictionary.join(p1, {
		gameId = tostring(game.GameId),
		placeId = tostring(game.PlaceId)
	})
end

local function setRbxEventStream(Target, EventContext, EventName, p1)
	-- upvalues: RbxAnalyticsService1 (ref), NewResult (copy), withDefaultArgs (copy)
	if RbxAnalyticsService1 then
		NewResult:debug("Event: {}", EventName)
		RbxAnalyticsService1:SetRBXEventStream(Target, EventContext, EventName, withDefaultArgs(p1 or {}))
	end
end

local function sendEventDeferred(Target, EventContext, EventName, p1)
	-- upvalues: RbxAnalyticsService1 (ref), NewResult (copy), withDefaultArgs (copy)
	if RbxAnalyticsService1 then
		NewResult:debug("SendEventDeferred: {}", EventName)
		RbxAnalyticsService1:SendEventDeferred(Target, EventContext, EventName, withDefaultArgs(p1 or {}))
	end
end

local AnalyticsModule = {
	with = function(p1)
		-- upvalues: RbxAnalyticsService1 (ref), RbxAnalyticsService (copy)
		RbxAnalyticsService1 = p1 or RbxAnalyticsService
	end,
	FireRccAnalyticsWithEventName = function(p1, p2)
		-- upvalues: setRbxEventStream (copy)
		setRbxEventStream("rcc", "experienceChat", p1, p2)
	end,
	FireClientAnalyticsWithEventName = function(p1, p2)
		-- upvalues: setRbxEventStream (copy)
		setRbxEventStream("client", "experienceChat", p1, p2)
	end
}

function AnalyticsModule.reportHistoryReplayed(ReceivedCount, KeptCount, LatencyMs)
	-- upvalues: AnalyticsModule (copy)
	AnalyticsModule.FireClientAnalyticsWithEventName("HistoryReplayed", {
		receivedCount = ReceivedCount,
		keptCount = KeptCount,
		latencyMs = LatencyMs
	})
end

function AnalyticsModule.reportCounter(CounterName, p1)
	-- upvalues: RbxAnalyticsService1 (ref), NewResult (copy)
	if RbxAnalyticsService1 then
		NewResult:debug("Counter: {}", CounterName)
		RbxAnalyticsService1:ReportCounter(CounterName, p1 or 1)
	end
end

AnalyticsModule.ExpChatChatEnabledUserCountFetchConfig = {
	eventName = "ExpChatChatEnabledUserCountFetch",
	description = "Counts successful and failed attempts to fetch the local chat-enabled system message user count.",
	links = "",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 7, 22 }
}

function AnalyticsModule.reportChatEnabledUserCountFetchResult(p1)
	-- upvalues: TelemetryService (copy), AnalyticsModule (copy)
	TelemetryService:LogCounter(AnalyticsModule.ExpChatChatEnabledUserCountFetchConfig, {
		customFields = { result = if p1 then "success" else "failure" }
	}, 1)
end

function AnalyticsModule.FireRccAnalyticsDeferred(p1, p2)
	-- upvalues: sendEventDeferred (copy)
	sendEventDeferred("RCC", "experienceChat", p1, p2)
end

function AnalyticsModule:TelemetryLogEvent(Config, CustomFields, StandardizedFields)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogEvent(Config, {
		customFields = CustomFields,
		standardizedFields = StandardizedFields
	})
end

AnalyticsModule.DefaultStandardizedFields = {
	"addOSInfo",
	"addSessionInfo",
	"addUniverseId",
	"addPlaceId"
}

function AnalyticsModule.reportTextChatCommandClientSent(p1, CommandName)
	-- upvalues: TextChatService (copy)
	TextChatService:SendTextChatCommandClientSent(CommandName)
	p1.FireClientAnalyticsWithEventName("CommandSent", { commandName = CommandName })
end

AnalyticsModule.RewriteDropdownToggledConfig = {
	eventName = "RewriteDropdownToggled",
	description = "When a user activates the AI rewrite dropdown toggle on a rewritten chat message.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatRewriteDropdownToggledThrottlePerMyriad", 10000),
	lastUpdated = { 26, 4, 21 }
}
AnalyticsModule.ExpChatGlobalChatTabClickedConfig = {
	eventName = "ExpChatGlobalChatTabClicked",
	description = "When a user selects the Global channel tab in the experience chat channel bar.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatGlobalChatTabClickedThrottlePerMyriad", 0),
	lastUpdated = { 26, 5, 13 }
}
AnalyticsModule.ExpChatTabClickedConfig = {
	eventName = "ExpChatTabClicked",
	description = "When a user clicks any tab in the experience chat channel bar.",
	links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4777640083/Friends+Chat+In+Exp+Tech+Spec#Experience-Chat-Tab-Events-Proposal",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatTabClickedThrottlePerMyriad", 10000),
	lastUpdated = { 26, 8, 12 }
}
AnalyticsModule.ExpChatTabImpressionConfig = {
	eventName = "ExpChatTabImpression",
	description = "When an experience chat tab is rendered or a tracked field (index, overflow, visibility, badge count) changes.",
	links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4777640083/Friends+Chat+In+Exp+Tech+Spec#Experience-Chat-Tab-Events-Proposal",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatTabImpressionThrottlePerMyriad", 10000),
	lastUpdated = { 26, 7, 27 }
}
AnalyticsModule.ExpChatPresetActionConfig = {
	eventName = "ExpChatPresetAction",
	description = "When a user interacts with the preset chat UI.",
	links = "https://roblox.atlassian.net/browse/EXPCHAT-1243",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatPresetActionThrottlePerMyriad", 10000),
	lastUpdated = { 26, 6, 1 }
}

return AnalyticsModule