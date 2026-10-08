local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local _ = require(script.Parent.chatTypes)
local chatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local createManageDevProductStoreModule = require(script.Parent.createManageDevProductStore)
local fFlagBuildExperienceDevProductRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceDevProductRecovery)
local fFlagBuildExperienceRemoveDevProductPriceCap = require(parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local downloadGeneratedImageAsyncModule = require(buildExperience.utils.downloadGeneratedImageAsync)
local studioManageDevProductTool = creatorAgentChatModule.StudioManageDevProductTool
local debug = creatorAgentChatModule.debug
local awaitRequestState = toolControllerUtilsModule.awaitRequestState
local getToolCallOrder = toolControllerUtilsModule.getToolCallOrder
local var1 = createManageDevProductStoreModule()

local function awaitPromise(p1)
	-- upvalues: chatConstantsModule (ref)
	local var2 = nil
	local var3 = nil
	local var4 = false
	p1:andThen(function(p2)
		-- upvalues: var2 (write), var4 (write)
		var2 = p2
		var4 = true
	end, function(p2)
		-- upvalues: var3 (write), var4 (write)
		var3 = p2
		var4 = true
	end)
	local var5 = os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS
	while os.clock() < var5 do
		task.wait()
	end
	p1:cancel()
	var3 = "The request timed out and its outcome is unknown. List developer products before retrying."
	
	return var2, u420
end

local function _(p2)
	return if typeof(p2) == "table" and typeof(p2.errorMessage) == "string" then p2.errorMessage elseif p2 == nil then "The request timed out." else tostring(p2)
end

local function detailCodeForFailure(p2, p3)
	local lowerText = string.lower(p3)
	
	return if string.find(lowerText, "outcome is unknown", 1, true) then "outcome_unknown" elseif string.find(lowerText, "universe", 1, true) and string.find(lowerText, "publish", 1, true) then "universe_not_published" else p2 .. "_failed"
end

local function awaitMutation(p2)
	-- upvalues: awaitPromise (ref)
	local var6, var7 = awaitPromise(p2)
	
	if var6 ~= nil then
		return var6, nil
	end
	local var8 = if typeof(var7) == "table" then var7.product else nil
	
	return var8, if typeof(var7) == "table" and typeof(var7.errorMessage) == "string" then var7.errorMessage elseif var7 == nil then "The request timed out." else tostring(var7), var8 == nil and (if typeof(var7) == "table" then var7.responseCode else nil) == 429
end

local function proposalFromFlow(p2, p3, p4)
	-- upvalues: fFlagBuildExperienceDevProductRecoveryModule (ref)
	return {
		toolCallId = p2.toolCallId,
		callOrder = p2.callOrder,
		action = p2.action,
		name = p2.name,
		description = p2.description,
		priceInRobux = p2.priceInRobux,
		productId = p2.productId,
		imageAssetId = p2.imageAssetId,
		isApproved = p3,
		isRejected = p4,
		isPending = if fFlagBuildExperienceDevProductRecoveryModule then p2.isPending else nil,
		hasError = if fFlagBuildExperienceDevProductRecoveryModule then p2.resultError ~= nil and not p4 else nil,
		canRetry = if fFlagBuildExperienceDevProductRecoveryModule then p2.canRetry and not p4 else nil
	}
end

local function moderationError(p2, p3)
	return if not (p2.action ~= "create" and p2.action ~= "update") then if (p2.name ~= nil and (p3.name ~= nil and p3.name ~= p2.name)) or (p2.description ~= nil and (p2.description ~= "" and (p3.description ~= nil and p3.description ~= p2.description))) then ("Roblox moderation altered this product's text. Product %s already exists; do not create another. Ask the creator for plainer wording and update this product."):format(tostring(p3.productId or (p2.productId or "unknown"))) else nil else nil
end

return function(p2, p3, p4, p5)
	-- upvalues: var1 (ref), fFlagBuildExperienceRemoveDevProductPriceCap (ref), downloadGeneratedImageAsyncModule (ref), awaitPromise (ref), fFlagBuildExperienceDevProductRecoveryModule (ref), awaitMutation (ref), proposalFromFlow (ref), debug (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), moderationError (ref), detailCodeForFailure (ref), studioManageDevProductTool (ref), getToolCallOrder (ref)
	local var6 = nil
	local t = {}
	local var7 = nil
	local _ = nil
	local _ = nil
	
	local function performMutation(p6)
		-- upvalues: fFlagBuildExperienceRemoveDevProductPriceCap (copy), downloadGeneratedImageAsyncModule (copy), awaitPromise (copy), fFlagBuildExperienceDevProductRecoveryModule (copy), awaitMutation (copy), var1 (ref)
		local universeId = p6.universeId
		
		if universeId == nil then
			return nil, "No universe is associated with this session."
		elseif not fFlagBuildExperienceRemoveDevProductPriceCap and p6.priceInRobux ~= nil and (p6.priceInRobux < 1 or p6.priceInRobux > 100) then
			return nil, "Developer-product prices must be between 1 and 100 Robux."
		elseif p6.action == "create" then
			if p6.name == nil or p6.name == "" or p6.priceInRobux == nil then
				return nil, "A name and price are required to create a developer product."
			end
			local var8 = nil
			
			if p6.imageAssetId ~= nil then
				local var9, var10
				local _ = nil
				local var11, var12 = awaitPromise(downloadGeneratedImageAsyncModule(p6.imageAssetId))
				
				if var11 == nil then
					local var13 = if typeof(var12) == "table" then var12.product else nil
					local _ = var13 == nil and (if typeof(var12) == "table" then var12.responseCode else nil) == 429
					var9 = var13
					var10 = if typeof(var12) == "table" and typeof(var12.errorMessage) == "string" then var12.errorMessage elseif var12 == nil then "The request timed out." else tostring(var12)
				else
					var9 = var11
					var10 = nil
				end
				var8 = var9
				local var14 = var10
				
				if var8 == nil then
					if fFlagBuildExperienceDevProductRecoveryModule then
						return nil, "The product image could not be loaded. No product was created.", true
					end
					return nil, var14
				else
					return awaitMutation(var1.create(universeId, {
						name = p6.name,
						description = p6.description,
						priceInRobux = p6.priceInRobux,
						imageFile = var8
					}))
				end
			end
		elseif p6.productId == nil then
			return nil, "A productId is required for this action."
		elseif p6.action == "update" then
			return awaitMutation(var1.update(universeId, p6.productId, {
				name = p6.name,
				description = p6.description,
				priceInRobux = p6.priceInRobux
			}))
		elseif p6.action == "activate" then
			return awaitMutation(var1.activate(universeId, p6.productId))
		elseif p6.action == "deactivate" then
			return awaitMutation(var1.deactivate(universeId, p6.productId))
		end
		return nil, ("Unsupported action '%s'."):format(p6.action)
	end
	
	local function _(p6)
		-- upvalues: p4 (ref)
		p4.removeDevProductTool(p6.toolCallId)
		p4.removeDevProductAction(p6.toolCallId)
	end
	
	local _ = function(p6, p7, p8)
		-- upvalues: fFlagBuildExperienceDevProductRecoveryModule (copy), var6 (write), p4 (ref), p5 (ref), proposalFromFlow (copy)
		if fFlagBuildExperienceDevProductRecoveryModule and var6 ~= p6 then
			p4.removeDevProductAction(p6.toolCallId)
			
			return
		end
		p6.submitted = false
		
		if p5 == nil then
			return
		end
		p4.setDevProductTool(proposalFromFlow(p6, false, false))
		p5(p7, p8)
	end
	
	local function submitResult(p6, p7, p8, p9)
		-- upvalues: p2 (ref), debug (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), fFlagBuildExperienceDevProductRecoveryModule (copy), var6 (write), p4 (ref), p5 (ref), proposalFromFlow (copy), awaitRequestState (copy), chatConstantsModule (copy), p3 (ref)
		local var8 = p2.submitActiveToolResult(p7, p8, p6.turnId, p6.referenceId)
		
		if var8 == nil then
			debug.log("warn", "manage_developer_product tool_result submit aborted (no active session)", { toolCallId = p6.toolCallId })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule then
				if fFlagBuildExperienceDevProductRecoveryModule and var6 ~= p6 then
					p4.removeDevProductAction(p6.toolCallId)
					
					return
				end
				p6.submitted = false
				
				if p5 == nil then
					return
				end
				p4.setDevProductTool(proposalFromFlow(p6, false, false))
				p5(p9, nil)
				
				return
			else
				p6.submitted = false
				
				return
			end
		else
			local var9 = awaitRequestState(var8.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			
			if var9.status == "succeeded" then
				p3[p6.toolCallId] = true
				p4.markSubmitted(p6.toolCallId)
				p4.removeDevProductAction(p6.toolCallId)
				
				if var6 == p6 then
					var6 = nil
				end
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule then
				local errorCode = var9.errorCode
				
				if fFlagBuildExperienceDevProductRecoveryModule and var6 ~= p6 then
					p4.removeDevProductAction(p6.toolCallId)
				else
					p6.submitted = false
					
					if p5 ~= nil then
						p4.setDevProductTool(proposalFromFlow(p6, false, false))
						p5(p9, errorCode)
					end
				end
			else
				p6.submitted = false
			end
			debug.log("warn", "manage_developer_product tool_result submit failed", {
				sessionId = p6.sessionId,
				toolCallId = p6.toolCallId,
				turnId = p6.turnId,
				referenceId = p6.referenceId,
				action = p6.action,
				state = debug.formatRequestState(var9)
			})
		end
	end
	
	local function submitApproval(p6)
		-- upvalues: performMutation (ref), moderationError (copy), detailCodeForFailure (copy), fFlagBuildExperienceDevProductRecoveryModule (copy), var6 (write), p4 (ref), proposalFromFlow (copy), studioManageDevProductTool (copy), submitResult (ref)
		local result, resultError
		local _ = nil
		local _ = nil
		local var8 = nil
		
		if p6.attempted then
			result = p6.result
			resultError = p6.resultError
			var8 = p6.resultDetailCode
		else
			p6.attempted = true
			local _ = nil
			local var9, var10, var11 = performMutation(p6)
			result = var9
			resultError = var10
			local var12 = var11
			
			if result ~= nil and resultError == nil then
				resultError = moderationError(p6, result)
				
				if resultError ~= nil then
					var8 = "name_moderated"
				end
			end
			p6.result = result
			p6.resultError = resultError
			
			if resultError ~= nil and var8 == nil then
				var8 = detailCodeForFailure(p6.action, resultError)
			end
			p6.resultDetailCode = var8
			
			if fFlagBuildExperienceDevProductRecoveryModule and resultError ~= nil and (var12 and p6.action == "create") and var6 == p6 then
				p6.attempted = false
				p6.submitted = false
				p6.isPending = false
				p6.canRetry = true
				p4.setDevProductTool(proposalFromFlow(p6, false, false))
				
				return
			elseif fFlagBuildExperienceDevProductRecoveryModule then
				p6.isPending = false
				p6.canRetry = false
				
				if p4.getOptimisticLocalTools(false).devProductByToolCallId[p6.toolCallId] ~= nil then
					p4.setDevProductTool(proposalFromFlow(p6, true, false))
				end
			end
			local var13, var14
			local _ = nil
			local _ = nil
			
			if result == nil or resultError ~= nil then
				var13 = studioManageDevProductTool.formatResultContent({
					status = "error",
					action = p6.action,
					detailCode = var8,
					message = resultError or "The developer product change failed.",
					product = result
				})
				var14 = true
			else
				local var15, var16 = studioManageDevProductTool.formatResultContent({ status = "ok", action = p6.action, product = result })
				var13 = var15
				var14 = var16
			end
			submitResult(p6, var13, var14, nil)
		end
	end
	
	local function submitRejection(p6, p7)
		-- upvalues: p4 (ref), proposalFromFlow (copy), submitApproval (ref), studioManageDevProductTool (copy), submitResult (ref)
		if p6.attempted then
			p4.setDevProductTool(proposalFromFlow(p6, true, false))
			submitApproval(p6)
			
			return
		end
		submitResult(p6, studioManageDevProductTool.formatRejectionContent(p6.action, p7), false, p7)
	end
	
	local function onApproveImpl()
		-- upvalues: var6 (write), fFlagBuildExperienceDevProductRecoveryModule (copy), p4 (ref), proposalFromFlow (copy), submitApproval (ref)
		if var6 == nil or var6.submitted then return end
		var6.submitted = true
		
		if fFlagBuildExperienceDevProductRecoveryModule then
			var6.isPending = true
			var6.canRetry = false
		end
		p4.setDevProductTool(proposalFromFlow(var6, true, false))
		task.spawn(function()
			-- upvalues: submitApproval (copy), var6 (ref)
			submitApproval(var6)
		end)
	end
	
	local function onRejectImpl()
		-- upvalues: var6 (write), p4 (ref), proposalFromFlow (copy), submitRejection (ref)
		if var6 == nil or var6.submitted then
			return
		end
		var6.submitted = true
		p4.setDevProductTool(proposalFromFlow(var6, false, true))
		task.spawn(function()
			-- upvalues: submitRejection (copy), var6 (ref)
			submitRejection(var6, nil)
		end)
	end
	
	local function runListRequest(p6, p7, p8, p9)
		-- upvalues: p2 (ref), var1 (ref), awaitPromise (copy), studioManageDevProductTool (copy), t (ref), p3 (ref), awaitRequestState (copy), chatConstantsModule (copy), debug (copy)
		local var8
		local universeId = p2.universeId
		local var9 = nil
		local _ = nil
		
		if universeId == nil then
			var8 = "No universe is associated with this session."
		else
			local var10, var11
			local var12, var13 = awaitPromise(var1.list(universeId))
			
			if var12 == nil then
				local var14 = if typeof(var13) == "table" then var13.product else nil
				local _ = var14 == nil and (if typeof(var13) == "table" then var13.responseCode else nil) == 429
				var10 = var14
				var11 = if typeof(var13) == "table" and typeof(var13.errorMessage) == "string" then var13.errorMessage elseif var13 == nil then "The request timed out." else tostring(var13)
			else
				var10 = var12
				var11 = nil
			end
			var9 = var10
			var8 = var11
		end
		local var15, var16
		local _ = nil
		local _ = nil
		
		if var9 == nil then
			var15 = studioManageDevProductTool.formatResultContent({
				status = "error",
				action = "list",
				detailCode = "list_failed",
				message = var8 or "Could not list developer products."
			})
			var16 = true
		else
			local var17, var18 = studioManageDevProductTool.formatResultContent({
				status = "ok",
				action = "list",
				count = #var9.developerProducts,
				products = var9.developerProducts,
				nextPageToken = var9.nextPageToken,
				truncated = var9.nextPageToken ~= nil
			})
			var15 = var17
			var16 = var18
		end
		local var19 = p2.submitActiveToolResult(var15, var16, p7, p8)
		t[p6] = nil
		
		if var19 == nil then
			p3[p6] = nil
			
			return
		end
		local var20 = awaitRequestState(var19.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		
		if var20.status ~= "succeeded" then
			p3[p6] = nil
			
			if var20.status == "pending" then
				var19.dispose()
			end
			debug.log("warn", "manage_developer_product list submit failed", {
				sessionId = p9,
				toolCallId = p6,
				state = debug.formatRequestState(var20)
			})
		end
	end
	
	local _ = function()
		-- upvalues: var6 (write), p4 (ref), var7 (write)
		if var6 ~= nil then
			p4.removeDevProductTool(var6.toolCallId)
			p4.removeDevProductAction(var6.toolCallId)
		end
		var6 = nil
		var7 = nil
	end
	
	return {
		syncManageDevProductRequests = function(p6)
			-- upvalues: studioManageDevProductTool (copy), p3 (ref), var6 (write), p4 (ref), var7 (write), t (ref), fFlagBuildExperienceDevProductRecoveryModule (copy), p2 (ref), awaitRequestState (copy), chatConstantsModule (copy), runListRequest (ref), getToolCallOrder (copy), proposalFromFlow (copy), onApproveImpl (write), onRejectImpl (write), debug (copy)
			local var8, var9, var10, var11 = studioManageDevProductTool.findManageDevProductRequestInTurnState(p6, p3)
			
			if var8 == nil then
				if var6 ~= nil then
					p4.removeDevProductTool(var6.toolCallId)
					p4.removeDevProductAction(var6.toolCallId)
				end
				var6 = nil
				var7 = nil
				
				return false
			else
				local var12 = studioManageDevProductTool.parseManageDevProductInput(var9)
				
				if var12 == nil then
					if t[var8] then
						return true
					end
					t[var8] = true
					task.spawn(function()
						-- upvalues: fFlagBuildExperienceDevProductRecoveryModule (copy), var9 (ref), studioManageDevProductTool (copy), p2 (copy), var10 (ref), var11 (ref), t (copy), var8 (ref), awaitRequestState (copy), chatConstantsModule (copy), p3 (copy)
						local var13 = fFlagBuildExperienceDevProductRecoveryModule and (typeof(var9) == "table" and (typeof(var9.action) == "string" and (string.lower(var9.action) == "update" and var9.imageAssetId ~= nil)))
						local var14 = p2.submitActiveToolResult(studioManageDevProductTool.formatResultContent({
							status = "error",
							action = if var13 then "update" else "unknown",
							detailCode = if var13 then "unsupported_image_update" else "invalid_arguments",
							message = if var13 then "Editing an existing developer product's image is not supported. No product was changed. Do not claim the image was updated or create a replacement product." else "The developer-product request was malformed."
						}), true, var10, var11)
						t[var8] = nil
						
						if var14 == nil then return end
						local var15 = awaitRequestState(var14.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
						
						if var15.status == "succeeded" then
							p3[var8] = true
							
							return
						elseif var15.status == "pending" then
							var14.dispose()
						end
					end)
					
					return true
				elseif studioManageDevProductTool.getActionKind(var12.action) == "read" then
					if t[var8] then
						return true
					end
					p3[var8] = true
					t[var8] = true
					task.spawn(function()
						-- upvalues: runListRequest (copy), var8 (ref), var10 (ref), var11 (ref), p6 (ref)
						runListRequest(var8, var10, var11, p6.sessionId)
					end)
					
					return true
				elseif var8 ~= var7 then
					var7 = var8
					local t_1 = {
						submitted = false,
						attempted = false,
						sessionId = p6.sessionId,
						toolCallId = var8,
						callOrder = getToolCallOrder(p6, var8),
						turnId = var10,
						referenceId = var11,
						universeId = p2.universeId,
						action = var12.action,
						name = var12.name,
						description = var12.description,
						priceInRobux = var12.priceInRobux,
						productId = var12.productId,
						imageAssetId = var12.imageAssetId
					}
					var6 = t_1
					p4.setDevProductTool(proposalFromFlow(t_1, false, false))
					p4.setDevProductAction(var8, onApproveImpl, onRejectImpl)
					debug.log("info", "manage_developer_product proposal displayed", {
						toolCallId = var8,
						turnId = var10,
						referenceId = var11,
						action = var12.action
					})
				end
				return true
			end
		end,
		stopPending = function()
			-- upvalues: t (ref), p3 (ref), var6 (write), p4 (ref), var7 (write)
			local var8 = false
			
			for i in t do
				t[i] = nil
				p3[i] = nil
				var8 = true
			end
			if var6 ~= nil and not var6.submitted then
				var6.submitted = true
				p4.removeDevProductTool(var6.toolCallId)
				p4.removeDevProductAction(var6.toolCallId)
				var6 = nil
				var7 = nil
				var8 = true
			end
			return var8
		end,
		trySubmitComposerText = function(p6)
			-- upvalues: var6 (write), p4 (ref), proposalFromFlow (copy), submitRejection (ref)
			if var6 == nil or var6.submitted then
				return false
			end
			var6.submitted = true
			p4.setDevProductTool(proposalFromFlow(var6, false, true))
			task.spawn(function()
				-- upvalues: submitRejection (copy), var6 (ref), p6 (ref)
				submitRejection(var6, p6)
			end)
			
			return true
		end
	}
end