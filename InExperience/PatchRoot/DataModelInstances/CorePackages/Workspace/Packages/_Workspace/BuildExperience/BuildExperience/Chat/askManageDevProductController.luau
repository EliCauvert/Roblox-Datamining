local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local developerProductModule = require(parent.DataHydration.DeveloperProduct)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local _ = require(script.Parent.chatTypes)
local chatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioManageDevProductTool = creatorAgentChatModule.StudioManageDevProductTool
local debug = creatorAgentChatModule.debug
local awaitRequestState = toolControllerUtilsModule.awaitRequestState
local getToolCallOrder = toolControllerUtilsModule.getToolCallOrder

local function awaitPromise(p1)
	-- upvalues: chatConstantsModule (ref)
	local var1 = nil
	local var2 = nil
	local var3 = false
	p1:andThen(function(p2)
		-- upvalues: var1 (write), var3 (write)
		var1 = p2
		var3 = true
	end, function(p2)
		-- upvalues: var2 (write), var3 (write)
		var2 = p2
		var3 = true
	end)
	local var4 = os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS
	while os.clock() < var4 do
		task.wait()
	end
	p1:cancel()
	var2 = "The request timed out and its outcome is unknown. List developer products before retrying."
	
	return var1, u355
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
	local var5, var6 = awaitPromise(p2)
	
	if var5 ~= nil then
		return var5, nil
	end
	local var7 = nil
	
	if typeof(var6) == "table" and typeof(var6.errorMessage) == "string" then
		return var7, var6.errorMessage
	elseif var6 == nil then
		return var7, "The request timed out."
	end
	return var7, tostring(var6)
end

local _ = function(p2, p3, p4)
	return {
		toolCallId = p2.toolCallId,
		callOrder = p2.callOrder,
		action = p2.action,
		name = p2.name,
		description = p2.description,
		priceInRobux = p2.priceInRobux,
		productId = p2.productId,
		isApproved = p3,
		isRejected = p4
	}
end

local function moderationError(p2, p3)
	return if not (p2.action ~= "create" and p2.action ~= "update") then if (p2.name ~= nil and (p3.name ~= nil and p3.name ~= p2.name)) or (p2.description ~= nil and (p2.description ~= "" and (p3.description ~= nil and p3.description ~= p2.description))) then ("Roblox moderation altered this product's text. Product %s already exists; do not create another. Ask the creator for plainer wording and update this product."):format(tostring(p3.productId or (p2.productId or "unknown"))) else nil else nil
end

