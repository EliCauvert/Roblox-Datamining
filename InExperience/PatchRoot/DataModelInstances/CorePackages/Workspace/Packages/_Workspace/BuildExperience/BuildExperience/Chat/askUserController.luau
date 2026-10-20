local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule = require(BuildExperience.Flags.FFlagBuildExperienceShowThinkingAfterAskUserSubmit)
local FFlagBuildExperienceToolResultFailureRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local SignalsModule = if FFlagBuildExperienceAnswerFormModule then require(Parent.Signals) else nil
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local ToolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local Debug = CreatorAgentChatModule.debug
local AwaitRequestStateFunction = ToolControllerUtilsModule.awaitRequestState
local GetToolCallOrderFunction = ToolControllerUtilsModule.getToolCallOrder

local function getSelectedOptionId(GgleOptionInSelection)
	if GgleOptionInSelection == nil then
		return nil
	end
	if GgleOptionInSelection.options == nil then
		return if GgleOptionInSelection.option == nil then nil else GgleOptionInSelection.option.id
	end
	local Ids = {}
	
	for _, option in GgleOptionInSelection.options do
		table.insert(Ids, option.id)
	end
	return Ids
end

local function _(OptimisticAskUserTool, p1)
	-- upvalues: getSelectedOptionId (copy)
	return {
		question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex],
		selectedOptionId = getSelectedOptionId(p1),
		customResponseText = if p1 == nil then nil else p1.customResponseText,
		toolCallId = OptimisticAskUserTool.toolCallId,
		callOrder = OptimisticAskUserTool.callOrder,
		isLastQuestion = #OptimisticAskUserTool.questions <= OptimisticAskUserTool.currentIndex
	}
end

local function buildOptimisticAskUserTool(AnswerFlow, p1)
	-- upvalues: getSelectedOptionId (copy), FFlagBuildExperienceAnswerFormModule (copy)
	local Selections = {}
	
	for i, selection in AnswerFlow.selections do
		Selections[i] = {
			selectedOptionId = getSelectedOptionId(selection),
			customResponseText = selection.customResponseText
		}
	end
	return {
		toolCallId = AnswerFlow.toolCallId,
		callOrder = AnswerFlow.callOrder,
		currentIndex = AnswerFlow.currentIndex,
		isSubmitting = if FFlagBuildExperienceAnswerFormModule then if p1 == nil then AnswerFlow.submitted else p1 else nil,
		selections = Selections,
		drafts = AnswerFlow.drafts
	}
end

local function toggleOptionInSelection(Selection, Option)
	local List = {}
	local Flag = false
	
	for _, value in if Selection == nil or Selection.options == nil then {} else Selection.options do
		if value.id == Option.id then
			Flag = true
		else
			table.insert(List, value)
		end
	end
	if not Flag then
		table.insert(List, Option)
	end
	return { option = nil, customResponseText = nil, options = List }
end

