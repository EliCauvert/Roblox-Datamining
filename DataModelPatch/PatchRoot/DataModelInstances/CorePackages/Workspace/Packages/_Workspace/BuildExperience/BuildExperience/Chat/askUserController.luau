local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local ChatConstantsModule = require(script.Parent.chatConstants)
local ComposerLockSignalModule = require(script.Parent.composerLockSignal)
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

local function buildOptimisticAskUserTool(AnswerFlow)
	-- upvalues: getSelectedOptionId (copy)
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
		selections = Selections
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

local _ = function(p1, p2, GetSubmittedToolCallIds)
	-- upvalues: StudioAskUserTool (copy), Debug (copy), ComposerLockSignalModule (copy), GetToolCallOrderFunction (copy)
	local v1 = nil
	local v2 = nil
	local v3 = false
	
	return function(p3): boolean
		-- upvalues: StudioAskUserTool (upval), GetSubmittedToolCallIds (copy), v3 (ref), Debug (upval), v1 (ref), v2 (ref), p2 (copy), ComposerLockSignalModule (upval), GetToolCallOrderFunction (upval), p1 (copy)
		local QuestionsInTurnState, QuestionsInTurnState2, QuestionsInTurnState3, QuestionsInTurnState4, QuestionsInTurnState5 = StudioAskUserTool.findQuestionsInTurnState(p3, GetSubmittedToolCallIds())
		
		if QuestionsInTurnState == nil or QuestionsInTurnState2 == nil then
			if v3 then
				Debug.log("info", "studio_ask_user answer stack cleared", { turn = Debug.formatTurnState(p3) })
				v3 = false
				v1 = nil
				v2 = nil
				p2(nil)
				ComposerLockSignalModule.setComposerMode("normal")
			end
			return false
		else
			v3 = true
			
			if QuestionsInTurnState2 ~= v1 or QuestionsInTurnState3 ~= v2 then
				v1 = QuestionsInTurnState2
				v2 = QuestionsInTurnState3
				local config = {
					currentIndex = 1,
					submitted = false,
					sessionId = p3.sessionId,
					toolCallId = QuestionsInTurnState2,
					callOrder = GetToolCallOrderFunction(p3, QuestionsInTurnState2),
					turnId = QuestionsInTurnState4,
					referenceId = QuestionsInTurnState5,
					questions = QuestionsInTurnState,
					selections = {}
				}
				p2(config)
				p1({
					customResponseText = nil,
					question = config.questions[config.currentIndex],
					selectedOptionId = nil,
					toolCallId = config.toolCallId,
					callOrder = config.callOrder,
					isLastQuestion = #config.questions <= config.currentIndex
				})
				ComposerLockSignalModule.setComposerMode("tool_response")
				Debug.log("info", "studio_ask_user answer stack displayed", {
					toolCallId = QuestionsInTurnState2,
					turnId = QuestionsInTurnState4,
					referenceId = QuestionsInTurnState5,
					questions = Debug.formatStudioAskUserQuestions(QuestionsInTurnState),
					turn = Debug.formatTurnState(p3)
				})
			end
			return true
		end
	end
end

