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

local function _(p0)
	return {
		toolCallId = p0.toolCallId,
		callOrder = p0.proposal.callOrder or 0,
		isAccepted = p0.proposal.isAccepted,
		feedbackText = p0.proposal.feedbackText
	}
end

local _ = function(p1, p2, p3)
	-- upvalues: studioProposePlanTool (ref), debug (ref), getToolCallOrder (ref)
	local var5 = nil
	local var6 = nil
	local var7 = false
	
	return function(p4)
		-- upvalues: studioProposePlanTool (copy), p3 (ref), var7 (write), debug (copy), var5 (write), var6 (write), p1 (ref), p2 (ref), getToolCallOrder (copy)
		local var8, var9, var10, var11, var12 = studioProposePlanTool.findPlanInTurnState(p4, p3())
		
		if var8 == nil or var9 == nil then
			if var7 then
				debug.log("info", "present_plan proposal cleared", { turn = debug.formatTurnState(p4) })
				var7 = false
				var5 = nil
				var6 = nil
				p1(nil)
				p2(nil)
			end
			return false
		else
			var7 = true
			
			if var9 ~= var5 or var10 ~= var6 then
				var5 = var9
				var6 = var10
				local t = {
					submitted = false,
					sessionId = p4.sessionId,
					toolCallId = var9,
					turnId = var11,
					referenceId = var12,
					proposal = {
						isAccepted = false,
						title = var8.title,
						textContent = var8.textContent,
						summary = var8.summary,
						toolCallId = var9,
						callOrder = getToolCallOrder(p4, var9)
					}
				}
				p2(t)
				p1(t.proposal)
				debug.log("info", "present_plan proposal displayed", {
					toolCallId = var9,
					turnId = var11,
					referenceId = var12,
					turn = debug.formatTurnState(p4)
				})
			end
			return true
		end
	end
end

