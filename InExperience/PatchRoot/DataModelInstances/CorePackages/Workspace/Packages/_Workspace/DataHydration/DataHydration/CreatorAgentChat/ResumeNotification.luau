local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("DataHydration").Parent
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
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

local function _(p1)
	if typeof(p1) == "number" and p1 ~= 0 then
		return p1
	elseif typeof(p1) ~= "string" or p1 == "" then
		return nil
	end
	local var1 = tonumber(p1)
	
	return if var1 == nil or var1 == 0 then nil else var1
end

local _ = function(p1)
	local var1
	local universeId = p1.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var1 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		local var2 = tonumber(universeId)
		var1 = if var2 == nil or var2 == 0 then nil else var2
	else
		var1 = nil
	end
	if var1 ~= nil then
		return var1
	end
	universeId = p1._meta and p1._meta._roblox
	
	if typeof(universeId) ~= "table" then
		return nil
	end
	local universeId_1 = universeId.universeId
	
	if typeof(universeId_1) == "number" and universeId_1 ~= 0 then
		return universeId_1
	elseif typeof(universeId_1) ~= "string" or universeId_1 == "" then
		return nil
	end
	local var3 = tonumber(universeId_1)
	
	return if var3 == nil or var3 == 0 then nil else var3
end

local _ = function(p1)
	-- upvalues: t (ref)
	return typeof(p1) == "string" and t[string.lower(p1)] == true
end

local _ = function(p1)
	-- upvalues: t (ref)
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p1.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			return true
		end
		local rawInput = p1.rawInput
		
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

local function getSessionUpdate(p1)
	-- upvalues: acpProtocolModule (ref)
	if p1.kind ~= "notification" then
		return nil, nil, nil, nil
	end
	local notification = p1.notification
	
	if notification.method ~= acpProtocolModule.Notifications.SessionUpdate then
		return nil, nil, nil, nil
	end
	local params = notification.params
	local sessionId = params.sessionId
	local update = params.update
	
	if typeof(sessionId) ~= "string" or sessionId == "" or typeof(update) ~= "table" then
		return nil, nil, nil, nil
	end
	local var1, var2
	local universeId = params.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var1 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		var2 = tonumber(universeId)
		var1 = if var2 == nil or var2 == 0 then nil else var2
	else
		var1 = nil
	end
	local var3
	if var1 == nil then
		universeId = params._meta and params._meta._roblox
		
		if typeof(universeId) == "table" then
			var2 = universeId.universeId
			
			if typeof(var2) == "number" and var2 ~= 0 then
				var3 = var2
			elseif typeof(var2) == "string" and var2 ~= "" then
				local var4 = tonumber(var2)
				var3 = if var4 == nil or var4 == 0 then nil else var4
			else
				var3 = nil
			end
		else
			var3 = nil
		end
	else
		var3 = var1
	end
	return update, sessionId, var3, params.pinForBuild == true
end

local function classifyFrame(p1)
	-- upvalues: getSessionUpdate (ref), fFlagBuildExperiencePinForBuild (ref), fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), t (ref)
	local var1, var2, var3, var4 = getSessionUpdate(p1)
	
	if var1 == nil or var2 == nil then
		return nil
	elseif fFlagBuildExperiencePinForBuild and var4 ~= true then
		return nil
	elseif var1.sessionUpdate == "state_change" and var1.state == "idle" then
		return { kind = "turn_end", sessionId = var2, universeId = var3 }
	elseif var1.sessionUpdate == "tool_call_update" then
		local status = var1.status
		
		if not (if status ~= "completed" then if status ~= "failed" then fFlagCreatorAgentChatFilterTerminalClientToolsModule and status == "cancelled" else true else true) then
			local var5
			local kind = var1.kind
			
			if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
				kind = var1.title
				
				if typeof(kind) == "string" and t[string.lower(kind)] == true then
					var5 = true
				else
					local rawInput = var1.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						var5 = typeof(kind) == "string" and t[string.lower(kind)] == true
						
						if not var5 then
							kind = rawInput.toolName
							var5 = false
							
							if typeof(kind) == "string" then
								var5 = t[string.lower(kind)] == true
								var5 = nil
							end
						end
					else
						var5 = false
					end
				end
				if not var5 then
					return nil
				end
				local toolCallId = var1.toolCallId
				local t_1 = {
					kind = "local_tool_call",
					sessionId = var2,
					universeId = var3
				}
				kind = if typeof(toolCallId) == "string" and toolCallId ~= "" then toolCallId else nil
				t_1.toolCallId = kind
				
				return t_1
			end
		end
	end
