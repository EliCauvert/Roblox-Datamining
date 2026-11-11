local HttpService = game:GetService("HttpService")
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local ParseFrameModule = require(script.Parent.Acp.parseFrame)
local _ = require(script.Parent.types)
local config = {
	studio_ask_user = true,
	ask_user = true,
	present_plan = true,
	propose_plan = true
}

local function extractRawFrame(p1)
	if typeof(p1) == "string" then
		return p1
	end
	if typeof(p1) ~= "table" then
		return nil
	end
	local v1 = nil
	for _, value in {
		"frame",
		"payload",
		"message",
		"data",
		"body"
	} do
		v1 = p1[value]
		
		if typeof(v1) == "string" and v1 ~= "" then
			return v1
		end
	end
	return nil
end

local function _(p2)
	if typeof(p2) == "number" and p2 ~= 0 then
		return p2
	elseif typeof(p2) == "string" and p2 ~= "" then
		local Number: number? = tonumber(p2)
		
		return if Number == nil or Number == 0 then nil else Number
	else
		return nil
	end
end

local _ = function(p2)
	local UniverseId = p2.universeId
	local UniverseId1 = nil
	
	if typeof(UniverseId) == "number" and UniverseId ~= 0 then
		UniverseId1 = UniverseId
	elseif typeof(UniverseId) == "string" and UniverseId ~= "" then
		local Number: number? = tonumber(UniverseId)
		UniverseId1 = if Number == nil or Number == 0 then nil else Number
	else
		UniverseId1 = nil
	end
	if UniverseId1 ~= nil then
		return UniverseId1
	end
	local Roblox = p2._meta and p2._meta._roblox
	
	if typeof(Roblox) ~= "table" then
		return nil
	end
	local UniverseId2 = Roblox.universeId
	
	if typeof(UniverseId2) == "number" and UniverseId2 ~= 0 then
		return UniverseId2
	elseif typeof(UniverseId2) == "string" and UniverseId2 ~= "" then
		local Number: number? = tonumber(UniverseId2)
		
		return if Number == nil or Number == 0 then nil else Number
	else
		return nil
	end
end

local _ = function(Text: string): boolean
	-- upvalues: config (copy)
	return typeof(Text) == "string" and config[string.lower(Text)] == true
end

local _ = function(p2): boolean
	-- upvalues: config (copy)
	local Kind: string = p2.kind
	
	if typeof(Kind) ~= "string" or config[string.lower(Kind)] ~= true then
		local Title: string = p2.title
		
		if typeof(Title) ~= "string" or config[string.lower(Title)] ~= true then
			local RawInput = p2.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			local Name: string = RawInput.name
			local IsEntry: boolean = typeof(Name) == "string" and config[string.lower(Name)] == true
			
			if not IsEntry then
				local ToolName: string = RawInput.toolName
				IsEntry = typeof(ToolName) == "string" and config[string.lower(ToolName)] == true
			end
			return IsEntry
		end
	end
	return true
end

local _ = function(p2)
	-- upvalues: AcpProtocolModule (copy)
	if p2.kind ~= "notification" then
		return nil, nil, nil
	end
	local Notification = p2.notification
	
	if Notification.method ~= AcpProtocolModule.Notifications.SessionUpdate then
		return nil, nil, nil
	end
	local Params = Notification.params
	local SessionId = Params.sessionId
	local Update = Params.update
	
	if typeof(SessionId) ~= "string" or SessionId == "" or typeof(Update) ~= "table" then
		return nil, nil, nil
	end
	local UniverseId = Params.universeId
	local UniverseId1 = nil
	
	if typeof(UniverseId) == "number" and UniverseId ~= 0 then
		UniverseId1 = UniverseId
	elseif typeof(UniverseId) == "string" and UniverseId ~= "" then
		local Number: number? = tonumber(UniverseId)
		UniverseId1 = if Number == nil or Number == 0 then nil else Number
	else
		UniverseId1 = nil
	end
	if UniverseId1 ~= nil then
		return Update, SessionId, UniverseId1
	end
	local Roblox = Params._meta and Params._meta._roblox
	
	if typeof(Roblox) ~= "table" then
		return Update, SessionId, nil
	end
	local UniverseId2 = Roblox.universeId
	
	if typeof(UniverseId2) == "number" and UniverseId2 ~= 0 then
		return Update, SessionId, UniverseId2
	elseif typeof(UniverseId2) ~= "string" or UniverseId2 == "" then
		return Update, SessionId, nil
	else
		local Number: number? = tonumber(UniverseId2)
		
		if Number == nil or Number == 0 then
			return Update, SessionId, nil
		else
			return Update, SessionId, Number
		end
	end
