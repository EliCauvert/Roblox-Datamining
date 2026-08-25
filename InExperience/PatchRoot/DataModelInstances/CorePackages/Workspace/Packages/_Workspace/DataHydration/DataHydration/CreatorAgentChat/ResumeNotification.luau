local httpService = game:GetService("HttpService")
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
local parseFrameModule = require(script.Parent.Acp.parseFrame)
local _ = require(script.Parent.types)
local t = {
	studio_ask_user = true,
	ask_user = true,
	present_plan = true,
	propose_plan = true
}

local function extractRawFrame(p0)
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
		local var12 = p0[v]
		
		if typeof(var12) == "string" and var12 ~= "" then
			return var12
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
	local var13 = tonumber(p1)
	
	return if var13 == nil or var13 == 0 then nil else var13
end

local _ = function(p2)
	local var14
	local universeId = p2.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var14 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		local var15 = tonumber(universeId)
		var14 = if var15 == nil or var15 == 0 then nil else var15
	else
		var14 = nil
	end
	if var14 ~= nil then
		return var14
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
	local var16 = tonumber(universeId_1)
	
	return if var16 == nil or var16 == 0 then nil else var16
end

local _ = function(p3)
	-- upvalues: t (ref)
	return typeof(p3) == "string" and t[string.lower(p3)] == true
end

local _ = function(p4)
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

local _ = function(p5)
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
	local var17, var18
	local universeId = params.universeId
	
	if typeof(universeId) == "number" and universeId ~= 0 then
		var17 = universeId
	elseif typeof(universeId) == "string" and universeId ~= "" then
		var18 = tonumber(universeId)
		var17 = if var18 == nil or var18 == 0 then nil else var18
	else
		var17 = nil
	end
	if var17 ~= nil then
		return update, sessionId, var17
	end
	universeId = params._meta and params._meta._roblox
	
	if typeof(universeId) ~= "table" then
		return update, sessionId, nil
	end
	var18 = universeId.universeId
	
	if typeof(var18) == "number" and var18 ~= 0 then
		return update, sessionId, var18
	elseif typeof(var18) ~= "string" or var18 == "" then
		return update, sessionId, nil
	end
	local var19 = tonumber(var18)
	
	if var19 == nil or var19 == 0 then
		return update, sessionId, nil
	end
	return update, sessionId, var19
end

local function classifyFrame(p6)
	-- upvalues: acpProtocolModule (ref), fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), t (ref)
	local var20, var21, var22, sessionId
	if p6.kind == "notification" then
		local notification = p6.notification
		
		if notification.method == acpProtocolModule.Notifications.SessionUpdate then
			local params = notification.params
			sessionId = params.sessionId
			local update = params.update
			
			if typeof(sessionId) == "string" and sessionId ~= "" and typeof(update) == "table" then
				local var23, var24
				var20 = update
				var21 = sessionId
				local universeId = params.universeId
				
				if typeof(universeId) == "number" and universeId ~= 0 then
					var23 = universeId
				elseif typeof(universeId) == "string" and universeId ~= "" then
					var24 = tonumber(universeId)
					var23 = if var24 == nil or var24 == 0 then nil else var24
				else
					var23 = nil
				end
				if var23 == nil then
					universeId = params._meta and params._meta._roblox
					
					if typeof(universeId) == "table" then
						var24 = universeId.universeId
						
						if typeof(var24) == "number" and var24 ~= 0 then
							var22 = var24
						elseif typeof(var24) == "string" and var24 ~= "" then
							local var25 = tonumber(var24)
							var22 = if var25 == nil or var25 == 0 then nil else var25
						else
							var22 = nil
						end
					else
						var22 = nil
					end
				else
					var22 = var23
				end
			else
				var20 = nil
				var21 = nil
				var22 = nil
			end
		else
			var20 = nil
			var21 = nil
			var22 = nil
		end
	else
		var20 = nil
		var21 = nil
		var22 = nil
	end
	if var20 == nil or var21 == nil then
		return nil
	elseif var20.sessionUpdate == "state_change" and var20.state == "idle" then
		return { kind = "turn_end", sessionId = var21, universeId = var22 }
	elseif var20.sessionUpdate == "tool_call_update" then
		local status = var20.status
		
		if not (if status ~= "completed" then if status ~= "failed" then fFlagCreatorAgentChatFilterTerminalClientToolsModule and status == "cancelled" else true else true) then
			local kind = var20.kind
			
			if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
				kind = var20.title
				
				if typeof(kind) == "string" and t[string.lower(kind)] == true then
					sessionId = true
				else
					local rawInput = var20.rawInput
					
					if typeof(rawInput) == "table" then
						kind = rawInput.name
						sessionId = typeof(kind) == "string" and t[string.lower(kind)] == true
						
						if not sessionId then
							kind = rawInput.toolName
							sessionId = false
							
							if typeof(kind) == "string" then
								sessionId = t[string.lower(kind)] == true
								sessionId = nil
							end
						end
					else
						sessionId = false
					end
				end
				if not sessionId then
					return nil
				end
				sessionId = var20.toolCallId
				local t_1 = {
					kind = "local_tool_call",
					sessionId = var21,
					universeId = var22
				}
				kind = if typeof(sessionId) == "string" and sessionId ~= "" then sessionId else nil
				t_1.toolCallId = kind
				
				return t_1
			end
		end
	end