return function(p5, p6, p7, p8)
	-- upvalues: debug (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), studioProposePlanTool (ref), getToolCallOrder (ref)
	local var14 = nil
	local onPlanAcceptedImpl = nil
	
	local function setPlanFlow(value)
		-- upvalues: var14 (write)
		var14 = value
	end
	
	local function recoverFailedSubmission(p9, p10, p11)
		-- upvalues: p8 (ref), p7 (ref)
		p9.submitted = false
		
		if p8 == nil then
			return
		end
		p9.proposal = {
			isAccepted = false,
			feedbackText = nil,
			title = p9.proposal.title,
			textContent = p9.proposal.textContent,
			summary = p9.proposal.summary,
			toolCallId = p9.proposal.toolCallId,
			callOrder = p9.proposal.callOrder
		}
		p7.setPlanTool({
			toolCallId = p9.toolCallId,
			callOrder = p9.proposal.callOrder or 0,
			isAccepted = p9.proposal.isAccepted,
			feedbackText = p9.proposal.feedbackText
		})
		p8(p10, p11)
	end
	
	local function submitPlanResult(p12, p13, p14, p15)
		-- upvalues: debug (copy), p5 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), recoverFailedSubmission (ref), awaitRequestState (copy), chatConstantsModule (copy), p6 (ref), p7 (ref), var14 (write)
		debug.log("info", "present_plan tool_result submitting", {
			sessionId = p12.sessionId,
			toolCallId = p12.toolCallId,
			turnId = p12.turnId,
			referenceId = p12.referenceId,
			resultKind = p14
		})
		local processTime = os.clock()
		local var25 = p5.submitActiveToolResult(p13, false, p12.turnId, p12.referenceId)
		
		if var25 == nil then
			debug.log("warn", "present_plan tool_result submit aborted (no active session)", { toolCallId = p12.toolCallId, resultKind = p14 })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule then
				recoverFailedSubmission(p12, p15, nil)
				
				return
			end
			p12.submitted = false
			
			return
		else
			local var26 = awaitRequestState(var25.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
			
			if var26.status == "succeeded" then
				debug.log("info", "present_plan tool_result submitted", {
					sessionId = p12.sessionId,
					toolCallId = p12.toolCallId,
					turnId = p12.turnId,
					referenceId = p12.referenceId,
					durationMs = floored,
					resultKind = p14
				})
				p6[p12.toolCallId] = true
				p7.markSubmitted(p12.toolCallId)
				p7.removePlanAction(p12.toolCallId)
				var14 = nil
				
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule then
				recoverFailedSubmission(p12, p15, var26.errorCode)
			else
				p12.submitted = false
			end
			debug.log("warn", "present_plan tool_result submit failed", {
				sessionId = p12.sessionId,
				toolCallId = p12.toolCallId,
				turnId = p12.turnId,
				referenceId = p12.referenceId,
				durationMs = floored,
				state = debug.formatRequestState(var26),
				resultKind = p14
			})
		end
	end
	
	local function _(p16)
		-- upvalues: submitPlanResult (ref), studioProposePlanTool (copy)
		submitPlanResult(p16, studioProposePlanTool.formatAcceptedContent(), "accept", nil)
	end
	
	local _ = function(p17, p18)
		-- upvalues: submitPlanResult (ref), studioProposePlanTool (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy)
		submitPlanResult(p17, studioProposePlanTool.formatFeedbackContent(p18), "feedback", if fFlagBuildExperienceToolResultFailureRecoveryModule then p18 else nil)
	end
	
	local function setCurrentPlanProposal(value)
		-- upvalues: var14 (write), p7 (ref), onPlanAcceptedImpl (write)
		if value == nil then
			if var14 ~= nil then
				p7.removePlanTool(var14.toolCallId)
				p7.removePlanAction(var14.toolCallId)
			end
			return
		else
			local var28 = var14
			
			if var28 ~= nil then
				p7.setPlanTool({
					toolCallId = var28.toolCallId,
					callOrder = var28.proposal.callOrder or 0,
					isAccepted = var28.proposal.isAccepted,
					feedbackText = var28.proposal.feedbackText
				})
				p7.setPlanAction(var28.toolCallId, onPlanAcceptedImpl)
			end
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p6 (ref)
		return p6
	end
	
	local var21 = nil
	local var22 = nil
	local var23 = false
	
	onPlanAcceptedImpl = function()
		-- upvalues: var14 (write), setCurrentPlanProposal (ref), submitPlanResult (ref), studioProposePlanTool (copy)
		if var14 == nil or var14.submitted then
			return
		end
		var14.submitted = true
		var14.proposal = {
			isAccepted = true,
			feedbackText = nil,
			title = var14.proposal.title,
			textContent = var14.proposal.textContent,
			summary = var14.proposal.summary,
			toolCallId = var14.proposal.toolCallId,
			callOrder = var14.proposal.callOrder
		}
		setCurrentPlanProposal(var14.proposal)
		task.spawn(function()
			-- upvalues: var14 (ref), submitPlanResult (copy), studioProposePlanTool (copy)
			submitPlanResult(var14, studioProposePlanTool.formatAcceptedContent(), "accept", nil)
		end)
	end
	
	return {
		syncPlanProposal = function(p19)
			-- upvalues: studioProposePlanTool (copy), getSubmittedToolCallIds (ref), var23 (write), debug (copy), var21 (write), var22 (write), setCurrentPlanProposal (ref), setPlanFlow (ref), getToolCallOrder (copy)
			local var8, var9, var10, var11, var12 = studioProposePlanTool.findPlanInTurnState(p19, getSubmittedToolCallIds())
			
			if var8 == nil or var9 == nil then
				if var23 then
					debug.log("info", "present_plan proposal cleared", { turn = debug.formatTurnState(p19) })
					var23 = false
					var5 = nil
					var6 = nil
					setCurrentPlanProposal(nil)
					setPlanFlow(nil)
				end
				return false
			else
				var23 = true
				
				if var9 ~= var5 or var10 ~= var6 then
					var5 = var9
					var6 = var10
					local t = {
						submitted = false,
						sessionId = p19.sessionId,
						toolCallId = var9,
						turnId = var11,
						referenceId = var12,
						proposal = {
							isAccepted = false,
							title = var8.title,
							textContent = var8.textContent,
							summary = var8.summary,
							toolCallId = var9,
							callOrder = getToolCallOrder(p19, var9)
						}
					}
					setPlanFlow(t)
					setCurrentPlanProposal(t.proposal)
					debug.log("info", "present_plan proposal displayed", {
						toolCallId = var9,
						turnId = var11,
						referenceId = var12,
						turn = debug.formatTurnState(p19)
					})
				end
				return true
			end
		end,
		stopPendingPlan = function()
			-- upvalues: var14 (write), p7 (ref)
			if var14 == nil or var14.submitted then
				return false
			end
			var14.submitted = true
			var14 = nil
			p7.removePlanTool(var14.toolCallId)
			p7.removePlanAction(var14.toolCallId)
			
			return true
		end,
		trySubmitComposerText = function(p20)
			-- upvalues: var14 (write), setCurrentPlanProposal (ref), submitPlanResult (ref), studioProposePlanTool (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy)
			if var14 == nil or var14.submitted then
				return false
			end
			var14.submitted = true
			var14.proposal = {
				isAccepted = false,
				title = var14.proposal.title,
				textContent = var14.proposal.textContent,
				summary = var14.proposal.summary,
				toolCallId = var14.proposal.toolCallId,
				callOrder = var14.proposal.callOrder,
				feedbackText = p20
			}
			setCurrentPlanProposal(var14.proposal)
			task.spawn(function()
				-- upvalues: var14 (ref), p20 (ref), submitPlanResult (copy), studioProposePlanTool (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy)
				submitPlanResult(var14, studioProposePlanTool.formatFeedbackContent(p20), "feedback", if fFlagBuildExperienceToolResultFailureRecoveryModule then p20 else nil)
			end)
			
			return true
		end
	}
end