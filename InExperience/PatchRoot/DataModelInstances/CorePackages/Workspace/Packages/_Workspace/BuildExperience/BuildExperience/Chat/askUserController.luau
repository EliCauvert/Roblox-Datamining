local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingAfterAskUserSubmit)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperienceAnswerFormModule = require(buildExperience.Flags.FFlagBuildExperienceAnswerForm)
local var1 = if fFlagBuildExperienceAnswerFormModule then require(parent.Signals) else nil
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

local function buildOptimisticAskUserTool(p2, p3)
	-- upvalues: getSelectedOptionId (ref), fFlagBuildExperienceAnswerFormModule (ref)
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
		isSubmitting = if fFlagBuildExperienceAnswerFormModule then if p3 ~= nil then p2.submitted else p3 else nil,
		selections = t,
		drafts = p2.drafts
	}
end

local function toggleOptionInSelection(p4, p5)
	local var2 = if p4 == nil or p4.options == nil then {} else p4.options
	local t = {}
	local var3 = false
	
	for i, v in var2 do
		if v.id == p5.id then
			var3 = true
		else
			table.insert(t, v)
		end
	end
	if not var3 then
		table.insert(t, p5)
	end
	return { option = nil, customResponseText = nil, options = t }
end

local _ = function(p6, p7, p8)
	-- upvalues: studioAskUserTool (ref), debug (ref), getToolCallOrder (ref), fFlagBuildExperienceAnswerFormModule (ref), var1 (ref)
	local var4 = nil
	local var5 = nil
	local var6 = false
	
	return function(p9)
		-- upvalues: studioAskUserTool (copy), p8 (ref), var6 (write), debug (copy), var4 (write), var5 (write), p6 (ref), p7 (ref), getToolCallOrder (copy), fFlagBuildExperienceAnswerFormModule (copy), var1 (copy)
		local var7, var8, _, var9, var10 = studioAskUserTool.findQuestionsInTurnState(p9, p8())
		
		if var7 == nil or var8 == nil then
			if var6 then
				debug.log("info", "ask_user answer stack cleared", { turn = debug.formatTurnState(p9) })
				var6 = false
				var4 = nil
				var5 = nil
				p6(nil)
				p7(nil)
			end
			return false
		else
			var6 = true
			
			if p9.sessionId ~= var4 or var8 ~= var5 then
				var4 = p9.sessionId
				var5 = var8
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p9.sessionId,
					toolCallId = var8,
					callOrder = getToolCallOrder(p9, var8),
					turnId = var9,
					referenceId = var10,
					questions = var7,
					selections = {}
				}
				
				if fFlagBuildExperienceAnswerFormModule then
					local t_1 = {}
					
					for i, v in t.questions do
						local var11, var12 = var1.createSignal(nil)
						t_1[v.id] = { getText = var11, setText = var12 }
					end
					t.drafts = t_1
				end
				p7(t)
				p6({
					customResponseText = nil,
					question = t.questions[t.currentIndex],
					selectedOptionId = nil,
					toolCallId = t.toolCallId,
					callOrder = t.callOrder,
					isLastQuestion = #t.questions <= t.currentIndex
				})
				debug.log("info", "ask_user answer stack displayed", {
					toolCallId = var8,
					turnId = var9,
					referenceId = var10,
					questions = debug.formatStudioAskUserQuestions(var7),
					turn = debug.formatTurnState(p9)
				})
			end
			return true
		end
	end
end

