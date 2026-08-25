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

local function _(p0)
	return if typeof(p0) == "table" then if typeof(p0.reason) == "string" and p0.reason ~= "" then p0.reason else nil else nil
end

local function fetchLatestSavedVersion(p1)
	-- upvalues: parent (ref)
	if p1 == nil then
		return nil
	end
	local var7, var8 = require(parent.DataHydration.PlaceVersionHistory).getPlaceVersionHistoryStore().fetchPageHistory(p1):await()
	
	if not var7 or typeof(var8) ~= "table" or typeof(var8.placeVersions) ~= "table" then
		return nil
	end
	local var9 = var8.placeVersions[1]
	
	return if typeof(var9) == "table" then tonumber(var9.version) else nil
end

return function(p2, p3, p4)
	-- upvalues: debug (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fetchLatestSavedVersion (ref), clientLogsCollectorModule (ref), awaitRequestState (ref), chatConstantsModule (ref), studioClientLogsTool (ref)
	local function _()
		-- upvalues: p4 (ref)
		return if p4 ~= nil then p4() else true
	end
	
	local function submitClientLogsResult(p5)
		-- upvalues: debug (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fetchLatestSavedVersion (copy), p2 (ref), p4 (ref), p3 (ref), clientLogsCollectorModule (copy), awaitRequestState (copy), chatConstantsModule (copy)
		local var13
		debug.log("info", "ask_for_logs tool_result collecting", {
			sessionId = p5.sessionId,
			toolCallId = p5.toolCallId,
			turnId = p5.turnId,
			referenceId = p5.referenceId,
			reason = p5.reason
		})
		local processTime = os.clock()
		local _ = nil
		
		if fFlagBuildExperiencePersistPlaytestLogsModule then
			local var12 = fetchLatestSavedVersion(p2.placeId)
			
			if not (if p4 ~= nil then p4() else true) then
				p3[p5.toolCallId] = nil
				
				return
			end
			var13 = clientLogsCollectorModule.collectToolResultContent({
				universeId = p2.universeId,
				placeId = p2.placeId,
				minimumPlaceVersion = var12
			})
		else
			var13 = clientLogsCollectorModule.collectToolResultContent()
		end
		local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
		local var15 = p2.submitActiveToolResult(var13, false, p5.turnId, p5.referenceId)
		
		if var15 == nil then
			debug.log("warn", "ask_for_logs tool_result submit aborted (no active session)", { toolCallId = p5.toolCallId, collectDurationMs = floored })
			
			return
		end
		local var16 = awaitRequestState(var15.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored_1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		
		if var16.status == "succeeded" then
			debug.log("info", "ask_for_logs tool_result submitted", {
				sessionId = p5.sessionId,
				toolCallId = p5.toolCallId,
				turnId = p5.turnId,
				referenceId = p5.referenceId,
				collectDurationMs = floored,
				submitDurationMs = floored_1
			})
			
			return
		end
		debug.log("warn", "ask_for_logs tool_result submit failed", {
			sessionId = p5.sessionId,
			toolCallId = p5.toolCallId,
			turnId = p5.turnId,
			referenceId = p5.referenceId,
			collectDurationMs = floored,
			submitDurationMs = floored_1,
			state = debug.formatRequestState(var16)
		})
	end
	
	return {
		syncClientLogsRequest = function(p6)
			-- upvalues: p4 (ref), studioClientLogsTool (copy), p3 (ref), submitClientLogsResult (ref)
			if not (if p4 ~= nil then p4() else true) then
				return false
			end
			local var18, var19, var20, var21 = studioClientLogsTool.findClientLogsRequestInTurnState(p6, p3)
			
			if var18 == nil then
				return false
			end
			p3[var18] = true
			local t = {
				sessionId = p6.sessionId,
				toolCallId = var18,
				turnId = var20,
				referenceId = var21,
				reason = if typeof(var19) ~= "table" then if typeof(var19.reason) == "string" and var19.reason ~= "" then var19.reason else nil else nil
			}
			task.spawn(function()
				-- upvalues: submitClientLogsResult (copy), t (ref)
				submitClientLogsResult(t)
			end)
			
			return true
		end
	}
end