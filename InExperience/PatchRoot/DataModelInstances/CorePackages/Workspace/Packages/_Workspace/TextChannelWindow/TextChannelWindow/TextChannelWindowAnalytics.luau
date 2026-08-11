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

local function _() --[[ line: 71 | named "passthroughCounterBackend" ]]
	-- upvalues: list (ref)
	return {
		type = "RobloxTelemetryCounter",
		standardizedFields = list,
		format = function(p1, p2) --[[ line: 78 ]]
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
				standardizedFields = list,
				format = function(p3, p4) --[[ line: 78 ]]
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
				standardizedFields = list,
				format = function(p5, p6) --[[ line: 78 ]]
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
				standardizedFields = list,
				format = function(p7, p8) --[[ line: 78 ]]
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
local var6 = nil

function t._setCountersEnabledForTesting(value) --[[ line: 126 ]]
	-- upvalues: var6 (write)
	var6 = value
end

function t.emit(p9, p10) --[[ line: 132 ]]
	-- upvalues: var6 (write), textChannelWindowCountersEnabled (ref), var3 (ref)
	if if var6 ~= nil then textChannelWindowCountersEnabled else var6 then
		var3.emit(p9, p10)
		
		return
	end
end

local textChannelWindowEventStreamEnabled = game:DefineFastFlag("TextChannelWindowEventStreamEnabled", false)
local textChannelWindowMessageRenderedEnabled = game:DefineFastFlag("TextChannelWindowMessageRenderedEnabled", false)
local textChannelWindowMessageRenderedPermyriad = game:DefineFastInt("TextChannelWindowMessageRenderedPermyriad", 0)

function t.getFFlagExpChatTelemetryEnabled() --[[ line: 148 ]]
	-- upvalues: textChannelWindowEventStreamEnabled (ref)
	return textChannelWindowEventStreamEnabled and game:GetEngineFeature("ExpChatTelemetryEventTrigger")
end

function t.getFFlagExpChatUseUpdatedMessageRendered() --[[ line: 152 ]]
	-- upvalues: textChannelWindowMessageRenderedEnabled (ref)
	return textChannelWindowMessageRenderedEnabled and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end

function t.shouldSendMessageRenderedTelemetry() --[[ line: 157 ]]
	-- upvalues: textChannelWindowMessageRenderedPermyriad (ref)
	local localPlayer = game:GetService("Players").LocalPlayer
	
	return if localPlayer then localPlayer.UserId % 10000 < textChannelWindowMessageRenderedPermyriad else false
end

t.FIntTextChannelWindowScrollThrottleMs = game:DefineFastInt("TextChannelWindowScrollThrottleMs", 400)

local _ = function(p11, p12) --[[ line: 172 | named "throttle" ]]
	local var11 = nil
	
	return function() --[[ line: 174 ]]
		-- upvalues: var11 (write), p11 (ref), p12 (ref)
		if var11 then
			return
		end
		p11()
		var11 = task.delay(p12() / 1000, function() --[[ line: 179 ]]
			-- upvalues: var11 (copy)
			var11 = nil
		end)
	end
end

function t.createOnScrollCallback(p13) --[[ line: 187 ]]
	-- upvalues: t (ref), textChatService (ref)
	if t.getFFlagExpChatTelemetryEnabled() then
		local var12 = function() --[[ line: 191 ]]
			-- upvalues: textChatService (copy), p13 (ref)
			textChatService:SendExpChatWindowScroll("text_channel_window", p13 or "")
		end
		
		local var13 = function() --[[ line: 193 ]]
			-- upvalues: t (copy)
			return t.FIntTextChannelWindowScrollThrottleMs
		end
		
		local var14 = nil
		
		return function() --[[ line: 174 ]]
			-- upvalues: var14 (write), var12 (ref), var13 (ref)
			if var14 then
				return
			end
			var12()
			var14 = task.delay(var13() / 1000, function() --[[ line: 179 ]]
				-- upvalues: var14 (copy)
				var11 = nil
			end)
		end
	end
	return nil
end

return t