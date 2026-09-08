local httpService = game:GetService("HttpService")
local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("DataHydration").Parent
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local fFlagBuildResumeToastLocalizationModule = require(script.Parent.FFlagBuildResumeToastLocalization)
local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
local localization = require(parent.RobloxAppLocales).Localization
local fFlagBuildExperiencePinForBuild = require(parent.SharedFlags).FFlagBuildExperiencePinForBuild
local parseFrameModule = require(script.Parent.Acp.parseFrame)
local _ = require(script.Parent.types)
local t = {
	studio_ask_user = true,
	ask_user = true,
	present_plan = true,
	propose_plan = true
}

local function extractRawFrame(p1)
	if typeof(p1) == "string" then
		return p1
	elseif typeof(p1) ~= "table" then
		return nil
	end
	for i, v in {
		"frame",
		"payload",
		"message",
		"data",
		"body"
	} do
		local var1 = p1[v]
		
		if typeof(var1) == "string" and var1 ~= "" then
			return var1
		end
	end
	return nil
end

local function _(p2)
	if typeof(p2) == "number" and p2 ~= 0 then
		return p2
	elseif typeof(p2) ~= "string" or p2 == "" then
		return nil
	end
	local var2 = tonumber(p2)
	
	return if var2 == nil or var2 == 0 then nil else var2
end

local _ = function(p2)
	local var2
	local universeId = p2.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var2 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		local var3 = tonumber(universeId)
		var2 = if var3 == nil or var3 == 0 then nil else var3
	else
		var2 = nil
	end
	if var2 ~= nil then
		return var2
	end
	universeId = p2._meta and p2._meta._roblox
	
	if typeof(universeId) ~= "table" then
		return nil
	end
	local universeId_1 = universeId.universeId
	
	if typeof(universeId_1) == "number" and universeId_1 ~= 0 then
		return universeId_1
	elseif typeof(universeId_1) ~= "string" or universeId_1 == "" then
		return nil
	end
	local var4 = tonumber(universeId_1)
	
	return if var4 == nil or var4 == 0 then nil else var4
end

local _ = function(p2)
	-- upvalues: t (ref)
	return typeof(p2) == "string" and t[string.lower(p2)] == true
end

local _ = function(p2)
	-- upvalues: t (ref)
	local kind = p2.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p2.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			return true
		end
		local rawInput = p2.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and t[string.lower(name)] == true
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and t[string.lower(toolName)] == true
		end
		return kind
	end
end

local function getSessionUpdate(p2)
	-- upvalues: acpProtocolModule (ref)
	if p2.kind ~= "notification" then
		return nil, nil, nil, nil
	end
	local notification = p2.notification
	
	if notification.method ~= acpProtocolModule.Notifications.SessionUpdate then
		return nil, nil, nil, nil
	end
	local params = notification.params
	local sessionId = params.sessionId
	local update = params.update
	
	if typeof(sessionId) ~= "string" or sessionId == "" or typeof(update) ~= "table" then
		return nil, nil, nil, nil
	end
	local var2, var3
	local universeId = params.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var2 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		var3 = tonumber(universeId)
		var2 = if var3 == nil or var3 == 0 then nil else var3
	else
		var2 = nil
	end
	local var4
	if var2 == nil then
		universeId = params._meta and params._meta._roblox
		
		if typeof(universeId) == "table" then
			var3 = universeId.universeId
			
			if typeof(var3) == "number" and var3 ~= 0 then
				var4 = var3
			elseif typeof(var3) == "string" and var3 ~= "" then
				local var5 = tonumber(var3)
				var4 = if var5 == nil or var5 == 0 then nil else var5
			else
				var4 = nil
			end
		else
			var4 = nil
		end
	else
		var4 = var2
	end
	return update, sessionId, var4, params.pinForBuild == true
end

local function classifyFrame(p2)
	-- upvalues: getSessionUpdate (ref), fFlagBuildExperiencePinForBuild (ref), fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), t (ref)
	local var2, var3, var4, var5 = getSessionUpdate(p2)
	
	if var2 == nil or var3 == nil then
		return nil
	elseif fFlagBuildExperiencePinForBuild and var5 ~= true then
		return nil
	elseif var2.sessionUpdate == "state_change" and var2.state == "idle" then
		return { kind = "turn_end", sessionId = var3, universeId = var4 }
	elseif var2.sessionUpdate == "tool_call_update" then
		local status = var2.status
		
		if not (if status ~= "completed" then if status ~= "failed" then fFlagCreatorAgentChatFilterTerminalClientToolsModule and status == "cancelled" else true else true) then
			local var6
			local kind = var2.kind
			
			if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
				kind = var2.title
				
				if typeof(kind) == "string" and t[string.lower(kind)] == true then
					var6 = true
				else
					local rawInput = var2.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var6 = typeof(kind) == "string" and t[string.lower(kind)] == true
						
						if not var6 then
							kind = rawInput.toolName
							var6 = false
							
							if typeof(kind) == "string" then
								var6 = t[string.lower(kind)] == true
								var6 = nil
							end
						end
					else
						var6 = false
					end
				end
				if not var6 then
					return nil
				end
				local toolCallId = var2.toolCallId
				local t_1 = {
					kind = "local_tool_call",
					sessionId = var3,
					universeId = var4
				}
				kind = if typeof(toolCallId) == "string" and toolCallId ~= "" then toolCallId else nil
				t_1.toolCallId = kind
				
				return t_1
			end
		end
	end
