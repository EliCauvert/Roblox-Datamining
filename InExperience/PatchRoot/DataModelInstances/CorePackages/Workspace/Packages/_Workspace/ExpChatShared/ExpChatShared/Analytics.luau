local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local textChatService = game:GetService("TextChatService")
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local dictionary = require(expChatShared.Parent.llama).Dictionary
local var4 = require(expChatShared.Logger):new("ExpChat/" .. script.Name)
local t = {}
local var6 = rbxAnalyticsService

local function withDefaultArgs(p0) --[[ line: 17 ]]
	-- upvalues: dictionary (ref)
	return dictionary.join(p0, {
		gameId = tostring(game.GameId),
		placeId = tostring(game.PlaceId)
	})
end

local function setRbxEventStream(value, p1, p2, p3) --[[ line: 24 ]]
	-- upvalues: var6 (write), var4 (ref), withDefaultArgs (ref)
	if var6 then
		var4:debug("Event: {}", p2)
		var6:SetRBXEventStream(value, p1, p2, withDefaultArgs(p3 or {}))
	end
end

local function sendEventDeferred(p4, p5, p6, p7) --[[ line: 31 ]]
	-- upvalues: var6 (write), var4 (ref), withDefaultArgs (ref)
	if var6 then
		var4:debug("SendEventDeferred: {}", p6)
		var6:SendEventDeferred(p4, p5, p6, withDefaultArgs(p7 or {}))
	end
end

function t.with(p8) --[[ line: 38 ]]
	-- upvalues: var6 (write), rbxAnalyticsService (ref)
	var6 = p8 or rbxAnalyticsService
end

function t.FireRccAnalyticsWithEventName(p9, p10) --[[ line: 42 ]]
	-- upvalues: setRbxEventStream (ref)
	setRbxEventStream("rcc", "experienceChat", p9, p10)
end

function t.FireClientAnalyticsWithEventName(p11, p12) --[[ line: 46 ]]
	-- upvalues: setRbxEventStream (ref)
	setRbxEventStream("client", "experienceChat", p11, p12)
end

function t.reportCounter(p13, p14) --[[ line: 50 ]]
	-- upvalues: var6 (write), var4 (ref)
	if var6 then
		var4:debug("Counter: {}", p13)
		var6:ReportCounter(p13, p14 or 1)
	end
end

t.ExpChatChatEnabledUserCountFetchConfig = {
	eventName = "ExpChatChatEnabledUserCountFetch",
	description = "Counts successful and failed attempts to fetch the local chat-enabled system message user count.",
	links = "",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 7, 22 }
}

function t.reportChatEnabledUserCountFetchResult(p15) --[[ line: 65 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogCounter(t.ExpChatChatEnabledUserCountFetchConfig, {
		customFields = { result = if p15 then "success" else "failure" }
	}, 1)
end

function t.FireRccAnalyticsDeferred(p16, p17) --[[ line: 73 ]]
	-- upvalues: sendEventDeferred (ref)
	sendEventDeferred("RCC", "experienceChat", p16, p17)
end

function t.TelemetryLogEvent(_, p18, p19, p20) --[[ line: 77 ]]
	-- upvalues: telemetryService (ref)
	telemetryService:LogEvent(p18, { customFields = p19, standardizedFields = p20 })
end

t.DefaultStandardizedFields = {
	"addOSInfo",
	"addSessionInfo",
	"addUniverseId",
	"addPlaceId"
}

function t.reportTextChatCommandClientSent(p21, p22) --[[ line: 83 ]]
	-- upvalues: textChatService (ref)
	textChatService:SendTextChatCommandClientSent(p22)
	p21.FireClientAnalyticsWithEventName("CommandSent", { commandName = p22 })
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