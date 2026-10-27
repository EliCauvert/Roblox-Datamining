local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FFlagBuildExperienceDevProductModerationReadbackModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductModerationReadback)
local WasDeveloperProductTextModeratedModule = require(BuildExperience.utils.wasDeveloperProductTextModerated)
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local FFlagBuildExperienceMonetizationFailureCausesModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationFailureCauses)
local FFlagBuildExperienceRemoveDevProductPriceCap = require(Parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local MonetizationFailureCausesModule = require(BuildExperience.utils.monetizationFailureCauses)
local DownloadGeneratedImageAsyncModule = require(BuildExperience.utils.downloadGeneratedImageAsync)
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local Debug = CreatorAgentChatModule.debug
local AwaitRequestStateFunction = ToolControllerUtilsModule.awaitRequestState
local GetToolCallOrderFunction = ToolControllerUtilsModule.getToolCallOrder
local v1 = require(script.Parent.createManageDevProductStore)()

local function awaitPromise(Promise)
	-- upvalues: ChatConstantsModule (copy)
	local v2 = nil
	local v3: string? = nil
	local Flag = false
	Promise:andThen(function(Result)
		-- upvalues: v2 (ref), Flag (ref)
		v2 = Result
		Flag = true
	end, function(p1)
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

local function _(p1)
	return if typeof(p1) == "table" and typeof(p1.errorMessage) == "string" then p1.errorMessage elseif p1 == nil then "The request timed out." else tostring(p1)
end

local function detailCodeForFailure(Action, Text: string): string
	local Lowered = string.lower(Text)
	
	return if string.find(Lowered, "outcome is unknown", 1, true) then "outcome_unknown" elseif string.find(Lowered, "universe", 1, true) and string.find(Lowered, "publish", 1, true) then "universe_not_published" else Action .. "_failed"
end

local function describeImageFailure(Text: string)
	-- upvalues: MonetizationFailureCausesModule (copy)
	return if Text == nil or string.find(string.lower(Text), "outcome is unknown", 1, true) then MonetizationFailureCausesModule.MESSAGES.imageTimedOut elseif MonetizationFailureCausesModule.classify(Text) == nil then MonetizationFailureCausesModule.MESSAGES.imageFailed else Text
end

local function awaitMutation(ActivateResult)
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

local function proposalFromFlow(p1, IsApproved, IsRejected)
	-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (copy), FFlagBuildExperienceMonetizationFailureCausesModule (copy), MonetizationFailureCausesModule (copy)
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
		errorCause = if FFlagBuildExperienceDevProductRecoveryModule and FFlagBuildExperienceMonetizationFailureCausesModule and p1.resultError ~= nil and not IsRejected then MonetizationFailureCausesModule.classify(p1.resultError) or (if p1.canRetry then "rateLimited" else nil) else nil,
		canRetry = if FFlagBuildExperienceDevProductRecoveryModule then p1.canRetry and not IsRejected else nil
	}
end

local function moderationError(p1, Product)
	-- upvalues: FFlagBuildExperienceDevProductModerationReadbackModule (copy), WasDeveloperProductTextModeratedModule (copy), FFlagBuildExperienceMonetizationFailureCausesModule (copy), MonetizationFailureCausesModule (copy)
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
	return if WasDeveloperProductTextModeratedModuleResult or WasDeveloperProductTextModeratedModuleResult1 then (if FFlagBuildExperienceMonetizationFailureCausesModule then MonetizationFailureCausesModule.MESSAGES.moderated .. " Do not create another product; product %s already exists. " .. "Ask the creator for plainer wording and update this product." else MonetizationFailureCausesModule.MESSAGES.moderated .. " Product %s already exists; do not create another. " .. "Ask the creator for plainer wording and update this product."):format((tostring(Product.productId or (p1.productId or "unknown")))) else nil
end

return function(p1, p2, p3, Callback, p4)
	-- upvalues: StudioManageDevProductTool (copy), v1 (copy), MonetizationFailureCausesModule (copy), FFlagBuildExperienceRemoveDevProductPriceCap (copy), awaitMutation (copy), DownloadGeneratedImageAsyncModule (copy), FFlagBuildExperienceDevProductRecoveryModule (copy), FFlagBuildExperienceMonetizationFailureCausesModule (copy), describeImageFailure (copy), FFlagBuildExperienceDevProductModerationReadbackModule (copy), ToolControllerUtilsModule (copy), proposalFromFlow (copy), Debug (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), moderationError (copy), detailCodeForFailure (copy), GetToolCallOrderFunction (copy)
	local P14 = p4 or StudioManageDevProductTool
	local v4 = nil
	local t = {}
	local ToolCallId = nil
	local onApproveImpl = nil
	local onRejectImpl = nil
	
	local function performMutation(p5)
		-- upvalues: MonetizationFailureCausesModule (upval), FFlagBuildExperienceRemoveDevProductPriceCap (upval), awaitMutation (upval), DownloadGeneratedImageAsyncModule (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), FFlagBuildExperienceMonetizationFailureCausesModule (upval), describeImageFailure (upval), v1 (copy), FFlagBuildExperienceDevProductModerationReadbackModule (upval)
		local UniverseId = p5.universeId
		
		if UniverseId == nil then
			return nil, MonetizationFailureCausesModule.MESSAGES.noUniverse
		end
		if not FFlagBuildExperienceRemoveDevProductPriceCap and p5.priceInRobux ~= nil and (p5.priceInRobux < 1 or p5.priceInRobux > 100) then
			return nil, "Developer-product prices must be between 1 and 100 Robux."
		end
		if p5.action == "create" then
			if p5.name == nil or p5.name == "" or p5.priceInRobux == nil then
				return nil, "A name and price are required to create a developer product."
			end
			local ImageFile = nil
			
			if p5.imageAssetId ~= nil then
				local AwaitMutationResult2
				ImageFile, AwaitMutationResult2 = awaitMutation(DownloadGeneratedImageAsyncModule(p5.imageAssetId))
				
				if ImageFile == nil then
					if not FFlagBuildExperienceDevProductRecoveryModule then
						return nil, AwaitMutationResult2
					elseif FFlagBuildExperienceMonetizationFailureCausesModule then
						return nil, `The product image could not be loaded. No product was created. {describeImageFailure(AwaitMutationResult2)}`, true
					else
						return nil, "The product image could not be loaded. No product was created.", true
					end
				end
			end
			return awaitMutation(v1.create(UniverseId, {
				name = p5.name,
				description = p5.description,
				priceInRobux = p5.priceInRobux,
				imageFile = ImageFile
			}))
		elseif p5.productId == nil then
			return nil, "A productId is required for this action."
		elseif p5.action == "update" then
			return awaitMutation(v1.update(UniverseId, p5.productId, {
				name = p5.name,
				description = p5.description,
				priceInRobux = p5.priceInRobux
			}, FFlagBuildExperienceDevProductModerationReadbackModule))
		elseif p5.action == "activate" then
			return awaitMutation(v1.activate(UniverseId, p5.productId))
		elseif p5.action == "deactivate" then
			return awaitMutation(v1.deactivate(UniverseId, p5.productId))
		else
			return nil, ("Unsupported action '%s'."):format(p5.action)
		end
	end
	
	local function _(p5)
		-- upvalues: p3 (copy)
		p3.removeDevProductTool(p5.toolCallId)
		p3.removeDevProductAction(p5.toolCallId)
	end
	
	local function recoverFailedSubmission(p5, p6, ErrorCode)
		-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (upval), v4 (ref), p3 (copy), FFlagBuildExperienceMonetizationFailureCausesModule (upval), ToolControllerUtilsModule (upval), p2 (copy), proposalFromFlow (upval), Callback (copy)
		if FFlagBuildExperienceDevProductRecoveryModule and v4 ~= p5 then
			p3.removeDevProductAction(p5.toolCallId)
			
			return
		end
		if FFlagBuildExperienceDevProductRecoveryModule and FFlagBuildExperienceMonetizationFailureCausesModule and p5.attempted and ToolControllerUtilsModule.isConversationGone(ErrorCode) then
			p5.isPending = false
			p5.canRetry = false
			p2[p5.toolCallId] = true
			p3.markSubmitted(p5.toolCallId)
			p3.setDevProductTool((proposalFromFlow(p5, true, false)))
			p3.removeDevProductAction(p5.toolCallId)
			v4 = nil
			
			if Callback ~= nil then
				Callback(p6, ErrorCode)
			end
			return
		else
			p5.submitted = false
			
			if Callback ~= nil then
				p3.setDevProductTool((proposalFromFlow(p5, false, false)))
				Callback(p6, ErrorCode)
				
				return
			end
		end
	end
	
	local function submitResult(p5, FormatRejectionContentResult, p6, p7)
		-- upvalues: p1 (copy), Debug (upval), recoverFailedSubmission (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p2 (copy), p3 (copy), v4 (ref)
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatRejectionContentResult, p6, p5.turnId, p5.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "manage_developer_product tool_result submit aborted (no active session)", { toolCallId = p5.toolCallId })
			recoverFailedSubmission(p5, p7, nil)
			
			return
		end
		local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		
		if AwaitRequestStateResult.status ~= "succeeded" then
			recoverFailedSubmission(p5, p7, AwaitRequestStateResult.errorCode)
			Debug.log("warn", "manage_developer_product tool_result submit failed", {
				sessionId = p5.sessionId,
				toolCallId = p5.toolCallId,
				turnId = p5.turnId,
				referenceId = p5.referenceId,
				action = p5.action,
				state = Debug.formatRequestState(AwaitRequestStateResult)
			})
			
			return
		end
		p2[p5.toolCallId] = true
		p3.markSubmitted(p5.toolCallId)
		p3.removeDevProductAction(p5.toolCallId)
		
		if v4 == p5 then
			v4 = nil
		end
	end
	
	local function submitApproval(p5)
		-- upvalues: performMutation (copy), moderationError (upval), detailCodeForFailure (upval), FFlagBuildExperienceDevProductRecoveryModule (upval), v4 (ref), p3 (copy), proposalFromFlow (upval), P14 (copy), submitResult (copy)
		local Result = nil
		local ResultError = nil
		local ResultDetailCode = nil
		if p5.attempted then
			Result = p5.result
			ResultError = p5.resultError
			ResultDetailCode = p5.resultDetailCode
		else
			p5.attempted = true
			local PerformMutationResult3
			Result, ResultError, PerformMutationResult3, ResultDetailCode = performMutation(p5)
			
			if Result ~= nil and ResultError == nil then
				ResultError = moderationError(p5, Result)
				
				if ResultError ~= nil then
					ResultDetailCode = "name_moderated"
				end
			end
			p5.result = Result
			p5.resultError = ResultError
			
			if ResultError ~= nil and ResultDetailCode == nil then
				ResultDetailCode = detailCodeForFailure(p5.action, ResultError)
			end
			p5.resultDetailCode = ResultDetailCode
			
			if FFlagBuildExperienceDevProductRecoveryModule and ResultError ~= nil and PerformMutationResult3 and p5.action == "create" and v4 == p5 then
				p5.attempted = false
				p5.submitted = false
				p5.isPending = false
				p5.canRetry = true
				p3.setDevProductTool((proposalFromFlow(p5, false, false)))
				
				return
			end
		end
		if FFlagBuildExperienceDevProductRecoveryModule then
			p5.isPending = false
			p5.canRetry = false
			
			if p3.getOptimisticLocalTools(false).devProductByToolCallId[p5.toolCallId] ~= nil then
				p3.setDevProductTool((proposalFromFlow(p5, true, false)))
			end
		end
		local v5 = nil
		local FormatResultContentResult = nil
		if Result == nil or ResultError ~= nil then
			FormatResultContentResult = P14.formatResultContent({
				status = "error",
				action = p5.action,
				detailCode = ResultDetailCode,
				message = ResultError or "The developer product change failed.",
				product = Result
			})
			v5 = true
		else
			FormatResultContentResult, v61 = P14.formatResultContent({ status = "ok", action = p5.action, product = Result })
		end
		submitResult(p5, FormatResultContentResult, v5, nil)
	end
	
	local function submitRejection(p5, p6)
		-- upvalues: p3 (copy), proposalFromFlow (upval), submitApproval (copy), P14 (copy), submitResult (copy)
		if p5.attempted then
			p3.setDevProductTool((proposalFromFlow(p5, true, false)))
			submitApproval(p5)
			
			return
		else
			submitResult(p5, P14.formatRejectionContent(p5.action, p6), false, p6)
		end
	end
	
	onApproveImpl = function()
		-- upvalues: v4 (ref), FFlagBuildExperienceDevProductRecoveryModule (upval), p3 (copy), proposalFromFlow (upval), submitApproval (copy)
		local v5 = v4
		
		if v5 == nil or v5.submitted then return end
		v5.submitted = true
		
		if FFlagBuildExperienceDevProductRecoveryModule then
			v5.isPending = true
			v5.canRetry = false
		end
		p3.setDevProductTool((proposalFromFlow(v5, true, false)))
		task.spawn(function()
			-- upvalues: submitApproval (upval), v5 (copy)
			submitApproval(v5)
		end)
	end
	
	onRejectImpl = function()
		-- upvalues: v4 (ref), p3 (copy), proposalFromFlow (upval), submitRejection (copy)
		local v5 = v4
		
		if v5 ~= nil and not v5.submitted then
			v5.submitted = true
			p3.setDevProductTool((proposalFromFlow(v5, false, true)))
			task.spawn(function()
				-- upvalues: submitRejection (upval), v5 (copy)
				submitRejection(v5, nil)
			end)
			
			return
		end
	end
	
	local function runListRequest(ToolCallId, TurnId, ReferenceId, SessionId)
		-- upvalues: p1 (copy), MonetizationFailureCausesModule (upval), awaitMutation (upval), v1 (copy), P14 (copy), t (copy), p2 (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), Debug (upval)
		local UniverseId = p1.universeId
		local v5 = nil
		local NoUniverse = nil
		
		if UniverseId == nil then
			NoUniverse = MonetizationFailureCausesModule.MESSAGES.noUniverse
		else
			v5, NoUniverse = awaitMutation(v1.list(UniverseId))
		end
		local FormatResultContentResult = nil
		local FormatResultContentResult2 = nil
		if v5 == nil then
			FormatResultContentResult = P14.formatResultContent({
				status = "error",
				action = "list",
				detailCode = "list_failed",
				message = NoUniverse or "Could not list developer products."
			})
			FormatResultContentResult2 = true
		else
			FormatResultContentResult, FormatResultContentResult2 = P14.formatResultContent({
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
	
	local _ = function()
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
		syncManageDevProductRequests = function(p5): boolean
			-- upvalues: P14 (copy), p2 (copy), v4 (ref), p3 (copy), ToolCallId (ref), t (copy), FFlagBuildExperienceDevProductRecoveryModule (upval), p1 (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), runListRequest (copy), GetToolCallOrderFunction (upval), proposalFromFlow (upval), onApproveImpl (ref), onRejectImpl (ref), Debug (upval)
			local ManageDevProductRequestInTurnState, ManageDevProductRequestInTurnState2, ManageDevProductRequestInTurnState3, ManageDevProductRequestInTurnState4 = P14.findManageDevProductRequestInTurnState(p5, p2)
			
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
				local ParseManageDevProductInputResult, ParseManageDevProductInputResult2, ParseManageDevProductInputResult3 = P14.parseManageDevProductInput(ManageDevProductRequestInTurnState2)
				
				if ParseManageDevProductInputResult ~= nil then
					if P14.getActionKind(ParseManageDevProductInputResult.action) ~= "read" then
						if ManageDevProductRequestInTurnState ~= ToolCallId then
							ToolCallId = ManageDevProductRequestInTurnState
							local config = {
								submitted = false,
								attempted = false,
								sessionId = p5.sessionId,
								toolCallId = ManageDevProductRequestInTurnState,
								callOrder = GetToolCallOrderFunction(p5, ManageDevProductRequestInTurnState),
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
						task.spawn(function()
							-- upvalues: runListRequest (upval), ManageDevProductRequestInTurnState (copy), ManageDevProductRequestInTurnState3 (copy), ManageDevProductRequestInTurnState4 (copy), p5 (copy)
							runListRequest(ManageDevProductRequestInTurnState, ManageDevProductRequestInTurnState3, ManageDevProductRequestInTurnState4, p5.sessionId)
						end)
						
						return true
					end
				elseif t[ManageDevProductRequestInTurnState] then
					return true
				else
					t[ManageDevProductRequestInTurnState] = true
					task.spawn(function()
						-- upvalues: ParseManageDevProductInputResult2 (copy), FFlagBuildExperienceDevProductRecoveryModule (upval), ManageDevProductRequestInTurnState2 (copy), P14 (upval), ParseManageDevProductInputResult3 (copy), p1 (upval), ManageDevProductRequestInTurnState3 (copy), ManageDevProductRequestInTurnState4 (copy), t (upval), ManageDevProductRequestInTurnState (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p2 (upval)
						local HasImageAssetId: boolean = ParseManageDevProductInputResult2 == nil and (FFlagBuildExperienceDevProductRecoveryModule and (typeof(ManageDevProductRequestInTurnState2) == "table" and (typeof(ManageDevProductRequestInTurnState2.action) == "string" and string.lower(ManageDevProductRequestInTurnState2.action) == "update") and ManageDevProductRequestInTurnState2.imageAssetId ~= nil))
						local SubmitActiveToolResultResult = p1.submitActiveToolResult(P14.formatResultContent({
							status = "error",
							kind = if P14.resolveRequestKind == nil then nil else P14.resolveRequestKind(ManageDevProductRequestInTurnState2),
							action = if HasImageAssetId then "update" else "unknown",
							detailCode = if HasImageAssetId then "unsupported_image_update" else ParseManageDevProductInputResult3 or "invalid_arguments",
							message = if HasImageAssetId then "Editing an existing developer product's image is not supported. No product was changed. Do not claim the image was updated or create a replacement product." else ParseManageDevProductInputResult2 or "The developer-product request was malformed."
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
		stopPending = function(): boolean
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
		trySubmitComposerText = function(p5): boolean
			-- upvalues: v4 (ref), p3 (copy), proposalFromFlow (upval), submitRejection (copy)
			local v6 = v4
			
			if v6 == nil or v6.submitted then
				return false
			else
				v6.submitted = true
				p3.setDevProductTool((proposalFromFlow(v6, false, true)))
				task.spawn(function()
					-- upvalues: submitRejection (upval), v6 (copy), p5 (copy)
					submitRejection(v6, p5)
				end)
				
				return true
			end
		end
	}
end