end

local function classifyFrame(p2)
	-- upvalues: AcpProtocolModule (copy), config (copy)
	local v2 = nil
	local SessionId = nil
	local UniverseId = nil
	if p2.kind == "notification" then
		local Notification = p2.notification
		
		if Notification.method == AcpProtocolModule.Notifications.SessionUpdate then
			local Params = Notification.params
			local SessionId1 = Params.sessionId
			local Update = Params.update
			
			if typeof(SessionId1) == "string" and SessionId1 ~= "" and typeof(Update) == "table" then
				v2 = Update
				SessionId = SessionId1
				local UniverseId1 = Params.universeId
				local UniverseId2 = nil
				
				if typeof(UniverseId1) == "number" and UniverseId1 ~= 0 then
					UniverseId2 = UniverseId1
				elseif typeof(UniverseId1) == "string" and UniverseId1 ~= "" then
					local Number: number? = tonumber(UniverseId1)
					UniverseId2 = if Number == nil or Number == 0 then nil else Number
				else
					UniverseId2 = nil
				end
				if UniverseId2 == nil then
					local Roblox = Params._meta and Params._meta._roblox
					
					if typeof(Roblox) == "table" then
						local UniverseId3 = Roblox.universeId
						
						if typeof(UniverseId3) == "number" and UniverseId3 ~= 0 then
							UniverseId = UniverseId3
						elseif typeof(UniverseId3) == "string" and UniverseId3 ~= "" then
							local Number: number? = tonumber(UniverseId3)
							UniverseId = if Number == nil or Number == 0 then nil else Number
						else
							UniverseId = nil
						end
					else
						UniverseId = nil
					end
				else
					UniverseId = UniverseId2
				end
			else
				v2 = nil
				SessionId = nil
				UniverseId = nil
			end
		else
			v2 = nil
			SessionId = nil
			UniverseId = nil
		end
	else
		v2 = nil
		SessionId = nil
		UniverseId = nil
	end
	if v2 == nil or SessionId == nil then
		return nil
	end
	if v2.sessionUpdate == "state_change" and v2.state == "idle" then
		return {
			kind = "turn_end",
			sessionId = SessionId,
			universeId = UniverseId
		}
	end
	repeat
		if v2.sessionUpdate ~= "tool_call_update" then break end
		local Status = v2.status
		
		if Status == "completed" or Status == "failed" then break end
		local Kind: string = v2.kind
		local Flag = nil
		repeat
			if typeof(Kind) ~= "string" or config[string.lower(Kind)] ~= true then
				local Title: string = v2.title
				
				if typeof(Title) ~= "string" or config[string.lower(Title)] ~= true then
					local RawInput = v2.rawInput
					
					if typeof(RawInput) == "table" then
						local Name: string = RawInput.name
						Flag = typeof(Name) == "string" and config[string.lower(Name)] == true
						
						if Flag then break end
						local ToolName: string = RawInput.toolName
						Flag = typeof(ToolName) == "string" and config[string.lower(ToolName)] == true
						break
					end
					Flag = false
				end
			end
			Flag = true
			break
		until true
		if not Flag then break end
		local ToolCallId = v2.toolCallId
		
		return {
			kind = "local_tool_call",
			sessionId = SessionId,
			universeId = UniverseId,
			toolCallId = if typeof(ToolCallId) == "string" and ToolCallId ~= "" then ToolCallId else nil
		}
	until true
	return nil
end

