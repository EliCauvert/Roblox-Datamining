local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local _ = require(script.Parent.chatTypes)
local chatConstantsModule = require(script.Parent.chatConstants)
local _ = require(script.Parent.localToolOverlay)
local toolControllerUtilsModule = require(script.Parent.toolControllerUtils)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local debug = creatorAgentChatModule.debug
local awaitRequestState = toolControllerUtilsModule.awaitRequestState
local getToolCallOrder = toolControllerUtilsModule.getToolCallOrder

local function getSelectedOptionId(p0) --[[ line: 59 ]]
	if p0 == nil then
		return nil
	elseif p0.options == nil then
		return if p0.option == nil then nil else p0.option.id
	end
	local t = {}
	
	for i, v in p0.options do
		table.insert(t, v.id)
	end
	return t
end

local function _(p1, p2) --[[ line: 76 | named "makeAnswerStackPrompt" ]]
	-- upvalues: getSelectedOptionId (ref)
	return {
		question = p1.questions[p1.currentIndex],
		selectedOptionId = getSelectedOptionId(p2),
		customResponseText = if p2 ~= nil then nil else p2.customResponseText,
		toolCallId = p1.toolCallId,
		callOrder = p1.callOrder,
		isLastQuestion = #p1.questions <= p1.currentIndex
	}
end

local function buildOptimisticAskUserTool(p3) --[[ line: 87 ]]
	-- upvalues: getSelectedOptionId (ref)
	local t = {}
	
	for i, v in p3.selections do
		t[i] = {
			selectedOptionId = getSelectedOptionId(v),
			customResponseText = v.customResponseText
		}
	end
	return {
		toolCallId = p3.toolCallId,
		callOrder = p3.callOrder,
		currentIndex = p3.currentIndex,
		selections = t
	}
end

local function toggleOptionInSelection(p4, p5) --[[ line: 103 ]]
	local var10 = if p4 == nil or p4.options == nil then {} else p4.options
	local t = {}
	local var12 = false
	
	for i, v in var10 do
		if v.id == p5.id then
			var12 = true
		else
			table.insert(t, v)
		end
	end
	if not var12 then
		table.insert(t, p5)
	end
	return { option = nil, customResponseText = nil, options = t }
end

local _ = function(p6, p7, p8) --[[ line: 126 | named "createAnswerStackSync" ]]
	-- upvalues: studioAskUserTool (ref), debug (ref), getToolCallOrder (ref)
	local var13 = nil
	local var14 = nil
	local var15 = false
	
	return function(p9) --[[ line: 135 ]]
		-- upvalues: studioAskUserTool (copy), p8 (ref), var15 (write), debug (copy), var13 (write), var14 (write), p6 (ref), p7 (ref), getToolCallOrder (copy)
		local var16, var17, _, var18, var19 = studioAskUserTool.findQuestionsInTurnState(p9, p8())
		
		if var16 == nil or var17 == nil then
			if var15 then
				debug.log("info", "studio_ask_user answer stack cleared", { turn = debug.formatTurnState(p9) })
				var15 = false
				var13 = nil
				var14 = nil
				p6(nil)
				p7(nil)
			end
			return false
		else
			var15 = true
			
			if p9.sessionId ~= var13 or var17 ~= var14 then
				var13 = p9.sessionId
				var14 = var17
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p9.sessionId,
					toolCallId = var17,
					callOrder = getToolCallOrder(p9, var17),
					turnId = var18,
					referenceId = var19,
					questions = var16,
					selections = {}
				}
				p7(t)
				p6({
					customResponseText = nil,
					question = t.questions[t.currentIndex],
					selectedOptionId = nil,
					toolCallId = t.toolCallId,
					callOrder = t.callOrder,
					isLastQuestion = #t.questions <= t.currentIndex
				})
				debug.log("info", "studio_ask_user answer stack displayed", {
					toolCallId = var17,
					turnId = var18,
					referenceId = var19,
					questions = debug.formatStudioAskUserQuestions(var16),
					turn = debug.formatTurnState(p9)
				})
			end
			return true
		end
	end
end

