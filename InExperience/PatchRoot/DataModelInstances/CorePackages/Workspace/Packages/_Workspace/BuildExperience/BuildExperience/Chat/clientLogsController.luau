local Parent = script:FindFirstAncestor("BuildExperience").Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local ChatConstantsModule = require(script.Parent.chatConstants)
local ClientLogsCollectorModule = require(script.Parent.clientLogsCollector)
local StudioClientLogsTool = CreatorAgentChatModule.StudioClientLogsTool
local Debug = CreatorAgentChatModule.debug
local AwaitRequestStateFunction = require(script.Parent.toolControllerUtils).awaitRequestState

local function _(p1)
	return if typeof(p1) == "table" and (typeof(p1.reason) == "string" and p1.reason ~= "") then p1.reason else nil
end

local function fetchLatestSavedVersion(PlaceId)
	-- upvalues: Parent (copy)
	if PlaceId == nil then
		return nil
	end
	local v1, v2 = require(Parent.DataHydration.PlaceVersionHistory).getPlaceVersionHistoryStore().fetchPageHistory(PlaceId):await()
	
	if v1 and typeof(v2) == "table" and typeof(v2.placeVersions) == "table" then
		local PlaceVersion = v2.placeVersions[1]
		
		return if typeof(PlaceVersion) == "table" then tonumber(PlaceVersion.version) else nil
	else
		return nil
	end
end

return function(p1, p2, Callback)
	-- upvalues: Debug (copy), fetchLatestSavedVersion (copy), ClientLogsCollectorModule (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), StudioClientLogsTool (copy)
	local function _()
		-- upvalues: Callback (copy)
		return Callback == nil or Callback()
	end
	
	local function submitClientLogsResult(p3)
		-- upvalues: Debug (upval), fetchLatestSavedVersion (upval), p1 (copy), Callback (copy), p2 (copy), ClientLogsCollectorModule (upval), AwaitRequestStateFunction (upval), ChatConstantsModule (upval)
		Debug.log("info", "ask_for_logs tool_result collecting", {
			sessionId = p3.sessionId,
			toolCallId = p3.toolCallId,
			turnId = p3.turnId,
			referenceId = p3.referenceId,
			reason = p3.reason
		})
		local ClockTime = os.clock()
		local LatestSavedVersion = fetchLatestSavedVersion(p1.placeId)
		
		if Callback ~= nil and not Callback() then
			p2[p3.toolCallId] = nil
			
			return
		end
		local Floored = math.floor((os.clock() - ClockTime) * 1000 + 0.5)
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(ClientLogsCollectorModule.collectToolResultContent({
			universeId = p1.universeId,
			placeId = p1.placeId,
			minimumPlaceVersion = LatestSavedVersion
		}), false, p3.turnId, p3.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "ask_for_logs tool_result submit aborted (no active session)", { toolCallId = p3.toolCallId, collectDurationMs = Floored })
			
			return
		end
		local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local Floored1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		
		if AwaitRequestStateResult.status == "succeeded" then
			Debug.log("info", "ask_for_logs tool_result submitted", {
				sessionId = p3.sessionId,
				toolCallId = p3.toolCallId,
				turnId = p3.turnId,
				referenceId = p3.referenceId,
				collectDurationMs = Floored,
				submitDurationMs = Floored1
			})
			
			return
		else
			Debug.log("warn", "ask_for_logs tool_result submit failed", {
				sessionId = p3.sessionId,
				toolCallId = p3.toolCallId,
				turnId = p3.turnId,
				referenceId = p3.referenceId,
				collectDurationMs = Floored,
				submitDurationMs = Floored1,
				state = Debug.formatRequestState(AwaitRequestStateResult)
			})
		end
	end
	
	return {
		syncClientLogsRequest = function(p3): boolean
			-- upvalues: Callback (copy), StudioClientLogsTool (upval), p2 (copy), submitClientLogsResult (copy)
			if Callback ~= nil and not Callback() then
				return false
			end
			local ClientLogsRequestInTurnState, ClientLogsRequestInTurnState2, ClientLogsRequestInTurnState3, ClientLogsRequestInTurnState4 = StudioClientLogsTool.findClientLogsRequestInTurnState(p3, p2)
			
			if ClientLogsRequestInTurnState == nil then
				return false
			else
				p2[ClientLogsRequestInTurnState] = true
				local config = {
					sessionId = p3.sessionId,
					toolCallId = ClientLogsRequestInTurnState,
					turnId = ClientLogsRequestInTurnState3,
					referenceId = ClientLogsRequestInTurnState4,
					reason = if typeof(ClientLogsRequestInTurnState2) == "table" and (typeof(ClientLogsRequestInTurnState2.reason) == "string" and ClientLogsRequestInTurnState2.reason ~= "") then ClientLogsRequestInTurnState2.reason else nil
				}
				task.spawn(function()
					-- upvalues: submitClientLogsResult (upval), config (copy)
					submitClientLogsResult(config)
				end)
				
				return true
			end
		end
	}
end