end

local function classifyRtnDetail(p2)
	-- upvalues: extractRawFrame (ref), parseFrameModule (ref), classifyFrame (ref)
	local var2 = extractRawFrame(p2)
	
	if var2 == nil then
		return nil
	end
	local var3 = parseFrameModule(var2)
	
	return if var3 == nil then nil else classifyFrame(var3)
end

local function targetMatchesNotification(p2, p3)
	return if p2 == nil then false elseif not (p2.sessionId ~= nil and p2.sessionId ~= "" and p2.sessionId == p3.sessionId) then p2.universeId ~= nil and (p3.universeId ~= nil and p2.universeId == p3.universeId) else true
end

local function getNotificationId(p2)
	return if p2.kind == "local_tool_call" and p2.toolCallId ~= nil then `CreatorAgentResume-{p2.sessionId}-{p2.toolCallId}` else `CreatorAgentResume-{p2.sessionId}-{p2.kind}`
end

local function getResumeDeepLink(p2)
	-- upvalues: httpService (ref)
	local t = {}
	
	if p2.universeId ~= nil then
		table.insert(t, `universeid={httpService:UrlEncode(tostring(p2.universeId))}`)
	end
	table.insert(t, `sessionid={httpService:UrlEncode(p2.sessionId)}`)
	
	return `roblox://navigation/build?{table.concat(t, "&")}`
end

local function getToastCopy(p2)
	-- upvalues: fFlagBuildResumeToastLocalizationModule (ref), localization (ref), localizationService (ref)
	local isLocalToolCall = p2.kind == "local_tool_call"
	
	if fFlagBuildResumeToastLocalizationModule then
		local var2 = localization.new(localizationService.RobloxLocaleId)
		
		return {
			title = var2:Format(if isLocalToolCall then "Feature.Build.Notification.Title.NeedInput" else "Feature.Build.Notification.Title.Finished"),
			label = var2:Format(if isLocalToolCall then "Feature.Build.Notification.Message.Continue" else "Feature.Build.Notification.Message.Review"),
			dismiss = var2:Format("Feature.Build.Action.Dismiss"),
			resume = var2:Format("Feature.Build.Action.Resume")
		}
	end
	return {
		dismiss = "Dismiss",
		resume = "Resume",
		title = if isLocalToolCall then "Assistant needs your input" else "Assistant finished",
		label = if isLocalToolCall then "Resume your build chat to continue." else "Resume your build chat to review the result."
	}
end

local _ = function(p2)
	-- upvalues: httpService (ref), getResumeDeepLink (ref)
	return httpService:JSONEncode({
		sessionId = p2.sessionId,
		universeId = p2.universeId,
		kind = p2.kind,
		deepLink = getResumeDeepLink(p2)
	})
end

local function getToastVisualItems(p2, p3, p4)
	local t = {}
	
	if p2.universeId ~= nil then
		table.insert(t, {
			thumbnail = {
				idType = "gameThumbnail",
				visualItemType = "thumbnail",
				id = tostring(p2.universeId)
			}
		})
	end
	table.insert(t, {
		textBody = {
			eventName = "CreatorAgentResume",
			visualItemType = "textBody",
			title = { text = p3.title },
			label = { text = p3.label },
			actions = {},
			actionEventParams = p4
		}
	})
	table.insert(t, {
		button = {
			buttonStyle = "Secondary",
			eventName = "CreatorAgentResumeDismiss",
			visualItemType = "button",
			label = { text = p3.dismiss },
			actions = { { actionType = "dismiss" } }
		}
	})
	table.insert(t, {
		button = {
			buttonStyle = "Primary",
			eventName = "CreatorAgentResume",
			visualItemType = "button",
			label = { text = p3.resume },
			actions = {},
			actionEventParams = p4
		}
	})
	
	return t
end

return {
	NotificationType = "CreatorAgentResume",
	ResumeEventName = "CreatorAgentResume",
	CapRtnNamespace = acpProtocolModule.CapRtnNamespace,
	classifyFrame = classifyFrame,
	classifyRtnDetail = classifyRtnDetail,
	targetMatchesNotification = targetMatchesNotification,
	getNotificationId = getNotificationId,
	getResumeDeepLink = getResumeDeepLink,
	buildToastNotification = function(p2)
		-- upvalues: getToastCopy (ref), httpService (ref), getResumeDeepLink (ref), getToastVisualItems (ref)
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		return {
			notificationType = "CreatorAgentResume",
			deliverTimestamp = unixTimestampMillis,
			notificationReceivedTimestampMs = unixTimestampMillis,
			content = {
				currentState = "Default",
				notificationType = "CreatorAgentResume",
				minVersion = 0,
				priority = 1,
				id = if p2.kind == "local_tool_call" and p2.toolCallId ~= nil then `CreatorAgentResume-{p2.sessionId}-{p2.toolCallId}` else `CreatorAgentResume-{p2.sessionId}-{p2.kind}`,
				clientEventsPayload = {},
				states = {
					Default = {
						layoutKey = "CreatorAgentResume",
						name = "Default",
						timeOnScreenMs = 12000,
						visualItems = getToastVisualItems(p2, getToastCopy(p2), httpService:JSONEncode({
							sessionId = p2.sessionId,
							universeId = p2.universeId,
							kind = p2.kind,
							deepLink = getResumeDeepLink(p2)
						}))
					}
				}
			}
		}
	end
}