return function(p10, p11, p12, p13) --[[ line: 181 | named "createAskUserController" ]]
	-- upvalues: buildOptimisticAskUserTool (ref), studioAskUserTool (ref), debug (ref), getToolCallOrder (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), toggleOptionInSelection (ref)
	local var21 = nil
	local onAnswerSelectedImpl = nil
	local onAnswerConfirmedImpl = nil
	
	local function setAnswerFlow(value) --[[ line: 191 ]]
		-- upvalues: var21 (write)
		var21 = value
	end
	
	local function setCurrentAnswerStackPrompt(value) --[[ line: 195 ]]
		-- upvalues: var21 (write), p12 (ref), buildOptimisticAskUserTool (copy), onAnswerSelectedImpl (write), onAnswerConfirmedImpl (write)
		if value == nil then
			if var21 ~= nil then
				p12.removeAskUserTool(var21.toolCallId)
				p12.removeAnswerAction(var21.toolCallId)
			end
			return
		elseif var21 ~= nil then
			p12.setAskUserTool(buildOptimisticAskUserTool(var21))
			p12.setAnswerAction(var21.toolCallId, onAnswerSelectedImpl, onAnswerConfirmedImpl)
		end
	end
	
	local function getSubmittedToolCallIds() --[[ line: 210 ]]
		-- upvalues: p11 (ref)
		return p11
	end
	
	local function _(p14, p15) --[[ line: 214 | named "recoverFailedSubmission" ]]
		-- upvalues: p13 (ref), p12 (ref), buildOptimisticAskUserTool (copy)
		p14.submitted = false
		
		if p13 == nil then
			return
		end
		local currentIndex = p14.selections[p14.currentIndex]
		local var31 = if currentIndex ~= nil then nil else currentIndex.customResponseText
		p14.selections[p14.currentIndex] = nil
		p12.setAskUserTool(buildOptimisticAskUserTool(p14))
		p13(var31, p15)
	end
	
	local var27 = nil
	local submitAskUserResponses = nil
	local submitAskUserCancellation = false
	
	local var30 = function(p16) --[[ line: 135 ]]
		-- upvalues: studioAskUserTool (copy), getSubmittedToolCallIds (ref), submitAskUserCancellation (write), debug (copy), var27 (write), submitAskUserResponses (write), setCurrentAnswerStackPrompt (ref), setAnswerFlow (ref), getToolCallOrder (copy)
		local var16, var17, _, var18, var19 = studioAskUserTool.findQuestionsInTurnState(p16, getSubmittedToolCallIds())
		
		if var16 == nil or var17 == nil then
			if submitAskUserCancellation then
				debug.log("info", "studio_ask_user answer stack cleared", { turn = debug.formatTurnState(p16) })
				submitAskUserCancellation = false
				var13 = nil
				var14 = nil
				setCurrentAnswerStackPrompt(nil)
				setAnswerFlow(nil)
			end
			return false
		else
			submitAskUserCancellation = true
			
			if p16.sessionId ~= var13 or var17 ~= var14 then
				var13 = p16.sessionId
				var14 = var17
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p16.sessionId,
					toolCallId = var17,
					callOrder = getToolCallOrder(p16, var17),
					turnId = var18,
					referenceId = var19,
					questions = var16,
					selections = {}
				}
				setAnswerFlow(t)
				setCurrentAnswerStackPrompt({
					customResponseText = nil,
					question = t.questions[t.currentIndex],
					selectedOptionId = nil,
					toolCallId = t.toolCallId,
					callOrder = t.callOrder,
					isLastQuestion = #t.questions <= t.currentIndex
				})
				debug.log("info", "studio_ask_user answer stack displayed", {
					toolCallId = var17,
					turnId = var18,
					referenceId = var19,
					questions = debug.formatStudioAskUserQuestions(var16),
					turn = debug.formatTurnState(p16)
				})
			end
			return true
		end
	end
	
	var27 = false
	
	submitAskUserResponses = function(p17) --[[ line: 231 | named "submitAskUserResponses" ]]
		-- upvalues: studioAskUserTool (copy), debug (copy), p10 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), p13 (ref), p12 (ref), buildOptimisticAskUserTool (copy), awaitRequestState (copy), chatConstantsModule (copy), p11 (ref), var21 (write)
		local t = {}
		
		for i, v in p17.questions do
			errorCode = p17.selections[i]
			
			if errorCode ~= nil then
				table.insert(t, {
					question = v,
					option = errorCode.option,
					options = errorCode.options,
					customResponseText = errorCode.customResponseText
				})
				continue
			end
			return
		end
		local var33 = studioAskUserTool.formatToolResultContent(t)
		debug.log("info", "studio_ask_user tool_result submitting", {
			sessionId = p17.sessionId,
			toolCallId = p17.toolCallId,
			turnId = p17.turnId,
			referenceId = p17.referenceId,
			questionCount = #p17.questions
		})
		local processTime = os.clock()
		local var35 = p10.submitActiveToolResult(var33, false, p17.turnId, p17.referenceId)
		
		if var35 == nil then
			debug.log("warn", "studio_ask_user tool_result submit aborted (no active session)", { toolCallId = p17.toolCallId })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule then
				p17.submitted = false
				
				if p13 == nil then
					return
				end
				local currentIndex = p17.selections[p17.currentIndex]
				local var36 = if currentIndex ~= nil then nil else currentIndex.customResponseText
				p17.selections[p17.currentIndex] = nil
				p12.setAskUserTool(buildOptimisticAskUserTool(p17))
				p13(var36, nil)
				
				return
			else
				p17.submitted = false
				
				return
			end
		else
			local var37 = awaitRequestState(var35.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
			
			if var37.status == "succeeded" then
				debug.log("info", "studio_ask_user tool_result submitted", {
					sessionId = p17.sessionId,
					toolCallId = p17.toolCallId,
					turnId = p17.turnId,
					referenceId = p17.referenceId,
					questionCount = #p17.questions,
					durationMs = floored
				})
				p11[p17.toolCallId] = true
				p12.markSubmitted(p17.toolCallId)
				p12.removeAnswerAction(p17.toolCallId)
				var21 = nil
				
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule then
				errorCode = var37.errorCode
				p17.submitted = false
				
				if p13 ~= nil then
					local currentIndex = p17.selections[p17.currentIndex]
					local var39 = if currentIndex ~= nil then nil else currentIndex.customResponseText
					p17.selections[p17.currentIndex] = nil
					p12.setAskUserTool(buildOptimisticAskUserTool(p17))
					p13(var39, errorCode)
				end
			else
				p17.submitted = false
			end
			debug.log("warn", "studio_ask_user tool_result submit failed", {
				sessionId = p17.sessionId,
				toolCallId = p17.toolCallId,
				turnId = p17.turnId,
				referenceId = p17.referenceId,
				durationMs = floored,
				state = debug.formatRequestState(var37)
			})
		end
		local errorCode
	end
	
	submitAskUserCancellation = function(p18) --[[ line: 302 | named "submitAskUserCancellation" ]]
		-- upvalues: studioAskUserTool (copy), p11 (ref), p12 (ref), var21 (write), p10 (ref), debug (copy), awaitRequestState (copy), chatConstantsModule (copy)
		local var40 = studioAskUserTool.formatCancellationContent()
		p11[p18.toolCallId] = true
		p12.markSubmitted(p18.toolCallId)
		p12.removeAnswerAction(p18.toolCallId)
		
		if var21 ~= nil then
			p12.removeAskUserTool(var21.toolCallId)
			p12.removeAnswerAction(var21.toolCallId)
		end
		var21 = nil
		local var41 = p10.submitActiveToolResult(var40, false, p18.turnId, p18.referenceId)
		
		if var41 == nil then
			debug.log("warn", "studio_ask_user cancel aborted (no active session)", { toolCallId = p18.toolCallId })
			
			return
		end
		awaitRequestState(var41.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
	end
	
	local _ = function(p19) --[[ line: 321 | named "advanceToNextQuestion" ]]
		-- upvalues: p12 (ref), buildOptimisticAskUserTool (copy)
		if #p19.questions <= p19.currentIndex then
			return false
		end
		p19.currentIndex += 1
		p12.setAskUserTool(buildOptimisticAskUserTool(p19))
		
		return true
	end
	
	local _ = function(p20) --[[ line: 331 | named "commitCurrentSelectionAndAdvance" ]]
		-- upvalues: p12 (ref), buildOptimisticAskUserTool (copy), submitAskUserResponses (ref)
		local var42
		if #p20.questions <= p20.currentIndex then
			var42 = false
		else
			p20.currentIndex += 1
			p12.setAskUserTool(buildOptimisticAskUserTool(p20))
			var42 = true
		end
		if var42 then
			return
		end
		p20.submitted = true
		task.spawn(function() --[[ line: 337 ]]
			-- upvalues: submitAskUserResponses (copy), p20 (ref)
			submitAskUserResponses(p20)
		end)
	end
	
	onAnswerSelectedImpl = function(p21, p22) --[[ line: 342 | named "onAnswerSelectedImpl" ]]
		-- upvalues: var21 (write), toggleOptionInSelection (copy), p12 (ref), buildOptimisticAskUserTool (copy), debug (copy), submitAskUserResponses (ref)
		if var21 == nil or var21.submitted then return end
		local currentIndex = var21.questions[var21.currentIndex]
		
		if currentIndex == nil or currentIndex.id ~= p21.id then return end
		if currentIndex.responseType == "multi_select" then
			var21.selections[var21.currentIndex] = toggleOptionInSelection(var21.selections[var21.currentIndex], p22)
			p12.setAskUserTool(buildOptimisticAskUserTool(var21))
			debug.log("info", "studio_ask_user multi-select toggled", {
				toolCallId = var21.toolCallId,
				questionId = p21.id,
				questionIndex = var21.currentIndex,
				optionId = p22.id,
				optionTitle = p22.title
			})
			
			return
		end
		local var43
		debug.log("info", "studio_ask_user answer selected", {
			toolCallId = var21.toolCallId,
			questionId = p21.id,
			questionIndex = var21.currentIndex,
			optionId = p22.id,
			optionTitle = p22.title
		})
		var21.selections[var21.currentIndex] = { options = nil, customResponseText = nil, option = p22 }
		p12.setAskUserTool(buildOptimisticAskUserTool(var21))
		
		if #var21.questions <= var21.currentIndex then
			var43 = false
		else
			var21.currentIndex += 1
			p12.setAskUserTool(buildOptimisticAskUserTool(var21))
			var43 = true
		end
		if var43 then
			return
		end
		var21.submitted = true
		task.spawn(function() --[[ line: 337 ]]
			-- upvalues: submitAskUserResponses (copy), var21 (ref)
			submitAskUserResponses(var21)
		end)
	end
	
	onAnswerConfirmedImpl = function() --[[ line: 385 | named "onAnswerConfirmedImpl" ]]
		-- upvalues: var21 (write), debug (copy), p12 (ref), buildOptimisticAskUserTool (copy), submitAskUserResponses (ref)
		if var21 == nil or var21.submitted then return end
		local currentIndex = var21.questions[var21.currentIndex]
		
		if currentIndex == nil or currentIndex.responseType ~= "multi_select" then return end
		local currentIndex_1 = var21.selections[var21.currentIndex]
		local var44 = if currentIndex_1 ~= nil then nil else currentIndex_1.options
		
		if var44 == nil or #var44 == 0 then return end
		local var45
		debug.log("info", "studio_ask_user multi-select confirmed", {
			toolCallId = var21.toolCallId,
			questionId = currentIndex.id,
			questionIndex = var21.currentIndex,
			selectedCount = #var44
		})
		
		if #var21.questions <= var21.currentIndex then
			var45 = false
		else
			var21.currentIndex += 1
			p12.setAskUserTool(buildOptimisticAskUserTool(var21))
			var45 = true
		end
		if var45 then
			return
		end
		var21.submitted = true
		task.spawn(function() --[[ line: 337 ]]
			-- upvalues: submitAskUserResponses (copy), var21 (ref)
			submitAskUserResponses(var21)
		end)
	end
	
	return {
		syncAnswerStack = function(p23) --[[ line: 448 ]]
			-- upvalues: var30 (ref), var27 (write)
			if var30(p23) then
				var27 = true
				
				return true
			end
			return false
		end,
		getSubmittedToolCallIds = getSubmittedToolCallIds,
		hasDisplayedAnswerStack = function() --[[ line: 471 ]]
			-- upvalues: var27 (write)
			return var27
		end,
		stopPendingAnswer = function() --[[ line: 456 ]]
			-- upvalues: var21 (write), submitAskUserCancellation (ref)
			if var21 == nil or var21.submitted then
				return false
			end
			var21.submitted = true
			task.spawn(function() --[[ line: 462 ]]
				-- upvalues: submitAskUserCancellation (copy), var21 (ref)
				submitAskUserCancellation(var21)
			end)
			
			return true
		end,
		trySubmitComposerText = function(p24) --[[ line: 412 ]]
			-- upvalues: var21 (write), debug (copy), p12 (ref), buildOptimisticAskUserTool (copy), submitAskUserResponses (ref)
			if var21 == nil or var21.submitted then
				return false
			end
			local currentIndex = var21.questions[var21.currentIndex]
			
			if currentIndex == nil then
				return false
			elseif currentIndex.responseType == "multi_select" then
				return false
			end
			local var46
			debug.log("info", "studio_ask_user custom answer submitted", {
				toolCallId = var21.toolCallId,
				questionId = currentIndex.id,
				questionIndex = var21.currentIndex
			})
			var21.selections[var21.currentIndex] = { option = nil, options = nil, customResponseText = p24 }
			p12.setAskUserTool(buildOptimisticAskUserTool(var21))
			
			if #var21.questions <= var21.currentIndex then
				var46 = false
			else
				var21.currentIndex += 1
				p12.setAskUserTool(buildOptimisticAskUserTool(var21))
				var46 = true
			end
			if var46 then
				return true
			end
			var21.submitted = true
			task.spawn(function() --[[ line: 442 ]]
				-- upvalues: submitAskUserResponses (copy), var21 (ref)
				submitAskUserResponses(var21)
			end)
			
			return true
		end
	}
end