end

local function classifyRtnDetail(p1)
	-- upvalues: extractRawFrame (ref), parseFrameModule (ref), classifyFrame (ref)
	local var1 = extractRawFrame(p1)
	
	if var1 == nil then
		return nil
	end
	local var2 = parseFrameModule(var1)
	
	return if var2 == nil then nil else classifyFrame(var2)
end

local function targetMatchesNotification(p1, p2)
	return if p1 == nil then false elseif not (p1.sessionId ~= nil and p1.sessionId ~= "" and p1.sessionId == p2.sessionId) then p1.universeId ~= nil and (p2.universeId ~= nil and p1.universeId == p2.universeId) else true
end

local function getNotificationId(p1)
	return if p1.kind == "local_tool_call" and p1.toolCallId ~= nil then `CreatorAgentResume-{p1.sessionId}-{p1.toolCallId}` else `CreatorAgentResume-{p1.sessionId}-{p1.kind}`
end

local function getResumeDeepLink(p1)
	-- upvalues: httpService (ref)
	local t = {}
	
	if p1.universeId ~= nil then
		table.insert(t, `universeid={httpService:UrlEncode(tostring(p1.universeId))}`)
	end
	table.insert(t, `sessionid={httpService:UrlEncode(p1.sessionId)}`)
	
	return `roblox://navigation/build?{table.concat(t, "&")}`
end

local _ = function(p1)
	if p1.kind == "local_tool_call" then
		return "Assistant needs your input", "Resume your build chat to continue."
	end
	return "Assistant finished", "Resume your build chat to review the result."
end

local _ = function(p1)
	-- upvalues: httpService (ref), getResumeDeepLink (ref)
	return httpService:JSONEncode({
		sessionId = p1.sessionId,
		universeId = p1.universeId,
		kind = p1.kind,
		deepLink = getResumeDeepLink(p1)
	})
end

local function getToastVisualItems(p1, p2, p3, p4)
	local t = {}
	
	if p1.universeId ~= nil then
		table.insert(t, {
			thumbnail = {
				idType = "gameThumbnail",
				visualItemType = "thumbnail",
				id = tostring(p1.universeId)
			}
		})
	end
	table.insert(t, {
		textBody = {
			eventName = "CreatorAgentResume",
			visualItemType = "textBody",
			title = { text = p2 },
			label = { text = p3 },
			actions = {},
			actionEventParams = p4
		}
	})
	table.insert(t, {
		button = {
			buttonStyle = "Secondary",
			eventName = "CreatorAgentResumeDismiss",
			visualItemType = "button",
			label = { text = "Dismiss" },
			actions = { { actionType = "dismiss" } }
		}
	})
	table.insert(t, {
		button = {
			buttonStyle = "Primary",
			eventName = "CreatorAgentResume",
			visualItemType = "button",
			label = { text = "Resume" },
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
	buildToastNotification = function(p1)
		-- upvalues: httpService (ref), getResumeDeepLink (ref), getToastVisualItems (ref)
		local var1, var2
		if p1.kind == "local_tool_call" then
			var1 = "Assistant needs your input"
			var2 = "Resume your build chat to continue."
		else
			var1 = "Assistant finished"
			var2 = "Resume your build chat to review the result."
		end
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
				id = if p1.kind == "local_tool_call" and p1.toolCallId ~= nil then `CreatorAgentResume-{p1.sessionId}-{p1.toolCallId}` else `CreatorAgentResume-{p1.sessionId}-{p1.kind}`,
				clientEventsPayload = {},
				states = {
					Default = {
						layoutKey = "CreatorAgentResume",
						name = "Default",
						timeOnScreenMs = 12000,
						visualItems = getToastVisualItems(p1, var1, var2, httpService:JSONEncode({
							sessionId = p1.sessionId,
							universeId = p1.universeId,
							kind = p1.kind,
							deepLink = getResumeDeepLink(p1)
						}))
					}
				}
			}
		}
	end
}