end

local function classifyRtnDetail(p7)
	-- upvalues: extractRawFrame (ref), parseFrameModule (ref), classifyFrame (ref)
	local var27 = extractRawFrame(p7)
	
	if var27 == nil then
		return nil
	end
	local var28 = parseFrameModule(var27)
	
	return if var28 == nil then nil else classifyFrame(var28)
end

local function targetMatchesNotification(p8, p9)
	return if p8 == nil then false elseif not (p8.sessionId ~= nil and p8.sessionId ~= "" and p8.sessionId == p9.sessionId) then p8.universeId ~= nil and (p9.universeId ~= nil and p8.universeId == p9.universeId) else true
end

local function getNotificationId(p10)
	return if p10.kind == "local_tool_call" and p10.toolCallId ~= nil then `CreatorAgentResume-{p10.sessionId}-{p10.toolCallId}` else `CreatorAgentResume-{p10.sessionId}-{p10.kind}`
end

local function getResumeDeepLink(p11)
	-- upvalues: httpService (ref)
	local t = {}
	
	if p11.universeId ~= nil then
		table.insert(t, `universeid={httpService:UrlEncode(tostring(p11.universeId))}`)
	end
	table.insert(t, `sessionid={httpService:UrlEncode(p11.sessionId)}`)
	
	return `roblox://navigation/build?{table.concat(t, "&")}`
end

local _ = function(p12)
	if p12.kind == "local_tool_call" then
		return "Assistant needs your input", "Resume your build chat to continue."
	end
	return "Assistant finished", "Resume your build chat to review the result."
end

local _ = function(p13)
	-- upvalues: httpService (ref), getResumeDeepLink (ref)
	return httpService:JSONEncode({
		sessionId = p13.sessionId,
		universeId = p13.universeId,
		kind = p13.kind,
		deepLink = getResumeDeepLink(p13)
	})
end

local function getToastVisualItems(p14, p15, p16, p17)
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
	buildToastNotification = function(p18)
		-- upvalues: httpService (ref), getResumeDeepLink (ref), getToastVisualItems (ref)
		local var31, var32
		if p18.kind == "local_tool_call" then
			var31 = "Assistant needs your input"
			var32 = "Resume your build chat to continue."
		else
			var31 = "Assistant finished"
			var32 = "Resume your build chat to review the result."
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
						visualItems = getToastVisualItems(p18, var31, var32, httpService:JSONEncode({
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