return function(p1, p2, p3)
	-- upvalues: buildOptimisticAskUserTool (copy), StudioAskUserTool (copy), Debug (copy), ComposerLockSignalModule (copy), GetToolCallOrderFunction (copy), AwaitRequestStateFunction (copy), ChatConstantsModule (copy), toggleOptionInSelection (copy)
	local AnswerFlow = nil
	local OnAnswerSelectedImpl = nil
	local OnAnswerConfirmedImpl = nil
	
	local function setAnswerFlow(Value)
		-- upvalues: AnswerFlow (ref)
		AnswerFlow = Value
	end
	
	local function setCurrentAnswerStackPrompt(p4)
		-- upvalues: AnswerFlow (ref), p3 (copy), buildOptimisticAskUserTool (upval), OnAnswerSelectedImpl (ref), OnAnswerConfirmedImpl (ref)
		local AnswerFlow1 = AnswerFlow
		
		if p4 == nil then
			if AnswerFlow1 ~= nil then
				p3.removeAskUserTool(AnswerFlow1.toolCallId)
				p3.removeAnswerAction(AnswerFlow1.toolCallId)
			end
			return
		elseif AnswerFlow1 ~= nil then
			p3.setAskUserTool((buildOptimisticAskUserTool(AnswerFlow1)))
			p3.setAnswerAction(AnswerFlow1.toolCallId, OnAnswerSelectedImpl, OnAnswerConfirmedImpl)
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p2 (copy)
		return p2
	end
	
	local ToolCallId = nil
	local v1 = nil
	local v2 = false
	
	local function v35(p4): boolean
		-- upvalues: StudioAskUserTool (upval), getSubmittedToolCallIds (copy), v2 (ref), Debug (upval), ToolCallId (ref), v1 (ref), setAnswerFlow (copy), ComposerLockSignalModule (upval), GetToolCallOrderFunction (upval), setCurrentAnswerStackPrompt (copy)
		local QuestionsInTurnState, QuestionsInTurnState2, QuestionsInTurnState3, QuestionsInTurnState4, QuestionsInTurnState5 = StudioAskUserTool.findQuestionsInTurnState(p4, getSubmittedToolCallIds())
		
		if QuestionsInTurnState == nil or QuestionsInTurnState2 == nil then
			if v2 then
				Debug.log("info", "studio_ask_user answer stack cleared", { turn = Debug.formatTurnState(p4) })
				v2 = false
				ToolCallId = nil
				v1 = nil
				setAnswerFlow(nil)
				ComposerLockSignalModule.setComposerMode("normal")
			end
			return false
		else
			v2 = true
			
			if QuestionsInTurnState2 ~= ToolCallId or QuestionsInTurnState3 ~= v1 then
				ToolCallId = QuestionsInTurnState2
				v1 = QuestionsInTurnState3
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
				setAnswerFlow(config)
				setCurrentAnswerStackPrompt({
					customResponseText = nil,
					question = config.questions[config.currentIndex],
					selectedOptionId = nil,
					toolCallId = config.toolCallId,
					callOrder = config.callOrder,
					isLastQuestion = #config.questions <= config.currentIndex
				})
				ComposerLockSignalModule.setComposerMode("tool_response")
				Debug.log("info", "studio_ask_user answer stack displayed", {
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
	
	local Flag = false
	
	local function submitAskUserResponses(AnswerFlow1)
		-- upvalues: StudioAskUserTool (upval), Debug (upval), p1 (copy), AwaitRequestStateFunction (upval), ChatConstantsModule (upval), p2 (copy), p3 (copy), AnswerFlow (ref), ComposerLockSignalModule (upval)
		local List = {}
		
		for i, question in AnswerFlow1.questions do
			local Selection = AnswerFlow1.selections[i]
			
			if Selection == nil then return end
			table.insert(List, {
				question = question,
				option = Selection.option,
				options = Selection.options,
				customResponseText = Selection.customResponseText
			})
		end
		local FormatToolResultContentResult = StudioAskUserTool.formatToolResultContent(List)
		Debug.log("info", "studio_ask_user tool_result submitting", {
			sessionId = AnswerFlow1.sessionId,
			toolCallId = AnswerFlow1.toolCallId,
			turnId = AnswerFlow1.turnId,
			referenceId = AnswerFlow1.referenceId,
			questionCount = #AnswerFlow1.questions
		})
		local ClockTime = os.clock()
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatToolResultContentResult, false, AnswerFlow1.turnId, AnswerFlow1.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "studio_ask_user tool_result submit aborted (no active session)", { toolCallId = AnswerFlow1.toolCallId })
			AnswerFlow1.submitted = false
			
			return
		end
		local AwaitRequestStateResult = AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local Floored = math.floor((os.clock() - ClockTime) * 1000 + 0.5)
		
		if AwaitRequestStateResult.status == "succeeded" then
			Debug.log("info", "studio_ask_user tool_result submitted", {
				sessionId = AnswerFlow1.sessionId,
				toolCallId = AnswerFlow1.toolCallId,
				turnId = AnswerFlow1.turnId,
				referenceId = AnswerFlow1.referenceId,
				questionCount = #AnswerFlow1.questions,
				durationMs = Floored
			})
			p2[AnswerFlow1.toolCallId] = true
			p3.markSubmitted(AnswerFlow1.toolCallId)
			p3.removeAnswerAction(AnswerFlow1.toolCallId)
			AnswerFlow = nil
			ComposerLockSignalModule.setComposerMode("normal")
			
			return
		else
			AnswerFlow1.submitted = false
			Debug.log("warn", "studio_ask_user tool_result submit failed", {
				sessionId = AnswerFlow1.sessionId,
				toolCallId = AnswerFlow1.toolCallId,
				turnId = AnswerFlow1.turnId,
				referenceId = AnswerFlow1.referenceId,
				durationMs = Floored,
				state = Debug.formatRequestState(AwaitRequestStateResult)
			})
		end
	end
	
	local function submitAskUserCancellation(AnswerFlow1)
		-- upvalues: StudioAskUserTool (upval), p2 (copy), p3 (copy), AnswerFlow (ref), ComposerLockSignalModule (upval), p1 (copy), Debug (upval), AwaitRequestStateFunction (upval), ChatConstantsModule (upval)
		local FormatCancellationContentResult = StudioAskUserTool.formatCancellationContent()
		p2[AnswerFlow1.toolCallId] = true
		p3.markSubmitted(AnswerFlow1.toolCallId)
		p3.removeAnswerAction(AnswerFlow1.toolCallId)
		local AnswerFlow2 = AnswerFlow
		
		if AnswerFlow2 ~= nil then
			p3.removeAskUserTool(AnswerFlow2.toolCallId)
			p3.removeAnswerAction(AnswerFlow2.toolCallId)
		end
		AnswerFlow = nil
		ComposerLockSignalModule.setComposerMode("normal")
		local SubmitActiveToolResultResult = p1.submitActiveToolResult(FormatCancellationContentResult, false, AnswerFlow1.turnId, AnswerFlow1.referenceId)
		
		if SubmitActiveToolResultResult == nil then
			Debug.log("warn", "studio_ask_user cancel aborted (no active session)", { toolCallId = AnswerFlow1.toolCallId })
			
			return
		else
			AwaitRequestStateFunction(SubmitActiveToolResultResult.state, os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		end
	end
	
	local function _(p4): boolean
		-- upvalues: p3 (copy), buildOptimisticAskUserTool (upval)
		if #p4.questions <= p4.currentIndex then
			return false
		else
			p4.currentIndex += 1
			p3.setAskUserTool((buildOptimisticAskUserTool(p4)))
			
			return true
		end
	end
	
	local _ = function(OptimisticAskUserTool)
		-- upvalues: p3 (copy), buildOptimisticAskUserTool (upval), submitAskUserResponses (copy)
		local Flag = nil
		if #OptimisticAskUserTool.questions <= OptimisticAskUserTool.currentIndex then
			Flag = false
		else
			OptimisticAskUserTool.currentIndex += 1
			p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			Flag = true
		end
		if not Flag then
			OptimisticAskUserTool.submitted = true
			task.spawn(function()
				-- upvalues: submitAskUserResponses (upval), OptimisticAskUserTool (copy)
				submitAskUserResponses(OptimisticAskUserTool)
			end)
			
			return
		end
	end
	
	OnAnswerSelectedImpl = function(p4, Option)
		-- upvalues: AnswerFlow (ref), toggleOptionInSelection (upval), p3 (copy), buildOptimisticAskUserTool (upval), Debug (upval), submitAskUserResponses (copy)
		local OptimisticAskUserTool = AnswerFlow
		
		if OptimisticAskUserTool == nil or OptimisticAskUserTool.submitted then return end
		local Question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex]
		
		if Question == nil or Question.id ~= p4.id then return end
		if Question.responseType == "multi_select" then
			OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = toggleOptionInSelection(OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex], Option)
			p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			Debug.log("info", "studio_ask_user multi-select toggled", {
				toolCallId = OptimisticAskUserTool.toolCallId,
				questionId = p4.id,
				questionIndex = OptimisticAskUserTool.currentIndex,
				optionId = Option.id,
				optionTitle = Option.title
			})
			
			return
		end
		Debug.log("info", "studio_ask_user answer selected", {
			toolCallId = OptimisticAskUserTool.toolCallId,
			questionId = p4.id,
			questionIndex = OptimisticAskUserTool.currentIndex,
			optionId = Option.id,
			optionTitle = Option.title
		})
		OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = { options = nil, customResponseText = nil, option = Option }
		p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
		local Flag = nil
		
		if #OptimisticAskUserTool.questions <= OptimisticAskUserTool.currentIndex then
			Flag = false
		else
			OptimisticAskUserTool.currentIndex += 1
			p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			Flag = true
		end
		if not Flag then
			OptimisticAskUserTool.submitted = true
			task.spawn(function()
				-- upvalues: submitAskUserResponses (upval), OptimisticAskUserTool (copy)
				submitAskUserResponses(OptimisticAskUserTool)
			end)
			
			return
		end
	end
	
	OnAnswerConfirmedImpl = function()
		-- upvalues: AnswerFlow (ref), Debug (upval), p3 (copy), buildOptimisticAskUserTool (upval), submitAskUserResponses (copy)
		local OptimisticAskUserTool = AnswerFlow
		
		if OptimisticAskUserTool == nil or OptimisticAskUserTool.submitted then return end
		local Question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex]
		
		if Question == nil or Question.responseType ~= "multi_select" then return end
		local Selection = OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex]
		local Options = if Selection == nil then nil else Selection.options
		
		if Options == nil or #Options == 0 then return end
		Debug.log("info", "studio_ask_user multi-select confirmed", {
			toolCallId = OptimisticAskUserTool.toolCallId,
			questionId = Question.id,
			questionIndex = OptimisticAskUserTool.currentIndex,
			selectedCount = #Options
		})
		local Flag = nil
		
		if #OptimisticAskUserTool.questions <= OptimisticAskUserTool.currentIndex then
			Flag = false
		else
			OptimisticAskUserTool.currentIndex += 1
			p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			Flag = true
		end
		if not Flag then
			OptimisticAskUserTool.submitted = true
			task.spawn(function()
				-- upvalues: submitAskUserResponses (upval), OptimisticAskUserTool (copy)
				submitAskUserResponses(OptimisticAskUserTool)
			end)
			
			return
		end
	end
	
	return {
		syncAnswerStack = function(p4): boolean
			-- upvalues: v35 (copy), Flag (ref)
			if v35(p4) then
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
		trySubmitComposerText = function(CustomResponseText): boolean
			-- upvalues: AnswerFlow (ref), Debug (upval), p3 (copy), buildOptimisticAskUserTool (upval), submitAskUserResponses (copy)
			local OptimisticAskUserTool = AnswerFlow
			
			if OptimisticAskUserTool == nil or OptimisticAskUserTool.submitted then
				return false
			end
			local Question = OptimisticAskUserTool.questions[OptimisticAskUserTool.currentIndex]
			
			if Question == nil then
				return false
			end
			if Question.responseType == "multi_select" then
				return false
			end
			Debug.log("info", "studio_ask_user custom answer submitted", {
				toolCallId = OptimisticAskUserTool.toolCallId,
				questionId = Question.id,
				questionIndex = OptimisticAskUserTool.currentIndex
			})
			OptimisticAskUserTool.selections[OptimisticAskUserTool.currentIndex] = {
				option = nil,
				options = nil,
				customResponseText = CustomResponseText
			}
			p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
			local Flag = nil
			
			if #OptimisticAskUserTool.questions <= OptimisticAskUserTool.currentIndex then
				Flag = false
			else
				OptimisticAskUserTool.currentIndex += 1
				p3.setAskUserTool((buildOptimisticAskUserTool(OptimisticAskUserTool)))
				Flag = true
			end
			if Flag then
				return true
			else
				OptimisticAskUserTool.submitted = true
				task.spawn(function()
					-- upvalues: submitAskUserResponses (upval), OptimisticAskUserTool (copy)
					submitAskUserResponses(OptimisticAskUserTool)
				end)
				
				return true
			end
		end
	}
end