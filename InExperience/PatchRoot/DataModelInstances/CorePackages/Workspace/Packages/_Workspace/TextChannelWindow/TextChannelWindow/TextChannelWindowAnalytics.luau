local textChatService = game:GetService("TextChatService")
local parent = script:FindFirstAncestor("TextChannelWindow").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local t = {
	getChannelCategory = function(p1)
		return if not (not p1 or p1 == "") then if p1:match("^RBXGeneral") then "general" elseif p1:match("^RBXTeam") then "team" elseif p1:match("^RBXWhisper") then "whisper" elseif p1:match("^RBXSystem") then "system" else "custom" else "none"
	end,
	getEnableProtectedChat = function()
		-- upvalues: textChatService (ref)
		return if game:GetEngineFeature("TextChatServiceProtectedChatEnabled") then textChatService:IsProtectedChatEnabled() else false
	end
}
local var1 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	shouldUseTelemetryService = true,
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		throttlingThousandths = 10000,
		links = "https://roblox.atlassian.net/wiki/spaces/SOCIAL/pages/4918804707"
	},
	getSharedInfo = function()
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

local function _()
	-- upvalues: textChannelWindowExcludeStandardizedFieldsFromCounters (ref), list (ref)
	return {
		type = "RobloxTelemetryCounter",
		standardizedFields = if textChannelWindowExcludeStandardizedFieldsFromCounters then nil else list,
		format = function(p1, p2)
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
				format = function(p1, p2)
					local cloned = table.clone(p1)
					cloned.enable_protected_chat = tostring(p2.enableProtectedChat)
					
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
				format = function(p1, p2)
					local cloned = table.clone(p1)
					cloned.enable_protected_chat = tostring(p2.enableProtectedChat)
					
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
				format = function(p1, p2)
					local cloned = table.clone(p1)
					cloned.enable_protected_chat = tostring(p2.enableProtectedChat)
					
					return cloned
				end
			}
		},
		throttlingThousandths = game:DefineFastInt("TCWMessageReceivedCountThrottlePerMyriad", 1000)
	})
}
game:SetFlagVersion("TextChannelWindowCountersEnabled", 2)
local textChannelWindowCountersEnabled = game:DefineFastFlag("TextChannelWindowCountersEnabled", false)
local var2 = nil

function t._setCountersEnabledForTesting(value)
	-- upvalues: var2 (write)
	var2 = value
end

function t.emit(p1, p2)
	-- upvalues: var2 (write), textChannelWindowCountersEnabled (ref), var1 (ref)
	if if var2 ~= nil then textChannelWindowCountersEnabled else var2 then
		var1.emit(p1, p2)
		
		return
	end
end

local textChannelWindowEventStreamEnabled = game:DefineFastFlag("TextChannelWindowEventStreamEnabled", false)
local textChannelWindowMessageRenderedEnabled = game:DefineFastFlag("TextChannelWindowMessageRenderedEnabled", false)
local textChannelWindowMessageRenderedPermyriad = game:DefineFastInt("TextChannelWindowMessageRenderedPermyriad", 0)

function t.getFFlagExpChatTelemetryEnabled()
	-- upvalues: textChannelWindowEventStreamEnabled (ref)
	return textChannelWindowEventStreamEnabled and game:GetEngineFeature("ExpChatTelemetryEventTrigger")
end

function t.getFFlagExpChatUseUpdatedMessageRendered()
	-- upvalues: textChannelWindowMessageRenderedEnabled (ref)
	return textChannelWindowMessageRenderedEnabled and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end

function t.shouldSendMessageRenderedTelemetry()
	-- upvalues: textChannelWindowMessageRenderedPermyriad (ref)
	local localPlayer = game:GetService("Players").LocalPlayer
	
	return if localPlayer then localPlayer.UserId % 10000 < textChannelWindowMessageRenderedPermyriad else false
end

t.FIntTextChannelWindowScrollThrottleMs = game:DefineFastInt("TextChannelWindowScrollThrottleMs", 400)

local _ = function(p1, p2)
	local var3 = nil
	
	return function()
		-- upvalues: var3 (write), p1 (ref), p2 (ref)
		if var3 then
			return
		end
		p1()
		var3 = task.delay(p2() / 1000, function()
			-- upvalues: var3 (copy)
			var3 = nil
		end)
	end
end

function t.createOnScrollCallback(p1)
	-- upvalues: t (ref), textChatService (ref)
	if t.getFFlagExpChatTelemetryEnabled() then
		local var3 = function()
			-- upvalues: textChatService (copy), p1 (ref)
			textChatService:SendExpChatWindowScroll("text_channel_window", p1 or "")
		end
		
		local var4 = function()
			-- upvalues: t (copy)
			return t.FIntTextChannelWindowScrollThrottleMs
		end
		
		local var5 = nil
		
		return function()
			-- upvalues: var5 (write), var3 (ref), var4 (ref)
			if var12 then
				return
			end
			var3()
			var12 = task.delay(var4() / 1000, function()
				-- upvalues: var12 (copy)
				var12 = nil
			end)
		end
	end
	return nil
end

return t