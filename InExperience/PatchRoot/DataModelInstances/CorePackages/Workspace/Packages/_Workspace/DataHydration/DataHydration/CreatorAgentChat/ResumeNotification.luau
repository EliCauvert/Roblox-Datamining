local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("DataHydration").Parent
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local FFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
local Localization = require(Parent.RobloxAppLocales).Localization
local FFlagBuildExperiencePinForBuild = require(Parent.SharedFlags).FFlagBuildExperiencePinForBuild
local ParseFrameModule = require(script.Parent.Acp.parseFrame)
local _ = require(script.Parent.types)
local config = {
	studio_ask_user = true,
	ask_user = true,
	present_plan = true,
	propose_plan = true
}

local function extractRawFrame(p1) --[[ Line: 37 ]]
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

local function _(p2) --[[ Line: 53 | Named "normalizeUniverseId" ]]
	if typeof(p2) == "number" and p2 ~= 0 then
		return p2
	elseif typeof(p2) == "string" and p2 ~= "" then
		local Number: number? = tonumber(p2)
		
		return if Number == nil or Number == 0 then nil else Number
	else
		return nil
	end
end

local _ = function(p2) --[[ Line: 64 | Named "getUniverseId" ]]
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

local _ = function(Text: string): boolean --[[ Line: 77 | Named "valueLooksLikeLocalTool" ]]
	-- upvalues: config (copy)
	return typeof(Text) == "string" and config[string.lower(Text)] == true
end

local _ = function(p2): boolean --[[ Line: 81 | Named "updateLooksLikeLocalTool" ]]
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

local function getSessionUpdate(p2) --[[ Line: 94 ]]
	-- upvalues: AcpProtocolModule (copy)
	if p2.kind ~= "notification" then
		return nil, nil, nil, nil
	end
	local Notification = p2.notification
	
	if Notification.method ~= AcpProtocolModule.Notifications.SessionUpdate then
		return nil, nil, nil, nil
	end
	local Params = Notification.params
	local SessionId = Params.sessionId
	local Update = Params.update
	
	if typeof(SessionId) ~= "string" or SessionId == "" or typeof(Update) ~= "table" then
		return nil, nil, nil, nil
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
	local UniverseId2 = nil
	if UniverseId1 == nil then
		local Roblox = Params._meta and Params._meta._roblox
		
		if typeof(Roblox) == "table" then
			local UniverseId3 = Roblox.universeId
			
			if typeof(UniverseId3) == "number" and UniverseId3 ~= 0 then
				UniverseId2 = UniverseId3
			elseif typeof(UniverseId3) == "string" and UniverseId3 ~= "" then
				local Number: number? = tonumber(UniverseId3)
				UniverseId2 = if Number == nil or Number == 0 then nil else Number
			else
				UniverseId2 = nil
			end
		else
			UniverseId2 = nil
		end
	else
		UniverseId2 = UniverseId1
	end
	return Update, SessionId, UniverseId2, Params.pinForBuild == true
end

local function classifyFrame(p2) --[[ Line: 114 ]]
	-- upvalues: getSessionUpdate (copy), FFlagBuildExperiencePinForBuild (copy), FFlagCreatorAgentChatFilterTerminalClientToolsModule (copy), config (copy)
	local SessionUpdate, SessionUpdate2, SessionUpdate3, SessionUpdate4 = getSessionUpdate(p2)
	
	if SessionUpdate == nil or SessionUpdate2 == nil then
		return nil
	end
	if FFlagBuildExperiencePinForBuild and SessionUpdate4 ~= true then
		return nil
	end
	if SessionUpdate.sessionUpdate == "state_change" and SessionUpdate.state == "idle" then
		return {
			kind = "turn_end",
			sessionId = SessionUpdate2,
			universeId = SessionUpdate3
		}
	end
	repeat
		if SessionUpdate.sessionUpdate ~= "tool_call_update" then break end
		local Status = SessionUpdate.status
		
		if Status == "completed" or (Status == "failed" or FFlagCreatorAgentChatFilterTerminalClientToolsModule and Status == "cancelled") then break end
		local Kind: string = SessionUpdate.kind
		local Flag = nil
		repeat
			if typeof(Kind) ~= "string" or config[string.lower(Kind)] ~= true then
				local Title: string = SessionUpdate.title
				
				if typeof(Title) ~= "string" or config[string.lower(Title)] ~= true then
					local RawInput = SessionUpdate.rawInput
					
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
		local ToolCallId = SessionUpdate.toolCallId
		
		return {
			kind = "local_tool_call",
			sessionId = SessionUpdate2,
			universeId = SessionUpdate3,
			toolCallId = if typeof(ToolCallId) == "string" and ToolCallId ~= "" then ToolCallId else nil
		}
	until true
	return nil
