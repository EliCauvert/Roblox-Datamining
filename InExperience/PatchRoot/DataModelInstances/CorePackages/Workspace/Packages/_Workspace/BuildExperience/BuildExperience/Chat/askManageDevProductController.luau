local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FFlagBuildExperienceToolResultFailureRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local FFlagBuildExperienceDevProductModerationReadbackModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductModerationReadback)
local WasDeveloperProductTextModeratedModule = require(BuildExperience.utils.wasDeveloperProductTextModerated)
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local FFlagBuildExperienceRemoveDevProductPriceCap = require(Parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local DownloadGeneratedImageAsyncModule = require(BuildExperience.utils.downloadGeneratedImageAsync)
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local Debug = CreatorAgentChatModule.debug
local AwaitRequestStateFunction = ToolControllerUtilsModule.awaitRequestState
local GetToolCallOrderFunction = ToolControllerUtilsModule.getToolCallOrder
local v1 = require(script.Parent.createManageDevProductStore)()

local function awaitPromise(Promise) --[[ Line: 77 ]]
	-- upvalues: ChatConstantsModule (copy)
	local v2 = nil
	local v3: string? = nil
	local Flag = false
	Promise:andThen(function(Result) --[[ Line: 80 ]]
		-- upvalues: v2 (ref), Flag (ref)
		v2 = Result
		Flag = true
	end, function(p1) --[[ Line: 83 ]]
		-- upvalues: v3 (ref), Flag (ref)
		v3 = p1
		Flag = true
	end)
	local NewClockTime = os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS
	while not Flag and os.clock() < NewClockTime do
		task.wait()
	end
	if not Flag then
		Promise:cancel()
		v3 = "The request timed out and its outcome is unknown. List developer products before retrying."
	end
	return v2, v3
end

local function _(p1) --[[ Line: 100 | Named "messageFromRejection" ]]
	return if typeof(p1) == "table" and typeof(p1.errorMessage) == "string" then p1.errorMessage elseif p1 == nil then "The request timed out." else tostring(p1)
end

local function detailCodeForFailure(Action, Text: string): string --[[ Line: 110 ]]
	local Lowered = string.lower(Text)
	
	return if string.find(Lowered, "outcome is unknown", 1, true) then "outcome_unknown" elseif string.find(Lowered, "universe", 1, true) and string.find(Lowered, "publish", 1, true) then "universe_not_published" else Action .. "_failed"
end

local function awaitMutation(ActivateResult) --[[ Line: 121 ]]
	-- upvalues: awaitPromise (copy), FFlagBuildExperienceDevProductModerationReadbackModule (copy)
	local AwaitPromiseResult, AwaitPromiseResult2 = awaitPromise(ActivateResult)
	
	if AwaitPromiseResult == nil then
		local Product = if typeof(AwaitPromiseResult2) == "table" then AwaitPromiseResult2.product else nil
		local ResponseCode = if typeof(AwaitPromiseResult2) == "table" then AwaitPromiseResult2.responseCode else nil
		
		return Product, if typeof(AwaitPromiseResult2) == "table" and typeof(AwaitPromiseResult2.errorMessage) == "string" then AwaitPromiseResult2.errorMessage elseif AwaitPromiseResult2 == nil then "The request timed out." else tostring(AwaitPromiseResult2), Product == nil and ResponseCode == 429, if FFlagBuildExperienceDevProductModerationReadbackModule and typeof(AwaitPromiseResult2) == "table" and AwaitPromiseResult2.outcome == "unverified" then "readback_unverified" else nil
	else
		return AwaitPromiseResult, nil
	end
end

local function proposalFromFlow(p1, IsApproved, IsRejected) --[[ Line: 137 ]]
	-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (copy)
	return {
		toolCallId = p1.toolCallId,
		callOrder = p1.callOrder,
		action = p1.action,
		name = p1.name,
		description = p1.description,
		priceInRobux = p1.priceInRobux,
		productId = p1.productId,
		imageAssetId = p1.imageAssetId,
		isApproved = IsApproved,
		isRejected = IsRejected,
		isPending = if FFlagBuildExperienceDevProductRecoveryModule then p1.isPending else nil,
		hasError = if FFlagBuildExperienceDevProductRecoveryModule then p1.resultError ~= nil and not IsRejected else nil,
		canRetry = if FFlagBuildExperienceDevProductRecoveryModule then p1.canRetry and not IsRejected else nil
	}
end

local function moderationError(p1, Product) --[[ Line: 159 ]]
	-- upvalues: FFlagBuildExperienceDevProductModerationReadbackModule (copy), WasDeveloperProductTextModeratedModule (copy)
	if p1.action ~= "create" and p1.action ~= "update" then
		return nil
	end
	local WasDeveloperProductTextModeratedModuleResult = nil
	local WasDeveloperProductTextModeratedModuleResult1 = nil
	if FFlagBuildExperienceDevProductModerationReadbackModule then
		WasDeveloperProductTextModeratedModuleResult = WasDeveloperProductTextModeratedModule(p1.name, Product.name)
		WasDeveloperProductTextModeratedModuleResult1 = WasDeveloperProductTextModeratedModule(p1.description, Product.description)
	else
		WasDeveloperProductTextModeratedModuleResult = p1.name ~= nil and (Product.name ~= nil and Product.name ~= p1.name)
		WasDeveloperProductTextModeratedModuleResult1 = p1.description ~= nil and (p1.description ~= "" and (Product.description ~= nil and Product.description ~= p1.description))
	end
	return if WasDeveloperProductTextModeratedModuleResult or WasDeveloperProductTextModeratedModuleResult1 then ("Roblox moderation altered this product's text. Product %s already exists; do not create another. Ask the creator for plainer wording and update this product."):format((tostring(Product.productId or (p1.productId or "unknown")))) else nil
end

return function(p1, p2, p3, Callback) --[[ Line: 186 | Named "createManageDevProductController" ]]
	-- upvalues: v1 (copy), FFlagBuildExperienceRemoveDevProductPriceCap (copy), awaitMutation (copy), DownloadGeneratedImageAsyncModule (copy), FFlagBuildExperienceDevProductRecoveryModule (copy), FFlagBuildExperienceDevProductModerationReadbackModule (copy), proposalFromFlow (copy), Debug (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), moderationError (copy), detailCodeForFailure (copy), StudioManageDevProductTool (copy), GetToolCallOrderFunction (copy)
	local v4 = nil
	local t = {}
	local ToolCallId = nil
	local onApproveImpl = nil
	local onRejectImpl = nil
	
	local function performMutation(p4) --[[ Line: 199 ]]
		-- upvalues: FFlagBuildExperienceRemoveDevProductPriceCap (upval), awaitMutation (upval), DownloadGeneratedImageAsyncModule (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), v1 (copy), FFlagBuildExperienceDevProductModerationReadbackModule (upval)
		local UniverseId = p4.universeId
		
		if UniverseId == nil then
			return nil, "No universe is associated with this session."
		end
		if not FFlagBuildExperienceRemoveDevProductPriceCap and p4.priceInRobux ~= nil and (p4.priceInRobux < 1 or p4.priceInRobux > 100) then
			return nil, "Developer-product prices must be between 1 and 100 Robux."
		end
		if p4.action == "create" then
			if p4.name == nil or p4.name == "" or p4.priceInRobux == nil then
				return nil, "A name and price are required to create a developer product."
			end
			local ImageFile = nil
			
			if p4.imageAssetId ~= nil then
				local AwaitMutationResult2
				ImageFile, AwaitMutationResult2 = awaitMutation(DownloadGeneratedImageAsyncModule(p4.imageAssetId))
				
				if ImageFile == nil then
					if FFlagBuildExperienceDevProductRecoveryModule then
						return nil, "The product image could not be loaded. No product was created.", true
					else
						return nil, AwaitMutationResult2
					end
				end
			end
			return awaitMutation(v1.create(UniverseId, {
				name = p4.name,
				description = p4.description,
				priceInRobux = p4.priceInRobux,
				imageFile = ImageFile
			}))
		elseif p4.productId == nil then
			return nil, "A productId is required for this action."
		elseif p4.action == "update" then
			return awaitMutation(v1.update(UniverseId, p4.productId, {
				name = p4.name,
				description = p4.description,
				priceInRobux = p4.priceInRobux
			}, FFlagBuildExperienceDevProductModerationReadbackModule))
		elseif p4.action == "activate" then
			return awaitMutation(v1.activate(UniverseId, p4.productId))
		elseif p4.action == "deactivate" then
			return awaitMutation(v1.deactivate(UniverseId, p4.productId))
		else
			return nil, ("Unsupported action '%s'."):format(p4.action)
		end
	end
	
	local function _(p4) --[[ Line: 252 | Named "clearMutationCard" ]]
		-- upvalues: p3 (copy)
		p3.removeDevProductTool(p4.toolCallId)
		p3.removeDevProductAction(p4.toolCallId)
	end
	
	local _ = function(p4, p5, p6) --[[ Line: 257 | Named "recoverFailedSubmission" ]]
		-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (upval), v4 (ref), p3 (copy), Callback (copy), proposalFromFlow (upval)
		if FFlagBuildExperienceDevProductRecoveryModule and v4 ~= p4 then
			p3.removeDevProductAction(p4.toolCallId)
			
			return
		end
		p4.submitted = false
		
		if Callback ~= nil then
			p3.setDevProductTool((proposalFromFlow(p4, false, false)))
			Callback(p5, p6)
			
			return
		end
	end
	
	local function submitResult(p4, FormatRejectionContentResult, p5, p6) --[[ Line: 270 ]]
		-- upvalues: p1 (copy), Debug (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), v4 (ref), p3 (copy), Callback (copy), proposalFromFlow (upval), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p2 (copy)
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatRejectionContentResult, p5, p4.turnId, p4.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "manage_developer_product tool_result submit aborted (no active session)", { toolCallId = p4.toolCallId })
			
			if not FFlagBuildExperienceToolResultFailureRecoveryModule then
				p4.submitted = false
				
				return
			end
			if FFlagBuildExperienceDevProductRecoveryModule and v4 ~= p4 then
				p3.removeDevProductAction(p4.toolCallId)
				
				return
			end
			p4.submitted = false
			
			if Callback ~= nil then
				p3.setDevProductTool((proposalFromFlow(p4, false, false)))
				Callback(p6, nil)
				
				return
			end
			return
		else
			local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			
			if AwaitRequestStateResult.status == "succeeded" then
				p2[p4.toolCallId] = true
				p3.markSubmitted(p4.toolCallId)
				p3.removeDevProductAction(p4.toolCallId)
				
				if v4 == p4 then
					v4 = nil
				end
				return
			else
				if FFlagBuildExperienceToolResultFailureRecoveryModule then
					local ErrorCode = AwaitRequestStateResult.errorCode
					
					if FFlagBuildExperienceDevProductRecoveryModule and v4 ~= p4 then
						p3.removeDevProductAction(p4.toolCallId)
					else
						p4.submitted = false
						
						if Callback ~= nil then
							p3.setDevProductTool((proposalFromFlow(p4, false, false)))
							Callback(p6, ErrorCode)
						end
					end
				else
					p4.submitted = false
				end
				Debug.log("warn", "manage_developer_product tool_result submit failed", {
					sessionId = p4.sessionId,
					toolCallId = p4.toolCallId,
					turnId = p4.turnId,
					referenceId = p4.referenceId,
					action = p4.action,
					state = Debug.formatRequestState(AwaitRequestStateResult)
				})
			end
		end
	end
	
	local function submitApproval(p4) --[[ Line: 317 ]]
		-- upvalues: performMutation (copy), moderationError (upval), detailCodeForFailure (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), v4 (ref), p3 (copy), proposalFromFlow (upval), StudioManageDevProductTool (upval), submitResult (copy)
		local Result = nil
		local ResultError = nil
		local ResultDetailCode = nil
		if p4.attempted then
			Result = p4.result
			ResultError = p4.resultError
			ResultDetailCode = p4.resultDetailCode
		else
			p4.attempted = true
			local PerformMutationResult3
			Result, ResultError, PerformMutationResult3, ResultDetailCode = performMutation(p4)
			
			if Result ~= nil and ResultError == nil then
				ResultError = moderationError(p4, Result)
				
				if ResultError ~= nil then
					ResultDetailCode = "name_moderated"
				end
			end
			p4.result = Result
			p4.resultError = ResultError
			
			if ResultError ~= nil and ResultDetailCode == nil then
				ResultDetailCode = detailCodeForFailure(p4.action, ResultError)
			end
			p4.resultDetailCode = ResultDetailCode
			
			if FFlagBuildExperienceDevProductRecoveryModule and ResultError ~= nil and PerformMutationResult3 and p4.action == "create" and v4 == p4 then
				p4.attempted = false
				p4.submitted = false
				p4.isPending = false
				p4.canRetry = true
				p3.setDevProductTool((proposalFromFlow(p4, false, false)))
				
				return
			end
		end
		if FFlagBuildExperienceDevProductRecoveryModule then
			p4.isPending = false
			p4.canRetry = false
			
			if p3.getOptimisticLocalTools(false).devProductByToolCallId[p4.toolCallId] ~= nil then
				p3.setDevProductTool((proposalFromFlow(p4, true, false)))
			end
		end
		local v5 = nil
		local FormatResultContentResult = nil
		if Result == nil or ResultError ~= nil then
			FormatResultContentResult = StudioManageDevProductTool.formatResultContent({
				status = "error",
				action = p4.action,
				detailCode = ResultDetailCode,
				message = ResultError or "The developer product change failed.",
				product = Result
			})
			v5 = true
		else
			FormatResultContentResult, v59 = StudioManageDevProductTool.formatResultContent({ status = "ok", action = p4.action, product = Result })
		end
		submitResult(p4, FormatResultContentResult, v5, nil)
	end
	
	local function submitRejection(p4, p5) --[[ Line: 383 ]]
		-- upvalues: p3 (copy), proposalFromFlow (upval), submitApproval (copy), StudioManageDevProductTool (upval), submitResult (copy)
		if p4.attempted then
			p3.setDevProductTool((proposalFromFlow(p4, true, false)))
			submitApproval(p4)
			
			return
		else
			submitResult(p4, StudioManageDevProductTool.formatRejectionContent(p4.action, p5), false, p5)
		end
	end
	
	onApproveImpl = function() --[[ Line: 396 | Named "onApproveImpl" ]]
		-- upvalues: v4 (ref), FFlagBuildExperienceDevProductRecoveryModule (upval), p3 (copy), proposalFromFlow (upval), submitApproval (copy)
		local v5 = v4
		
		if v5 == nil or v5.submitted then return end
		v5.submitted = true
		
		if FFlagBuildExperienceDevProductRecoveryModule then
			v5.isPending = true
			v5.canRetry = false
		end
		p3.setDevProductTool((proposalFromFlow(v5, true, false)))
		task.spawn(function() --[[ Line: 407 ]]
			-- upvalues: submitApproval (upval), v5 (copy)
			submitApproval(v5)
		end)
	end
	
	onRejectImpl = function() --[[ Line: 413 | Named "onRejectImpl" ]]
		-- upvalues: v4 (ref), p3 (copy), proposalFromFlow (upval), submitRejection (copy)
		local v5 = v4
		
		if v5 ~= nil and not v5.submitted then
			v5.submitted = true
			p3.setDevProductTool((proposalFromFlow(v5, false, true)))
			task.spawn(function() --[[ Line: 420 ]]
				-- upvalues: submitRejection (upval), v5 (copy)
				submitRejection(v5, nil)
			end)
			
			return
		end
	end
	
	local function runListRequest(ToolCallId, TurnId, ReferenceId, SessionId) --[[ Line: 427 ]]
		-- upvalues: p1 (copy), awaitMutation (upval), v1 (copy), StudioManageDevProductTool (upval), t (copy), p2 (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), Debug (upval)
		local UniverseId = p1.universeId
		local v5 = nil
		local v6 = nil
		
		if UniverseId == nil then
			v6 = "No universe is associated with this session."
		else
			v5, v64 = awaitMutation(v1.list(UniverseId))
		end
		local FormatResultContentResult = nil
		local FormatResultContentResult2 = nil
		if v5 == nil then
			FormatResultContentResult = StudioManageDevProductTool.formatResultContent({
				status = "error",
				action = "list",
				detailCode = "list_failed",
				message = v6 or "Could not list developer products."
			})
			FormatResultContentResult2 = true
		else
			FormatResultContentResult, FormatResultContentResult2 = StudioManageDevProductTool.formatResultContent({
				status = "ok",
				action = "list",
				count = #v5.developerProducts,
				products = v5.developerProducts,
				nextPageToken = v5.nextPageToken,
				truncated = v5.nextPageToken ~= nil
			})
		end
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatResultContentResult, FormatResultContentResult2, TurnId, ReferenceId)
		t[ToolCallId] = nil
		
		if SubmitActiveToolResultResult == nil then
			p2[ToolCallId] = nil
			
			return
		end
		local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		
		if AwaitRequestStateResult.status ~= "succeeded" then
			p2[ToolCallId] = nil
			
			if AwaitRequestStateResult.status == "pending" then
				SubmitActiveToolResultResult.dispose()
			end
			Debug.log("warn", "manage_developer_product list submit failed", {
				sessionId = SessionId,
				toolCallId = ToolCallId,
				state = Debug.formatRequestState(AwaitRequestStateResult)
			})
		end
	end
	
	local _ = function() --[[ Line: 477 | Named "clearMutationFlow" ]]
		-- upvalues: v4 (ref), p3 (copy), ToolCallId (ref)
		local v5 = v4
		
		if v5 ~= nil then
			p3.removeDevProductTool(v5.toolCallId)
			p3.removeDevProductAction(v5.toolCallId)
		end
		v4 = nil
		ToolCallId = nil
	end
	
	return {
		syncManageDevProductRequests = function(p4): boolean --[[ Line: 486 ]]
			-- upvalues: StudioManageDevProductTool (upval), p2 (copy), v4 (ref), p3 (copy), ToolCallId (ref), t (copy), FFlagBuildExperienceDevProductRecoveryModule (upval), p1 (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), runListRequest (copy), GetToolCallOrderFunction (upval), proposalFromFlow (upval), onApproveImpl (ref), onRejectImpl (ref), Debug (upval)
			local ManageDevProductRequestInTurnState, ManageDevProductRequestInTurnState2, ManageDevProductRequestInTurnState3, ManageDevProductRequestInTurnState4 = StudioManageDevProductTool.findManageDevProductRequestInTurnState(p4, p2)
			
			if ManageDevProductRequestInTurnState == nil then
				local v5 = v4
				
				if v5 ~= nil then
					p3.removeDevProductTool(v5.toolCallId)
					p3.removeDevProductAction(v5.toolCallId)
				end
				v4 = nil
				ToolCallId = nil
				
				return false
			else
				local ParseManageDevProductInputResult = StudioManageDevProductTool.parseManageDevProductInput(ManageDevProductRequestInTurnState2)
				
				if ParseManageDevProductInputResult ~= nil then
					if StudioManageDevProductTool.getActionKind(ParseManageDevProductInputResult.action) ~= "read" then
						if ManageDevProductRequestInTurnState ~= ToolCallId then
							ToolCallId = ManageDevProductRequestInTurnState
							local config = {
								submitted = false,
								attempted = false,
								sessionId = p4.sessionId,
								toolCallId = ManageDevProductRequestInTurnState,
								callOrder = GetToolCallOrderFunction(p4, ManageDevProductRequestInTurnState),
								turnId = ManageDevProductRequestInTurnState3,
								referenceId = ManageDevProductRequestInTurnState4,
								universeId = p1.universeId,
								action = ParseManageDevProductInputResult.action,
								name = ParseManageDevProductInputResult.name,
								description = ParseManageDevProductInputResult.description,
								priceInRobux = ParseManageDevProductInputResult.priceInRobux,
								productId = ParseManageDevProductInputResult.productId,
								imageAssetId = ParseManageDevProductInputResult.imageAssetId
							}
							v4 = config
							p3.setDevProductTool((proposalFromFlow(config, false, false)))
							p3.setDevProductAction(ManageDevProductRequestInTurnState, onApproveImpl, onRejectImpl)
							Debug.log("info", "manage_developer_product proposal displayed", {
								toolCallId = ManageDevProductRequestInTurnState,
								turnId = ManageDevProductRequestInTurnState3,
								referenceId = ManageDevProductRequestInTurnState4,
								action = ParseManageDevProductInputResult.action
							})
						end
						return true
					elseif t[ManageDevProductRequestInTurnState] then
						return true
					else
						p2[ManageDevProductRequestInTurnState] = true
						t[ManageDevProductRequestInTurnState] = true
						task.spawn(function() --[[ Line: 539 ]]
							-- upvalues: runListRequest (upval), ManageDevProductRequestInTurnState (copy), ManageDevProductRequestInTurnState3 (copy), ManageDevProductRequestInTurnState4 (copy), p4 (copy)
							runListRequest(ManageDevProductRequestInTurnState, ManageDevProductRequestInTurnState3, ManageDevProductRequestInTurnState4, p4.sessionId)
						end)
						
						return true
					end
				elseif t[ManageDevProductRequestInTurnState] then
					return true
				else
					t[ManageDevProductRequestInTurnState] = true
					task.spawn(function() --[[ Line: 503 ]]
						-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (upval), ManageDevProductRequestInTurnState2 (copy), StudioManageDevProductTool (upval), p1 (upval), ManageDevProductRequestInTurnState3 (copy), ManageDevProductRequestInTurnState4 (copy), t (upval), ManageDevProductRequestInTurnState (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p2 (upval)
						local HasImageAssetId: boolean = FFlagBuildExperienceDevProductRecoveryModule and (typeof(ManageDevProductRequestInTurnState2) == "table" and (typeof(ManageDevProductRequestInTurnState2.action) == "string" and string.lower(ManageDevProductRequestInTurnState2.action) == "update") and ManageDevProductRequestInTurnState2.imageAssetId ~= nil)
						local SubmitActiveToolResultResult = p1.submitActiveToolResult(StudioManageDevProductTool.formatResultContent({
							status = "error",
							action = if HasImageAssetId then "update" else "unknown",
							detailCode = if HasImageAssetId then "unsupported_image_update" else "invalid_arguments",
							message = if HasImageAssetId then "Editing an existing developer product's image is not supported. No product was changed. Do not claim the image was updated or create a replacement product." else "The developer-product request was malformed."
						}), true, ManageDevProductRequestInTurnState3, ManageDevProductRequestInTurnState4)
						t[ManageDevProductRequestInTurnState] = nil
						
						if SubmitActiveToolResultResult == nil then return end
						local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
						
						if AwaitRequestStateResult.status == "succeeded" then
							p2[ManageDevProductRequestInTurnState] = true
							
							return
						end
						if AwaitRequestStateResult.status == "pending" then
							SubmitActiveToolResultResult.dispose()
						end
					end)
					
					return true
				end
			end
		end,
		stopPending = function(): boolean --[[ Line: 590 ]]
			-- upvalues: t (copy), p2 (copy), v4 (ref), p3 (copy), ToolCallId (ref)
			local Flag = false
			
			for i in t do
				t[i] = nil
				p2[i] = nil
				Flag = true
			end
			local v5 = v4
			
			if v5 ~= nil and not v5.submitted then
				v5.submitted = true
				p3.removeDevProductTool(v5.toolCallId)
				p3.removeDevProductAction(v5.toolCallId)
				v4 = nil
				ToolCallId = nil
				Flag = true
			end
			return Flag
		end,
		trySubmitComposerText = function(p4): boolean --[[ Line: 577 ]]
			-- upvalues: v4 (ref), p3 (copy), proposalFromFlow (upval), submitRejection (copy)
			local v6 = v4
			
			if v6 == nil or v6.submitted then
				return false
			else
				v6.submitted = true
				p3.setDevProductTool((proposalFromFlow(v6, false, true)))
				task.spawn(function() --[[ Line: 584 ]]
					-- upvalues: submitRejection (upval), v6 (copy), p4 (copy)
					submitRejection(v6, p4)
				end)
				
				return true
			end
		end
	}
end