local _ = function(p2, p3, GetSubmittedToolCallIds)
	-- upvalues: StudioAskUserTool (copy), Debug (copy), GetToolCallOrderFunction (copy), FFlagBuildExperienceAnswerFormModule (copy), SignalsModule (copy)
	local SessionId = nil
	local v1 = nil
	local v2 = false
	
	return function(p4): boolean
		-- upvalues: StudioAskUserTool (upval), GetSubmittedToolCallIds (copy), v2 (ref), Debug (upval), SessionId (ref), v1 (ref), p2 (copy), p3 (copy), GetToolCallOrderFunction (upval), FFlagBuildExperienceAnswerFormModule (upval), SignalsModule (upval)
		local QuestionsInTurnState, QuestionsInTurnState2, _, QuestionsInTurnState4, QuestionsInTurnState5 = StudioAskUserTool.findQuestionsInTurnState(p4, GetSubmittedToolCallIds())
		
		if QuestionsInTurnState == nil or QuestionsInTurnState2 == nil then
			if v2 then
				Debug.log("info", "ask_user answer stack cleared", { turn = Debug.formatTurnState(p4) })
				v2 = false
				SessionId = nil
				v1 = nil
				p2(nil)
				p3(nil)
			end
			return false
		else
			v2 = true
			
			if p4.sessionId ~= SessionId or QuestionsInTurnState2 ~= v1 then
				SessionId = p4.sessionId
				v1 = QuestionsInTurnState2
				local config = {
					currentIndex = 1,
					submitted = false,
					sessionId = p4.sessionId,
					toolCallId = QuestionsInTurnState2,
					callOrder = GetToolCallOrderFunction(p4, QuestionsInTurnState2),
					turnId = QuestionsInTurnState4,
					referenceId = QuestionsInTurnState5,
					questions = QuestionsInTurnState,
					selections = {}
				}
				
				if FFlagBuildExperienceAnswerFormModule then
					local Drafts = {}
					
					for _, question in config.questions do
						local Signal, Signal2 = SignalsModule.createSignal(nil)
						Drafts[question.id] = { getText = Signal, setText = Signal2 }
					end
					config.drafts = Drafts
				end
				p3(config)
				p2({
					customResponseText = nil,
					question = config.questions[config.currentIndex],
					selectedOptionId = nil,
					toolCallId = config.toolCallId,
					callOrder = config.callOrder,
					isLastQuestion = #config.questions <= config.currentIndex
				})
				Debug.log("info", "ask_user answer stack displayed", {
					toolCallId = QuestionsInTurnState2,
					turnId = QuestionsInTurnState4,
					referenceId = QuestionsInTurnState5,
					questions = Debug.formatStudioAskUserQuestions(QuestionsInTurnState),
					turn = Debug.formatTurnState(p4)
				})
			end
			return true
		end
	end
end