return function(p9, p10, p11, p12)
	-- upvalues: fFlagBuildExperienceAnswerFormModule (ref), buildOptimisticAskUserTool (ref), fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (ref), studioAskUserTool (ref), debug (ref), getToolCallOrder (ref), var1 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), awaitRequestState (ref), chatConstantsModule (ref), toggleOptionInSelection (ref)
	local var7 = nil
	local onAnswerSelectedImpl = nil
	local onAnswerConfirmedImpl = nil
	
	local function setAnswerFlow(value)
		-- upvalues: fFlagBuildExperienceAnswerFormModule (copy), var7 (write)
		if fFlagBuildExperienceAnswerFormModule and value == nil and var7 ~= nil then
			local drafts = var7.drafts
			
			if drafts ~= nil then
				for i, v in drafts do
					v.setText(nil)
				end
			end
		end
		var7 = value
	end
	
	local function setCurrentAnswerStackPrompt(value)
		-- upvalues: var7 (write), p11 (ref), buildOptimisticAskUserTool (copy), onAnswerSelectedImpl (write), onAnswerConfirmedImpl (write)
		if value == nil then
			if var7 ~= nil then
				p11.removeAskUserTool(var7.toolCallId)
				p11.removeAnswerAction(var7.toolCallId)
			end
			return
		elseif var7 ~= nil then
			p11.setAskUserTool(buildOptimisticAskUserTool(var7))
			p11.setAnswerAction(var7.toolCallId, onAnswerSelectedImpl, onAnswerConfirmedImpl)
		end
	end
	
	local function getSubmittedToolCallIds()
		-- upvalues: p10 (ref)
		return p10
	end
	
	local function _(value)
		-- upvalues: fFlagBuildExperienceAnswerFormModule (copy), p11 (ref), buildOptimisticAskUserTool (copy), fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (copy)
		value.submitted = false
		
		if fFlagBuildExperienceAnswerFormModule then
			p11.setAskUserTool(buildOptimisticAskUserTool(value))
		end
		if fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p11.clearSubmitted(value.toolCallId)
		end
	end
	
	local function recoverFailedSubmission(p13, p14)
		-- upvalues: fFlagBuildExperienceAnswerFormModule (copy), p11 (ref), buildOptimisticAskUserTool (copy), fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (copy), p12 (ref)
		p13.submitted = false
		
		if fFlagBuildExperienceAnswerFormModule then
			p11.setAskUserTool(buildOptimisticAskUserTool(p13))
		end
		if fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p11.clearSubmitted(p13.toolCallId)
		end
		if p12 == nil then
			return
		end
		local currentIndex = p13.selections[p13.currentIndex]
		local var8 = if currentIndex ~= nil then nil else currentIndex.customResponseText
		p13.selections[p13.currentIndex] = nil
		p11.setAskUserTool(buildOptimisticAskUserTool(p13))
		p12(var8, p14)
	end
	
	local var8 = nil
	local submitAskUserResponses = nil
	local submitAskUserCancellation = false
	
	local var9 = function(p13)
		-- upvalues: studioAskUserTool (copy), getSubmittedToolCallIds (ref), submitAskUserCancellation (write), debug (copy), var8 (write), submitAskUserResponses (write), setCurrentAnswerStackPrompt (ref), setAnswerFlow (ref), getToolCallOrder (copy), fFlagBuildExperienceAnswerFormModule (copy), var1 (copy)
		local var10, var11, _, var12, var13 = studioAskUserTool.findQuestionsInTurnState(p13, getSubmittedToolCallIds())
		
		if var10 == nil or var11 == nil then
			if submitAskUserCancellation then
				debug.log("info", "ask_user answer stack cleared", { turn = debug.formatTurnState(p13) })
				submitAskUserCancellation = false
				var4 = nil
				var5 = nil
				setCurrentAnswerStackPrompt(nil)
				setAnswerFlow(nil)
			end
			return false
		else
			submitAskUserCancellation = true
			
			if p13.sessionId ~= var4 or var11 ~= var5 then
				var4 = p13.sessionId
				var5 = var11
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p13.sessionId,
					toolCallId = var11,
					callOrder = getToolCallOrder(p13, var11),
					turnId = var12,
					referenceId = var13,
					questions = var10,
					selections = {}
				}
				
				if fFlagBuildExperienceAnswerFormModule then
					local t_1 = {}
					
					for i, v in t.questions do
						local var14, var15 = var1.createSignal(nil)
						t_1[v.id] = { getText = var14, setText = var15 }
					end
					t.drafts = t_1
				end
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
					toolCallId = var11,
					turnId = var12,
					referenceId = var13,
					questions = debug.formatStudioAskUserQuestions(var10),
					turn = debug.formatTurnState(p13)
				})
			end
			return true
		end
	end
	
	var8 = false
	
	submitAskUserResponses = function(p14)
		-- upvalues: studioAskUserTool (copy), debug (copy), p9 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), fFlagBuildExperienceAnswerFormModule (copy), recoverFailedSubmission (ref), p11 (ref), buildOptimisticAskUserTool (copy), fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (copy), awaitRequestState (copy), chatConstantsModule (copy), p10 (ref), var7 (write)
		local t = {}
		
		for i, v in p14.questions do
			drafts = p14.selections[i]
			
			if drafts ~= nil then
				table.insert(t, {
					question = v,
					option = drafts.option,
					options = drafts.options,
					customResponseText = drafts.customResponseText
				})
				continue
			end
			return
		end
		local var16 = studioAskUserTool.formatToolResultContent(t)
		debug.log("info", "ask_user tool_result submitting", {
			sessionId = p14.sessionId,
			toolCallId = p14.toolCallId,
			turnId = p14.turnId,
			referenceId = p14.referenceId,
			questionCount = #p14.questions
		})
		local processTime = os.clock()
		local var17 = p9.submitActiveToolResult(var16, false, p14.turnId, p14.referenceId)
		
		if var17 == nil then
			debug.log("warn", "ask_user tool_result submit aborted (no active session)", { toolCallId = p14.toolCallId })
			
			if fFlagBuildExperienceToolResultFailureRecoveryModule or fFlagBuildExperienceAnswerFormModule then
				recoverFailedSubmission(p14, nil)
				
				return
			end
			p14.submitted = false
			
			if fFlagBuildExperienceAnswerFormModule then
				p11.setAskUserTool(buildOptimisticAskUserTool(p14))
			end
			if fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
				p11.clearSubmitted(p14.toolCallId)
			end
			return
		else
			local var18 = awaitRequestState(var17.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
			local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
			
			if var18.status == "succeeded" then
				debug.log("info", "ask_user tool_result submitted", {
					sessionId = p14.sessionId,
					toolCallId = p14.toolCallId,
					turnId = p14.turnId,
					referenceId = p14.referenceId,
					questionCount = #p14.questions,
					durationMs = floored
				})
				p10[p14.toolCallId] = true
				p11.markSubmitted(p14.toolCallId)
				p11.removeAnswerAction(p14.toolCallId)
				
				if fFlagBuildExperienceAnswerFormModule then
					p11.setAskUserTool(buildOptimisticAskUserTool(p14, false))
				end
				if fFlagBuildExperienceAnswerFormModule and var7 ~= nil then
					drafts = var7.drafts
					
					if drafts ~= nil then
						for i_1, v_1 in drafts do
							v_1.setText(nil)
						end
					end
				end
				var7 = nil
				
				return
			elseif fFlagBuildExperienceToolResultFailureRecoveryModule or fFlagBuildExperienceAnswerFormModule then
				recoverFailedSubmission(p14, var18.errorCode)
			else
				p14.submitted = false
				
				if fFlagBuildExperienceAnswerFormModule then
					p11.setAskUserTool(buildOptimisticAskUserTool(p14))
				end
				if fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
					p11.clearSubmitted(p14.toolCallId)
				end
			end
			debug.log("warn", "ask_user tool_result submit failed", {
				sessionId = p14.sessionId,
				toolCallId = p14.toolCallId,
				turnId = p14.turnId,
				referenceId = p14.referenceId,
				durationMs = floored,
				state = debug.formatRequestState(var18)
			})
		end
		local drafts
	end
	
	submitAskUserCancellation = function(p15)
		-- upvalues: studioAskUserTool (copy), p10 (ref), p11 (ref), var7 (write), fFlagBuildExperienceAnswerFormModule (copy), p9 (ref), debug (copy), awaitRequestState (copy), chatConstantsModule (copy)
		local var19 = studioAskUserTool.formatCancellationContent()
		p10[p15.toolCallId] = true
		p11.markSubmitted(p15.toolCallId)
		p11.removeAnswerAction(p15.toolCallId)
		
		if var7 ~= nil then
			p11.removeAskUserTool(var7.toolCallId)
			p11.removeAnswerAction(var7.toolCallId)
		end
		if fFlagBuildExperienceAnswerFormModule and var7 ~= nil then
			local drafts = var7.drafts
			
			if drafts ~= nil then
				for i, v in drafts do
					v.setText(nil)
				end
			end
		end
		var7 = nil
		local var20 = p9.submitActiveToolResult(var19, false, p15.turnId, p15.referenceId)
		
		if var20 == nil then
			debug.log("warn", "ask_user cancel aborted (no active session)", { toolCallId = p15.toolCallId })
			
			return
		end
		awaitRequestState(var20.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
	end
	
	local _ = function(p16)
		-- upvalues: p11 (ref), buildOptimisticAskUserTool (copy)
		if #p16.questions <= p16.currentIndex then
			return false
		end
		p16.currentIndex += 1
		p11.setAskUserTool(buildOptimisticAskUserTool(p16))
		
		return true
	end
	
	local function commitCurrentSelectionAndAdvance(p16)
		-- upvalues: p11 (ref), buildOptimisticAskUserTool (copy), fFlagBuildExperienceAnswerFormModule (copy), fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (copy), submitAskUserResponses (ref)
		local var21
		if #p16.questions <= p16.currentIndex then
			var21 = false
		else
			p16.currentIndex += 1
			p11.setAskUserTool(buildOptimisticAskUserTool(p16))
			var21 = true
		end
		if var21 then return end
		p16.submitted = true
		
		if fFlagBuildExperienceAnswerFormModule then
			p11.setAskUserTool(buildOptimisticAskUserTool(p16))
		end
		if fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p11.markSubmitted(p16.toolCallId)
		end
		task.spawn(function()
			-- upvalues: submitAskUserResponses (copy), p16 (ref)
			submitAskUserResponses(p16)
		end)
	end
	
	onAnswerSelectedImpl = function(p16, p17, p18)
		-- upvalues: var7 (write), fFlagBuildExperienceAnswerFormModule (copy), toggleOptionInSelection (copy), p11 (ref), buildOptimisticAskUserTool (copy), debug (copy), commitCurrentSelectionAndAdvance (ref)
		if var7 == nil or var7.submitted then return end
		local currentIndex = var7.questions[var7.currentIndex]
		
		if currentIndex == nil or currentIndex.id ~= p16.id then return end
		if currentIndex.responseType ~= "multi_select" then
			debug.log("info", "ask_user answer selected", {
				toolCallId = var7.toolCallId,
				questionId = p16.id,
				questionIndex = var7.currentIndex,
				optionId = p17.id,
				optionTitle = p17.title
			})
			var7.selections[var7.currentIndex] = { options = nil, customResponseText = nil, option = p17 }
			p11.setAskUserTool(buildOptimisticAskUserTool(var7))
			commitCurrentSelectionAndAdvance(var7)
			
			return
		elseif fFlagBuildExperienceAnswerFormModule and p18 then
			var7.selections[var7.currentIndex] = nil
		end
		var7.selections[var7.currentIndex] = toggleOptionInSelection(var7.selections[var7.currentIndex], p17)
		p11.setAskUserTool(buildOptimisticAskUserTool(var7))
		debug.log("info", "ask_user multi-select toggled", {
			toolCallId = var7.toolCallId,
			questionId = p16.id,
			questionIndex = var7.currentIndex,
			optionId = p17.id,
			optionTitle = p17.title
		})
	end
	
	onAnswerConfirmedImpl = function()
		-- upvalues: var7 (write), debug (copy), commitCurrentSelectionAndAdvance (ref)
		if var7 == nil or var7.submitted then return end
		local currentIndex = var7.questions[var7.currentIndex]
		
		if currentIndex == nil or currentIndex.responseType ~= "multi_select" then return end
		local currentIndex_1 = var7.selections[var7.currentIndex]
		local var21 = if currentIndex_1 ~= nil then nil else currentIndex_1.options
		
		if var21 == nil or #var21 == 0 then
			return
		end
		debug.log("info", "ask_user multi-select confirmed", {
			toolCallId = var7.toolCallId,
			questionId = currentIndex.id,
			questionIndex = var7.currentIndex,
			selectedCount = #var21
		})
		commitCurrentSelectionAndAdvance(var7)
	end
	
	local function submitCustomAnswer(p16, p17, p18)
		-- upvalues: fFlagBuildExperienceAnswerFormModule (copy), debug (copy), p11 (ref), buildOptimisticAskUserTool (copy), fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (copy), submitAskUserResponses (ref)
		if not fFlagBuildExperienceAnswerFormModule and p17.responseType == "multi_select" then
			return false
		elseif fFlagBuildExperienceAnswerFormModule then
			p18 = string.match(p18, "^%s*(.-)%s*$") or ""
			
			if p18 == "" then
				return false
			end
		end
		local var21
		debug.log("info", "ask_user custom answer submitted", {
			toolCallId = p16.toolCallId,
			questionId = p17.id,
			questionIndex = p16.currentIndex
		})
		p16.selections[p16.currentIndex] = { option = nil, options = nil, customResponseText = p18 }
		p11.setAskUserTool(buildOptimisticAskUserTool(p16))
		
		if #p16.questions <= p16.currentIndex then
			var21 = false
		else
			p16.currentIndex += 1
			p11.setAskUserTool(buildOptimisticAskUserTool(p16))
			var21 = true
		end
		if var21 then
			return true
		end
		p16.submitted = true
		
		if fFlagBuildExperienceAnswerFormModule then
			p11.setAskUserTool(buildOptimisticAskUserTool(p16))
		end
		if fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule then
			p11.markSubmitted(p16.toolCallId)
		end
		task.spawn(function()
			-- upvalues: submitAskUserResponses (copy), p16 (ref)
			submitAskUserResponses(p16)
		end)
		
		return true
	end
	
	return {
		syncAnswerStack = function(p16)
			-- upvalues: var9 (ref), var8 (write)
			if var9(p16) then
				var8 = true
				
				return true
			end
			return false
		end,
		getSubmittedToolCallIds = getSubmittedToolCallIds,
		hasDisplayedAnswerStack = function()
			-- upvalues: var8 (write)
			return var8
		end,
		stopPendingAnswer = function()
			-- upvalues: var7 (write), submitAskUserCancellation (ref)
			if var7 == nil or var7.submitted then
				return false
			end
			var7.submitted = true
			task.spawn(function()
				-- upvalues: submitAskUserCancellation (copy), var7 (ref)
				submitAskUserCancellation(var7)
			end)
			
			return true
		end,
		trySubmitComposerText = function(p16)
			-- upvalues: var7 (write), submitCustomAnswer (ref)
			if var7 == nil or var7.submitted then
				return false
			end
			local currentIndex = var7.questions[var7.currentIndex]
			
			return if currentIndex == nil then false else submitCustomAnswer(var7, currentIndex, p16)
		end,
		trySubmitAnswerText = function(p16, p17, p18)
			-- upvalues: var7 (write), submitCustomAnswer (ref)
			if var7 == nil or var7.submitted or var7.toolCallId ~= p16 then
				return false
			end
			local currentIndex = var7.questions[var7.currentIndex]
			
			return if currentIndex == nil or currentIndex.id ~= p17 then false else submitCustomAnswer(var7, currentIndex, p18)
		end
	}
end