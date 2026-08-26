local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local textChatService = game:GetService("TextChatService")
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local dictionary = require(expChatShared.Parent.llama).Dictionary
local var1 = require(expChatShared.Logger):new("ExpChat/" .. script.Name)
local t = {}
local var2 = rbxAnalyticsService

local function withDefaultArgs(p1)
	-- upvalues: dictionary (ref)
	return dictionary.join(p1, {
		gameId = tostring(game.GameId),
		placeId = tostring(game.PlaceId)
	})
end

local function setRbxEventStream(value, p1, p2, p3)
	-- upvalues: var2 (write), var1 (ref), withDefaultArgs (ref)
	if var2 then
		var1:debug("Event: {}", p2)
		var2:SetRBXEventStream(value, p1, p2, withDefaultArgs(p3 or {}))
	end
end

local function sendEventDeferred(p1, p2, p3, p4)
	-- upvalues: var2 (write), var1 (ref), withDefaultArgs (ref)
	if var2 then
		var1:debug("SendEventDeferred: {}", p3)
		var2:SendEventDeferred(p1, p2, p3, withDefaultArgs(p4 or {}))
	end
end

function t.with(p1)
	-- upvalues: var2 (write), rbxAnalyticsService (ref)
	var2 = p1 or rbxAnalyticsService
end

function t.FireRccAnalyticsWithEventName(p1, p2)
	-- upvalues: setRbxEventStream (ref)
	setRbxEventStream("rcc", "experienceChat", p1, p2)
end

function t.FireClientAnalyticsWithEventName(p1, p2)
	-- upvalues: setRbxEventStream (ref)
	setRbxEventStream("client", "experienceChat", p1, p2)
end

function t.reportCounter(p1, p2)
	-- upvalues: var2 (write), var1 (ref)
	if var2 then
		var1:debug("Counter: {}", p1)
		var2:ReportCounter(p1, p2 or 1)
	end
end

t.ExpChatChatEnabledUserCountFetchConfig = {
	eventName = "ExpChatChatEnabledUserCountFetch",
	description = "Counts successful and failed attempts to fetch the local chat-enabled system message user count.",
	links = "",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 7, 22 }
}

function t.reportChatEnabledUserCountFetchResult(p1)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogCounter(t.ExpChatChatEnabledUserCountFetchConfig, {
		customFields = { result = if p1 then "success" else "failure" }
	}, 1)
end

function t.FireRccAnalyticsDeferred(p1, p2)
	-- upvalues: sendEventDeferred (ref)
	sendEventDeferred("RCC", "experienceChat", p1, p2)
end

function t.TelemetryLogEvent(_, p1, p2, p3)
	-- upvalues: telemetryService (ref)
	telemetryService:LogEvent(p1, { customFields = p2, standardizedFields = p3 })
end

t.DefaultStandardizedFields = {
	"addOSInfo",
	"addSessionInfo",
	"addUniverseId",
	"addPlaceId"
}

function t.reportTextChatCommandClientSent(p1, p2)
	-- upvalues: textChatService (ref)
	textChatService:SendTextChatCommandClientSent(p2)
	p1.FireClientAnalyticsWithEventName("CommandSent", { commandName = p2 })
end

t.RewriteDropdownToggledConfig = {
	eventName = "RewriteDropdownToggled",
	description = "When a user activates the AI rewrite dropdown toggle on a rewritten chat message.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatRewriteDropdownToggledThrottlePerMyriad", 10000),
	lastUpdated = { 26, 4, 21 }
}
t.ExpChatGlobalChatTabClickedConfig = {
	eventName = "ExpChatGlobalChatTabClicked",
	description = "When a user selects the Global channel tab in the experience chat channel bar.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatGlobalChatTabClickedThrottlePerMyriad", 0),
	lastUpdated = { 26, 5, 13 }
}
t.ExpChatTabClickedConfig = {
	eventName = "ExpChatTabClicked",
	description = "When a user clicks any tab in the experience chat channel bar.",
	links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4777640083/Friends+Chat+In+Exp+Tech+Spec#Experience-Chat-Tab-Events-Proposal",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatTabClickedThrottlePerMyriad", 10000),
	lastUpdated = { 26, 8, 12 }
}
t.ExpChatTabImpressionConfig = {
	eventName = "ExpChatTabImpression",
	description = "When an experience chat tab is rendered or a tracked field (index, overflow, visibility, badge count) changes.",
	links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4777640083/Friends+Chat+In+Exp+Tech+Spec#Experience-Chat-Tab-Events-Proposal",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatTabImpressionThrottlePerMyriad", 10000),
	lastUpdated = { 26, 7, 27 }
}
t.ExpChatPresetActionConfig = {
	eventName = "ExpChatPresetAction",
	description = "When a user interacts with the preset chat UI.",
	links = "https://roblox.atlassian.net/browse/EXPCHAT-1243",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatPresetActionThrottlePerMyriad", 10000),
	lastUpdated = { 26, 6, 1 }
}

return t