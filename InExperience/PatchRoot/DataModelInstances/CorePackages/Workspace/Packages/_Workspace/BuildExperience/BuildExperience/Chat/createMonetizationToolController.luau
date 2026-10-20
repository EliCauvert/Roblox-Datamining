local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local FFlagBuildExperienceToolResultFailureRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local config = {
	outcome = "unverified",
	errorMessage = "The request timed out and its outcome is unknown. List again before retrying."
}

local function _(p1)
	return if typeof(p1) == "table" and typeof(p1.errorMessage) == "string" then p1.errorMessage else tostring(p1)
end

local _ = function(p1)
	-- upvalues: ChatConstantsModule (copy), config (copy)
	local v1, v2 = p1:timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, config):await()
	
	if v1 then
		if v2 == nil then
			return nil, "The request returned no result.", nil
		else
			return v2, nil, nil
		end
	elseif v2 == nil then
		return nil, "The request returned no result.", nil
	else
		return nil, if typeof(v2) == "table" and typeof(v2.errorMessage) == "string" then v2.errorMessage else tostring(v2), v2
	end
end

local _ = function(Text, p1): string
	return if typeof(p1) == "table" and p1.outcome == "unverified" then "outcome_unknown" else Text .. "_failed"
end

return function(p1, p2, p3, p4, Callback)
	-- upvalues: HttpClientModule (copy), ChatConstantsModule (copy), FFlagBuildExperienceDevProductRecoveryModule (copy), PromiseModule (copy), Debug (copy), config (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (copy), ToolControllerUtilsModule (copy)
	local Tool = p1.tool
	local TOOLNAME = Tool.TOOL_NAME
	local v1 = nil
	local Tbl = {}
	local Generation = 0
	local Tbl1 = {}
	local Count = 0
	
	local function _(Count): boolean
		-- upvalues: Generation (ref)
		return Generation == Count
	end
	
	local _ = function(p5): boolean
		-- upvalues: v1 (ref), Generation (ref)
		return v1 == p5 and Generation == p5.generation
	end
	
	local _ = function(Count1, Count2): boolean
		-- upvalues: Generation (ref), Count (ref)
		return Generation == Count1 and Count == Count2
	end
	
	local _ = function(p5, p6)
		-- upvalues: HttpClientModule (upval), ChatConstantsModule (upval), Tbl1 (copy)
		local TimeoutResult = HttpClientModule.asPromise(p5):timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		Tbl1[TimeoutResult] = p6
		local AwaitStatusResult, AwaitStatusResult2 = TimeoutResult:awaitStatus()
		Tbl1[TimeoutResult] = nil
		
		return AwaitStatusResult, AwaitStatusResult2
	end
	
	local function cancelReplies(p5)
		-- upvalues: Tbl1 (copy)
		for i, value in table.clone(Tbl1) do
			if p5 == nil or value == p5 then
				Tbl1[i] = nil
				i:cancel()
			end
		end
	end
	
	local _ = function()
		-- upvalues: Count (ref), Tbl (copy), p3 (copy), cancelReplies (copy)
		Count += 1
		
		for i in Tbl do
			p3[i] = nil
		end
		table.clear(Tbl)
		cancelReplies("automatic")
	end
	
	local _ = function()
		-- upvalues: Generation (ref), Count (ref), Tbl (copy), p3 (copy), cancelReplies (copy)
		Generation += 1
		Count += 1
		
		for i in Tbl do
			p3[i] = nil
		end
		table.clear(Tbl)
		cancelReplies("automatic")
		cancelReplies("afterDecision")
	end
	
	local function proposalFromFlow(p6, IsApproved, IsRejected)
		-- upvalues: p1 (copy), FFlagBuildExperienceDevProductRecoveryModule (upval)
		local Input = p6.input
		local config = {
			toolCallId = p6.toolCallId,
			callOrder = p6.callOrder,
			action = Input.action,
			name = Input.name,
			description = Input.description,
			priceInRobux = Input.priceInRobux,
			itemKind = p1.itemKind,
			itemId = p1.itemIdOf(Input),
			isApproved = IsApproved,
			isRejected = IsRejected,
			isPending = if FFlagBuildExperienceDevProductRecoveryModule then p6.isPending else nil,
			hasError = if FFlagBuildExperienceDevProductRecoveryModule then p6.resultError ~= nil and not IsRejected else nil,
			canRetry = not FFlagBuildExperienceDevProductRecoveryModule and nil
		}
		
		if p1.cardFields ~= nil then
			for i, value in p1.cardFields(Input) do
				config[i] = value
			end
		end
		return config
	end
	
	local function submitAutomaticResult(Key, p7, FormatResultContentResult, p8, Count1, Count2)
		-- upvalues: Generation (ref), Count (ref), p2 (copy), Tbl (copy), p3 (copy), HttpClientModule (upval), ChatConstantsModule (upval), Tbl1 (copy), PromiseModule (upval), Debug (upval), TOOLNAME (copy)
		if Generation ~= Count1 or Count ~= Count2 then return end
		local SubmitActiveToolResultResult = p2.submitActiveToolResult(FormatResultContentResult, p8, p7.turnId, p7.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Tbl[Key] = nil
			
			if Generation == Count1 then
				p3[Key] = nil
			end
			return
		else
			local TimeoutResult = HttpClientModule.asPromise(SubmitActiveToolResultResult):timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			Tbl1[TimeoutResult] = "automatic"
			local AwaitStatusResult, AwaitStatusResult2 = TimeoutResult:awaitStatus()
			Tbl1[TimeoutResult] = nil
			
			if Generation ~= Count1 or Count ~= Count2 then return end
			Tbl[Key] = nil
			
			if AwaitStatusResult == PromiseModule.Status.Resolved then
				p3[Key] = true
				
				return
			else
				p3[Key] = nil
				Debug.log("warn", TOOLNAME .. " automatic submit failed", {
					toolCallId = Key,
					status = AwaitStatusResult,
					reason = if typeof(AwaitStatusResult2) == "table" and typeof(AwaitStatusResult2.errorMessage) == "string" then AwaitStatusResult2.errorMessage else tostring(AwaitStatusResult2)
				})
			end
		end
	end
	
	local function runList(Key, p7, Count1, Count2)
		-- upvalues: Generation (ref), Count (ref), p2 (copy), p1 (copy), ChatConstantsModule (upval), config (upval), Tool (copy), submitAutomaticResult (copy)
		if Generation ~= Count1 or Count ~= Count2 then return end
		local v2 = nil
		local v3 = nil
		
		if p2.universeId == nil then
			v3 = "No universe is associated with this session."
		else
			local v4, v5 = p1.list(p2.universeId):timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, config):await()
			local ErrorMessage = nil
			local v6 = nil
			
			if v4 then
				if v5 == nil then
					v6 = nil
					ErrorMessage = "The request returned no result."
				else
					v6 = v5
					ErrorMessage = nil
				end
			elseif v5 == nil then
				v6 = nil
				ErrorMessage = "The request returned no result."
			else
				v6 = nil
				ErrorMessage = if typeof(v5) == "table" and typeof(v5.errorMessage) == "string" then v5.errorMessage else tostring(v5)
			end
			v2 = v6
			v3 = ErrorMessage
		end
		if Generation ~= Count1 or Count ~= Count2 then return end
		local config1 = { status = "ok", action = "list" }
		
		if v2 == nil then
			config1 = {
				status = "error",
				action = "list",
				detailCode = "list_failed",
				message = v3 or "The list request failed."
			}
		else
			for i, value in v2 do
				config1[i] = value
			end
		end
		local FormatResultContentResult, FormatResultContentResult2 = Tool.formatResultContent(config1)
		submitAutomaticResult(Key, p7, FormatResultContentResult, FormatResultContentResult2 or v2 == nil, Count1, Count2)
	end
	
	local function recoverFailedSubmission(p8, p9, ResponseCode)
		-- upvalues: v1 (ref), Generation (ref), p4 (copy), Callback (copy), proposalFromFlow (copy)
		if v1 ~= p8 or Generation ~= p8.generation then
			p4.removeDevProductAction(p8.toolCallId)
			
			return
		end
		if not p8.toolCallPresent then
			p4.removeDevProductTool(p8.toolCallId)
			p4.removeDevProductAction(p8.toolCallId)
			v1 = nil
			
			return
		end
		p8.submitted = false
		
		if Callback ~= nil then
			p4.setDevProductTool((proposalFromFlow(p8, false, false)))
			Callback(p9, ResponseCode)
			
			return
		end
	end
	
	local function submitResult(p8, FormatRejectionContentResult, p9, p10)
		-- upvalues: v1 (ref), Generation (ref), p2 (copy), HttpClientModule (upval), ChatConstantsModule (upval), Tbl1 (copy), PromiseModule (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), recoverFailedSubmission (copy), Debug (upval), TOOLNAME (copy), p3 (copy), p4 (copy)
		if v1 ~= p8 or Generation ~= p8.generation then return end
		local SubmitActiveToolResultResult = p2.submitActiveToolResult(FormatRejectionContentResult, p9, p8.turnId, p8.referenceId)
		local Status = "no session"
		local v7 = nil
		
		if SubmitActiveToolResultResult ~= nil then
			local TimeoutResult = HttpClientModule.asPromise(SubmitActiveToolResultResult):timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			Tbl1[TimeoutResult] = "afterDecision"
			local AwaitStatusResult, AwaitStatusResult2 = TimeoutResult:awaitStatus()
			Tbl1[TimeoutResult] = nil
			Status = AwaitStatusResult
			v7 = AwaitStatusResult2
		end
		if v1 ~= p8 or Generation ~= p8.generation then return end
		if Status == PromiseModule.Status.Resolved then
			p3[p8.toolCallId] = true
			p4.markSubmitted(p8.toolCallId)
			p4.removeDevProductAction(p8.toolCallId)
			
			if v1 == p8 then
				v1 = nil
			end
			return
		else
			if FFlagBuildExperienceToolResultFailureRecoveryModule or not p8.toolCallPresent then
				recoverFailedSubmission(p8, p10, if typeof(v7) == "table" then v7.responseCode else nil)
			else
				p8.submitted = false
			end
			Debug.log("warn", TOOLNAME .. " tool_result submit failed", {
				sessionId = p8.sessionId,
				toolCallId = p8.toolCallId,
				action = p8.input.action,
				status = Status,
				reason = if typeof(v7) == "table" and typeof(v7.errorMessage) == "string" then v7.errorMessage else tostring(v7)
			})
		end
	end
	
	local function submitApproval(p8)
		-- upvalues: v1 (ref), Generation (ref), p1 (copy), ChatConstantsModule (upval), config (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), p4 (copy), proposalFromFlow (copy), Tool (copy), submitResult (copy)
		if v1 ~= p8 or Generation ~= p8.generation then return end
		if not p8.attempted then
			p8.attempted = true
			local Result = nil
			local v7 = nil
			local OutcomeUnknown: string? = nil
			local ResultError = nil
			
			if p8.universeId == nil then
				ResultError = "No universe is associated with this session."
			else
				local MutateResult = p1.mutate(p8.universeId, p8.input)
				
				if MutateResult == nil then
					ResultError = "The write was not sent."
				else
					local v8, v9 = MutateResult:timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, config):await()
					local v10 = nil
					local ErrorMessage = nil
					local v11 = nil
					
					if v8 then
						if v9 == nil then
							v10 = nil
							ErrorMessage = "The request returned no result."
							v11 = nil
						else
							v10 = v9
							ErrorMessage = nil
							v11 = nil
						end
					elseif v9 == nil then
						v10 = nil
						ErrorMessage = "The request returned no result."
						v11 = nil
					else
						v10 = nil
						ErrorMessage = if typeof(v9) == "table" and typeof(v9.errorMessage) == "string" then v9.errorMessage else tostring(v9)
						v11 = v9
					end
					Result = v10
					ResultError = ErrorMessage
					v7 = v11
				end
			end
			if v1 ~= p8 or Generation ~= p8.generation then return end
			if Result == nil and typeof(v7) == "table" then
				Result = v7[p1.resultKey]
			end
			if ResultError ~= nil then
				local Action = p8.input.action
				OutcomeUnknown = if typeof(v7) == "table" and v7.outcome == "unverified" then "outcome_unknown" else Action .. "_failed"
			end
			p8.result = Result
			p8.resultError = ResultError
			p8.resultDetailCode = OutcomeUnknown
		end
		if FFlagBuildExperienceDevProductRecoveryModule then
			p8.isPending = false
			
			if p4.getOptimisticLocalTools(false).devProductByToolCallId[p8.toolCallId] ~= nil then
				p4.setDevProductTool((proposalFromFlow(p8, true, false)))
			end
		end
		local config1 = { action = p8.input.action, [p1.resultKey] = p8.result }
		
		if p8.resultError == nil then
			config1.status = "ok"
		else
			config1.status = "error"
			config1.detailCode = p8.resultDetailCode
			config1.message = p8.resultError
		end
		local FormatResultContentResult, FormatResultContentResult2 = Tool.formatResultContent(config1)
		submitResult(p8, FormatResultContentResult, FormatResultContentResult2 or p8.resultError ~= nil, nil)
	end
	
	local function submitRejection(p8, p9)
		-- upvalues: v1 (ref), Generation (ref), p4 (copy), proposalFromFlow (copy), submitApproval (copy), submitResult (copy), Tool (copy)
		if v1 ~= p8 or Generation ~= p8.generation then return end
		if p8.attempted then
			p4.setDevProductTool((proposalFromFlow(p8, true, false)))
			submitApproval(p8)
			
			return
		else
			submitResult(p8, Tool.formatRejectionContent(p8.input.action, p9), false, p9)
		end
	end
	
	local function settle(p8, IsPending, p9): boolean
		-- upvalues: v1 (ref), Generation (ref), FFlagBuildExperienceDevProductRecoveryModule (upval), p4 (copy), proposalFromFlow (copy), submitApproval (copy), submitRejection (copy)
		if v1 ~= p8 or Generation ~= p8.generation or p8.submitted then
			return false
		end
		p8.submitted = true
		
		if FFlagBuildExperienceDevProductRecoveryModule then
			p8.isPending = IsPending
		end
		p4.setDevProductTool((proposalFromFlow(p8, IsPending, not IsPending)))
		task.spawn(function()
			-- upvalues: IsPending (copy), submitApproval (upval), p8 (copy), submitRejection (upval), p9 (copy)
			if IsPending then
				submitApproval(p8)
				
				return
			else
				submitRejection(p8, p9)
			end
		end)
		
		return true
	end
	
	local _ = function()
		-- upvalues: v1 (ref), p4 (copy)
		local v7 = v1
		
		if v7 ~= nil then
			p4.removeDevProductTool(v7.toolCallId)
			p4.removeDevProductAction(v7.toolCallId)
		end
		v1 = nil
	end
	
	return {
		syncRequests = function(p8): boolean
			-- upvalues: v1 (ref), Tbl (copy), Count (ref), p3 (copy), cancelReplies (copy), Tool (copy), Generation (ref), p4 (copy), submitAutomaticResult (copy), runList (copy), ToolControllerUtilsModule (upval), p2 (copy), proposalFromFlow (copy), settle (copy), Debug (upval), TOOLNAME (copy)
			if v1 ~= nil then
				v1.toolCallPresent = p8.toolCalls[v1.toolCallId] ~= nil
			end
			for i in Tbl do
				if p8.toolCalls[i] == nil then
					Count += 1
					
					for i1 in Tbl do
						p3[i1] = nil
					end
					table.clear(Tbl)
					cancelReplies("automatic")
					break
				end
			end
			local RequestInTurnState, RequestInTurnState2, RequestInTurnState3, RequestInTurnState4 = Tool.findRequestInTurnState(p8, p3)
			
			if RequestInTurnState == nil then
				if v1 ~= nil and not v1.submitted and not v1.attempted then
					Generation += 1
					Count += 1
					
					for i2 in Tbl do
						p3[i2] = nil
					end
					table.clear(Tbl)
					cancelReplies("automatic")
					cancelReplies("afterDecision")
					local v7 = v1
					
					if v7 ~= nil then
						p4.removeDevProductTool(v7.toolCallId)
						p4.removeDevProductAction(v7.toolCallId)
					end
					v1 = nil
				end
				return false
			else
				if Tbl[RequestInTurnState] then
					return true
				end
				local config = {
					turnId = RequestInTurnState3,
					referenceId = RequestInTurnState4
				}
				local ParseInputResult, ParseInputResult2 = Tool.parseInput(RequestInTurnState2)
				
				if ParseInputResult ~= nil and ParseInputResult.createAndGoLive == true then
					ParseInputResult = nil
					ParseInputResult2 = "createAndGoLive is not supported yet. Create without it and ask the creator to activate the product separately."
				end
				if ParseInputResult == nil then
					Tbl[RequestInTurnState] = true
					local Count1: number = Generation
					local Count2: number = Count
					task.spawn(function()
						-- upvalues: Tool (upval), ParseInputResult2 (ref), submitAutomaticResult (upval), RequestInTurnState (copy), config (copy), Count1 (copy), Count2 (copy)
						submitAutomaticResult(RequestInTurnState, config, Tool.formatResultContent({
							status = "error",
							action = "unknown",
							detailCode = "invalid_arguments",
							message = ParseInputResult2
						}), true, Count1, Count2)
					end)
					
					return true
				end
				if Tool.getActionKind(ParseInputResult.action) == "read" then
					p3[RequestInTurnState] = true
					Tbl[RequestInTurnState] = true
					task.spawn(runList, RequestInTurnState, config, Generation, Count)
					
					return true
				end
				if v1 ~= nil and (v1.submitted or v1.attempted) then
					return true
				end
				if v1 == nil or RequestInTurnState ~= v1.toolCallId then
					if v1 ~= nil then
						Generation += 1
						Count += 1
						
						for i3 in Tbl do
							p3[i3] = nil
						end
						table.clear(Tbl)
						cancelReplies("automatic")
						cancelReplies("afterDecision")
						local v8 = v1
						
						if v8 ~= nil then
							p4.removeDevProductTool(v8.toolCallId)
							p4.removeDevProductAction(v8.toolCallId)
						end
						v1 = nil
					end
					local config1 = {
						submitted = false,
						attempted = false,
						toolCallPresent = true,
						isPending = false,
						sessionId = p8.sessionId,
						toolCallId = RequestInTurnState,
						callOrder = ToolControllerUtilsModule.getToolCallOrder(p8, RequestInTurnState),
						turnId = RequestInTurnState3,
						referenceId = RequestInTurnState4,
						universeId = p2.universeId,
						input = ParseInputResult,
						generation = Generation
					}
					v1 = config1
					p4.setDevProductTool((proposalFromFlow(config1, false, false)))
					p4.setDevProductAction(RequestInTurnState, function()
						-- upvalues: settle (upval), config1 (copy)
						settle(config1, true, nil)
					end, function()
						-- upvalues: settle (upval), config1 (copy)
						settle(config1, false, nil)
					end)
					Debug.log("info", TOOLNAME .. " proposal displayed", {
						toolCallId = RequestInTurnState,
						turnId = RequestInTurnState3,
						action = ParseInputResult.action
					})
				end
				return true
			end
		end,
		stopPending = function(): boolean
			-- upvalues: v1 (ref), Tbl (copy), Count (ref), p3 (copy), cancelReplies (copy), Tbl1 (copy), Generation (ref), p4 (copy)
			local v9 = v1
			
			if v9 == nil or not v9.submitted and not v9.attempted then
				local v10: boolean = v1 ~= nil or (next(Tbl) ~= nil or next(Tbl1) ~= nil)
				
				if v10 then
					Generation += 1
					Count += 1
					
					for i1 in Tbl do
						p3[i1] = nil
					end
					table.clear(Tbl)
					cancelReplies("automatic")
					cancelReplies("afterDecision")
				end
				if v9 ~= nil then
					v9.submitted = true
					p3[v9.toolCallId] = nil
					local v11 = v1
					
					if v11 ~= nil then
						p4.removeDevProductTool(v11.toolCallId)
						p4.removeDevProductAction(v11.toolCallId)
					end
					v1 = nil
				end
				return v10
			else
				local HasNextEntry = next(Tbl) ~= nil
				
				if HasNextEntry then
					Count += 1
					
					for i in Tbl do
						p3[i] = nil
					end
					table.clear(Tbl)
					cancelReplies("automatic")
				end
				return HasNextEntry
			end
		end,
		trySubmitComposerText = function(p9)
			-- upvalues: v1 (ref), settle (copy)
			local v12 = v1
			
			return v12 ~= nil and settle(v12, false, p9)
		end
	}
end