end

local function getResumeDeepLink(p2): string --[[ Line: 186 ]]
	-- upvalues: HttpService (copy)
	local List = {}
	
	if p2.universeId ~= nil then
		table.insert(List, `universeid={HttpService:UrlEncode((tostring(p2.universeId)))}`)
	end
	table.insert(List, `sessionid={HttpService:UrlEncode(p2.sessionId)}`)
	
	return `roblox://navigation/build?{table.concat(List, "&")}`
end

local function getToastCopy(p2) --[[ Line: 203 ]]
	-- upvalues: Localization (copy), LocalizationService (copy)
	local IsLocalToolCall = p2.kind == "local_tool_call"
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	return {
		title = NewLocalization:Format(if IsLocalToolCall then "Feature.Build.Notification.Title.NeedInput" else "Feature.Build.Notification.Title.Finished"),
		label = NewLocalization:Format(if IsLocalToolCall then "Feature.Build.Notification.Message.Continue" else "Feature.Build.Notification.Message.Review"),
		dismiss = NewLocalization:Format("Feature.Build.Action.Dismiss"),
		resume = NewLocalization:Format("Feature.Build.Action.Resume")
	}
end

local _ = function(p2) --[[ Line: 222 | Named "getActionEventParams" ]]
	-- upvalues: HttpService (copy), getResumeDeepLink (copy)
	return HttpService:JSONEncode({
		sessionId = p2.sessionId,
		universeId = p2.universeId,
		kind = p2.kind,
		deepLink = getResumeDeepLink(p2)
	})
end

local function getToastVisualItems(p2, ToastCopy, ActionEventParams) --[[ Line: 231 ]]
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
			title = { text = ToastCopy.title },
			label = { text = ToastCopy.label },
			actions = {},
			actionEventParams = ActionEventParams
		}
	})
	table.insert(List, {
		button = {
			buttonStyle = "Secondary",
			eventName = "CreatorAgentResumeDismiss",
			visualItemType = "button",
			label = { text = ToastCopy.dismiss },
			actions = { { actionType = "dismiss" } }
		}
	})
	table.insert(List, {
		button = {
			buttonStyle = "Primary",
			eventName = "CreatorAgentResume",
			visualItemType = "button",
			label = { text = ToastCopy.resume },
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
	classifyRtnDetail = function(p2) --[[ Line: 150 ]]
		-- upvalues: extractRawFrame (copy), ParseFrameModule (copy), classifyFrame (copy)
		local ExtractRawFrameResult = extractRawFrame(p2)
		
		if ExtractRawFrameResult == nil then
			return nil
		else
			local ParseFrameModuleResult = ParseFrameModule(ExtractRawFrameResult)
			
			return if ParseFrameModuleResult == nil then nil else classifyFrame(ParseFrameModuleResult)
		end
	end,
	targetMatchesNotification = function(p2, p3): boolean --[[ Line: 164 ]]
		return p2 ~= nil and (p2.sessionId ~= nil and p2.sessionId ~= "" and p2.sessionId == p3.sessionId or p2.universeId ~= nil and (p3.universeId ~= nil and p2.universeId == p3.universeId))
	end,
	getNotificationId = function(p2): string --[[ Line: 179 ]]
		return if p2.kind == "local_tool_call" and p2.toolCallId ~= nil then `CreatorAgentResume-{p2.sessionId}-{p2.toolCallId}` else `CreatorAgentResume-{p2.sessionId}-{p2.kind}`
	end,
	getResumeDeepLink = getResumeDeepLink,
	buildToastNotification = function(p2) --[[ Line: 279 ]]
		-- upvalues: getToastCopy (copy), HttpService (copy), getResumeDeepLink (copy), getToastVisualItems (copy)
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
						visualItems = getToastVisualItems(p2, getToastCopy(p2), (HttpService:JSONEncode({
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