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

local function getSelectedOptionId(p1)
	if p1 == nil then
		return nil
	elseif p1.options == nil then
		return if p1.option == nil then nil else p1.option.id
	end
	local t = {}
	
	for i, v in p1.options do
		table.insert(t, v.id)
	end
	return t
end

local function _(p2, p3)
	-- upvalues: getSelectedOptionId (ref)
	return {
		question = p2.questions[p2.currentIndex],
		selectedOptionId = getSelectedOptionId(p3),
		customResponseText = if p3 ~= nil then nil else p3.customResponseText,
		toolCallId = p2.toolCallId,
		callOrder = p2.callOrder,
		isLastQuestion = #p2.questions <= p2.currentIndex
	}
end

local function buildOptimisticAskUserTool(p2)
	-- upvalues: getSelectedOptionId (ref)
	local t = {}
	
	for i, v in p2.selections do
		t[i] = {
			selectedOptionId = getSelectedOptionId(v),
			customResponseText = v.customResponseText
		}
	end
	return {
		toolCallId = p2.toolCallId,
		callOrder = p2.callOrder,
		currentIndex = p2.currentIndex,
		selections = t
	}
end

local function toggleOptionInSelection(p3, p4)
	local var1 = if p3 == nil or p3.options == nil then {} else p3.options
	local t = {}
	local var2 = false
	
	for i, v in var1 do
		if v.id == p4.id then
			var2 = true
		else
			table.insert(t, v)
		end
	end
	if not var2 then
		table.insert(t, p4)
	end
	return { option = nil, customResponseText = nil, options = t }
end

local _ = function(p5, p6, p7)
	-- upvalues: studioAskUserTool (ref), debug (ref), getToolCallOrder (ref)
	local var3 = nil
	local var4 = nil
	local var5 = false
	
	return function(p8)
		-- upvalues: studioAskUserTool (copy), p7 (ref), var5 (write), debug (copy), var3 (write), var4 (write), p5 (ref), p6 (ref), getToolCallOrder (copy)
		local var6, var7, _, var8, var9 = studioAskUserTool.findQuestionsInTurnState(p8, p7())
		
		if var6 == nil or var7 == nil then
			if var5 then
				debug.log("info", "ask_user answer stack cleared", { turn = debug.formatTurnState(p8) })
				var5 = false
				var3 = nil
				var4 = nil
				p5(nil)
				p6(nil)
			end
			return false
		else
			var5 = true
			
			if p8.sessionId ~= var3 or var7 ~= var4 then
				var3 = p8.sessionId
				var4 = var7
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p8.sessionId,
					toolCallId = var7,
					callOrder = getToolCallOrder(p8, var7),
					turnId = var8,
					referenceId = var9,
					questions = var6,
					selections = {}
				}
				p6(t)
				p5({
					customResponseText = nil,
					question = t.questions[t.currentIndex],
					selectedOptionId = nil,
					toolCallId = t.toolCallId,
					callOrder = t.callOrder,
					isLastQuestion = #t.questions <= t.currentIndex
				})
				debug.log("info", "ask_user answer stack displayed", {
					toolCallId = var7,
					turnId = var8,
					referenceId = var9,
					questions = debug.formatStudioAskUserQuestions(var6),
					turn = debug.formatTurnState(p8)
				})
			end
			return true
		end
	end
end

