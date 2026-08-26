local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local chatConstantsModule = require(script.Parent.chatConstants)
local clientLogsCollectorModule = require(script.Parent.clientLogsCollector)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
local debug = creatorAgentChatModule.debug
local awaitRequestState = toolControllerUtilsModule.awaitRequestState

local function _(p1)
	return if typeof(p1) == "table" then if typeof(p1.reason) == "string" and p1.reason ~= "" then p1.reason else nil else nil
end

local function fetchLatestSavedVersion(p1)
	-- upvalues: parent (ref)
	if p1 == nil then
		return nil
	end
	local var1, var2 = require(parent.DataHydration.PlaceVersionHistory).getPlaceVersionHistoryStore().fetchPageHistory(p1):await()
	
	if not var1 or typeof(var2) ~= "table" or typeof(var2.placeVersions) ~= "table" then
		return nil
	end
	local var3 = var2.placeVersions[1]
	
	return if typeof(var3) == "table" then tonumber(var3.version) else nil
end

return function(p1, p2, p3)
	-- upvalues: debug (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fetchLatestSavedVersion (ref), clientLogsCollectorModule (ref), awaitRequestState (ref), chatConstantsModule (ref), studioClientLogsTool (ref)
	local function _()
		-- upvalues: p3 (ref)
		return if p3 ~= nil then p3() else true
	end
	
	local function submitClientLogsResult(p4)
		-- upvalues: debug (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fetchLatestSavedVersion (copy), p1 (ref), p3 (ref), p2 (ref), clientLogsCollectorModule (copy), awaitRequestState (copy), chatConstantsModule (copy)
		local var1
		debug.log("info", "ask_for_logs tool_result collecting", {
			sessionId = p4.sessionId,
			toolCallId = p4.toolCallId,
			turnId = p4.turnId,
			referenceId = p4.referenceId,
			reason = p4.reason
		})
		local processTime = os.clock()
		local _ = nil
		
		if fFlagBuildExperiencePersistPlaytestLogsModule then
			local var2 = fetchLatestSavedVersion(p1.placeId)
			
			if not (if p3 ~= nil then p3() else true) then
				p2[p4.toolCallId] = nil
				
				return
			end
			var1 = clientLogsCollectorModule.collectToolResultContent({
				universeId = p1.universeId,
				placeId = p1.placeId,
				minimumPlaceVersion = var2
			})
		else
			var1 = clientLogsCollectorModule.collectToolResultContent()
		end
		local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
		local var3 = p1.submitActiveToolResult(var1, false, p4.turnId, p4.referenceId)
		
		if var3 == nil then
			debug.log("warn", "ask_for_logs tool_result submit aborted (no active session)", { toolCallId = p4.toolCallId, collectDurationMs = floored })
			
			return
		end
		local var4 = awaitRequestState(var3.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored_1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		
		if var4.status == "succeeded" then
			debug.log("info", "ask_for_logs tool_result submitted", {
				sessionId = p4.sessionId,
				toolCallId = p4.toolCallId,
				turnId = p4.turnId,
				referenceId = p4.referenceId,
				collectDurationMs = floored,
				submitDurationMs = floored_1
			})
			
			return
		end
		debug.log("warn", "ask_for_logs tool_result submit failed", {
			sessionId = p4.sessionId,
			toolCallId = p4.toolCallId,
			turnId = p4.turnId,
			referenceId = p4.referenceId,
			collectDurationMs = floored,
			submitDurationMs = floored_1,
			state = debug.formatRequestState(var4)
		})
	end
	
	return {
		syncClientLogsRequest = function(p4)
			-- upvalues: p3 (ref), studioClientLogsTool (copy), p2 (ref), submitClientLogsResult (ref)
			if not (if p3 ~= nil then p3() else true) then
				return false
			end
			local var1, var2, var3, var4 = studioClientLogsTool.findClientLogsRequestInTurnState(p4, p2)
			
			if var1 == nil then
				return false
			end
			p2[var1] = true
			local t = {
				sessionId = p4.sessionId,
				toolCallId = var1,
				turnId = var3,
				referenceId = var4,
				reason = if typeof(var2) ~= "table" then if typeof(var2.reason) == "string" and var2.reason ~= "" then var2.reason else nil else nil
			}
			task.spawn(function()
				-- upvalues: submitClientLogsResult (copy), t (ref)
				submitClientLogsResult(t)
			end)
			
			return true
		end
	}
end