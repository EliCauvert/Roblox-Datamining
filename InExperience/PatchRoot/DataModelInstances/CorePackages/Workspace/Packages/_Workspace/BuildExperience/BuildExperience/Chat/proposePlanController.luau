local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local FFlagBuildExperienceToolResultFailureRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool
local Debug = CreatorAgentChatModule.debug
local AwaitRequestStateFunction = ToolControllerUtilsModule.awaitRequestState
local GetToolCallOrderFunction = ToolControllerUtilsModule.getToolCallOrder

local function _(p1)
	return {
		toolCallId = p1.toolCallId,
		callOrder = p1.proposal.callOrder or 0,
		isAccepted = p1.proposal.isAccepted,
		feedbackText = p1.proposal.feedbackText
	}
end

local _ = function(p1, p2, p3)
	-- upvalues: StudioProposePlanTool (copy), Debug (copy), GetToolCallOrderFunction (copy)
	local v1 = nil
	local v2 = nil
	local v3 = false
	
	return function(p4): boolean
		-- upvalues: StudioProposePlanTool (upval), p3 (copy), v3 (ref), Debug (upval), v1 (ref), v2 (ref), p1 (copy), p2 (copy), GetToolCallOrderFunction (upval)
		local PlanInTurnState, PlanInTurnState2, PlanInTurnState3, PlanInTurnState4, PlanInTurnState5 = StudioProposePlanTool.findPlanInTurnState(p4, p3())
		
		if PlanInTurnState == nil or PlanInTurnState2 == nil then
			if v3 then
				Debug.log("info", "present_plan proposal cleared", { turn = Debug.formatTurnState(p4) })
				v3 = false
				v1 = nil
				v2 = nil
				p1(nil)
				p2(nil)
			end
			return false
		else
			v3 = true
			
			if PlanInTurnState2 ~= v1 or PlanInTurnState3 ~= v2 then
				v1 = PlanInTurnState2
				v2 = PlanInTurnState3
				local config = {
					submitted = false,
					sessionId = p4.sessionId,
					toolCallId = PlanInTurnState2,
					turnId = PlanInTurnState4,
					referenceId = PlanInTurnState5,
					proposal = {
						isAccepted = false,
						title = PlanInTurnState.title,
						textContent = PlanInTurnState.textContent,
						summary = PlanInTurnState.summary,
						toolCallId = PlanInTurnState2,
						callOrder = GetToolCallOrderFunction(p4, PlanInTurnState2)
					}
				}
				p2(config)
				p1(config.proposal)
				Debug.log("info", "present_plan proposal displayed", {
					toolCallId = PlanInTurnState2,
					turnId = PlanInTurnState4,
					referenceId = PlanInTurnState5,
					turn = Debug.formatTurnState(p4)
				})
			end
			return true
		end
	end
end

