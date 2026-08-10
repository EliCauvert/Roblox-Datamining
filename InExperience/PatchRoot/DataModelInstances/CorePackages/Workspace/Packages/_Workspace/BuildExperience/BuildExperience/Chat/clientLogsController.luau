local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local chatConstantsModule = require(script.Parent.chatConstants)
local clientLogsCollectorModule = require(script.Parent.clientLogsCollector)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
local debug = creatorAgentChatModule.debug
local awaitRequestState = toolControllerUtilsModule.awaitRequestState

local function _(p0) --[[ line: 33 | named "getClientLogsReason" ]]
	return if typeof(p0) == "table" then if typeof(p0.reason) == "string" and p0.reason ~= "" then p0.reason else nil else nil
end

return function(p1, p2) --[[ line: 40 | named "createClientLogsController" ]]
	-- upvalues: debug (ref), clientLogsCollectorModule (ref), awaitRequestState (ref), chatConstantsModule (ref), studioClientLogsTool (ref)
	local function submitClientLogsResult(p3) --[[ line: 44 ]]
		-- upvalues: debug (copy), clientLogsCollectorModule (copy), p1 (ref), awaitRequestState (copy), chatConstantsModule (copy)
		debug.log("info", "ask_for_logs tool_result collecting", {
			sessionId = p3.sessionId,
			toolCallId = p3.toolCallId,
			turnId = p3.turnId,
			referenceId = p3.referenceId,
			reason = p3.reason
		})
		local floored = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		local var6 = p1.submitActiveToolResult(clientLogsCollectorModule.collectToolResultContent(), false, p3.turnId, p3.referenceId)
		
		if var6 == nil then
			debug.log("warn", "ask_for_logs tool_result submit aborted (no active session)", { toolCallId = p3.toolCallId, collectDurationMs = floored })
			
			return
		end
		local var7 = awaitRequestState(var6.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored_1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		
		if var7.status == "succeeded" then
			debug.log("info", "ask_for_logs tool_result submitted", {
				sessionId = p3.sessionId,
				toolCallId = p3.toolCallId,
				turnId = p3.turnId,
				referenceId = p3.referenceId,
				collectDurationMs = floored,
				submitDurationMs = floored_1
			})
			
			return
		end
		debug.log("warn", "ask_for_logs tool_result submit failed", {
			sessionId = p3.sessionId,
			toolCallId = p3.toolCallId,
			turnId = p3.turnId,
			referenceId = p3.referenceId,
			collectDurationMs = floored,
			submitDurationMs = floored_1,
			state = debug.formatRequestState(var7)
		})
	end
	
	return {
		syncClientLogsRequest = function(p4) --[[ line: 92 ]]
			-- upvalues: studioClientLogsTool (copy), p2 (ref), submitClientLogsResult (ref)
			local var9, var10, var11, var12 = studioClientLogsTool.findClientLogsRequestInTurnState(p4, p2)
			
			if var9 == nil then
				return false
			end
			p2[var9] = true
			local t = {
				sessionId = p4.sessionId,
				toolCallId = var9,
				turnId = var11,
				referenceId = var12,
				reason = if typeof(var10) ~= "table" then if typeof(var10.reason) == "string" and var10.reason ~= "" then var10.reason else nil else nil
			}
			task.spawn(function() --[[ line: 107 ]]
				-- upvalues: submitClientLogsResult (copy), t (ref)
				submitClientLogsResult(t)
			end)
			
			return true
		end
	}
end