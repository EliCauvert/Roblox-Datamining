local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local FFlagBuildExperienceMonetizationFailureCausesModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationFailureCauses)
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local MonetizationFailureCausesModule = require(BuildExperience.utils.monetizationFailureCauses)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local config = {
	outcome = "unverified",
	errorMessage = "The request timed out and its outcome is unknown. List again before retrying."
}

local function _(p1)
	return if typeof(p1) == "table" and typeof(p1.errorMessage) == "string" then p1.errorMessage else tostring(p1)
end

local _ = function(p1, p2)
	-- upvalues: ChatConstantsModule (copy), config (copy)
	local v1, v2 = p1:timeout(p2 or ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, config):await()
	
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

local _ = function(p1, p2, p3): boolean
	if p2 ~= nil or typeof(p3) ~= "table" then
		return false
	elseif p3.retryable == true then
		return true
	else
		local Cause = p3.cause
		
		return p1 == "create" and (p3.outcome == "failed" and typeof(Cause) == "table") and Cause.responseCode == 429
	end
end

return function(p1, p2, p3, p4, Callback)
	-- upvalues: HttpClientModule (copy), ChatConstantsModule (copy), FFlagBuildExperienceDevProductRecoveryModule (copy), FFlagBuildExperienceMonetizationFailureCausesModule (copy), MonetizationFailureCausesModule (copy), PromiseModule (copy), Debug (copy), config (copy), ToolControllerUtilsModule (copy)
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
		-- upvalues: p1 (copy), FFlagBuildExperienceDevProductRecoveryModule (upval), FFlagBuildExperienceMonetizationFailureCausesModule (upval), MonetizationFailureCausesModule (upval)
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
			errorCause = if FFlagBuildExperienceDevProductRecoveryModule and FFlagBuildExperienceMonetizationFailureCausesModule and p6.resultError ~= nil and not IsRejected then MonetizationFailureCausesModule.classify(p6.resultError) or (if p6.canRetry == true then "rateLimited" else nil) else nil,
			canRetry = if FFlagBuildExperienceDevProductRecoveryModule then p6.canRetry == true and not IsRejected else nil
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
		-- upvalues: Generation (ref), Count (ref), p2 (copy), MonetizationFailureCausesModule (upval), p1 (copy), ChatConstantsModule (upval), config (upval), Tool (copy), submitAutomaticResult (copy)
		if Generation ~= Count1 or Count ~= Count2 then return end
		local v2 = nil
		local NoUniverse = nil
		
		if p2.universeId == nil then
			NoUniverse = MonetizationFailureCausesModule.MESSAGES.noUniverse
		else
			local ListResult, ListResult2 = p1.list(p2.universeId)
			local v3, v4 = ListResult:timeout(ListResult2 or ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, config):await()
			local ErrorMessage = nil
			local v5 = nil
			
			if v3 then
				if v4 == nil then
					v5 = nil
					ErrorMessage = "The request returned no result."
				else
					v5 = v4
					ErrorMessage = nil
				end
			elseif v4 == nil then
				v5 = nil
				ErrorMessage = "The request returned no result."
			else
				v5 = nil
				ErrorMessage = if typeof(v4) == "table" and typeof(v4.errorMessage) == "string" then v4.errorMessage else tostring(v4)
			end
			v2 = v5
			NoUniverse = ErrorMessage
		end
		if Generation ~= Count1 or Count ~= Count2 then return end
		local config1 = { status = "ok", action = "list" }
		
		if v2 == nil then
			config1 = {
				status = "error",
				action = "list",
				detailCode = "list_failed",
				message = NoUniverse or "The list request failed."
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
		-- upvalues: v1 (ref), Generation (ref), p4 (copy), FFlagBuildExperienceDevProductRecoveryModule (upval), FFlagBuildExperienceMonetizationFailureCausesModule (upval), ToolControllerUtilsModule (upval), p3 (copy), proposalFromFlow (copy), Callback (copy)
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
		if FFlagBuildExperienceDevProductRecoveryModule and FFlagBuildExperienceMonetizationFailureCausesModule and p8.attempted and ToolControllerUtilsModule.isConversationGone(ResponseCode) then
			p8.isPending = false
			p8.canRetry = false
			p3[p8.toolCallId] = true
			p4.markSubmitted(p8.toolCallId)
			p4.setDevProductTool((proposalFromFlow(p8, true, false)))
			p4.removeDevProductAction(p8.toolCallId)
			v1 = nil
			
			if Callback ~= nil then
				Callback(p9, ResponseCode)
			end
			return
		else
			p8.submitted = false
			
			if Callback ~= nil then
				p4.setDevProductTool((proposalFromFlow(p8, false, false)))
				Callback(p9, ResponseCode)
				
				return
			end
		end
	end
	
	local function submitResult(p8, FormatRejectionContentResult, p9, p10)
		-- upvalues: v1 (ref), Generation (ref), p2 (copy), HttpClientModule (upval), ChatConstantsModule (upval), Tbl1 (copy), PromiseModule (upval), recoverFailedSubmission (copy), Debug (upval), TOOLNAME (copy), p3 (copy), p4 (copy)
		if v1 ~= p8 or Generation ~= p8.generation then return end
		local SubmitActiveToolResultResult = p2.submitActiveToolResult(FormatRejectionContentResult, p9, p8.turnId, p8.referenceId)
		local Status = "no session"
		local v6 = nil
		
		if SubmitActiveToolResultResult ~= nil then
			local TimeoutResult = HttpClientModule.asPromise(SubmitActiveToolResultResult):timeout(ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			Tbl1[TimeoutResult] = "afterDecision"
			local AwaitStatusResult, AwaitStatusResult2 = TimeoutResult:awaitStatus()
			Tbl1[TimeoutResult] = nil
			Status = AwaitStatusResult
			v6 = AwaitStatusResult2
		end
		if v1 ~= p8 or Generation ~= p8.generation then return end
		if Status ~= PromiseModule.Status.Resolved then
			recoverFailedSubmission(p8, p10, if typeof(v6) == "table" then v6.responseCode else nil)
			Debug.log("warn", TOOLNAME .. " tool_result submit failed", {
				sessionId = p8.sessionId,
				toolCallId = p8.toolCallId,
				action = p8.input.action,
				status = Status,
				reason = if typeof(v6) == "table" and typeof(v6.errorMessage) == "string" then v6.errorMessage else tostring(v6)
			})
			
			return
		end
		p3[p8.toolCallId] = true
		p4.markSubmitted(p8.toolCallId)
		p4.removeDevProductAction(p8.toolCallId)
		
		if v1 == p8 then
			v1 = nil
		end
	end
	
	local function submitApproval(p8)
		-- upvalues: v1 (ref), Generation (ref), MonetizationFailureCausesModule (upval), p1 (copy), ChatConstantsModule (upval), config (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), FFlagBuildExperienceMonetizationFailureCausesModule (upval), p4 (copy), proposalFromFlow (copy), Tool (copy), submitResult (copy)
		if v1 ~= p8 or Generation ~= p8.generation then return end
		if not p8.attempted then
			p8.attempted = true
			local Result = nil
			local v6 = nil
			local OutcomeUnknown: string? = nil
			local NoUniverse = nil
			
			if p8.universeId == nil then
				NoUniverse = MonetizationFailureCausesModule.MESSAGES.noUniverse
			else
				local MutateResult = p1.mutate(p8.universeId, p8.input)
				
				if MutateResult == nil then
					NoUniverse = "The write was not sent."
				else
					local HasImageAssetId = p8.input.imageAssetId ~= nil
					local v7, v8 = MutateResult:timeout((if HasImageAssetId then ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS * 2 else nil) or ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS, config):await()
					local v9 = nil
					local ErrorMessage = nil
					local v10 = nil
					
					if v7 then
						if v8 == nil then
							v9 = nil
							ErrorMessage = "The request returned no result."
							v10 = nil
						else
							v9 = v8
							ErrorMessage = nil
							v10 = nil
						end
					elseif v8 == nil then
						v9 = nil
						ErrorMessage = "The request returned no result."
						v10 = nil
					else
						v9 = nil
						ErrorMessage = if typeof(v8) == "table" and typeof(v8.errorMessage) == "string" then v8.errorMessage else tostring(v8)
						v10 = v8
					end
					Result = v9
					NoUniverse = ErrorMessage
					v6 = v10
				end
			end
			if v1 ~= p8 or Generation ~= p8.generation then return end
			if Result == nil and typeof(v6) == "table" then
				Result = v6[p1.resultKey]
			end
			if NoUniverse ~= nil then
				local Action = p8.input.action
				OutcomeUnknown = if typeof(v6) == "table" and v6.outcome == "unverified" then "outcome_unknown" else Action .. "_failed"
			end
			p8.result = Result
			p8.resultError = NoUniverse
			p8.resultDetailCode = OutcomeUnknown
			
			if FFlagBuildExperienceDevProductRecoveryModule and FFlagBuildExperienceMonetizationFailureCausesModule and NoUniverse ~= nil then
				local Action = p8.input.action
				local v11 = v6
				local IsResponseCodeMatch = nil
				
				if Result == nil and typeof(v11) == "table" then
					if v11.retryable == true then
						IsResponseCodeMatch = true
					else
						local Cause = v11.cause
						IsResponseCodeMatch = Action == "create" and (v11.outcome == "failed" and (typeof(Cause) == "table" and Cause.responseCode == 429))
					end
				else
					IsResponseCodeMatch = false
				end
				if IsResponseCodeMatch then
					p8.attempted = false
					p8.submitted = false
					p8.isPending = false
					p8.canRetry = true
					p4.setDevProductTool((proposalFromFlow(p8, false, false)))
					
					return
				end
			end
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
			p8.canRetry = false
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
		local v6 = v1
		
		if v6 ~= nil then
			p4.removeDevProductTool(v6.toolCallId)
			p4.removeDevProductAction(v6.toolCallId)
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
					local v6 = v1
					
					if v6 ~= nil then
						p4.removeDevProductTool(v6.toolCallId)
						p4.removeDevProductAction(v6.toolCallId)
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
						local v7 = v1
						
						if v7 ~= nil then
							p4.removeDevProductTool(v7.toolCallId)
							p4.removeDevProductAction(v7.toolCallId)
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
			local v8 = v1
			
			if v8 == nil or not v8.submitted and not v8.attempted then
				local v9: boolean = v1 ~= nil or (next(Tbl) ~= nil or next(Tbl1) ~= nil)
				
				if v9 then
					Generation += 1
					Count += 1
					
					for i1 in Tbl do
						p3[i1] = nil
					end
					table.clear(Tbl)
					cancelReplies("automatic")
					cancelReplies("afterDecision")
				end
				if v8 ~= nil then
					v8.submitted = true
					p3[v8.toolCallId] = nil
					local v10 = v1
					
					if v10 ~= nil then
						p4.removeDevProductTool(v10.toolCallId)
						p4.removeDevProductAction(v10.toolCallId)
					end
					v1 = nil
				end
				return v9
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
			local v11 = v1
			
			return v11 ~= nil and settle(v11, false, p9)
		end
	}
end