return function(p1, p2, p3, Callback)
	-- upvalues: Debug (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), StudioProposePlanTool (copy), GetToolCallOrderFunction (copy)
	local PlanFlow = nil
	local OnPlanAcceptedImpl = nil
	
	local function setPlanFlow(Value)
		-- upvalues: PlanFlow (ref)
		PlanFlow = Value
	end
	
	local function recoverFailedSubmission(p4, p5, ErrorCode)
		-- upvalues: Callback (copy), p3 (copy)
		p4.submitted = false
		
		if Callback ~= nil then
			p4.proposal = {
				isAccepted = false,
				feedbackText = nil,
				title = p4.proposal.title,
				textContent = p4.proposal.textContent,
				summary = p4.proposal.summary,
				toolCallId = p4.proposal.toolCallId,
				callOrder = p4.proposal.callOrder
			}
			p3.setPlanTool({
				toolCallId = p4.toolCallId,
				callOrder = p4.proposal.callOrder or 0,
				isAccepted = p4.proposal.isAccepted,
				feedbackText = p4.proposal.feedbackText
			})
			Callback(p5, ErrorCode)
			
			return
		end
	end
	
	local function submitPlanResult(PlanFlow1, FormatAcceptedContentResult, ResultKind, p4)
		-- upvalues: Debug (upval), p1 (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), recoverFailedSubmission (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p2 (copy), p3 (copy), PlanFlow (ref)
		Debug.log("info", "present_plan tool_result submitting", {
			sessionId = PlanFlow1.sessionId,
			toolCallId = PlanFlow1.toolCallId,
			turnId = PlanFlow1.turnId,
			referenceId = PlanFlow1.referenceId,
			resultKind = ResultKind
		})
		local ClockTime = os.clock()
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatAcceptedContentResult, false, PlanFlow1.turnId, PlanFlow1.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "present_plan tool_result submit aborted (no active session)", {
				toolCallId = PlanFlow1.toolCallId,
				resultKind = ResultKind
			})
			
			if FFlagBuildExperienceToolResultFailureRecoveryModule then
				recoverFailedSubmission(PlanFlow1, p4, nil)
				
				return
			else
				PlanFlow1.submitted = false
				
				return
			end
		else
			local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local Floored = math.floor((os.clock() - ClockTime) * 1000 + 0.5)
			
			if AwaitRequestStateResult.status == "succeeded" then
				Debug.log("info", "present_plan tool_result submitted", {
					sessionId = PlanFlow1.sessionId,
					toolCallId = PlanFlow1.toolCallId,
					turnId = PlanFlow1.turnId,
					referenceId = PlanFlow1.referenceId,
					durationMs = Floored,
					resultKind = ResultKind
				})
				p2[PlanFlow1.toolCallId] = true
				p3.markSubmitted(PlanFlow1.toolCallId)
				p3.removePlanAction(PlanFlow1.toolCallId)
				PlanFlow = nil
				
				return
			else
				if FFlagBuildExperienceToolResultFailureRecoveryModule then
					recoverFailedSubmission(PlanFlow1, p4, AwaitRequestStateResult.errorCode)
				else
					PlanFlow1.submitted = false
				end
				Debug.log("warn", "present_plan tool_result submit failed", {
					sessionId = PlanFlow1.sessionId,
					toolCallId = PlanFlow1.toolCallId,
					turnId = PlanFlow1.turnId,
					referenceId = PlanFlow1.referenceId,
					durationMs = Floored,
					state = Debug.formatRequestState(AwaitRequestStateResult),
					resultKind = ResultKind
				})
			end
		end
	end
	
	local function _(p4)
		-- upvalues: submitPlanResult (copy), StudioProposePlanTool (upval)
		submitPlanResult(p4, StudioProposePlanTool.formatAcceptedContent(), "accept", nil)
	end
	
	local _ = function(p4, p5)
		-- upvalues: submitPlanResult (copy), StudioProposePlanTool (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval)
		submitPlanResult(p4, StudioProposePlanTool.formatFeedbackContent(p5), "feedback", if FFlagBuildExperienceToolResultFailureRecoveryModule then p5 else nil)
	end
	
	local function setCurrentPlanProposal(Proposal)
		-- upvalues: PlanFlow (ref), p3 (copy), OnPlanAcceptedImpl (ref)
		if Proposal == nil then
			local PlanFlow2 = PlanFlow
			
			if PlanFlow2 ~= nil then
				p3.removePlanTool(PlanFlow2.toolCallId)
				p3.removePlanAction(PlanFlow2.toolCallId)
			end
			return
		else
			local PlanFlow1 = PlanFlow
			
			if PlanFlow1 ~= nil then
				p3.setPlanTool({
					toolCallId = PlanFlow1.toolCallId,
					callOrder = PlanFlow1.proposal.callOrder or 0,
					isAccepted = PlanFlow1.proposal.isAccepted,
					feedbackText = PlanFlow1.proposal.feedbackText
				})
				p3.setPlanAction(PlanFlow1.toolCallId, OnPlanAcceptedImpl)
			end
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p2 (copy)
		return p2
	end
	
	local ToolCallId = nil
	local v1 = nil
	local v2 = false
	
	OnPlanAcceptedImpl = function()
		-- upvalues: PlanFlow (ref), setCurrentPlanProposal (copy), submitPlanResult (copy), StudioProposePlanTool (upval)
		local PlanFlow1 = PlanFlow
		
		if PlanFlow1 ~= nil and not PlanFlow1.submitted then
			PlanFlow1.submitted = true
			PlanFlow1.proposal = {
				isAccepted = true,
				feedbackText = nil,
				title = PlanFlow1.proposal.title,
				textContent = PlanFlow1.proposal.textContent,
				summary = PlanFlow1.proposal.summary,
				toolCallId = PlanFlow1.proposal.toolCallId,
				callOrder = PlanFlow1.proposal.callOrder
			}
			setCurrentPlanProposal(PlanFlow1.proposal)
			task.spawn(function()
				-- upvalues: PlanFlow1 (copy), submitPlanResult (upval), StudioProposePlanTool (upval)
				submitPlanResult(PlanFlow1, StudioProposePlanTool.formatAcceptedContent(), "accept", nil)
			end)
			
			return
		end
	end
	
	return {
		syncPlanProposal = function(p4): boolean
			-- upvalues: StudioProposePlanTool (upval), getSubmittedToolCallIds (copy), v2 (ref), Debug (upval), ToolCallId (ref), v1 (ref), setCurrentPlanProposal (copy), setPlanFlow (copy), GetToolCallOrderFunction (upval)
			local PlanInTurnState, PlanInTurnState2, PlanInTurnState3, PlanInTurnState4, PlanInTurnState5 = StudioProposePlanTool.findPlanInTurnState(p4, getSubmittedToolCallIds())
			
			if PlanInTurnState == nil or PlanInTurnState2 == nil then
				if v2 then
					Debug.log("info", "present_plan proposal cleared", { turn = Debug.formatTurnState(p4) })
					v2 = false
					ToolCallId = nil
					v1 = nil
					setCurrentPlanProposal(nil)
					setPlanFlow(nil)
				end
				return false
			else
				v2 = true
				
				if PlanInTurnState2 ~= ToolCallId or PlanInTurnState3 ~= v1 then
					ToolCallId = PlanInTurnState2
					v1 = PlanInTurnState3
					local config = {
						submitted = false,
						sessionId = p4.sessionId,
						toolCallId = PlanInTurnState2,
						turnId = PlanInTurnState4,
						referenceId = PlanInTurnState5,
						proposal = {
							isAccepted = false,
							title = PlanInTurnState.title,
							textContent = PlanInTurnState.textContent,
							summary = PlanInTurnState.summary,
							toolCallId = PlanInTurnState2,
							callOrder = GetToolCallOrderFunction(p4, PlanInTurnState2)
						}
					}
					setPlanFlow(config)
					setCurrentPlanProposal(config.proposal)
					Debug.log("info", "present_plan proposal displayed", {
						toolCallId = PlanInTurnState2,
						turnId = PlanInTurnState4,
						referenceId = PlanInTurnState5,
						turn = Debug.formatTurnState(p4)
					})
				end
				return true
			end
		end,
		stopPendingPlan = function(): boolean
			-- upvalues: PlanFlow (ref), p3 (copy)
			local PlanFlow1 = PlanFlow
			
			if PlanFlow1 == nil or PlanFlow1.submitted then
				return false
			else
				PlanFlow1.submitted = true
				PlanFlow = nil
				p3.removePlanTool(PlanFlow1.toolCallId)
				p3.removePlanAction(PlanFlow1.toolCallId)
				
				return true
			end
		end,
		trySubmitComposerText = function(FeedbackText): boolean
			-- upvalues: PlanFlow (ref), setCurrentPlanProposal (copy), submitPlanResult (copy), StudioProposePlanTool (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval)
			local PlanFlow1 = PlanFlow
			
			if PlanFlow1 == nil or PlanFlow1.submitted then
				return false
			else
				PlanFlow1.submitted = true
				PlanFlow1.proposal = {
					isAccepted = false,
					title = PlanFlow1.proposal.title,
					textContent = PlanFlow1.proposal.textContent,
					summary = PlanFlow1.proposal.summary,
					toolCallId = PlanFlow1.proposal.toolCallId,
					callOrder = PlanFlow1.proposal.callOrder,
					feedbackText = FeedbackText
				}
				setCurrentPlanProposal(PlanFlow1.proposal)
				task.spawn(function()
					-- upvalues: PlanFlow1 (copy), FeedbackText (copy), submitPlanResult (upval), StudioProposePlanTool (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval)
					submitPlanResult(PlanFlow1, StudioProposePlanTool.formatFeedbackContent(FeedbackText), "feedback", if FFlagBuildExperienceToolResultFailureRecoveryModule then FeedbackText else nil)
				end)
				
				return true
			end
		end
	}
end