local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local ChatConstantsModule = require(script.Parent.chatConstants)
local ClientDataModelCollectorModule = require(script.Parent.clientDataModelCollector)
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local StudioClientDataModelTools = CreatorAgentChatModule.StudioClientDataModelTools
local Debug = CreatorAgentChatModule.debug

return function(p1, p2, p3) --[[ Line: 30 | Named "createClientDataModelController" ]]
	-- upvalues: StudioClientDataModelTools (copy), ClientDataModelCollectorModule (copy), Debug (copy), ToolControllerUtilsModule (copy), ChatConstantsModule (copy)
	local Callback = p3 or function(): boolean --[[ Line: 35 ]]
		return true
	end
	local t = {}
	
	local function _(Key) --[[ Line: 40 | Named "clearPending" ]]
		-- upvalues: t (copy), p2 (copy)
		t[Key] = nil
		p2[Key] = nil
	end
	
	local function collectResult(p4) --[[ Line: 45 ]]
		-- upvalues: StudioClientDataModelTools (upval), ClientDataModelCollectorModule (upval)
		return if p4.toolName == StudioClientDataModelTools.SEARCH_TOOL_NAME then ClientDataModelCollectorModule.searchClientDataModel(p4.rawInput) else ClientDataModelCollectorModule.inspectClientInstance(p4.rawInput)
	end
	
	local function submitResult(p4) --[[ Line: 52 ]]
		-- upvalues: Callback (copy), t (copy), p2 (copy), Debug (upval), collectResult (copy), StudioClientDataModelTools (upval), p1 (copy), ToolControllerUtilsModule (upval), ChatConstantsModule (upval)
		if not Callback() then
			local ToolCallId = p4.toolCallId
			t[ToolCallId] = nil
			p2[ToolCallId] = nil
			
			return
		end
		Debug.log("info", `{p4.toolName} tool_result collecting`, {
			sessionId = p4.sessionId,
			toolCallId = p4.toolCallId,
			turnId = p4.turnId,
			referenceId = p4.referenceId
		})
		local ClockTime = os.clock()
		local Success, Result = pcall(collectResult, p4)
		
		if not Success then
			Result = {
				status = "collection_failed",
				message = "The client DataModel could not be inspected."
			}
		end
		local FormatResultContentResult = StudioClientDataModelTools.formatResultContent(Result)
		local Floored = math.floor((os.clock() - ClockTime) * 1000 + 0.5)
		
		if not Callback() then
			local ToolCallId = p4.toolCallId
			t[ToolCallId] = nil
			p2[ToolCallId] = nil
			
			return
		end
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatResultContentResult, false, p4.turnId, p4.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			local ToolCallId = p4.toolCallId
			t[ToolCallId] = nil
			p2[ToolCallId] = nil
			Debug.log("warn", `{p4.toolName} tool_result submit aborted (no active session)`, { toolCallId = p4.toolCallId, collectDurationMs = Floored })
			
			return
		end
		local AwaitRequestStateResult = ToolControllerUtilsModule.awaitRequestState(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local Floored1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		t[p4.toolCallId] = nil
		
		if AwaitRequestStateResult.status == "succeeded" then
			Debug.log("info", `{p4.toolName} tool_result submitted`, {
				sessionId = p4.sessionId,
				toolCallId = p4.toolCallId,
				turnId = p4.turnId,
				referenceId = p4.referenceId,
				collectDurationMs = Floored,
				submitDurationMs = Floored1
			})
			
			return
		end
		if AwaitRequestStateResult.status == "pending" then
			SubmitActiveToolResultResult.dispose()
		else
			p2[p4.toolCallId] = nil
		end
		Debug.log("warn", `{p4.toolName} tool_result submit failed`, {
			sessionId = p4.sessionId,
			toolCallId = p4.toolCallId,
			turnId = p4.turnId,
			referenceId = p4.referenceId,
			collectDurationMs = Floored,
			submitDurationMs = Floored1,
			state = Debug.formatRequestState(AwaitRequestStateResult)
		})
	end
	
	local function syncRequest(p4, ToolName, Callback1): boolean --[[ Line: 122 ]]
		-- upvalues: Callback (copy), p2 (copy), t (copy), Debug (upval), submitResult (copy)
		if not Callback() then
			return false
		end
		local CallbackResult, CallbackResult2, CallbackResult3, CallbackResult4 = Callback1(p4, p2)
		
		if CallbackResult == nil then
			return false
		else
			p2[CallbackResult] = true
			t[CallbackResult] = true
			local config = {
				sessionId = p4.sessionId,
				toolCallId = CallbackResult,
				toolName = ToolName,
				rawInput = CallbackResult2,
				turnId = CallbackResult3,
				referenceId = CallbackResult4
			}
			Debug.log("info", "runtime client tool call accepted", {
				sessionId = config.sessionId,
				toolCallId = config.toolCallId,
				toolName = config.toolName,
				turnId = config.turnId,
				referenceId = config.referenceId,
				gameId = game.GameId,
				path = if typeof(CallbackResult2) == "table" then CallbackResult2.path else nil
			})
			task.spawn(function() --[[ Line: 154 ]]
				-- upvalues: submitResult (upval), config (copy)
				submitResult(config)
			end)
			
			return true
		end
	end
	
	return {
		revokePending = function() --[[ Line: 175 ]]
			-- upvalues: t (copy), p2 (copy)
			for i in t do
				t[i] = nil
				p2[i] = nil
			end
		end,
		syncClientDataModelRequests = function(p4) --[[ Line: 160 ]]
			-- upvalues: syncRequest (copy), StudioClientDataModelTools (upval)
			local SyncRequestResult = syncRequest(p4, StudioClientDataModelTools.SEARCH_TOOL_NAME, StudioClientDataModelTools.findSearchRequestInTurnState)
			local SyncRequestResult1 = syncRequest(p4, StudioClientDataModelTools.INSPECT_TOOL_NAME, StudioClientDataModelTools.findInspectRequestInTurnState)
			
			return SyncRequestResult or SyncRequestResult1
		end
	}
end