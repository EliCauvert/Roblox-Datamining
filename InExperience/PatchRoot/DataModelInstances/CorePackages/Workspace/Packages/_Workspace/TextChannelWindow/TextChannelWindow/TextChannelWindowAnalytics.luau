local TextChatService = game:GetService("TextChatService")
local Parent = script:FindFirstAncestor("TextChannelWindow").Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local TextChannelWindowAnalyticsModule = {
	getChannelCategory = function(p1): string --[[ Line: 12 ]]
		return if p1 and p1 ~= "" then if p1:match("^RBXGeneral") then "general" elseif p1:match("^RBXTeam") then "team" elseif p1:match("^RBXWhisper") then "whisper" elseif p1:match("^RBXSystem") then "system" else "custom" else "none"
	end,
	getEnableProtectedChat = function() --[[ Line: 34 ]]
		-- upvalues: TextChatService (copy)
		return if game:GetEngineFeature("TextChatServiceProtectedChatEnabled") then TextChatService:IsProtectedChatEnabled() else false
	end
}
local Emitter = SocialLuaAnalyticsModule.Telemetry.createEmitter({
	shouldUseTelemetryService = true,
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		throttlingThousandths = 10000,
		links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4918804707"
	},
	getSharedInfo = function() --[[ Line: 49 ]]
		-- upvalues: TextChannelWindowAnalyticsModule (copy)
		return {
			enableProtectedChat = TextChannelWindowAnalyticsModule.getEnableProtectedChat()
		}
	end
})
local list = {
	"addOSInfo",
	"addSessionInfo",
	"addPlaceId",
	"addUniverseId"
}
local TextChannelWindowExcludeStandardizedFieldsFromCounters = game:DefineFastFlag("TextChannelWindowExcludeStandardizedFieldsFromCounters", false)

local function _() --[[ Line: 78 | Named "passthroughCounterBackend" ]]
	-- upvalues: TextChannelWindowExcludeStandardizedFieldsFromCounters (copy), list (copy)
	return {
		type = "RobloxTelemetryCounter",
		standardizedFields = if TextChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
		format = function(Tbl, p1) --[[ Line: 87 ]]
			local Copy = table.clone(Tbl)
			Copy.enable_protected_chat = tostring(p1.enableProtectedChat)
			
			return Copy
		end
	}
end