return function(p5, p6, p7, p8)
	-- upvalues: buildOptimisticAskUserTool (ref), studioAskUserTool (ref), debug (ref), getToolCallOrder (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), toggleOptionInSelection (ref)
	local var3 = nil
	local onAnswerSelectedImpl = nil
	local onAnswerConfirmedImpl = nil
	
	local function setAnswerFlow(value)
		-- upvalues: var3 (write)
		var3 = value
	end
	
	local function setCurrentAnswerStackPrompt(value)
		-- upvalues: var3 (write), p7 (ref), buildOptimisticAskUserTool (copy), onAnswerSelectedImpl (write), onAnswerConfirmedImpl (write)
		if value == nil then
			if var3 ~= nil then
				p7.removeAskUserTool(var3.toolCallId)
				p7.removeAnswerAction(var3.toolCallId)
			end
			return
		elseif var3 ~= nil then
			p7.setAskUserTool(buildOptimisticAskUserTool(var3))
			p7.setAnswerAction(var3.toolCallId, onAnswerSelectedImpl, onAnswerConfirmedImpl)
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p6 (ref)
		return p6
	end
	
	local function _(p9, p10)
		-- upvalues: p8 (ref), p7 (ref), buildOptimisticAskUserTool (copy)
		p9.submitted = false
		
		if p8 == nil then
			return
		end
		local currentIndex = p9.selections[p9.currentIndex]
		local var4 = if currentIndex ~= nil then nil else currentIndex.customResponseText
		p9.selections[p9.currentIndex] = nil
		p7.setAskUserTool(buildOptimisticAskUserTool(p9))
		p8(var4, p10)
	end
	
	local var4 = nil
	local submitAskUserResponses = nil
	local submitAskUserCancellation = false
	
	local var5 = function(p9)
		-- upvalues: studioAskUserTool (copy), getSubmittedToolCallIds (ref), submitAskUserCancellation (write), debug (copy), var4 (write), submitAskUserResponses (write), setCurrentAnswerStackPrompt (ref), setAnswerFlow (ref), getToolCallOrder (copy)
		local var6, var7, _, var8, var9 = studioAskUserTool.findQuestionsInTurnState(p9, getSubmittedToolCallIds())
		
		if var6 == nil or var7 == nil then
			if submitAskUserCancellation then
				debug.log("info", "ask_user answer stack cleared", { turn = debug.formatTurnState(p9) })
				submitAskUserCancellation = false
				var13 = nil
				var14 = nil
				setCurrentAnswerStackPrompt(nil)
				setAnswerFlow(nil)
			end
			return false
		else
			submitAskUserCancellation = true
			
			if p9.sessionId ~= var13 or var7 ~= var14 then
				var13 = p9.sessionId
				var14 = var7
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p9.sessionId,
					toolCallId = var7,
					callOrder = getToolCallOrder(p9, var7),
					turnId = var8,
					referenceId = var9,
					questions = var6,
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
				debug.log("info", "ask_user answer stack displayed", {
					toolCallId = var7,
					turnId = var8,
					referenceId = var9,
					questions = debug.formatStudioAskUserQuestions(var6),
					turn = debug.formatTurnState(p9)
				})
			end
			return true
		end
	end
	
	var4 = false
	
	submitAskUserResponses = function(p9)
		-- upvalues: studioAskUserTool (copy), debug (copy), p5 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), p8 (ref), p7 (ref), buildOptimisticAskUserTool (copy), awaitRequestState (copy), chatConstantsModule (copy), p6 (ref), var3 (write)
		local t = {}
		
		for i, v in p9.questions do
			errorCode = p9.selections[i]
			
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
		local var6 = studioAskUserTool.formatToolResultContent(t)
		debug.log("info", "ask_user tool_result submitting", {
			sessionId = p9.sessionId,
			toolCallId = p9.toolCallId,
			turnId = p9.turnId,
			referenceId = p9.referenceId,
			questionCount = #p9.questions
		})
		local processTime = os.clock()
		local var7 = p5.submitActiveToolResult(var6, false, p9.turnId, p9.referenceId)
		
		if var7 == nil then
			debug.log("warn", "ask_user tool_result submit aborted (no active session)", { toolCallId = p9.toolCallId })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule then
				p9.submitted = false
				
				if p8 == nil then
					return
				end
				local currentIndex = p9.selections[p9.currentIndex]
				local var8 = if currentIndex ~= nil then nil else currentIndex.customResponseText
				p9.selections[p9.currentIndex] = nil
				p7.setAskUserTool(buildOptimisticAskUserTool(p9))
				p8(var8, nil)
				
				return
			else
				p9.submitted = false
				
				return
			end
		else
			local var9 = awaitRequestState(var7.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
			
			if var9.status == "succeeded" then
				debug.log("info", "ask_user tool_result submitted", {
					sessionId = p9.sessionId,
					toolCallId = p9.toolCallId,
					turnId = p9.turnId,
					referenceId = p9.referenceId,
					questionCount = #p9.questions,
					durationMs = floored
				})
				p6[p9.toolCallId] = true
				p7.markSubmitted(p9.toolCallId)
				p7.removeAnswerAction(p9.toolCallId)
				var3 = nil
				
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule then
				errorCode = var9.errorCode
				p9.submitted = false
				
				if p8 ~= nil then
					local currentIndex = p9.selections[p9.currentIndex]
					local var10 = if currentIndex ~= nil then nil else currentIndex.customResponseText
					p9.selections[p9.currentIndex] = nil
					p7.setAskUserTool(buildOptimisticAskUserTool(p9))
					p8(var10, errorCode)
				end
			else
				p9.submitted = false
			end
			debug.log("warn", "ask_user tool_result submit failed", {
				sessionId = p9.sessionId,
				toolCallId = p9.toolCallId,
				turnId = p9.turnId,
				referenceId = p9.referenceId,
				durationMs = floored,
				state = debug.formatRequestState(var9)
			})
		end
		local errorCode
	end
	
	submitAskUserCancellation = function(p10)
		-- upvalues: studioAskUserTool (copy), p6 (ref), p7 (ref), var3 (write), p5 (ref), debug (copy), awaitRequestState (copy), chatConstantsModule (copy)
		local var11 = studioAskUserTool.formatCancellationContent()
		p6[p10.toolCallId] = true
		p7.markSubmitted(p10.toolCallId)
		p7.removeAnswerAction(p10.toolCallId)
		
		if var3 ~= nil then
			p7.removeAskUserTool(var3.toolCallId)
			p7.removeAnswerAction(var3.toolCallId)
		end
		var3 = nil
		local var12 = p5.submitActiveToolResult(var11, false, p10.turnId, p10.referenceId)
		
		if var12 == nil then
			debug.log("warn", "ask_user cancel aborted (no active session)", { toolCallId = p10.toolCallId })
			
			return
		end
		awaitRequestState(var12.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
	end
	
	local _ = function(p10)
		-- upvalues: p7 (ref), buildOptimisticAskUserTool (copy)
		if #p10.questions <= p10.currentIndex then
			return false
		end
		p10.currentIndex += 1
		p7.setAskUserTool(buildOptimisticAskUserTool(p10))
		
		return true
	end
	
	local _ = function(p10)
		-- upvalues: p7 (ref), buildOptimisticAskUserTool (copy), submitAskUserResponses (ref)
		local var11
		if #p10.questions <= p10.currentIndex then
			var11 = false
		else
			p10.currentIndex += 1
			p7.setAskUserTool(buildOptimisticAskUserTool(p10))
			var11 = true
		end
		if var11 then
			return
		end
		p10.submitted = true
		task.spawn(function()
			-- upvalues: submitAskUserResponses (copy), p10 (ref)
			submitAskUserResponses(p10)
		end)
	end
	
	onAnswerSelectedImpl = function(p10, p11)
		-- upvalues: var3 (write), toggleOptionInSelection (copy), p7 (ref), buildOptimisticAskUserTool (copy), debug (copy), submitAskUserResponses (ref)
		if var3 == nil or var3.submitted then return end
		local currentIndex = var3.questions[var3.currentIndex]
		
		if currentIndex == nil or currentIndex.id ~= p10.id then return end
		if currentIndex.responseType == "multi_select" then
			var3.selections[var3.currentIndex] = toggleOptionInSelection(var3.selections[var3.currentIndex], p11)
			p7.setAskUserTool(buildOptimisticAskUserTool(var3))
			debug.log("info", "ask_user multi-select toggled", {
				toolCallId = var3.toolCallId,
				questionId = p10.id,
				questionIndex = var3.currentIndex,
				optionId = p11.id,
				optionTitle = p11.title
			})
			
			return
		end
		local var11
		debug.log("info", "ask_user answer selected", {
			toolCallId = var3.toolCallId,
			questionId = p10.id,
			questionIndex = var3.currentIndex,
			optionId = p11.id,
			optionTitle = p11.title
		})
		var3.selections[var3.currentIndex] = { options = nil, customResponseText = nil, option = p11 }
		p7.setAskUserTool(buildOptimisticAskUserTool(var3))
		
		if #var3.questions <= var3.currentIndex then
			var11 = false
		else
			var3.currentIndex += 1
			p7.setAskUserTool(buildOptimisticAskUserTool(var3))
			var11 = true
		end
		if var11 then
			return
		end
		var3.submitted = true
		task.spawn(function()
			-- upvalues: submitAskUserResponses (copy), var3 (ref)
			submitAskUserResponses(var3)
		end)
	end
	
	onAnswerConfirmedImpl = function()
		-- upvalues: var3 (write), debug (copy), p7 (ref), buildOptimisticAskUserTool (copy), submitAskUserResponses (ref)
		if var3 == nil or var3.submitted then return end
		local currentIndex = var3.questions[var3.currentIndex]
		
		if currentIndex == nil or currentIndex.responseType ~= "multi_select" then return end
		local currentIndex_1 = var3.selections[var3.currentIndex]
		local var11 = if currentIndex_1 ~= nil then nil else currentIndex_1.options
		
		if var11 == nil or #var11 == 0 then return end
		local var12
		debug.log("info", "ask_user multi-select confirmed", {
			toolCallId = var3.toolCallId,
			questionId = currentIndex.id,
			questionIndex = var3.currentIndex,
			selectedCount = #var11
		})
		
		if #var3.questions <= var3.currentIndex then
			var12 = false
		else
			var3.currentIndex += 1
			p7.setAskUserTool(buildOptimisticAskUserTool(var3))
			var12 = true
		end
		if var12 then
			return
		end
		var3.submitted = true
		task.spawn(function()
			-- upvalues: submitAskUserResponses (copy), var3 (ref)
			submitAskUserResponses(var3)
		end)
	end
	
	return {
		syncAnswerStack = function(p10)
			-- upvalues: var5 (ref), var4 (write)
			if var5(p10) then
				var4 = true
				
				return true
			end
			return false
		end,
		getSubmittedToolCallIds = getSubmittedToolCallIds,
		hasDisplayedAnswerStack = function()
			-- upvalues: var4 (write)
			return var4
		end,
		stopPendingAnswer = function()
			-- upvalues: var3 (write), submitAskUserCancellation (ref)
			if var3 == nil or var3.submitted then
				return false
			end
			var3.submitted = true
			task.spawn(function()
				-- upvalues: submitAskUserCancellation (copy), var3 (ref)
				submitAskUserCancellation(var3)
			end)
			
			return true
		end,
		trySubmitComposerText = function(p10)
			-- upvalues: var3 (write), debug (copy), p7 (ref), buildOptimisticAskUserTool (copy), submitAskUserResponses (ref)
			if var3 == nil or var3.submitted then
				return false
			end
			local currentIndex = var3.questions[var3.currentIndex]
			
			if currentIndex == nil then
				return false
			elseif currentIndex.responseType == "multi_select" then
				return false
			end
			local var11
			debug.log("info", "ask_user custom answer submitted", {
				toolCallId = var3.toolCallId,
				questionId = currentIndex.id,
				questionIndex = var3.currentIndex
			})
			var3.selections[var3.currentIndex] = { option = nil, options = nil, customResponseText = p10 }
			p7.setAskUserTool(buildOptimisticAskUserTool(var3))
			
			if #var3.questions <= var3.currentIndex then
				var11 = false
			else
				var3.currentIndex += 1
				p7.setAskUserTool(buildOptimisticAskUserTool(var3))
				var11 = true
			end
			if var11 then
				return true
			end
			var3.submitted = true
			task.spawn(function()
				-- upvalues: submitAskUserResponses (copy), var3 (ref)
				submitAskUserResponses(var3)
			end)
			
			return true
		end
	}
end