return function(p4, p5, p6, Callback)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), buildOptimisticAskUserTool (copy), FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (copy), StudioAskUserTool (copy), Debug (copy), GetToolCallOrderFunction (copy), SignalsModule (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), toggleOptionInSelection (copy)
	local AnswerFlow = nil
	local OnAnswerSelectedImpl = nil
	local OnAnswerConfirmedImpl = nil
	
	local function setAnswerFlow(Value)
		-- upvalues: FFlagBuildExperienceAnswerFormModule (upval), AnswerFlow (ref)
		if FFlagBuildExperienceAnswerFormModule and Value == nil and AnswerFlow ~= nil then
			local Drafts = AnswerFlow.drafts
			
			if Drafts ~= nil then
				for _, draft in Drafts do
					draft.setText(nil)
				end
			end
		end
		AnswerFlow = Value
	end
	
	local function setCurrentAnswerStackPrompt(p7)
		-- upvalues: AnswerFlow (ref), p6 (copy), buildOptimisticAskUserTool (upval), OnAnswerSelectedImpl (ref), OnAnswerConfirmedImpl (ref)
		local AnswerFlow1 = AnswerFlow
		
		if p7 == nil then
			if AnswerFlow1 ~= nil then
				p6.removeAskUserTool(AnswerFlow1.toolCallId)
				p6.removeAnswerAction(AnswerFlow1.toolCallId)
			end
			return
		elseif AnswerFlow1 ~= nil then
			p6.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow1)))
			p6.setAnswerAction(AnswerFlow1.toolCallId, OnAnswerSelectedImpl, OnAnswerConfirmedImpl)
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p5 (copy)
		return p5
	end
	
	local function _(p7)
		-- upvalues: FFlagBuildExperienceAnswerFormModule (upval), p6 (copy), buildOptimisticAskUserTool (upval), FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (upval)
		p7.submitted = false
		
		if FFlagBuildExperienceAnswerFormModule then
			p6.setAskUserTool((buildOptimisticAskUserTool(p7)))
		end
		if FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p6.clearSubmitted(p7.toolCallId)
		end
	end
	
	local function recoverFailedSubmission(OptimisticAskUserTool, ErrorCode)
		-- upvalues: FFlagBuildExperienceAnswerFormModule (upval), p6 (copy), buildOptimisticAskUserTool (upval), FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (upval), Callback (copy)
		OptimisticAskUserTool.submitted = false
		
		if FFlagBuildExperienceAnswerFormModule then
			p6.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
		end
		if FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p6.clearSubmitted(OptimisticAskUserTool.toolCallId)
		end
		if Callback ~= nil then
			local Selection = OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex]
			local CustomResponseText = if Selection == nil then nil else Selection.customResponseText
			OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = nil
			p6.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			Callback(CustomResponseText, ErrorCode)
			
			return
		end
	end
	
	local SessionId = nil
	local ToolCallId = nil
	local v3 = false
	
	local function v45(p7): boolean
		-- upvalues: StudioAskUserTool (upval), getSubmittedToolCallIds (copy), v3 (ref), Debug (upval), SessionId (ref), ToolCallId (ref), setCurrentAnswerStackPrompt (copy), setAnswerFlow (copy), GetToolCallOrderFunction (upval), FFlagBuildExperienceAnswerFormModule (upval), SignalsModule (upval)
		local QuestionsInTurnState, QuestionsInTurnState2, _, QuestionsInTurnState4, QuestionsInTurnState5 = StudioAskUserTool.findQuestionsInTurnState(p7, getSubmittedToolCallIds())
		
		if QuestionsInTurnState == nil or QuestionsInTurnState2 == nil then
			if v3 then
				Debug.log("info", "ask_user answer stack cleared", { turn = Debug.formatTurnState(p7) })
				v3 = false
				SessionId = nil
				ToolCallId = nil
				setCurrentAnswerStackPrompt(nil)
				setAnswerFlow(nil)
			end
			return false
		else
			v3 = true
			
			if p7.sessionId ~= SessionId or QuestionsInTurnState2 ~= ToolCallId then
				SessionId = p7.sessionId
				ToolCallId = QuestionsInTurnState2
				local config = {
					currentIndex = 1,
					submitted = false,
					sessionId = p7.sessionId,
					toolCallId = QuestionsInTurnState2,
					callOrder = GetToolCallOrderFunction(p7, QuestionsInTurnState2),
					turnId = QuestionsInTurnState4,
					referenceId = QuestionsInTurnState5,
					questions = QuestionsInTurnState,
					selections = {}
				}
				
				if FFlagBuildExperienceAnswerFormModule then
					local Drafts = {}
					
					for _, question in config.questions do
						local Signal, Signal2 = SignalsModule.createSignal(nil)
						Drafts[question.id] = { getText = Signal, setText = Signal2 }
					end
					config.drafts = Drafts
				end
				setAnswerFlow(config)
				setCurrentAnswerStackPrompt({
					customResponseText = nil,
					question = config.questions[config.currentIndex],
					selectedOptionId = nil,
					toolCallId = config.toolCallId,
					callOrder = config.callOrder,
					isLastQuestion = #config.questions <= config.currentIndex
				})
				Debug.log("info", "ask_user answer stack displayed", {
					toolCallId = QuestionsInTurnState2,
					turnId = QuestionsInTurnState4,
					referenceId = QuestionsInTurnState5,
					questions = Debug.formatStudioAskUserQuestions(QuestionsInTurnState),
					turn = Debug.formatTurnState(p7)
				})
			end
			return true
		end
	end
	
	local Flag = false
	
	local function submitAskUserResponses(p8)
		-- upvalues: StudioAskUserTool (upval), Debug (upval), p4 (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), recoverFailedSubmission (copy), p6 (copy), buildOptimisticAskUserTool (upval), FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (upval), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p5 (copy), AnswerFlow (ref)
		local List = {}
		
		for i, question in p8.questions do
			local Selection = p8.selections[i]
			
			if Selection == nil then return end
			table.insert(List, {
				question = question,
				option = Selection.option,
				options = Selection.options,
				customResponseText = Selection.customResponseText
			})
		end
		local FormatToolResultContentResult = StudioAskUserTool.formatToolResultContent(List)
		Debug.log("info", "ask_user tool_result submitting", {
			sessionId = p8.sessionId,
			toolCallId = p8.toolCallId,
			turnId = p8.turnId,
			referenceId = p8.referenceId,
			questionCount = #p8.questions
		})
		local ClockTime = os.clock()
		local SubmitActiveToolResultResult = p4.submitActiveToolResult(FormatToolResultContentResult, false, p8.turnId, p8.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "ask_user tool_result submit aborted (no active session)", { toolCallId = p8.toolCallId })
			
			if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then
				recoverFailedSubmission(p8, nil)
				
				return
			end
			p8.submitted = false
			
			if FFlagBuildExperienceAnswerFormModule then
				p6.setAskUserTool((buildOptimisticAskUserTool(p8)))
			end
			if FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
				p6.clearSubmitted(p8.toolCallId)
			end
			return
		else
			local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local Floored = math.floor((os.clock() - ClockTime) * 1000 + 0.5)
			
			if AwaitRequestStateResult.status == "succeeded" then
				Debug.log("info", "ask_user tool_result submitted", {
					sessionId = p8.sessionId,
					toolCallId = p8.toolCallId,
					turnId = p8.turnId,
					referenceId = p8.referenceId,
					questionCount = #p8.questions,
					durationMs = Floored
				})
				p5[p8.toolCallId] = true
				p6.markSubmitted(p8.toolCallId)
				p6.removeAnswerAction(p8.toolCallId)
				
				if FFlagBuildExperienceAnswerFormModule then
					p6.setAskUserTool((buildOptimisticAskUserTool(p8, false)))
				end
				if FFlagBuildExperienceAnswerFormModule and AnswerFlow ~= nil then
					local Drafts = AnswerFlow.drafts
					
					if Drafts ~= nil then
						for _, draft in Drafts do
							draft.setText(nil)
						end
					end
				end
				AnswerFlow = nil
				
				return
			else
				if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then
					recoverFailedSubmission(p8, AwaitRequestStateResult.errorCode)
				else
					p8.submitted = false
					
					if FFlagBuildExperienceAnswerFormModule then
						p6.setAskUserTool((buildOptimisticAskUserTool(p8)))
					end
					if FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
						p6.clearSubmitted(p8.toolCallId)
					end
				end
				Debug.log("warn", "ask_user tool_result submit failed", {
					sessionId = p8.sessionId,
					toolCallId = p8.toolCallId,
					turnId = p8.turnId,
					referenceId = p8.referenceId,
					durationMs = Floored,
					state = Debug.formatRequestState(AwaitRequestStateResult)
				})
			end
		end
	end
	
	local function submitAskUserCancellation(AnswerFlow1)
		-- upvalues: StudioAskUserTool (upval), p5 (copy), p6 (copy), AnswerFlow (ref), FFlagBuildExperienceAnswerFormModule (upval), p4 (copy), Debug (upval), AwaitRequestStateFunction (upval), ChatConstantsModule (upval)
		local FormatCancellationContentResult = StudioAskUserTool.formatCancellationContent()
		p5[AnswerFlow1.toolCallId] = true
		p6.markSubmitted(AnswerFlow1.toolCallId)
		p6.removeAnswerAction(AnswerFlow1.toolCallId)
		local AnswerFlow2 = AnswerFlow
		
		if AnswerFlow2 ~= nil then
			p6.removeAskUserTool(AnswerFlow2.toolCallId)
			p6.removeAnswerAction(AnswerFlow2.toolCallId)
		end
		if FFlagBuildExperienceAnswerFormModule and AnswerFlow ~= nil then
			local Drafts = AnswerFlow.drafts
			
			if Drafts ~= nil then
				for _, draft in Drafts do
					draft.setText(nil)
				end
			end
		end
		AnswerFlow = nil
		local SubmitActiveToolResultResult = p4.submitActiveToolResult(FormatCancellationContentResult, false, AnswerFlow1.turnId, AnswerFlow1.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "ask_user cancel aborted (no active session)", { toolCallId = AnswerFlow1.toolCallId })
			
			return
		else
			AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		end
	end
	
	local _ = function(p9): boolean
		-- upvalues: p6 (copy), buildOptimisticAskUserTool (upval)
		if #p9.questions <= p9.currentIndex then
			return false
		else
			p9.currentIndex += 1
			p6.setAskUserTool((buildOptimisticAskUserTool(p9)))
			
			return true
		end
	end
	
	local function commitCurrentSelectionAndAdvance(AnswerFlow)
		-- upvalues: p6 (copy), buildOptimisticAskUserTool (upval), FFlagBuildExperienceAnswerFormModule (upval), FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (upval), submitAskUserResponses (copy)
		local Flag = nil
		if #AnswerFlow.questions <= AnswerFlow.currentIndex then
			Flag = false
		else
			AnswerFlow.currentIndex += 1
			p6.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow)))
			Flag = true
		end
		if Flag then return end
		AnswerFlow.submitted = true
		
		if FFlagBuildExperienceAnswerFormModule then
			p6.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow)))
		end
		if FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p6.markSubmitted(AnswerFlow.toolCallId)
		end
		task.spawn(function()
			-- upvalues: submitAskUserResponses (upval), AnswerFlow (copy)
			submitAskUserResponses(AnswerFlow)
		end)
	end
	
	OnAnswerSelectedImpl = function(p9, Option, p10)
		-- upvalues: AnswerFlow (ref), FFlagBuildExperienceAnswerFormModule (upval), toggleOptionInSelection (upval), p6 (copy), buildOptimisticAskUserTool (upval), Debug (upval), commitCurrentSelectionAndAdvance (copy)
		local OptimisticAskUserTool = AnswerFlow
		
		if OptimisticAskUserTool == nil or OptimisticAskUserTool.submitted then return end
		local Question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex]
		
		if Question == nil or Question.id ~= p9.id then return end
		if Question.responseType ~= "multi_select" then
			Debug.log("info", "ask_user answer selected", {
				toolCallId = OptimisticAskUserTool.toolCallId,
				questionId = p9.id,
				questionIndex = OptimisticAskUserTool.currentIndex,
				optionId = Option.id,
				optionTitle = Option.title
			})
			OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = { options = nil, customResponseText = nil, option = Option }
			p6.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			commitCurrentSelectionAndAdvance(OptimisticAskUserTool)
			
			return
		end
		if FFlagBuildExperienceAnswerFormModule and p10 then
			OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = nil
		end
		OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = toggleOptionInSelection(OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex], Option)
		p6.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
		Debug.log("info", "ask_user multi-select toggled", {
			toolCallId = OptimisticAskUserTool.toolCallId,
			questionId = p9.id,
			questionIndex = OptimisticAskUserTool.currentIndex,
			optionId = Option.id,
			optionTitle = Option.title
		})
	end
	
	OnAnswerConfirmedImpl = function()
		-- upvalues: AnswerFlow (ref), Debug (upval), commitCurrentSelectionAndAdvance (copy)
		local OptimisticAskUserTool = AnswerFlow
		
		if OptimisticAskUserTool == nil or OptimisticAskUserTool.submitted then return end
		local Question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex]
		
		if Question == nil or Question.responseType ~= "multi_select" then return end
		local Selection = OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex]
		local Options = if Selection == nil then nil else Selection.options
		
		if Options ~= nil and #Options ~= 0 then
			Debug.log("info", "ask_user multi-select confirmed", {
				toolCallId = OptimisticAskUserTool.toolCallId,
				questionId = Question.id,
				questionIndex = OptimisticAskUserTool.currentIndex,
				selectedCount = #Options
			})
			commitCurrentSelectionAndAdvance(OptimisticAskUserTool)
			
			return
		end
	end
	
	local function submitCustomAnswer(AnswerFlow, Question, Text: string): boolean
		-- upvalues: FFlagBuildExperienceAnswerFormModule (upval), Debug (upval), p6 (copy), buildOptimisticAskUserTool (upval), FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (upval), submitAskUserResponses (copy)
		if not FFlagBuildExperienceAnswerFormModule and Question.responseType == "multi_select" then
			return false
		end
		if FFlagBuildExperienceAnswerFormModule then
			Text = string.match(Text, "^%s*(.-)%s*$") or ""
			
			if Text == "" then
				return false
			end
		end
		Debug.log("info", "ask_user custom answer submitted", {
			toolCallId = AnswerFlow.toolCallId,
			questionId = Question.id,
			questionIndex = AnswerFlow.currentIndex
		})
		AnswerFlow.selections[AnswerFlow.currentIndex] = { option = nil, options = nil, customResponseText = Text }
		p6.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow)))
		local Flag = nil
		
		if #AnswerFlow.questions <= AnswerFlow.currentIndex then
			Flag = false
		else
			AnswerFlow.currentIndex += 1
			p6.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow)))
			Flag = true
		end
		if Flag then
			return true
		end
		AnswerFlow.submitted = true
		
		if FFlagBuildExperienceAnswerFormModule then
			p6.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow)))
		end
		if FFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p6.markSubmitted(AnswerFlow.toolCallId)
		end
		task.spawn(function()
			-- upvalues: submitAskUserResponses (upval), AnswerFlow (copy)
			submitAskUserResponses(AnswerFlow)
		end)
		
		return true
	end
	
	return {
		syncAnswerStack = function(p9): boolean
			-- upvalues: v45 (copy), Flag (ref)
			if v45(p9) then
				Flag = true
				
				return true
			else
				return false
			end
		end,
		getSubmittedToolCallIds = getSubmittedToolCallIds,
		hasDisplayedAnswerStack = function()
			-- upvalues: Flag (ref)
			return Flag
		end,
		stopPendingAnswer = function(): boolean
			-- upvalues: AnswerFlow (ref), submitAskUserCancellation (copy)
			local AnswerFlow1 = AnswerFlow
			
			if AnswerFlow1 == nil or AnswerFlow1.submitted then
				return false
			else
				AnswerFlow1.submitted = true
				task.spawn(function()
					-- upvalues: submitAskUserCancellation (upval), AnswerFlow1 (copy)
					submitAskUserCancellation(AnswerFlow1)
				end)
				
				return true
			end
		end,
		trySubmitComposerText = function(CustomResponseText)
			-- upvalues: AnswerFlow (ref), submitCustomAnswer (copy)
			local AnswerFlow1 = AnswerFlow
			
			if AnswerFlow1 == nil or AnswerFlow1.submitted then
				return false
			else
				local Question = AnswerFlow1.questions[AnswerFlow1.currentIndex]
				
				return Question ~= nil and submitCustomAnswer(AnswerFlow1, Question, CustomResponseText)
			end
		end,
		trySubmitAnswerText = function(ToolCallId, Id, CustomResponseText)
			-- upvalues: AnswerFlow (ref), submitCustomAnswer (copy)
			local OptimisticAskUserTool = AnswerFlow
			
			if OptimisticAskUserTool == nil or OptimisticAskUserTool.submitted or OptimisticAskUserTool.toolCallId ~= ToolCallId then
				return false
			else
				local Question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex]
				
				return Question ~= nil and Question.id == Id and submitCustomAnswer(OptimisticAskUserTool, Question, CustomResponseText)
			end
		end
	}
end