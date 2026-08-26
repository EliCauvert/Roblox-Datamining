local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local _ = require(script.Parent.chatTypes)
local chatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local debug = creatorAgentChatModule.debug
local awaitRequestState = toolControllerUtilsModule.awaitRequestState
local getToolCallOrder = toolControllerUtilsModule.getToolCallOrder

local function _(p1)
	return {
		toolCallId = p1.toolCallId,
		callOrder = p1.proposal.callOrder or 0,
		isAccepted = p1.proposal.isAccepted,
		feedbackText = p1.proposal.feedbackText
	}
end

local _ = function(p1, p2, p3)
	-- upvalues: studioProposePlanTool (ref), debug (ref), getToolCallOrder (ref)
	local var1 = nil
	local var2 = nil
	local var3 = false
	
	return function(p4)
		-- upvalues: studioProposePlanTool (copy), p3 (ref), var3 (write), debug (copy), var1 (write), var2 (write), p1 (ref), p2 (ref), getToolCallOrder (copy)
		local var4, var5, var6, var7, var8 = studioProposePlanTool.findPlanInTurnState(p4, p3())
		
		if var4 == nil or var5 == nil then
			if var3 then
				debug.log("info", "present_plan proposal cleared", { turn = debug.formatTurnState(p4) })
				var3 = false
				var1 = nil
				var2 = nil
				p1(nil)
				p2(nil)
			end
			return false
		else
			var3 = true
			
			if var5 ~= var1 or var6 ~= var2 then
				var1 = var5
				var2 = var6
				local t = {
					submitted = false,
					sessionId = p4.sessionId,
					toolCallId = var5,
					turnId = var7,
					referenceId = var8,
					proposal = {
						isAccepted = false,
						title = var4.title,
						textContent = var4.textContent,
						summary = var4.summary,
						toolCallId = var5,
						callOrder = getToolCallOrder(p4, var5)
					}
				}
				p2(t)
				p1(t.proposal)
				debug.log("info", "present_plan proposal displayed", {
					toolCallId = var5,
					turnId = var7,
					referenceId = var8,
					turn = debug.formatTurnState(p4)
				})
			end
			return true
		end
	end
end

