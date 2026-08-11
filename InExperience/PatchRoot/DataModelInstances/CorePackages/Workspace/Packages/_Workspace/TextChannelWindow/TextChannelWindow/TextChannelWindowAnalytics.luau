local textChatService = game:GetService("TextChatService")
local parent = script:FindFirstAncestor("TextChannelWindow").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local t = {
	getChannelCategory = function(p0) --[[ line: 12 ]]
		return if not (not p0 or p0 == "") then if p0:match("^RBXGeneral") then "general" elseif p0:match("^RBXTeam") then "team" elseif p0:match("^RBXWhisper") then "whisper" elseif p0:match("^RBXSystem") then "system" else "custom" else "none"
	end,
	getEnableProtectedChat = function() --[[ line: 34 ]]
		-- upvalues: textChatService (ref)
		return if game:GetEngineFeature("TextChatServiceProtectedChatEnabled") then textChatService:IsProtectedChatEnabled() else false
	end
}
local var3 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	shouldUseTelemetryService = true,
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		throttlingThousandths = 10000,
		links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4918804707"
	},
	getSharedInfo = function() --[[ line: 49 ]]
		-- upvalues: t (ref)
		return { enableProtectedChat = t.getEnableProtectedChat() }
	end
})
local list = {
	"addOSInfo",
	"addSessionInfo",
	"addPlaceId",
	"addUniverseId"
}
local textChannelWindowExcludeStandardizedFieldsFromCounters = game:DefineFastFlag("TextChannelWindowExcludeStandardizedFieldsFromCounters", false)

local function _() --[[ line: 78 | named "passthroughCounterBackend" ]]
	-- upvalues: textChannelWindowExcludeStandardizedFieldsFromCounters (ref), list (ref)
	return {
		type = "RobloxTelemetryCounter",
		standardizedFields = if textChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
		format = function(p1, p2) --[[ line: 87 ]]
			local cloned = table.clone(p1)
			cloned.enable_protected_chat = tostring(p2.enableProtectedChat)
			
			return cloned
		end
	}
end

t.Counters = {
	Mount = socialLuaAnalyticsModule.Telemetry.new({
		name = "TextChannelWindowMount",
		description = "Mount outcome per occurrence. result = success | failed | deferred.",
		lastUpdated = { 26, 7, 7 },
		backendsList = {
			{
				type = "RobloxTelemetryCounter",
				standardizedFields = if textChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
				format = function(p3, p4) --[[ line: 87 ]]
					local cloned = table.clone(p3)
					cloned.enable_protected_chat = tostring(p4.enableProtectedChat)
					
					return cloned
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWMountCountThrottlePerMyriad", 10000)
	}),
	Send = socialLuaAnalyticsModule.Telemetry.new({
		name = "TextChannelWindowSend",
		description = "Send outcome per occurrence. result = success | failure.",
		lastUpdated = { 26, 7, 7 },
		backendsList = {
			{
				type = "RobloxTelemetryCounter",
				standardizedFields = if textChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
				format = function(p5, p6) --[[ line: 87 ]]
					local cloned = table.clone(p5)
					cloned.enable_protected_chat = tostring(p6.enableProtectedChat)
					
					return cloned
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWSendCountThrottlePerMyriad", 10000)
	}),
	MessageReceived = socialLuaAnalyticsModule.Telemetry.new({
		name = "TextChannelWindowMessageReceived",
		description = "Receive outcome by TextChatMessage.Status.",
		lastUpdated = { 26, 7, 7 },
		backendsList = {
			{
				type = "RobloxTelemetryCounter",
				standardizedFields = if textChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
				format = function(p7, p8) --[[ line: 87 ]]
					local cloned = table.clone(p7)
					cloned.enable_protected_chat = tostring(p8.enableProtectedChat)
					
					return cloned
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWMessageReceivedCountThrottlePerMyriad", 1000)
	})
}
game:SetFlagVersion("TextChannelWindowCountersEnabled", 2)
local textChannelWindowCountersEnabled = game:DefineFastFlag("TextChannelWindowCountersEnabled", false)
local var7 = nil

function t._setCountersEnabledForTesting(value) --[[ line: 135 ]]
	-- upvalues: var7 (write)
	var7 = value
end

function t.emit(p9, p10) --[[ line: 141 ]]
	-- upvalues: var7 (write), textChannelWindowCountersEnabled (ref), var3 (ref)
	if if var7 ~= nil then textChannelWindowCountersEnabled else var7 then
		var3.emit(p9, p10)
		
		return
	end
end

local textChannelWindowEventStreamEnabled = game:DefineFastFlag("TextChannelWindowEventStreamEnabled", false)
local textChannelWindowMessageRenderedEnabled = game:DefineFastFlag("TextChannelWindowMessageRenderedEnabled", false)
local textChannelWindowMessageRenderedPermyriad = game:DefineFastInt("TextChannelWindowMessageRenderedPermyriad", 0)

function t.getFFlagExpChatTelemetryEnabled() --[[ line: 157 ]]
	-- upvalues: textChannelWindowEventStreamEnabled (ref)
	return textChannelWindowEventStreamEnabled and game:GetEngineFeature("ExpChatTelemetryEventTrigger")
end

function t.getFFlagExpChatUseUpdatedMessageRendered() --[[ line: 161 ]]
	-- upvalues: textChannelWindowMessageRenderedEnabled (ref)
	return textChannelWindowMessageRenderedEnabled and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end

function t.shouldSendMessageRenderedTelemetry() --[[ line: 166 ]]
	-- upvalues: textChannelWindowMessageRenderedPermyriad (ref)
	local localPlayer = game:GetService("Players").LocalPlayer
	
	return if localPlayer then localPlayer.UserId % 10000 < textChannelWindowMessageRenderedPermyriad else false
end

t.FIntTextChannelWindowScrollThrottleMs = game:DefineFastInt("TextChannelWindowScrollThrottleMs", 400)

local _ = function(p11, p12) --[[ line: 181 | named "throttle" ]]
	local var12 = nil
	
	return function() --[[ line: 183 ]]
		-- upvalues: var12 (write), p11 (ref), p12 (ref)
		if var12 then
			return
		end
		p11()
		var12 = task.delay(p12() / 1000, function() --[[ line: 188 ]]
			-- upvalues: var12 (copy)
			var12 = nil
		end)
	end
end

function t.createOnScrollCallback(p13) --[[ line: 196 ]]
	-- upvalues: t (ref), textChatService (ref)
	if t.getFFlagExpChatTelemetryEnabled() then
		local var13 = function() --[[ line: 200 ]]
			-- upvalues: textChatService (copy), p13 (ref)
			textChatService:SendExpChatWindowScroll("text_channel_window", p13 or "")
		end
		
		local var14 = function() --[[ line: 202 ]]
			-- upvalues: t (copy)
			return t.FIntTextChannelWindowScrollThrottleMs
		end
		
		local var15 = nil
		
		return function() --[[ line: 183 ]]
			-- upvalues: var15 (write), var13 (ref), var14 (ref)
			if var12 then
				return
			end
			var13()
			var12 = task.delay(var14() / 1000, function() --[[ line: 188 ]]
				-- upvalues: var12 (copy)
				var12 = nil
			end)
		end
	end
	return nil
end

return t