return function(p2, p3, p4, p5)
	-- upvalues: developerProductModule (ref), awaitMutation (ref), debug (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), moderationError (ref), detailCodeForFailure (ref), studioManageDevProductTool (ref), awaitPromise (ref), getToolCallOrder (ref)
	local developerProductStore = developerProductModule.getDeveloperProductStore()
	local var5 = nil
	local t = {}
	local var6 = nil
	local _ = nil
	local _ = nil
	
	local function performMutation(p6)
		-- upvalues: awaitMutation (copy), developerProductStore (ref)
		local universeId = p6.universeId
		
		if universeId == nil then
			return nil, "No universe is associated with this session."
		elseif p6.action == "create" then
			if p6.name == nil or p6.name == "" or p6.priceInRobux == nil then
				return nil, "A name and price are required to create a developer product."
			end
			return awaitMutation(developerProductStore.create(universeId, {
				name = p6.name,
				description = p6.description,
				priceInRobux = p6.priceInRobux
			}))
		elseif p6.productId == nil then
			return nil, "A productId is required for this action."
		elseif p6.action == "update" then
			return awaitMutation(developerProductStore.update(universeId, p6.productId, {
				name = p6.name,
				description = p6.description,
				priceInRobux = p6.priceInRobux
			}))
		elseif p6.action == "activate" then
			return awaitMutation(developerProductStore.activate(universeId, p6.productId))
		elseif p6.action == "deactivate" then
			return awaitMutation(developerProductStore.deactivate(universeId, p6.productId))
		end
		return nil, ("Unsupported action '%s'."):format(p6.action)
	end
	
	local function _(p6)
		-- upvalues: p4 (ref)
		p4.removeDevProductTool(p6.toolCallId)
		p4.removeDevProductAction(p6.toolCallId)
	end
	
	local _ = function(p6, p7, p8)
		-- upvalues: p5 (ref), p4 (ref)
		p6.submitted = false
		
		if p5 == nil then
			return
		end
		p4.setDevProductTool({
			isApproved = false,
			isRejected = false,
			toolCallId = p6.toolCallId,
			callOrder = p6.callOrder,
			action = p6.action,
			name = p6.name,
			description = p6.description,
			priceInRobux = p6.priceInRobux,
			productId = p6.productId
		})
		p5(p7, p8)
	end
	
	local function submitResult(p6, p7, p8, p9)
		-- upvalues: p2 (ref), debug (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), p5 (ref), p4 (ref), awaitRequestState (copy), chatConstantsModule (copy), p3 (ref), var5 (write)
		local var7 = p2.submitActiveToolResult(p7, p8, p6.turnId, p6.referenceId)
		
		if var7 == nil then
			debug.log("warn", "manage_developer_product tool_result submit aborted (no active session)", { toolCallId = p6.toolCallId })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule then
				p6.submitted = false
				
				if p5 == nil then
					return
				end
				p4.setDevProductTool({
					isApproved = false,
					isRejected = false,
					toolCallId = p6.toolCallId,
					callOrder = p6.callOrder,
					action = p6.action,
					name = p6.name,
					description = p6.description,
					priceInRobux = p6.priceInRobux,
					productId = p6.productId
				})
				p5(p9, nil)
				
				return
			else
				p6.submitted = false
				
				return
			end
		else
			local var8 = awaitRequestState(var7.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			
			if var8.status == "succeeded" then
				p3[p6.toolCallId] = true
				p4.markSubmitted(p6.toolCallId)
				p4.removeDevProductAction(p6.toolCallId)
				
				if var5 == p6 then
					var5 = nil
				end
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule then
				local errorCode = var8.errorCode
				p6.submitted = false
				
				if p5 ~= nil then
					p4.setDevProductTool({
						isApproved = false,
						isRejected = false,
						toolCallId = p6.toolCallId,
						callOrder = p6.callOrder,
						action = p6.action,
						name = p6.name,
						description = p6.description,
						priceInRobux = p6.priceInRobux,
						productId = p6.productId
					})
					p5(p9, errorCode)
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
				state = debug.formatRequestState(var8)
			})
		end
	end
	
	local function submitApproval(p6)
		-- upvalues: performMutation (ref), moderationError (copy), detailCodeForFailure (copy), studioManageDevProductTool (copy), submitResult (ref)
		local result, resultError
		local _ = nil
		local _ = nil
		local var7 = nil
		
		if p6.attempted then
			result = p6.result
			resultError = p6.resultError
			var7 = p6.resultDetailCode
		else
			p6.attempted = true
			local var8, var9 = performMutation(p6)
			result = var8
			resultError = var9
			
			if result ~= nil then
				resultError = moderationError(p6, result)
				
				if resultError ~= nil then
					var7 = "name_moderated"
				end
			end
			p6.result = result
			p6.resultError = resultError
			
			if resultError ~= nil and var7 == nil then
				var7 = detailCodeForFailure(p6.action, resultError)
			end
			p6.resultDetailCode = var7
		end
		local var10, var11
		local _ = nil
		local _ = nil
		
		if result == nil or resultError ~= nil then
			var10 = studioManageDevProductTool.formatResultContent({
				status = "error",
				action = p6.action,
				detailCode = var7,
				message = resultError or "The developer product change failed.",
				product = result
			})
			var11 = true
		else
			local var12, var13 = studioManageDevProductTool.formatResultContent({ status = "ok", action = p6.action, product = result })
			var10 = var12
			var11 = var13
		end
		submitResult(p6, var10, var11, nil)
	end
	
	local function submitRejection(p6, p7)
		-- upvalues: p4 (ref), submitApproval (ref), studioManageDevProductTool (copy), submitResult (ref)
		if p6.attempted then
			p4.setDevProductTool({
				isApproved = true,
				isRejected = false,
				toolCallId = p6.toolCallId,
				callOrder = p6.callOrder,
				action = p6.action,
				name = p6.name,
				description = p6.description,
				priceInRobux = p6.priceInRobux,
				productId = p6.productId
			})
			submitApproval(p6)
			
			return
		end
		submitResult(p6, studioManageDevProductTool.formatRejectionContent(p6.action, p7), false, p7)
	end
	
	local function onApproveImpl()
		-- upvalues: var5 (write), p4 (ref), submitApproval (ref)
		if var5 == nil or var5.submitted then
			return
		end
		var5.submitted = true
		p4.setDevProductTool({
			isApproved = true,
			isRejected = false,
			toolCallId = var5.toolCallId,
			callOrder = var5.callOrder,
			action = var5.action,
			name = var5.name,
			description = var5.description,
			priceInRobux = var5.priceInRobux,
			productId = var5.productId
		})
		task.spawn(function()
			-- upvalues: submitApproval (copy), var5 (ref)
			submitApproval(var5)
		end)
	end
	
	local function onRejectImpl()
		-- upvalues: var5 (write), p4 (ref), submitRejection (ref)
		if var5 == nil or var5.submitted then
			return
		end
		var5.submitted = true
		p4.setDevProductTool({
			isApproved = false,
			isRejected = true,
			toolCallId = var5.toolCallId,
			callOrder = var5.callOrder,
			action = var5.action,
			name = var5.name,
			description = var5.description,
			priceInRobux = var5.priceInRobux,
			productId = var5.productId
		})
		task.spawn(function()
			-- upvalues: submitRejection (copy), var5 (ref)
			submitRejection(var5, nil)
		end)
	end
	
	local function runListRequest(p6, p7, p8, p9)
		-- upvalues: p2 (ref), developerProductStore (ref), awaitPromise (copy), studioManageDevProductTool (copy), t (ref), p3 (ref), awaitRequestState (copy), chatConstantsModule (copy), debug (copy)
		local var7
		local universeId = p2.universeId
		local var8 = nil
		local _ = nil
		
		if universeId == nil then
			var7 = "No universe is associated with this session."
		else
			local var9, var10
			local var11, var12 = awaitPromise(developerProductStore.list(universeId))
			
			if var11 == nil then
				var9 = nil
				var10 = if typeof(var12) == "table" and typeof(var12.errorMessage) == "string" then var12.errorMessage elseif var12 == nil then "The request timed out." else tostring(var12)
			else
				var9 = var11
				var10 = nil
			end
			var8 = var9
			var7 = var10
		end
		local var13, var14
		local _ = nil
		local _ = nil
		
		if var8 == nil then
			var13 = studioManageDevProductTool.formatResultContent({
				status = "error",
				action = "list",
				detailCode = "list_failed",
				message = var7 or "Could not list developer products."
			})
			var14 = true
		else
			local var15, var16 = studioManageDevProductTool.formatResultContent({
				status = "ok",
				action = "list",
				count = #var8.developerProducts,
				products = var8.developerProducts,
				nextPageToken = var8.nextPageToken,
				truncated = var8.nextPageToken ~= nil
			})
			var13 = var15
			var14 = var16
		end
		local var17 = p2.submitActiveToolResult(var13, var14, p7, p8)
		t[p6] = nil
		
		if var17 == nil then
			p3[p6] = nil
			
			return
		end
		local var18 = awaitRequestState(var17.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		
		if var18.status ~= "succeeded" then
			p3[p6] = nil
			
			if var18.status == "pending" then
				var17.dispose()
			end
			debug.log("warn", "manage_developer_product list submit failed", {
				sessionId = p9,
				toolCallId = p6,
				state = debug.formatRequestState(var18)
			})
		end
	end
	
	local _ = function()
		-- upvalues: var5 (write), p4 (ref), var6 (write)
		if var5 ~= nil then
			p4.removeDevProductTool(var5.toolCallId)
			p4.removeDevProductAction(var5.toolCallId)
		end
		var5 = nil
		var6 = nil
	end
	
	return {
		syncManageDevProductRequests = function(p6)
			-- upvalues: studioManageDevProductTool (copy), p3 (ref), var5 (write), p4 (ref), var6 (write), t (ref), p2 (ref), awaitRequestState (copy), chatConstantsModule (copy), runListRequest (ref), getToolCallOrder (copy), onApproveImpl (write), onRejectImpl (write), debug (copy)
			local var7, var8, var9, var10 = studioManageDevProductTool.findManageDevProductRequestInTurnState(p6, p3)
			
			if var7 == nil then
				if var5 ~= nil then
					p4.removeDevProductTool(var5.toolCallId)
					p4.removeDevProductAction(var5.toolCallId)
				end
				var5 = nil
				var6 = nil
				
				return false
			else
				local var11 = studioManageDevProductTool.parseManageDevProductInput(var8)
				
				if var11 == nil then
					if t[var7] then
						return true
					end
					t[var7] = true
					task.spawn(function()
						-- upvalues: studioManageDevProductTool (copy), p2 (copy), var9 (ref), var10 (ref), t (copy), var7 (ref), awaitRequestState (copy), chatConstantsModule (copy), p3 (copy)
						local var12 = p2.submitActiveToolResult(studioManageDevProductTool.formatResultContent({
							status = "error",
							action = "unknown",
							detailCode = "invalid_arguments",
							message = "The developer-product request was malformed."
						}), true, var9, var10)
						t[var7] = nil
						
						if var12 == nil then return end
						local var13 = awaitRequestState(var12.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
						
						if var13.status == "succeeded" then
							p3[var7] = true
							
							return
						elseif var13.status == "pending" then
							var12.dispose()
						end
					end)
					
					return true
				elseif studioManageDevProductTool.getActionKind(var11.action) == "read" then
					if t[var7] then
						return true
					end
					p3[var7] = true
					t[var7] = true
					task.spawn(function()
						-- upvalues: runListRequest (copy), var7 (ref), var9 (ref), var10 (ref), p6 (ref)
						runListRequest(var7, var9, var10, p6.sessionId)
					end)
					
					return true
				elseif var7 ~= var6 then
					var6 = var7
					local t_1 = {
						submitted = false,
						attempted = false,
						sessionId = p6.sessionId,
						toolCallId = var7,
						callOrder = getToolCallOrder(p6, var7),
						turnId = var9,
						referenceId = var10,
						universeId = p2.universeId,
						action = var11.action,
						name = var11.name,
						description = var11.description,
						priceInRobux = var11.priceInRobux,
						productId = var11.productId
					}
					var5 = t_1
					p4.setDevProductTool({
						isApproved = false,
						isRejected = false,
						toolCallId = t_1.toolCallId,
						callOrder = t_1.callOrder,
						action = t_1.action,
						name = t_1.name,
						description = t_1.description,
						priceInRobux = t_1.priceInRobux,
						productId = t_1.productId
					})
					p4.setDevProductAction(var7, onApproveImpl, onRejectImpl)
					debug.log("info", "manage_developer_product proposal displayed", {
						toolCallId = var7,
						turnId = var9,
						referenceId = var10,
						action = var11.action
					})
				end
				return true
			end
		end,
		stopPending = function()
			-- upvalues: t (ref), p3 (ref), var5 (write), p4 (ref), var6 (write)
			local var7 = false
			
			for i in t do
				t[i] = nil
				p3[i] = nil
				var7 = true
			end
			if var5 ~= nil and not var5.submitted then
				var5.submitted = true
				p4.removeDevProductTool(var5.toolCallId)
				p4.removeDevProductAction(var5.toolCallId)
				var5 = nil
				var6 = nil
				var7 = true
			end
			return var7
		end,
		trySubmitComposerText = function(p6)
			-- upvalues: var5 (write), p4 (ref), submitRejection (ref)
			if var5 == nil or var5.submitted then
				return false
			end
			var5.submitted = true
			p4.setDevProductTool({
				isApproved = false,
				isRejected = true,
				toolCallId = var5.toolCallId,
				callOrder = var5.callOrder,
				action = var5.action,
				name = var5.name,
				description = var5.description,
				priceInRobux = var5.priceInRobux,
				productId = var5.productId
			})
			task.spawn(function()
				-- upvalues: submitRejection (copy), var5 (ref), p6 (ref)
				submitRejection(var5, p6)
			end)
			
			return true
		end
	}
end