local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local ChatConstantsModule = require(script.Parent.chatConstants)
local ClientLogsCollectorModule = require(script.Parent.clientLogsCollector)
local StudioClientLogsTool = CreatorAgentChatModule.StudioClientLogsTool
local Debug = CreatorAgentChatModule.debug
local AwaitRequestStateFunction = require(script.Parent.toolControllerUtils).awaitRequestState

local function _(p1)
	return if typeof(p1) == "table" and (typeof(p1.reason) == "string" and p1.reason ~= "") then p1.reason else nil
end

return function(p1, p2)
	-- upvalues: Debug (copy), ClientLogsCollectorModule (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), StudioClientLogsTool (copy)
	local function submitClientLogsResult(p3)
		-- upvalues: Debug (upval), ClientLogsCollectorModule (upval), p1 (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval)
		Debug.log("info", "ask_for_logs tool_result collecting", {
			sessionId = p3.sessionId,
			toolCallId = p3.toolCallId,
			turnId = p3.turnId,
			referenceId = p3.referenceId,
			reason = p3.reason
		})
		local Floored = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(ClientLogsCollectorModule.collectToolResultContent(), false, p3.turnId, p3.referenceId)
		
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
			-- upvalues: StudioClientLogsTool (upval), p2 (copy), submitClientLogsResult (copy)
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