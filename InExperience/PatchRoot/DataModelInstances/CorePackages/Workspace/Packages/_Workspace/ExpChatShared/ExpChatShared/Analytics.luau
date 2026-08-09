local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local dictionary = require(expChatShared.Parent.llama).Dictionary
local var3 = require(expChatShared.Logger):new("ExpChat/" .. script.Name)
local t = {}
local var5 = rbxAnalyticsService

local function withDefaultArgs(p0) --[[ line: 16 ]]
	-- upvalues: dictionary (ref)
	return dictionary.join(p0, {
		gameId = tostring(game.GameId),
		placeId = tostring(game.PlaceId)
	})
end

local function setRbxEventStream(value, p1, p2, p3) --[[ line: 23 ]]
	-- upvalues: var5 (write), var3 (ref), withDefaultArgs (ref)
	if var5 then
		var3:debug("Event: {}", p2)
		var5:SetRBXEventStream(value, p1, p2, withDefaultArgs(p3 or {}))
	end
end

local function sendEventDeferred(p4, p5, p6, p7) --[[ line: 30 ]]
	-- upvalues: var5 (write), var3 (ref), withDefaultArgs (ref)
	if var5 then
		var3:debug("SendEventDeferred: {}", p6)
		var5:SendEventDeferred(p4, p5, p6, withDefaultArgs(p7 or {}))
	end
end

function t.with(p8) --[[ line: 37 ]]
	-- upvalues: var5 (write), rbxAnalyticsService (ref)
	var5 = p8 or rbxAnalyticsService
end

function t.FireRccAnalyticsWithEventName(p9, p10) --[[ line: 41 ]]
	-- upvalues: setRbxEventStream (ref)
	setRbxEventStream("rcc", "experienceChat", p9, p10)
end

function t.FireClientAnalyticsWithEventName(p11, p12) --[[ line: 45 ]]
	-- upvalues: setRbxEventStream (ref)
	setRbxEventStream("client", "experienceChat", p11, p12)
end

function t.reportCounter(p13, p14) --[[ line: 49 ]]
	-- upvalues: var5 (write), var3 (ref)
	if var5 then
		var3:debug("Counter: {}", p13)
		var5:ReportCounter(p13, p14 or 1)
	end
end

function t.FireRccAnalyticsDeferred(p15, p16) --[[ line: 56 ]]
	-- upvalues: sendEventDeferred (ref)
	sendEventDeferred("RCC", "experienceChat", p15, p16)
end

function t.TelemetryLogEvent(_, p17, p18, p19) --[[ line: 60 ]]
	-- upvalues: telemetryService (ref)
	telemetryService:LogEvent(p17, { customFields = p18, standardizedFields = p19 })
end

t.DefaultStandardizedFields = {
	"addOSInfo",
	"addSessionInfo",
	"addUniverseId",
	"addPlaceId"
}
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
t.ExpChatPresetActionConfig = {
	eventName = "ExpChatPresetAction",
	description = "When a user interacts with the preset chat UI.",
	links = "https://roblox.atlassian.net/browse/EXPCHAT-1243",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatPresetActionThrottlePerMyriad", 10000),
	lastUpdated = { 26, 6, 1 }
}

return t