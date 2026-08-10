local httpService = game:GetService("HttpService")
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local parseFrameModule = require(script.Parent.Acp.parseFrame)
local _ = require(script.Parent.types)
local t = {
	studio_ask_user = true,
	ask_user = true,
	present_plan = true,
	propose_plan = true
}

local function extractRawFrame(p0) --[[ line: 29 ]]
	if typeof(p0) == "string" then
		return p0
	elseif typeof(p0) ~= "table" then
		return nil
	end
	for i, v in {
		"frame",
		"payload",
		"message",
		"data",
		"body"
	} do
		local var11 = p0[v]
		
		if typeof(var11) == "string" and var11 ~= "" then
			return var11
		end
	end
	return nil
end

local function _(p1) --[[ line: 45 | named "normalizeUniverseId" ]]
	if typeof(p1) == "number" and p1 ~= 0 then
		return p1
	elseif typeof(p1) ~= "string" or p1 == "" then
		return nil
	end
	local var12 = tonumber(p1)
	
	return if var12 == nil or var12 == 0 then nil else var12
end

local _ = function(p2) --[[ line: 56 | named "getUniverseId" ]]
	local var13
	local universeId = p2.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var13 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		local var14 = tonumber(universeId)
		var13 = if var14 == nil or var14 == 0 then nil else var14
	else
		var13 = nil
	end
	if var13 ~= nil then
		return var13
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
	local var15 = tonumber(universeId_1)
	
	return if var15 == nil or var15 == 0 then nil else var15
end

local _ = function(p3) --[[ line: 69 | named "valueLooksLikeLocalTool" ]]
	-- upvalues: t (ref)
	return typeof(p3) == "string" and t[string.lower(p3)] == true
end

local _ = function(p4) --[[ line: 73 | named "updateLooksLikeLocalTool" ]]
	-- upvalues: t (ref)
	local kind = p4.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p4.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			return true
		end
		local rawInput = p4.rawInput
		
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

local _ = function(p5) --[[ line: 86 | named "getSessionUpdate" ]]
	-- upvalues: acpProtocolModule (ref)
	if p5.kind ~= "notification" then
		return nil, nil, nil
	end
	local notification = p5.notification
	
	if notification.method ~= acpProtocolModule.Notifications.SessionUpdate then
		return nil, nil, nil
	end
	local params = notification.params
	local sessionId = params.sessionId
	local update = params.update
	
	if typeof(sessionId) ~= "string" or sessionId == "" or typeof(update) ~= "table" then
		return nil, nil, nil
	end
	local var16, var17
	local universeId = params.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var16 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		var17 = tonumber(universeId)
		var16 = if var17 == nil or var17 == 0 then nil else var17
	else
		var16 = nil
	end
	if var16 ~= nil then
		return update, sessionId, var16
	end
	universeId = params._meta and params._meta._roblox
	
	if typeof(universeId) ~= "table" then
		return update, sessionId, nil
	end
	var17 = universeId.universeId
	
	if typeof(var17) == "number" and var17 ~= 0 then
		return update, sessionId, var17
	elseif typeof(var17) ~= "string" or var17 == "" then
		return update, sessionId, nil
	end
	local var18 = tonumber(var17)
	
	if var18 == nil or var18 == 0 then
		return update, sessionId, nil
	end
	return update, sessionId, var18
end

local function classifyFrame(p6) --[[ line: 106 ]]
	-- upvalues: acpProtocolModule (ref), t (ref)
	local var19, var20, var21, sessionId
	if p6.kind == "notification" then
		local notification = p6.notification
		
		if notification.method == acpProtocolModule.Notifications.SessionUpdate then
			local params = notification.params
			sessionId = params.sessionId
			local update = params.update
			
			if typeof(sessionId) == "string" and sessionId ~= "" and typeof(update) == "table" then
				local var22, var23
				var19 = update
				var20 = sessionId
				local universeId = params.universeId
				
				if typeof(universeId) == "number" and universeId ~= 0 then
					var22 = universeId
				elseif typeof(universeId) == "string" and universeId ~= "" then
					var23 = tonumber(universeId)
					var22 = if var23 == nil or var23 == 0 then nil else var23
				else
					var22 = nil
				end
				if var22 == nil then
					universeId = params._meta and params._meta._roblox
					
					if typeof(universeId) == "table" then
						var23 = universeId.universeId
						
						if typeof(var23) == "number" and var23 ~= 0 then
							var21 = var23
						elseif typeof(var23) == "string" and var23 ~= "" then
							local var24 = tonumber(var23)
							var21 = if var24 == nil or var24 == 0 then nil else var24
						else
							var21 = nil
						end
					else
						var21 = nil
					end
				else
					var21 = var22
				end
			else
				var19 = nil
				var20 = nil
				var21 = nil
			end
		else
			var19 = nil
			var20 = nil
			var21 = nil
		end
	else
		var19 = nil
		var20 = nil
		var21 = nil
	end
	if var19 == nil or var20 == nil then
		return nil
	elseif var19.sessionUpdate == "state_change" and var19.state == "idle" then
		return { kind = "turn_end", sessionId = var20, universeId = var21 }
	elseif var19.sessionUpdate == "tool_call_update" then
		local status = var19.status
		
		if status ~= "completed" and status ~= "failed" then
			local var25
			local kind = var19.kind
			
			if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
				kind = var19.title
				
				if typeof(kind) == "string" and t[string.lower(kind)] == true then
					var25 = true
				else
					sessionId = var19.rawInput
					
					if typeof(sessionId) == "table" then
						kind = sessionId.name
						var25 = typeof(kind) == "string" and t[string.lower(kind)] == true
						
						if not var25 then
							kind = sessionId.toolName
							var25 = false
							
							if typeof(kind) == "string" then
								var25 = t[string.lower(kind)] == true
								var25 = nil
							end
						end
					else
						var25 = false
					end
				end
				if not var25 then
					return nil
				end
				local toolCallId = var19.toolCallId
				sessionId = {
					kind = "local_tool_call",
					sessionId = var20,
					universeId = var21
				}
				kind = if typeof(toolCallId) == "string" and toolCallId ~= "" then toolCallId else nil
				sessionId.toolCallId = kind
				
				return sessionId
			end
		end
	end
