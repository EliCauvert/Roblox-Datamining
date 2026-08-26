local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local chatConstantsModule = require(script.Parent.chatConstants)
local clientDataModelCollectorModule = require(script.Parent.clientDataModelCollector)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioClientDataModelTools = creatorAgentChatModule.StudioClientDataModelTools
local debug = creatorAgentChatModule.debug

return function(p1, p2, p3)
	-- upvalues: studioClientDataModelTools (ref), clientDataModelCollectorModule (ref), debug (ref), toolControllerUtilsModule (ref), chatConstantsModule (ref)
	p3 = p3 or function()
		return true
	end
	local t = {}
	
	local function _(p4)
		-- upvalues: t (ref), p2 (ref)
		t[p4] = nil
		p2[p4] = nil
	end
	
	local function collectResult(p4)
		-- upvalues: studioClientDataModelTools (copy), clientDataModelCollectorModule (copy)
		return if p4.toolName == studioClientDataModelTools.SEARCH_TOOL_NAME then clientDataModelCollectorModule.searchClientDataModel(p4.rawInput) else clientDataModelCollectorModule.inspectClientInstance(p4.rawInput)
	end
	
	local function submitResult(p4)
		-- upvalues: p3 (ref), t (ref), p2 (ref), debug (copy), collectResult (ref), studioClientDataModelTools (copy), p1 (ref), toolControllerUtilsModule (copy), chatConstantsModule (copy)
		if not p3() then
			local toolCallId = p4.toolCallId
			t[toolCallId] = nil
			p2[toolCallId] = nil
			
			return
		end
		debug.log("info", `{p4.toolName} tool_result collecting`, {
			sessionId = p4.sessionId,
			toolCallId = p4.toolCallId,
			turnId = p4.turnId,
			referenceId = p4.referenceId
		})
		local processTime = os.clock()
		local ok, status = pcall(collectResult, p4)
		
		if not ok then
			status = {
				status = "collection_failed",
				message = "The client DataModel could not be inspected."
			}
		end
		local var1 = studioClientDataModelTools.formatResultContent(status)
		local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
		
		if not p3() then
			local toolCallId = p4.toolCallId
			t[toolCallId] = nil
			p2[toolCallId] = nil
			
			return
		end
		local var2 = p1.submitActiveToolResult(var1, false, p4.turnId, p4.referenceId)
		
		if var2 == nil then
			local toolCallId = p4.toolCallId
			t[toolCallId] = nil
			p2[toolCallId] = nil
			debug.log("warn", `{p4.toolName} tool_result submit aborted (no active session)`, { toolCallId = p4.toolCallId, collectDurationMs = floored })
			
			return
		end
		local var3 = toolControllerUtilsModule.awaitRequestState(var2.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored_1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		t[p4.toolCallId] = nil
		
		if var3.status == "succeeded" then
			debug.log("info", `{p4.toolName} tool_result submitted`, {
				sessionId = p4.sessionId,
				toolCallId = p4.toolCallId,
				turnId = p4.turnId,
				referenceId = p4.referenceId,
				collectDurationMs = floored,
				submitDurationMs = floored_1
			})
			
			return
		elseif var3.status == "pending" then
			var2.dispose()
		else
			p2[p4.toolCallId] = nil
		end
		debug.log("warn", `{p4.toolName} tool_result submit failed`, {
			sessionId = p4.sessionId,
			toolCallId = p4.toolCallId,
			turnId = p4.turnId,
			referenceId = p4.referenceId,
			collectDurationMs = floored,
			submitDurationMs = floored_1,
			state = debug.formatRequestState(var3)
		})
	end
	
	local function syncRequest(p4, p5, p6)
		-- upvalues: p3 (ref), p2 (ref), t (ref), debug (copy), submitResult (ref)
		if not p3() then
			return false
		end
		local var1, var2, var3, var4 = p6(p4, p2)
		
		if var1 == nil then
			return false
		end
		p2[var1] = true
		t[var1] = true
		local t_1 = {
			sessionId = p4.sessionId,
			toolCallId = var1,
			toolName = p5,
			rawInput = var2,
			turnId = var3,
			referenceId = var4
		}
		debug.log("info", "runtime client tool call accepted", {
			sessionId = t_1.sessionId,
			toolCallId = t_1.toolCallId,
			toolName = t_1.toolName,
			turnId = t_1.turnId,
			referenceId = t_1.referenceId,
			gameId = game.GameId,
			path = if typeof(var2) == "table" then var2.path else nil
		})
		task.spawn(function()
			-- upvalues: submitResult (copy), t_1 (ref)
			submitResult(t_1)
		end)
		
		return true
	end
	
	return {
		revokePending = function()
			-- upvalues: t (ref), p2 (ref)
			for i in t do
				t[i] = nil
				p2[i] = nil
			end
		end,
		syncClientDataModelRequests = function(p4)
			-- upvalues: syncRequest (ref), studioClientDataModelTools (copy)
			return syncRequest(p4, studioClientDataModelTools.SEARCH_TOOL_NAME, studioClientDataModelTools.findSearchRequestInTurnState) or syncRequest(p4, studioClientDataModelTools.INSPECT_TOOL_NAME, studioClientDataModelTools.findInspectRequestInTurnState)
		end
	}
end