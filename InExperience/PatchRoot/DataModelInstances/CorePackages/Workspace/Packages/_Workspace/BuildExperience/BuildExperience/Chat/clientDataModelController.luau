local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local chatConstantsModule = require(script.Parent.chatConstants)
local clientDataModelCollectorModule = require(script.Parent.clientDataModelCollector)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioClientDataModelTools = creatorAgentChatModule.StudioClientDataModelTools
local debug = creatorAgentChatModule.debug

return function(p0, p1, p2)
	-- upvalues: studioClientDataModelTools (ref), clientDataModelCollectorModule (ref), debug (ref), toolControllerUtilsModule (ref), chatConstantsModule (ref)
	p2 = p2 or function()
		return true
	end
	local t = {}
	
	local function _(p3)
		-- upvalues: t (ref), p1 (ref)
		t[p3] = nil
		p1[p3] = nil
	end
	
	local function collectResult(p4)
		-- upvalues: studioClientDataModelTools (copy), clientDataModelCollectorModule (copy)
		return if p4.toolName == studioClientDataModelTools.SEARCH_TOOL_NAME then clientDataModelCollectorModule.searchClientDataModel(p4.rawInput) else clientDataModelCollectorModule.inspectClientInstance(p4.rawInput)
	end
	
	local function submitResult(p5)
		-- upvalues: p2 (ref), t (ref), p1 (ref), debug (copy), collectResult (ref), studioClientDataModelTools (copy), p0 (ref), toolControllerUtilsModule (copy), chatConstantsModule (copy)
		if not p2() then
			local toolCallId = p5.toolCallId
			t[toolCallId] = nil
			p1[toolCallId] = nil
			
			return
		end
		debug.log("info", `{p5.toolName} tool_result collecting`, {
			sessionId = p5.sessionId,
			toolCallId = p5.toolCallId,
			turnId = p5.turnId,
			referenceId = p5.referenceId
		})
		local processTime = os.clock()
		local ok, status = pcall(collectResult, p5)
		
		if not ok then
			status = {
				status = "collection_failed",
				message = "The client DataModel could not be inspected."
			}
		end
		local var10 = studioClientDataModelTools.formatResultContent(status)
		local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
		
		if not p2() then
			local toolCallId = p5.toolCallId
			t[toolCallId] = nil
			p1[toolCallId] = nil
			
			return
		end
		local var12 = p0.submitActiveToolResult(var10, false, p5.turnId, p5.referenceId)
		
		if var12 == nil then
			local toolCallId = p5.toolCallId
			t[toolCallId] = nil
			p1[toolCallId] = nil
			debug.log("warn", `{p5.toolName} tool_result submit aborted (no active session)`, { toolCallId = p5.toolCallId, collectDurationMs = floored })
			
			return
		end
		local var13 = toolControllerUtilsModule.awaitRequestState(var12.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored_1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		t[p5.toolCallId] = nil
		
		if var13.status == "succeeded" then
			debug.log("info", `{p5.toolName} tool_result submitted`, {
				sessionId = p5.sessionId,
				toolCallId = p5.toolCallId,
				turnId = p5.turnId,
				referenceId = p5.referenceId,
				collectDurationMs = floored,
				submitDurationMs = floored_1
			})
			
			return
		elseif var13.status == "pending" then
			var12.dispose()
		else
			p1[p5.toolCallId] = nil
		end
		debug.log("warn", `{p5.toolName} tool_result submit failed`, {
			sessionId = p5.sessionId,
			toolCallId = p5.toolCallId,
			turnId = p5.turnId,
			referenceId = p5.referenceId,
			collectDurationMs = floored,
			submitDurationMs = floored_1,
			state = debug.formatRequestState(var13)
		})
	end
	
	local function syncRequest(p6, p7, p8)
		-- upvalues: p2 (ref), p1 (ref), t (ref), debug (copy), submitResult (ref)
		if not p2() then
			return false
		end
		local var15, var16, var17, var18 = p8(p6, p1)
		
		if var15 == nil then
			return false
		end
		p1[var15] = true
		t[var15] = true
		local t_1 = {
			sessionId = p6.sessionId,
			toolCallId = var15,
			toolName = p7,
			rawInput = var16,
			turnId = var17,
			referenceId = var18
		}
		debug.log("info", "runtime client tool call accepted", {
			sessionId = t_1.sessionId,
			toolCallId = t_1.toolCallId,
			toolName = t_1.toolName,
			turnId = t_1.turnId,
			referenceId = t_1.referenceId,
			gameId = game.GameId,
			path = if typeof(var16) == "table" then var16.path else nil
		})
		task.spawn(function()
			-- upvalues: submitResult (copy), t_1 (ref)
			submitResult(t_1)
		end)
		
		return true
	end
	
	return {
		revokePending = function()
			-- upvalues: t (ref), p1 (ref)
			for i in t do
				t[i] = nil
				p1[i] = nil
			end
		end,
		syncClientDataModelRequests = function(p9)
			-- upvalues: syncRequest (ref), studioClientDataModelTools (copy)
			return syncRequest(p9, studioClientDataModelTools.SEARCH_TOOL_NAME, studioClientDataModelTools.findSearchRequestInTurnState) or syncRequest(p9, studioClientDataModelTools.INSPECT_TOOL_NAME, studioClientDataModelTools.findInspectRequestInTurnState)
		end
	}
end