end

local function classifyRtnDetail(p7) --[[ line: 136 ]]
	-- upvalues: extractRawFrame (ref), parseFrameModule (ref), classifyFrame (ref)
	local var26 = extractRawFrame(p7)
	
	if var26 == nil then
		return nil
	end
	local var27 = parseFrameModule(var26)
	
	return if var27 == nil then nil else classifyFrame(var27)
end

local function targetMatchesNotification(p8, p9) --[[ line: 150 ]]
	return if p8 == nil then false elseif not (p8.sessionId ~= nil and p8.sessionId ~= "" and p8.sessionId == p9.sessionId) then p8.universeId ~= nil and (p9.universeId ~= nil and p8.universeId == p9.universeId) else true
end

local function getNotificationId(p10) --[[ line: 165 ]]
	return if p10.kind == "local_tool_call" and p10.toolCallId ~= nil then `CreatorAgentResume-{p10.sessionId}-{p10.toolCallId}` else `CreatorAgentResume-{p10.sessionId}-{p10.kind}`
end

local function getResumeDeepLink(p11) --[[ line: 172 ]]
	-- upvalues: httpService (ref)
	local t = {}
	
	if p11.universeId ~= nil then
		table.insert(t, `universeid={httpService:UrlEncode(tostring(p11.universeId))}`)
	end
	table.insert(t, `sessionid={httpService:UrlEncode(p11.sessionId)}`)
	
	return `roblox://navigation/build?{table.concat(t, "&")}`
end

local _ = function(p12) --[[ line: 182 | named "getToastCopy" ]]
	if p12.kind == "local_tool_call" then
		return "Assistant needs your input", "Resume your build chat to continue."
	end
	return "Assistant finished", "Resume your build chat to review the result."
end

local _ = function(p13) --[[ line: 189 | named "getActionEventParams" ]]
	-- upvalues: httpService (ref), getResumeDeepLink (ref)
	return httpService:JSONEncode({
		sessionId = p13.sessionId,
		universeId = p13.universeId,
		kind = p13.kind,
		deepLink = getResumeDeepLink(p13)
	})
end

local function getToastVisualItems(p14, p15, p16, p17) --[[ line: 198 ]]
	local t = {}
	
	if p14.universeId ~= nil then
		table.insert(t, {
			thumbnail = {
				idType = "gameThumbnail",
				visualItemType = "thumbnail",
				id = tostring(p14.universeId)
			}
		})
	end
	table.insert(t, {
		textBody = {
			eventName = "CreatorAgentResume",
			visualItemType = "textBody",
			title = { text = p15 },
			label = { text = p16 },
			actions = {},
			actionEventParams = p17
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
			actionEventParams = p17
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
	buildToastNotification = function(p18) --[[ line: 251 ]]
		-- upvalues: httpService (ref), getResumeDeepLink (ref), getToastVisualItems (ref)
		local var30, var31
		if p18.kind == "local_tool_call" then
			var30 = "Assistant needs your input"
			var31 = "Resume your build chat to continue."
		else
			var30 = "Assistant finished"
			var31 = "Resume your build chat to review the result."
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
				id = if p18.kind == "local_tool_call" and p18.toolCallId ~= nil then `CreatorAgentResume-{p18.sessionId}-{p18.toolCallId}` else `CreatorAgentResume-{p18.sessionId}-{p18.kind}`,
				clientEventsPayload = {},
				states = {
					Default = {
						layoutKey = "CreatorAgentResume",
						name = "Default",
						timeOnScreenMs = 12000,
						visualItems = getToastVisualItems(p18, var30, var31, httpService:JSONEncode({
							sessionId = p18.sessionId,
							universeId = p18.universeId,
							kind = p18.kind,
							deepLink = getResumeDeepLink(p18)
						}))
					}
				}
			}
		}
	end
}