TextChannelWindowAnalyticsModule.Counters = {
	Mount = SocialLuaAnalyticsModule.Telemetry.new({
		name = "TextChannelWindowMount",
		description = "Mount outcome per occurrence. result = success | failed | deferred.",
		lastUpdated = { 26, 7, 7 },
		backendsList = {
			{
				type = "RobloxTelemetryCounter",
				standardizedFields = if TextChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
				format = function(Tbl, p1) --[[ Line: 87 ]]
					local Copy = table.clone(Tbl)
					Copy.enable_protected_chat = tostring(p1.enableProtectedChat)
					
					return Copy
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWMountCountThrottlePerMyriad", 10000)
	}),
	Send = SocialLuaAnalyticsModule.Telemetry.new({
		name = "TextChannelWindowSend",
		description = "Send outcome per occurrence. result = success | failure.",
		lastUpdated = { 26, 7, 7 },
		backendsList = {
			{
				type = "RobloxTelemetryCounter",
				standardizedFields = if TextChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
				format = function(Tbl, p1) --[[ Line: 87 ]]
					local Copy = table.clone(Tbl)
					Copy.enable_protected_chat = tostring(p1.enableProtectedChat)
					
					return Copy
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWSendCountThrottlePerMyriad", 10000)
	}),
	MessageReceived = SocialLuaAnalyticsModule.Telemetry.new({
		name = "TextChannelWindowMessageReceived",
		description = "Receive outcome by TextChatMessage.Status.",
		lastUpdated = { 26, 7, 7 },
		backendsList = {
			{
				type = "RobloxTelemetryCounter",
				standardizedFields = if TextChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
				format = function(Tbl, p1) --[[ Line: 87 ]]
					local Copy = table.clone(Tbl)
					Copy.enable_protected_chat = tostring(p1.enableProtectedChat)
					
					return Copy
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWMessageReceivedCountThrottlePerMyriad", 1000)
	})
}
game:SetFlagVersion("TextChannelWindowCountersEnabled", 2)
local TextChannelWindowCountersEnabled = game:DefineFastFlag("TextChannelWindowCountersEnabled", false)
local v1 = nil

function TextChannelWindowAnalyticsModule._setCountersEnabledForTesting(p1) --[[ Line: 135 ]]
	-- upvalues: v1 (ref)
	v1 = p1
end

function TextChannelWindowAnalyticsModule.emit(p1, p2) --[[ Line: 141 ]]
	-- upvalues: v1 (ref), TextChannelWindowCountersEnabled (copy), Emitter (copy)
	if if v1 == nil then TextChannelWindowCountersEnabled else v1 then
		Emitter.emit(p1, p2)
		
		return
	end
end

local TextChannelWindowEventStreamEnabled = game:DefineFastFlag("TextChannelWindowEventStreamEnabled", false)
local TextChannelWindowMessageRenderedEnabled = game:DefineFastFlag("TextChannelWindowMessageRenderedEnabled", false)
local TextChannelWindowMessageRenderedPermyriad = game:DefineFastInt("TextChannelWindowMessageRenderedPermyriad", 0)

function TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() --[[ Line: 157 ]]
	-- upvalues: TextChannelWindowEventStreamEnabled (copy)
	return TextChannelWindowEventStreamEnabled and game:GetEngineFeature("ExpChatTelemetryEventTrigger")
end

function TextChannelWindowAnalyticsModule.getFFlagExpChatUseUpdatedMessageRendered() --[[ Line: 161 ]]
	-- upvalues: TextChannelWindowMessageRenderedEnabled (copy)
	return TextChannelWindowMessageRenderedEnabled and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end

function TextChannelWindowAnalyticsModule.shouldSendMessageRenderedTelemetry(): boolean --[[ Line: 166 ]]
	-- upvalues: TextChannelWindowMessageRenderedPermyriad (copy)
	local LocalPlayer = game:GetService("Players").LocalPlayer
	
	return if LocalPlayer then LocalPlayer.UserId % 10000 < TextChannelWindowMessageRenderedPermyriad else false
end

TextChannelWindowAnalyticsModule.FIntTextChannelWindowScrollThrottleMs = game:DefineFastInt("TextChannelWindowScrollThrottleMs", 400)

local _ = function(p1, p2) --[[ Line: 181 | Named "throttle" ]]
	local DelayedThread = nil
	
	return function() --[[ Line: 183 ]]
		-- upvalues: DelayedThread (ref), p1 (copy), p2 (copy)
		if not DelayedThread then
			p1()
			DelayedThread = task.delay(p2() / 1000, function() --[[ Line: 188 ]]
				-- upvalues: DelayedThread (upval)
				DelayedThread = nil
			end)
			
			return
		end
	end
end

function TextChannelWindowAnalyticsModule.createOnScrollCallback(p1) --[[ Line: 196 ]]
	-- upvalues: TextChannelWindowAnalyticsModule (copy), TextChatService (copy)
	if TextChannelWindowAnalyticsModule.getFFlagExpChatTelemetryEnabled() then
		local function v16() --[[ Line: 200 ]]
			-- upvalues: TextChatService (upval), p1 (copy)
			TextChatService:SendExpChatWindowScroll("text_channel_window", p1 or "")
		end
		
		local function v17() --[[ Line: 202 ]]
			-- upvalues: TextChannelWindowAnalyticsModule (upval)
			return TextChannelWindowAnalyticsModule.FIntTextChannelWindowScrollThrottleMs
		end
		
		local DelayedThread = nil
		
		return function() --[[ Line: 183 ]]
			-- upvalues: DelayedThread (ref), v16 (copy), v17 (copy)
			if not DelayedThread then
				v16()
				DelayedThread = task.delay(v17() / 1000, function() --[[ Line: 188 ]]
					-- upvalues: DelayedThread (upval)
					DelayedThread = nil
				end)
				
				return
			end
		end
	else
		return nil
	end
end

return TextChannelWindowAnalyticsModule