return function(p1, p2, p3, p4)
	-- upvalues: debug (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), studioProposePlanTool (ref), getToolCallOrder (ref)
	local var1 = nil
	local onPlanAcceptedImpl = nil
	
	local function setPlanFlow(value)
		-- upvalues: var1 (write)
		var1 = value
	end
	
	local function recoverFailedSubmission(p5, p6, p7)
		-- upvalues: p4 (ref), p3 (ref)
		p5.submitted = false
		
		if p4 == nil then
			return
		end
		p5.proposal = {
			isAccepted = false,
			feedbackText = nil,
			title = p5.proposal.title,
			textContent = p5.proposal.textContent,
			summary = p5.proposal.summary,
			toolCallId = p5.proposal.toolCallId,
			callOrder = p5.proposal.callOrder
		}
		p3.setPlanTool({
			toolCallId = p5.toolCallId,
			callOrder = p5.proposal.callOrder or 0,
			isAccepted = p5.proposal.isAccepted,
			feedbackText = p5.proposal.feedbackText
		})
		p4(p6, p7)
	end
	
	local function submitPlanResult(p5, p6, p7, p8)
		-- upvalues: debug (copy), p1 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), recoverFailedSubmission (ref), awaitRequestState (copy), chatConstantsModule (copy), p2 (ref), p3 (ref), var1 (write)
		debug.log("info", "present_plan tool_result submitting", {
			sessionId = p5.sessionId,
			toolCallId = p5.toolCallId,
			turnId = p5.turnId,
			referenceId = p5.referenceId,
			resultKind = p7
		})
		local processTime = os.clock()
		local var2 = p1.submitActiveToolResult(p6, false, p5.turnId, p5.referenceId)
		
		if var2 == nil then
			debug.log("warn", "present_plan tool_result submit aborted (no active session)", { toolCallId = p5.toolCallId, resultKind = p7 })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule then
				recoverFailedSubmission(p5, p8, nil)
				
				return
			end
			p5.submitted = false
			
			return
		else
			local var3 = awaitRequestState(var2.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
			
			if var3.status == "succeeded" then
				debug.log("info", "present_plan tool_result submitted", {
					sessionId = p5.sessionId,
					toolCallId = p5.toolCallId,
					turnId = p5.turnId,
					referenceId = p5.referenceId,
					durationMs = floored,
					resultKind = p7
				})
				p2[p5.toolCallId] = true
				p3.markSubmitted(p5.toolCallId)
				p3.removePlanAction(p5.toolCallId)
				var1 = nil
				
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule then
				recoverFailedSubmission(p5, p8, var3.errorCode)
			else
				p5.submitted = false
			end
			debug.log("warn", "present_plan tool_result submit failed", {
				sessionId = p5.sessionId,
				toolCallId = p5.toolCallId,
				turnId = p5.turnId,
				referenceId = p5.referenceId,
				durationMs = floored,
				state = debug.formatRequestState(var3),
				resultKind = p7
			})
		end
	end
	
	local function _(p5)
		-- upvalues: submitPlanResult (ref), studioProposePlanTool (copy)
		submitPlanResult(p5, studioProposePlanTool.formatAcceptedContent(), "accept", nil)
	end
	
	local _ = function(p5, p6)
		-- upvalues: submitPlanResult (ref), studioProposePlanTool (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy)
		submitPlanResult(p5, studioProposePlanTool.formatFeedbackContent(p6), "feedback", if fFlagBuildExperienceToolResultFailureRecoveryModule then p6 else nil)
	end
	
	local function setCurrentPlanProposal(value)
		-- upvalues: var1 (write), p3 (ref), onPlanAcceptedImpl (write)
		if value == nil then
			if var1 ~= nil then
				p3.removePlanTool(var1.toolCallId)
				p3.removePlanAction(var1.toolCallId)
			end
			return
		else
			local var2 = var1
			
			if var2 ~= nil then
				p3.setPlanTool({
					toolCallId = var2.toolCallId,
					callOrder = var2.proposal.callOrder or 0,
					isAccepted = var2.proposal.isAccepted,
					feedbackText = var2.proposal.feedbackText
				})
				p3.setPlanAction(var2.toolCallId, onPlanAcceptedImpl)
			end
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p2 (ref)
		return p2
	end
	
	local var2 = nil
	local var3 = nil
	local var4 = false
	
	onPlanAcceptedImpl = function()
		-- upvalues: var1 (write), setCurrentPlanProposal (ref), submitPlanResult (ref), studioProposePlanTool (copy)
		if var1 == nil or var1.submitted then
			return
		end
		var1.submitted = true
		var1.proposal = {
			isAccepted = true,
			feedbackText = nil,
			title = var1.proposal.title,
			textContent = var1.proposal.textContent,
			summary = var1.proposal.summary,
			toolCallId = var1.proposal.toolCallId,
			callOrder = var1.proposal.callOrder
		}
		setCurrentPlanProposal(var1.proposal)
		task.spawn(function()
			-- upvalues: var1 (ref), submitPlanResult (copy), studioProposePlanTool (copy)
			submitPlanResult(var1, studioProposePlanTool.formatAcceptedContent(), "accept", nil)
		end)
	end
	
	return {
		syncPlanProposal = function(p5)
			-- upvalues: studioProposePlanTool (copy), getSubmittedToolCallIds (ref), var4 (write), debug (copy), var2 (write), var3 (write), setCurrentPlanProposal (ref), setPlanFlow (ref), getToolCallOrder (copy)
			local var5, var6, var7, var8, var9 = studioProposePlanTool.findPlanInTurnState(p5, getSubmittedToolCallIds())
			
			if var5 == nil or var6 == nil then
				if var4 then
					debug.log("info", "present_plan proposal cleared", { turn = debug.formatTurnState(p5) })
					var4 = false
					var5 = nil
					var6 = nil
					setCurrentPlanProposal(nil)
					setPlanFlow(nil)
				end
				return false
			else
				var4 = true
				
				if var6 ~= var5 or var7 ~= var6 then
					var5 = var6
					var6 = var7
					local t = {
						submitted = false,
						sessionId = p5.sessionId,
						toolCallId = var6,
						turnId = var8,
						referenceId = var9,
						proposal = {
							isAccepted = false,
							title = var5.title,
							textContent = var5.textContent,
							summary = var5.summary,
							toolCallId = var6,
							callOrder = getToolCallOrder(p5, var6)
						}
					}
					setPlanFlow(t)
					setCurrentPlanProposal(t.proposal)
					debug.log("info", "present_plan proposal displayed", {
						toolCallId = var6,
						turnId = var8,
						referenceId = var9,
						turn = debug.formatTurnState(p5)
					})
				end
				return true
			end
		end,
		stopPendingPlan = function()
			-- upvalues: var1 (write), p3 (ref)
			if var1 == nil or var1.submitted then
				return false
			end
			var1.submitted = true
			var1 = nil
			p3.removePlanTool(var1.toolCallId)
			p3.removePlanAction(var1.toolCallId)
			
			return true
		end,
		trySubmitComposerText = function(p5)
			-- upvalues: var1 (write), setCurrentPlanProposal (ref), submitPlanResult (ref), studioProposePlanTool (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy)
			if var1 == nil or var1.submitted then
				return false
			end
			var1.submitted = true
			var1.proposal = {
				isAccepted = false,
				title = var1.proposal.title,
				textContent = var1.proposal.textContent,
				summary = var1.proposal.summary,
				toolCallId = var1.proposal.toolCallId,
				callOrder = var1.proposal.callOrder,
				feedbackText = p5
			}
			setCurrentPlanProposal(var1.proposal)
			task.spawn(function()
				-- upvalues: var1 (ref), p5 (ref), submitPlanResult (copy), studioProposePlanTool (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy)
				submitPlanResult(var1, studioProposePlanTool.formatFeedbackContent(p5), "feedback", if fFlagBuildExperienceToolResultFailureRecoveryModule then p5 else nil)
			end)
			
			return true
		end
	}
end