local function getResumeDeepLink(p2): string
	-- upvalues: HttpService (copy)
	local List = {}
	
	if p2.universeId ~= nil then
		table.insert(List, `universeid={HttpService:UrlEncode((tostring(p2.universeId)))}`)
	end
	table.insert(List, `sessionid={HttpService:UrlEncode(p2.sessionId)}`)
	
	return `roblox://navigation/build?{table.concat(List, "&")}`
end

local _ = function(p2)
	if p2.kind == "local_tool_call" then
		return "Assistant needs your input", "Resume your build chat to continue."
	else
		return "Assistant finished", "Resume your build chat to review the result."
	end
end

local _ = function(p2)
	-- upvalues: HttpService (copy), getResumeDeepLink (copy)
	return HttpService:JSONEncode({
		sessionId = p2.sessionId,
		universeId = p2.universeId,
		kind = p2.kind,
		deepLink = getResumeDeepLink(p2)
	})
end

local function getToastVisualItems(p2, Text, Text1, ActionEventParams)
	local List = {}
	
	if p2.universeId ~= nil then
		table.insert(List, {
			thumbnail = {
				idType = "gameThumbnail",
				visualItemType = "thumbnail",
				id = tostring(p2.universeId)
			}
		})
	end
	table.insert(List, {
		textBody = {
			eventName = "CreatorAgentResume",
			visualItemType = "textBody",
			title = { text = Text },
			label = { text = Text1 },
			actions = {},
			actionEventParams = ActionEventParams
		}
	})
	table.insert(List, {
		button = {
			buttonStyle = "Secondary",
			eventName = "CreatorAgentResumeDismiss",
			visualItemType = "button",
			label = { text = "Dismiss" },
			actions = { { actionType = "dismiss" } }
		}
	})
	table.insert(List, {
		button = {
			buttonStyle = "Primary",
			eventName = "CreatorAgentResume",
			visualItemType = "button",
			label = { text = "Resume" },
			actions = {},
			actionEventParams = ActionEventParams
		}
	})
	
	return List
end

return {
	NotificationType = "CreatorAgentResume",
	ResumeEventName = "CreatorAgentResume",
	CapRtnNamespace = AcpProtocolModule.CapRtnNamespace,
	classifyFrame = classifyFrame,
	classifyRtnDetail = function(p2)
		-- upvalues: extractRawFrame (copy), ParseFrameModule (copy), classifyFrame (copy)
		local ExtractRawFrameResult = extractRawFrame(p2)
		
		if ExtractRawFrameResult == nil then
			return nil
		else
			local ParseFrameModuleResult = ParseFrameModule(ExtractRawFrameResult)
			
			return if ParseFrameModuleResult == nil then nil else classifyFrame(ParseFrameModuleResult)
		end
	end,
	targetMatchesNotification = function(p2, p3): boolean
		return p2 ~= nil and (p2.sessionId ~= nil and p2.sessionId ~= "" and p2.sessionId == p3.sessionId or p2.universeId ~= nil and (p3.universeId ~= nil and p2.universeId == p3.universeId))
	end,
	getNotificationId = function(p2): string
		return if p2.kind == "local_tool_call" and p2.toolCallId ~= nil then `CreatorAgentResume-{p2.sessionId}-{p2.toolCallId}` else `CreatorAgentResume-{p2.sessionId}-{p2.kind}`
	end,
	getResumeDeepLink = getResumeDeepLink,
	buildToastNotification = function(p2)
		-- upvalues: HttpService (copy), getResumeDeepLink (copy), getToastVisualItems (copy)
		local v2 = nil
		local v3 = nil
		if p2.kind == "local_tool_call" then
			v2 = "Assistant needs your input"
			v3 = "Resume your build chat to continue."
		else
			v2 = "Assistant finished"
			v3 = "Resume your build chat to review the result."
		end
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		return {
			notificationType = "CreatorAgentResume",
			deliverTimestamp = UnixTimestampMillis,
			notificationReceivedTimestampMs = UnixTimestampMillis,
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
						visualItems = getToastVisualItems(p2, v2, v3, (HttpService:JSONEncode({
							sessionId = p2.sessionId,
							universeId = p2.universeId,
							kind = p2.kind,
							deepLink = getResumeDeepLink(p2)
						})))
					}
				}
			}
		}
	end
}