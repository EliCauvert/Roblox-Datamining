local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local signalsModule = require(parent.Signals)
local chatTurnToolsModule = require(script.Parent.chatTurnTools)
local _ = require(script.Parent.chatTypes)
local chatConstantsModule = require(script.Parent.chatConstants)
local clientToolItems = creatorAgentChatModule.ClientToolItems
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local subagentTasks = creatorAgentChatModule.SubagentTasks
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local turnDisplayModule = require(script.Parent.turnDisplay)
local clientLogsCollectorModule = require(script.Parent.clientLogsCollector)
local composerLockSignalModule = require(script.Parent.composerLockSignal)
local debug = creatorAgentChatModule.debug
local saveAndPublishResultModule = require(script.Parent.saveAndPublishResult)

local function _(p0) --[[ line: 91 | named "getLatestTurnSequenceId" ]]
	return if p0 == nil or p0.getLatestProcessedSequenceNumber == nil then nil else p0.getLatestProcessedSequenceNumber()
end

local function buildTurnFeedbackIds(p1, p2, p3) --[[ line: 98 ]]
	-- upvalues: saveAndPublishResultModule (ref)
	local latestSuccessfulResult = saveAndPublishResultModule.getLatestSuccessfulResult(p3)
	
	return {
		universeId = p1.universeId,
		placeId = p1.placeId,
		sessionId = if p3 ~= nil then nil else p3.sessionId,
		sequenceId = if p2 == nil or p2.getLatestProcessedSequenceNumber == nil then nil else p2.getLatestProcessedSequenceNumber(),
		publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
	}
end

local function getToolCallOrder(p4, p5) --[[ line: 114 ]]
	for i, v in p4.activityItems do
		if v.kind == "tool_call" and v.toolCallId == p5 then
			return i
		end
	end
	local t = {}
	
	for v in p4.toolCalls do
		table.insert(t, v)
	end
	table.sort(t)
	
	for v, v_1 in t do
		if v_1 == p5 then
			return v
		end
	end
	return 0
end

local _ = function(p6) --[[ line: 135 | named "isContentPolicyViolation" ]]
	return if p6 == nil or p6.status ~= "failed" then false else p6.errorCode == -32001
end

local function makeAnswerStackPrompt(p7, p8) --[[ line: 143 ]]
	return {
		question = p7.questions[p7.currentIndex],
		selectedOptionId = if p8 == nil or p8.option == nil then nil else p8.option.id,
		customResponseText = if p8 ~= nil then nil else p8.customResponseText,
		toolCallId = p7.toolCallId,
		callOrder = p7.callOrder
	}
end

local _ = function(value) --[[ line: 157 | named "formatSetupErrorMessage" ]]
	return if not (value.message ~= nil and value.message ~= "") then if value.stage == "missing_project" then "An experience is required to chat with the assistant." elseif value.stage == "session_new" then "The assistant couldn't start a session. Please try again." else "The assistant couldn't connect. Please try again." else value.message
end

local _ = function(p9, p10, p11) --[[ line: 171 | named "createAnswerStackSync" ]]
	-- upvalues: studioAskUserTool (ref), debug (ref), composerLockSignalModule (ref), getToolCallOrder (ref)
	local var20 = nil
	local var21 = nil
	local var22 = false
	
	return function(p12) --[[ line: 180 ]]
		-- upvalues: studioAskUserTool (copy), p11 (ref), var22 (write), debug (copy), var20 (write), var21 (write), p10 (ref), composerLockSignalModule (copy), getToolCallOrder (copy), p9 (ref)
		local var23, var24, var25, var26, var27 = studioAskUserTool.findQuestionsInTurnState(p12, p11())
		
		if var23 == nil or var24 == nil then
			if var22 then
				debug.log("info", "studio_ask_user answer stack cleared", { turn = debug.formatTurnState(p12) })
				var22 = false
				var20 = nil
				var21 = nil
				p10(nil)
				composerLockSignalModule.setComposerMode("normal")
			end
			return false
		else
			var22 = true
			
			if var24 ~= var20 or var25 ~= var21 then
				var20 = var24
				var21 = var25
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p12.sessionId,
					toolCallId = var24,
					callOrder = getToolCallOrder(p12, var24),
					turnId = var26,
					referenceId = var27,
					questions = var23,
					selections = {}
				}
				p10(t)
				p9({
					selectedOptionId = nil,
					customResponseText = nil,
					question = t.questions[t.currentIndex],
					toolCallId = t.toolCallId,
					callOrder = t.callOrder
				})
				composerLockSignalModule.setComposerMode("tool_response")
				debug.log("info", "studio_ask_user answer stack displayed", {
					toolCallId = var24,
					turnId = var26,
					referenceId = var27,
					questions = debug.formatStudioAskUserQuestions(var23),
					turn = debug.formatTurnState(p12)
				})
			end
			return true
		end
	end
end

local function awaitRequestState(p13, p14) --[[ line: 227 ]]
	while p13(false).status == "pending" do
		if p14 > os.clock() then
			task.wait()
			continue
		end
		return p13(false)
	end
	return p13(false)
end

local _ = function(value) --[[ line: 241 | named "newClientToolItemsSignal" ]]
	-- upvalues: signalsModule (ref)
	return signalsModule.createSignal(value or {})
end

local function upsertClientToolItem(p15, p16, p17) --[[ line: 247 ]]
	-- upvalues: clientToolItems (ref)
	local cloned = table.clone(p15(false))
	local var30 = false
	
	for i, v in cloned do
		if v.key == p17.key then
			cloned[i] = p17
			var30 = true
			break
		end
	end
	if not var30 then
		table.insert(cloned, p17)
	end
	p16(clientToolItems.sortClientToolItems(cloned))
end

local function removeClientToolItem(p18, p19, p20) --[[ line: 267 ]]
	local t = {}
	
	for i, v in p18(false) do
		if v.key ~= p20 then
			table.insert(t, v)
		end
	end
	p19(t)
end

local function syncSubagentTasks(p21, p22, p23) --[[ line: 281 ]]
	-- upvalues: subagentTasks (ref), clientToolItems (ref), removeClientToolItem (ref), upsertClientToolItem (ref)
	local var32 = subagentTasks.fromTurnState(p21)
	local subagentTasksItemKey = clientToolItems.getSubagentTasksItemKey()
	
	if var32 == nil then
		removeClientToolItem(p22, p23, subagentTasksItemKey)
		
		return nil
	end
	upsertClientToolItem(p22, p23, clientToolItems.makeSubagentTasksItem(var32, clientToolItems.getSubagentTasksCallOrder(p21), not p21.isDone))
	
	return var32
end

local function createAskUserController(p24, p25, p26, p27) --[[ line: 305 ]]
	-- upvalues: upsertClientToolItem (ref), clientToolItems (ref), removeClientToolItem (ref), studioAskUserTool (ref), debug (ref), composerLockSignalModule (ref), getToolCallOrder (ref), awaitRequestState (ref), chatConstantsModule (ref), makeAnswerStackPrompt (ref)
	local var34 = nil
	local onAnswerSelectedImpl = nil
	
	local function setAnswerFlow(value) --[[ line: 314 ]]
		-- upvalues: var34 (write)
		var34 = value
	end
	
	local function _(p28, p29, p30) --[[ line: 318 | named "upsertAskPrompt" ]]
		-- upvalues: upsertClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy), onAnswerSelectedImpl (write)
		upsertClientToolItem(p26, p27, clientToolItems.makeAskItem(p28, p29, p30, if p30 then onAnswerSelectedImpl else nil))
	end
	
	local _ = function(p31, p32) --[[ line: 326 | named "removeLastAskPrompt" ]]
		-- upvalues: removeClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy)
		removeClientToolItem(p26, p27, clientToolItems.getAskItemKey(p31, p32))
	end
	
	local function setCurrentAnswerStackPrompt(value) --[[ line: 330 ]]
		-- upvalues: var34 (write), removeClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy), upsertClientToolItem (copy), onAnswerSelectedImpl (write)
		if value ~= nil then
			local var43 = value.selectedOptionId == nil
			upsertClientToolItem(p26, p27, clientToolItems.makeAskItem(value, if var34 ~= nil then 1 else var34.currentIndex, var43, if var43 then onAnswerSelectedImpl else nil))
			
			return
		elseif var34 ~= nil then
			removeClientToolItem(p26, p27, clientToolItems.getAskItemKey({
				selectedOptionId = nil,
				customResponseText = nil,
				question = var34.questions[var34.currentIndex],
				toolCallId = var34.toolCallId,
				callOrder = var34.callOrder
			}, var34.currentIndex))
		end
	end
	
	local function getSubmittedToolCallIds() --[[ line: 341 ]]
		-- upvalues: p25 (ref)
		return p25
	end
	
	local var39 = nil
	local submitAskUserResponses = nil
	local submitAskUserCancellation = false
	
	local var42 = function(p33) --[[ line: 180 ]]
		-- upvalues: studioAskUserTool (copy), getSubmittedToolCallIds (ref), submitAskUserCancellation (write), debug (copy), var39 (write), submitAskUserResponses (write), setAnswerFlow (ref), composerLockSignalModule (copy), getToolCallOrder (copy), setCurrentAnswerStackPrompt (ref)
		local var23, var24, var25, var26, var27 = studioAskUserTool.findQuestionsInTurnState(p33, getSubmittedToolCallIds())
		
		if var23 == nil or var24 == nil then
			if submitAskUserCancellation then
				debug.log("info", "studio_ask_user answer stack cleared", { turn = debug.formatTurnState(p33) })
				submitAskUserCancellation = false
				var20 = nil
				var21 = nil
				setAnswerFlow(nil)
				composerLockSignalModule.setComposerMode("normal")
			end
			return false
		else
			submitAskUserCancellation = true
			
			if var24 ~= var20 or var25 ~= var21 then
				var20 = var24
				var21 = var25
				local t = {
					currentIndex = 1,
					submitted = false,
					sessionId = p33.sessionId,
					toolCallId = var24,
					callOrder = getToolCallOrder(p33, var24),
					turnId = var26,
					referenceId = var27,
					questions = var23,
					selections = {}
				}
				setAnswerFlow(t)
				setCurrentAnswerStackPrompt({
					selectedOptionId = nil,
					customResponseText = nil,
					question = t.questions[t.currentIndex],
					toolCallId = t.toolCallId,
					callOrder = t.callOrder
				})
				composerLockSignalModule.setComposerMode("tool_response")
				debug.log("info", "studio_ask_user answer stack displayed", {
					toolCallId = var24,
					turnId = var26,
					referenceId = var27,
					questions = debug.formatStudioAskUserQuestions(var23),
					turn = debug.formatTurnState(p33)
				})
			end
			return true
		end
	end
	
	var39 = false
	
	submitAskUserResponses = function(p34) --[[ line: 348 | named "submitAskUserResponses" ]]
		-- upvalues: studioAskUserTool (copy), debug (copy), p24 (ref), awaitRequestState (copy), chatConstantsModule (copy), p25 (ref), var34 (write), composerLockSignalModule (copy)
		local t = {}
		
		for i, v in p34.questions do
			local var50 = p34.selections[i]
			
			if var50 ~= nil then
				table.insert(t, {
					question = v,
					option = var50.option,
					customResponseText = var50.customResponseText
				})
				continue
			end
			return
		end
		local var45 = studioAskUserTool.formatToolResultContent(t)
		debug.log("info", "studio_ask_user tool_result submitting", {
			sessionId = p34.sessionId,
			toolCallId = p34.toolCallId,
			turnId = p34.turnId,
			referenceId = p34.referenceId,
			questionCount = #p34.questions
		})
		local processTime = os.clock()
		local var47 = p24.submitActiveToolResult(var45, false, p34.turnId, p34.referenceId)
		
		if var47 == nil then
			debug.log("warn", "studio_ask_user tool_result submit aborted (no active session)", { toolCallId = p34.toolCallId })
			p34.submitted = false
			
			return
		end
		local var48 = awaitRequestState(var47.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
		
		if var48.status == "succeeded" then
			debug.log("info", "studio_ask_user tool_result submitted", {
				sessionId = p34.sessionId,
				toolCallId = p34.toolCallId,
				turnId = p34.turnId,
				referenceId = p34.referenceId,
				questionCount = #p34.questions,
				durationMs = floored
			})
			p25[p34.toolCallId] = true
			var34 = nil
			composerLockSignalModule.setComposerMode("normal")
			
			return
		end
		p34.submitted = false
		debug.log("warn", "studio_ask_user tool_result submit failed", {
			sessionId = p34.sessionId,
			toolCallId = p34.toolCallId,
			turnId = p34.turnId,
			referenceId = p34.referenceId,
			durationMs = floored,
			state = debug.formatRequestState(var48)
		})
	end
	
	submitAskUserCancellation = function(p35) --[[ line: 409 | named "submitAskUserCancellation" ]]
		-- upvalues: studioAskUserTool (copy), p25 (ref), var34 (write), removeClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy), composerLockSignalModule (copy), p24 (ref), debug (copy), awaitRequestState (copy), chatConstantsModule (copy)
		local var51 = studioAskUserTool.formatCancellationContent()
		p25[p35.toolCallId] = true
		
		if var34 ~= nil then
			removeClientToolItem(p26, p27, clientToolItems.getAskItemKey({
				selectedOptionId = nil,
				customResponseText = nil,
				question = var34.questions[var34.currentIndex],
				toolCallId = var34.toolCallId,
				callOrder = var34.callOrder
			}, var34.currentIndex))
		end
		var34 = nil
		composerLockSignalModule.setComposerMode("normal")
		local var52 = p24.submitActiveToolResult(var51, false, p35.turnId, p35.referenceId)
		
		if var52 == nil then
			debug.log("warn", "studio_ask_user cancel aborted (no active session)", { toolCallId = p35.toolCallId })
			
			return
		end
		awaitRequestState(var52.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
	end
	
	local _ = function(p36) --[[ line: 427 | named "advanceToNextQuestion" ]]
		-- upvalues: upsertClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy), onAnswerSelectedImpl (write)
		if #p36.questions <= p36.currentIndex then
			return false
		end
		p36.currentIndex += 1
		upsertClientToolItem(p26, p27, clientToolItems.makeAskItem({
			selectedOptionId = nil,
			customResponseText = nil,
			question = p36.questions[p36.currentIndex],
			toolCallId = p36.toolCallId,
			callOrder = p36.callOrder
		}, p36.currentIndex, true, onAnswerSelectedImpl))
		
		return true
	end
	
	onAnswerSelectedImpl = function(p37, p38) --[[ line: 437 | named "onAnswerSelectedImpl" ]]
		-- upvalues: var34 (write), debug (copy), makeAnswerStackPrompt (copy), upsertClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy), onAnswerSelectedImpl (write), submitAskUserResponses (ref)
		if var34 == nil or var34.submitted then return end
		local currentIndex = var34.questions[var34.currentIndex]
		
		if currentIndex == nil or currentIndex.id ~= p37.id then return end
		local var53
		debug.log("info", "studio_ask_user answer selected", {
			toolCallId = var34.toolCallId,
			questionId = p37.id,
			questionIndex = var34.currentIndex,
			optionId = p38.id,
			optionTitle = p38.title
		})
		var34.selections[var34.currentIndex] = { customResponseText = nil, option = p38 }
		upsertClientToolItem(p26, p27, clientToolItems.makeAskItem(makeAnswerStackPrompt(var34, var34.selections[var34.currentIndex]), var34.currentIndex, false, nil))
		
		if #var34.questions <= var34.currentIndex then
			var53 = false
		else
			var34.currentIndex += 1
			upsertClientToolItem(p26, p27, clientToolItems.makeAskItem({
				selectedOptionId = nil,
				customResponseText = nil,
				question = var34.questions[var34.currentIndex],
				toolCallId = var34.toolCallId,
				callOrder = var34.callOrder
			}, var34.currentIndex, true, onAnswerSelectedImpl))
			var53 = true
		end
		if var53 then
			return
		end
		var34.submitted = true
		task.spawn(function() --[[ line: 466 ]]
			-- upvalues: submitAskUserResponses (copy), var34 (ref)
			submitAskUserResponses(var34)
		end)
	end
	
	return {
		syncAnswerStack = function(p39) --[[ line: 504 ]]
			-- upvalues: var42 (ref), var39 (write)
			if var42(p39) then
				var39 = true
				
				return true
			end
			return false
		end,
		getSubmittedToolCallIds = getSubmittedToolCallIds,
		hasDisplayedAnswerStack = function() --[[ line: 527 ]]
			-- upvalues: var39 (write)
			return var39
		end,
		stopPendingAnswer = function() --[[ line: 512 ]]
			-- upvalues: var34 (write), submitAskUserCancellation (ref)
			if var34 == nil or var34.submitted then
				return false
			end
			var34.submitted = true
			task.spawn(function() --[[ line: 518 ]]
				-- upvalues: submitAskUserCancellation (copy), var34 (ref)
				submitAskUserCancellation(var34)
			end)
			
			return true
		end,
		trySubmitComposerText = function(p40) --[[ line: 472 ]]
			-- upvalues: var34 (write), debug (copy), makeAnswerStackPrompt (copy), upsertClientToolItem (copy), p26 (ref), p27 (ref), clientToolItems (copy), onAnswerSelectedImpl (write), submitAskUserResponses (ref)
			if var34 == nil or var34.submitted then
				return false
			end
			local currentIndex = var34.questions[var34.currentIndex]
			
			if currentIndex == nil then
				return false
			end
			local var54
			debug.log("info", "studio_ask_user custom answer submitted", {
				toolCallId = var34.toolCallId,
				questionId = currentIndex.id,
				questionIndex = var34.currentIndex
			})
			var34.selections[var34.currentIndex] = { option = nil, customResponseText = p40 }
			upsertClientToolItem(p26, p27, clientToolItems.makeAskItem(makeAnswerStackPrompt(var34, var34.selections[var34.currentIndex]), var34.currentIndex, false, nil))
			
			if #var34.questions <= var34.currentIndex then
				var54 = false
			else
				var34.currentIndex += 1
				upsertClientToolItem(p26, p27, clientToolItems.makeAskItem({
					selectedOptionId = nil,
					customResponseText = nil,
					question = var34.questions[var34.currentIndex],
					toolCallId = var34.toolCallId,
					callOrder = var34.callOrder
				}, var34.currentIndex, true, onAnswerSelectedImpl))
				var54 = true
			end
			if var54 then
				return true
			end
			var34.submitted = true
			task.spawn(function() --[[ line: 498 ]]
				-- upvalues: submitAskUserResponses (copy), var34 (ref)
				submitAskUserResponses(var34)
			end)
			
			return true
		end
	}
end

local _ = function(p41, p42, p43) --[[ line: 535 | named "createPlanProposalSync" ]]
	-- upvalues: studioProposePlanTool (ref), debug (ref), composerLockSignalModule (ref), getToolCallOrder (ref)
	local var55 = nil
	local var56 = nil
	local var57 = false
	
	return function(p44) --[[ line: 544 ]]
		-- upvalues: studioProposePlanTool (copy), p43 (ref), var57 (write), debug (copy), var55 (write), var56 (write), p42 (ref), composerLockSignalModule (copy), getToolCallOrder (copy), p41 (ref)
		local var58, var59, var60, var61, var62 = studioProposePlanTool.findPlanInTurnState(p44, p43())
		
		if var58 == nil or var59 == nil then
			if var57 then
				debug.log("info", "present_plan proposal cleared", { turn = debug.formatTurnState(p44) })
				var57 = false
				var55 = nil
				var56 = nil
				p42(nil)
				composerLockSignalModule.setComposerMode("normal")
			end
			return false
		else
			var57 = true
			
			if var59 ~= var55 or var60 ~= var56 then
				var55 = var59
				var56 = var60
				local t = {
					submitted = false,
					sessionId = p44.sessionId,
					toolCallId = var59,
					turnId = var61,
					referenceId = var62,
					proposal = {
						isAccepted = false,
						title = var58.title,
						textContent = var58.textContent,
						summary = var58.summary,
						toolCallId = var59,
						callOrder = getToolCallOrder(p44, var59)
					}
				}
				p42(t)
				p41(t.proposal)
				composerLockSignalModule.setComposerMode("tool_response")
				debug.log("info", "present_plan proposal displayed", {
					toolCallId = var59,
					turnId = var61,
					referenceId = var62,
					turn = debug.formatTurnState(p44)
				})
			end
			return true
		end
	end
end

local function createProposePlanController(p45, p46, p47, p48) --[[ line: 594 ]]
	-- upvalues: debug (ref), awaitRequestState (ref), chatConstantsModule (ref), composerLockSignalModule (ref), studioProposePlanTool (ref), upsertClientToolItem (ref), clientToolItems (ref), getToolCallOrder (ref), removeClientToolItem (ref)
	local var64 = nil
	local onPlanAcceptedImpl = nil
	
	local function setPlanFlow(value) --[[ line: 603 ]]
		-- upvalues: var64 (write)
		var64 = value
	end
	
	local function submitPlanResult(p49, p50, p51) --[[ line: 607 ]]
		-- upvalues: debug (copy), p45 (ref), awaitRequestState (copy), chatConstantsModule (copy), p46 (ref), var64 (write), composerLockSignalModule (copy)
		debug.log("info", "present_plan tool_result submitting", {
			sessionId = p49.sessionId,
			toolCallId = p49.toolCallId,
			turnId = p49.turnId,
			referenceId = p49.referenceId,
			resultKind = p51
		})
		local processTime = os.clock()
		local var74 = p45.submitActiveToolResult(p50, false, p49.turnId, p49.referenceId)
		
		if var74 == nil then
			debug.log("warn", "present_plan tool_result submit aborted (no active session)", { toolCallId = p49.toolCallId, resultKind = p51 })
			p49.submitted = false
			
			return
		end
		local var75 = awaitRequestState(var74.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored = math.floor((os.clock() - processTime) * 1000 + 0.5)
		
		if var75.status == "succeeded" then
			debug.log("info", "present_plan tool_result submitted", {
				sessionId = p49.sessionId,
				toolCallId = p49.toolCallId,
				turnId = p49.turnId,
				referenceId = p49.referenceId,
				durationMs = floored,
				resultKind = p51
			})
			p46[p49.toolCallId] = true
			var64 = nil
			composerLockSignalModule.setComposerMode("normal")
			
			return
		end
		p49.submitted = false
		debug.log("warn", "present_plan tool_result submit failed", {
			sessionId = p49.sessionId,
			toolCallId = p49.toolCallId,
			turnId = p49.turnId,
			referenceId = p49.referenceId,
			durationMs = floored,
			state = debug.formatRequestState(var75),
			resultKind = p51
		})
	end
	
	local function _(p52) --[[ line: 655 | named "submitPlanAccepted" ]]
		-- upvalues: submitPlanResult (ref), studioProposePlanTool (copy)
		submitPlanResult(p52, studioProposePlanTool.formatAcceptedContent(), "accept")
	end
	
	local _ = function(p53, p54) --[[ line: 659 | named "submitPlanFeedback" ]]
		-- upvalues: submitPlanResult (ref), studioProposePlanTool (copy)
		submitPlanResult(p53, studioProposePlanTool.formatFeedbackContent(p54), "feedback")
	end
	
	local function setCurrentPlanProposal(value) --[[ line: 663 ]]
		-- upvalues: upsertClientToolItem (copy), p47 (ref), p48 (ref), clientToolItems (copy), onPlanAcceptedImpl (write)
		if value ~= nil then
			local var77 = value.isAccepted ~= true and value.feedbackText == nil
			upsertClientToolItem(p47, p48, clientToolItems.makePlanItem(value, var77, if var77 then onPlanAcceptedImpl else nil))
		end
	end
	
	local function getSubmittedToolCallIds() --[[ line: 674 ]]
		-- upvalues: p46 (ref)
		return p46
	end
	
	local var70 = nil
	local var71 = nil
	local var72 = false
	
	onPlanAcceptedImpl = function() --[[ line: 679 | named "onPlanAcceptedImpl" ]]
		-- upvalues: var64 (write), upsertClientToolItem (copy), p47 (ref), p48 (ref), clientToolItems (copy), onPlanAcceptedImpl (write), submitPlanResult (ref), studioProposePlanTool (copy)
		if var64 == nil or var64.submitted then return end
		var64.submitted = true
		var64.proposal = {
			isAccepted = true,
			feedbackText = nil,
			title = var64.proposal.title,
			textContent = var64.proposal.textContent,
			summary = var64.proposal.summary,
			toolCallId = var64.proposal.toolCallId,
			callOrder = var64.proposal.callOrder
		}
		local proposal = var64.proposal
		
		if proposal ~= nil then
			local var78 = proposal.isAccepted ~= true and proposal.feedbackText == nil
			upsertClientToolItem(p47, p48, clientToolItems.makePlanItem(proposal, var78, if var78 then onPlanAcceptedImpl else nil))
		end
		task.spawn(function() --[[ line: 696 ]]
			-- upvalues: var64 (ref), submitPlanResult (copy), studioProposePlanTool (copy)
			submitPlanResult(var64, studioProposePlanTool.formatAcceptedContent(), "accept")
		end)
	end
	
	return {
		syncPlanProposal = function(p55) --[[ line: 544 ]]
			-- upvalues: studioProposePlanTool (copy), getSubmittedToolCallIds (ref), var72 (write), debug (copy), var70 (write), var71 (write), setPlanFlow (ref), composerLockSignalModule (copy), getToolCallOrder (copy), setCurrentPlanProposal (ref)
			local var58, var59, var60, var61, var62 = studioProposePlanTool.findPlanInTurnState(p55, getSubmittedToolCallIds())
			
			if var58 == nil or var59 == nil then
				if var72 then
					debug.log("info", "present_plan proposal cleared", { turn = debug.formatTurnState(p55) })
					var72 = false
					var55 = nil
					var56 = nil
					setPlanFlow(nil)
					composerLockSignalModule.setComposerMode("normal")
				end
				return false
			else
				var72 = true
				
				if var59 ~= var55 or var60 ~= var56 then
					var55 = var59
					var56 = var60
					local t = {
						submitted = false,
						sessionId = p55.sessionId,
						toolCallId = var59,
						turnId = var61,
						referenceId = var62,
						proposal = {
							isAccepted = false,
							title = var58.title,
							textContent = var58.textContent,
							summary = var58.summary,
							toolCallId = var59,
							callOrder = getToolCallOrder(p55, var59)
						}
					}
					setPlanFlow(t)
					setCurrentPlanProposal(t.proposal)
					composerLockSignalModule.setComposerMode("tool_response")
					debug.log("info", "present_plan proposal displayed", {
						toolCallId = var59,
						turnId = var61,
						referenceId = var62,
						turn = debug.formatTurnState(p55)
					})
				end
				return true
			end
		end,
		stopPendingPlan = function() --[[ line: 726 ]]
			-- upvalues: var64 (write), removeClientToolItem (copy), p47 (ref), p48 (ref), clientToolItems (copy), composerLockSignalModule (copy)
			if var64 == nil or var64.submitted then
				return false
			end
			var64.submitted = true
			var64 = nil
			removeClientToolItem(p47, p48, clientToolItems.getPlanItemKey(var64.proposal))
			composerLockSignalModule.setComposerMode("normal")
			
			return true
		end,
		trySubmitComposerText = function(p56) --[[ line: 702 ]]
			-- upvalues: var64 (write), upsertClientToolItem (copy), p47 (ref), p48 (ref), clientToolItems (copy), onPlanAcceptedImpl (write), submitPlanResult (ref), studioProposePlanTool (copy)
			if var64 == nil or var64.submitted then
				return false
			end
			var64.submitted = true
			var64.proposal = {
				isAccepted = false,
				title = var64.proposal.title,
				textContent = var64.proposal.textContent,
				summary = var64.proposal.summary,
				toolCallId = var64.proposal.toolCallId,
				callOrder = var64.proposal.callOrder,
				feedbackText = p56
			}
			local proposal = var64.proposal
			
			if proposal ~= nil then
				local var79 = proposal.isAccepted ~= true and proposal.feedbackText == nil
				upsertClientToolItem(p47, p48, clientToolItems.makePlanItem(proposal, var79, if var79 then onPlanAcceptedImpl else nil))
			end
			task.spawn(function() --[[ line: 720 ]]
				-- upvalues: var64 (ref), p56 (ref), submitPlanResult (copy), studioProposePlanTool (copy)
				submitPlanResult(var64, studioProposePlanTool.formatFeedbackContent(p56), "feedback")
			end)
			
			return true
		end
	}
end

local _ = function(p57) --[[ line: 749 | named "getClientLogsReason" ]]
	return if typeof(p57) == "table" then if typeof(p57.reason) == "string" and p57.reason ~= "" then p57.reason else nil else nil
end

local function createClientLogsController(p58, p59) --[[ line: 756 ]]
	-- upvalues: debug (ref), clientLogsCollectorModule (ref), awaitRequestState (ref), chatConstantsModule (ref), studioClientLogsTool (ref)
	local function submitClientLogsResult(p60) --[[ line: 760 ]]
		-- upvalues: debug (copy), clientLogsCollectorModule (copy), p58 (ref), awaitRequestState (copy), chatConstantsModule (copy)
		debug.log("info", "ask_for_logs tool_result collecting", {
			sessionId = p60.sessionId,
			toolCallId = p60.toolCallId,
			turnId = p60.turnId,
			referenceId = p60.referenceId,
			reason = p60.reason
		})
		local floored = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		local var82 = p58.submitActiveToolResult(clientLogsCollectorModule.collectToolResultContent(), false, p60.turnId, p60.referenceId)
		
		if var82 == nil then
			debug.log("warn", "ask_for_logs tool_result submit aborted (no active session)", { toolCallId = p60.toolCallId, collectDurationMs = floored })
			
			return
		end
		local var83 = awaitRequestState(var82.state, os.clock() + chatConstantsModule.CAS_RPC_TIMEOUT_SECONDS)
		local floored_1 = math.floor((os.clock() - os.clock()) * 1000 + 0.5)
		
		if var83.status == "succeeded" then
			debug.log("info", "ask_for_logs tool_result submitted", {
				sessionId = p60.sessionId,
				toolCallId = p60.toolCallId,
				turnId = p60.turnId,
				referenceId = p60.referenceId,
				collectDurationMs = floored,
				submitDurationMs = floored_1
			})
			
			return
		end
		debug.log("warn", "ask_for_logs tool_result submit failed", {
			sessionId = p60.sessionId,
			toolCallId = p60.toolCallId,
			turnId = p60.turnId,
			referenceId = p60.referenceId,
			collectDurationMs = floored,
			submitDurationMs = floored_1,
			state = debug.formatRequestState(var83)
		})
	end
	
	return {
		syncClientLogsRequest = function(p61) --[[ line: 808 ]]
			-- upvalues: studioClientLogsTool (copy), p59 (ref), submitClientLogsResult (ref)
			local var85, var86, var87, var88 = studioClientLogsTool.findClientLogsRequestInTurnState(p61, p59)
			
			if var85 == nil then
				return false
			end
			p59[var85] = true
			local t = {
				sessionId = p61.sessionId,
				toolCallId = var85,
				turnId = var87,
				referenceId = var88,
				reason = if typeof(var86) ~= "table" then if typeof(var86.reason) == "string" and var86.reason ~= "" then var86.reason else nil else nil
			}
			task.spawn(function() --[[ line: 823 ]]
				-- upvalues: submitClientLogsResult (copy), t (ref)
				submitClientLogsResult(t)
			end)
			
			return true
		end
	}
end

return {
	createLiveAssistantTurn = function(p62, p63, p64) --[[ line: 836 ]]
		-- upvalues: signalsModule (ref), createAskUserController (ref), createProposePlanController (ref), createClientLogsController (ref), turnDisplayModule (ref), buildTurnFeedbackIds (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), debug (ref), chatTurnToolsModule (ref), syncSubagentTasks (ref)
		local t = {}
		local var91, var92 = signalsModule.createSignal({})
		var91 = createAskUserController(p62, t, var91, var92)
		var92 = createProposePlanController(p62, t, var91, var92)
		local var93 = createClientLogsController(p62, t)
		local universeId = p62.universeId
		local var94, var95 = signalsModule.createSignal(turnDisplayModule.ASSISTANT_LOADING_TEXT)
		local var96, var97 = signalsModule.createSignal(true)
		local var98, var99 = signalsModule.createSignal({})
		local var100, var101 = signalsModule.createSignal(buildTurnFeedbackIds(p62, nil, nil))
		local t_1 = {
			isUser = false,
			text = var94,
			isLoading = var96,
			turnActivity = var98,
			universeId = p62.universeId,
			clientToolItems = var91,
			turnFeedbackIds = var100
		}
		local var103 = nil
		var103 = p62.sendPrompt({
			prompt = p63,
			promptMeta = {
				_roblox = {
					localTools = {
						studioAskUserTool.LOCAL_TOOL_DEFINITION,
						studioProposePlanTool.LOCAL_TOOL_DEFINITION,
						studioClientLogsTool.LOCAL_TOOL_DEFINITION
					},
					providerConfig = { universeId = universeId }
				}
			},
			rtnIdleFallbackSeconds = turnDisplayModule.CAS_RTN_IDLE_FALLBACK_SECONDS,
			pollMinIntervalSeconds = turnDisplayModule.CAS_POLL_MIN_INTERVAL_SECONDS,
			pollMaxIntervalSeconds = turnDisplayModule.CAS_POLL_MAX_INTERVAL_SECONDS,
			onCompleted = function(p65) --[[ line: 889 ]]
				-- upvalues: var91 (ref), debug (copy), buildTurnFeedbackIds (copy), p62 (ref), var103 (write), chatTurnToolsModule (copy), t_1 (ref), var101 (ref), p64 (ref)
				if var91.hasDisplayedAnswerStack() and p65 ~= nil and p65.assistantText == "" then
					debug.log("info", "studio_ask_user turn completed without assistant text", { turn = debug.formatTurnState(p65) })
				end
				local var104 = buildTurnFeedbackIds(p62, var103.getTurnHandle(false), p65)
				local t = {
					toolCallCount = if p65 ~= nil then 0 else p65.toolCallCount,
					includesPublishTool = if p65 ~= nil then false else chatTurnToolsModule.includesPublishPlaceTool(p65),
					promptFailureReason = if if p65 == nil or p65.status ~= "failed" then false else p65.errorCode == -32001 then "content_policy" else nil,
					sessionId = var104.sessionId,
					latestSequenceId = var104.sequenceId,
					turnFeedbackIds = var104
				}
				t_1.sessionId = t.sessionId or p62.getCasSessionId()
				var101(var104)
				debug.log("info", "agent_turn_feedback live turn ids resolved", { feedbackIds = var104 })
				p64(t)
			end
		})
		debug.log("info", "creator agent local tools registered for prompt", {
			universeId = universeId,
			placeId = p62.placeId,
			toolName = studioAskUserTool.TOOL_NAME,
			planToolName = studioProposePlanTool.TOOL_NAME,
			logsToolName = studioClientLogsTool.TOOL_NAME
		})
		
		return {
			assistantMessage = t_1,
			start = function() --[[ line: 929 ]]
				-- upvalues: var103 (write), var97 (ref), var95 (ref), t_1 (ref), p62 (ref), turnDisplayModule (copy), var99 (ref), syncSubagentTasks (copy), var91 (ref), var92 (ref), var101 (ref), buildTurnFeedbackIds (copy), var91 (ref), var92 (ref), var93 (ref)
				var103.start()
				task.spawn(function() --[[ line: 935 ]]
					-- upvalues: var103 (copy), var97 (copy), var95 (copy), t_1 (copy), p62 (copy), turnDisplayModule (copy), var99 (copy), syncSubagentTasks (copy), var91 (copy), var92 (copy), var101 (copy), buildTurnFeedbackIds (copy), var91 (copy), var92 (copy), var93 (copy)
					while var103.getTurnHandle(false) == nil and var103.getSetupError(false) == nil do
						task.wait()
					end
					local setupError = var103.getSetupError(false)
					
					if setupError == nil then
						local turnHandle = var103.getTurnHandle(false)
						
						if turnHandle == nil then
							var97(false)
							
							return
						end
						t_1.sessionId = p62.getCasSessionId()
						turnDisplayModule.syncTurnResponseText(turnHandle, var95, var97, var99, function(p66) --[[ line: 957 ]]
							-- upvalues: syncSubagentTasks (copy), var91 (copy), var92 (copy), p62 (copy), var101 (copy), buildTurnFeedbackIds (copy), turnHandle (ref), var91 (copy), var92 (copy), var93 (copy)
							local var108 = syncSubagentTasks(p66, var91, var92)
							
							if var108 ~= nil then
								p62.setSubagentTaskState(var108)
							end
							var101(buildTurnFeedbackIds(p62, turnHandle, p66))
							
							return if var93.syncClientLogsRequest(p66) then true elseif var92.syncPlanProposal(p66) then true else var91.syncAnswerStack(p66)
						end, var91.getSubmittedToolCallIds)
						
						return
					else
						var97(false)
						var95(if setupError.message == nil or setupError.message == "" then if setupError.stage == "missing_project" then "An experience is required to chat with the assistant." elseif setupError.stage == "session_new" then "The assistant couldn't start a session. Please try again." else "The assistant couldn't connect. Please try again." else setupError.message)
					end
				end)
			end,
			stop = function() --[[ line: 978 ]]
				-- upvalues: var91 (ref), var92 (ref), var103 (write)
				var91.stopPendingAnswer()
				var92.stopPendingPlan()
				var103.stop()
			end,
			trySubmitComposerText = function(p67) --[[ line: 984 ]]
				-- upvalues: var91 (ref), var92 (ref)
				return if var91.trySubmitComposerText(p67) then true else var92.trySubmitComposerText(p67)
			end
		}
	end,
	createResumedAssistantTurn = function(p68, p69, p70, p71) --[[ line: 1002 ]]
		-- upvalues: clientToolItems (ref), signalsModule (ref), createAskUserController (ref), createProposePlanController (ref), createClientLogsController (ref), buildTurnFeedbackIds (ref), turnDisplayModule (ref), syncSubagentTasks (ref), chatTurnToolsModule (ref), debug (ref)
		local t = {}
		local var110 = p69.state(false)
		local var111, var112 = signalsModule.createSignal(clientToolItems.getCompletedItemsFromTurnState(var110) or {})
		local var113 = createAskUserController(p68, t, var111, var112)
		var111 = createProposePlanController(p68, t, var111, var112)
		local var114 = createClientLogsController(p68, t)
		local var115 = buildTurnFeedbackIds(p68, p69, var110)
		local var116, var117 = signalsModule.createSignal(turnDisplayModule.ASSISTANT_LOADING_TEXT)
		local var118, var119 = signalsModule.createSignal(true)
		local var120, var121 = signalsModule.createSignal({})
		local var122, var123 = signalsModule.createSignal(var115)
		local t_1 = {
			isUser = false,
			text = var116,
			isLoading = var118,
			turnActivity = var120,
			universeId = p68.universeId,
			sessionId = p69.state(false).sessionId,
			clientToolItems = var111,
			turnFeedbackIds = var122
		}
		local var125 = false
		local var126 = nil
		
		return {
			assistantMessage = t_1,
			start = function() --[[ line: 1036 ]]
				-- upvalues: var125 (write), var126 (write), p68 (ref), p71 (ref), turnDisplayModule (copy), p69 (ref), var117 (ref), var119 (ref), var121 (ref), syncSubagentTasks (copy), var111 (ref), var112 (ref), var123 (ref), buildTurnFeedbackIds (copy), var113 (ref), var111 (ref), var114 (ref), chatTurnToolsModule (copy), t_1 (ref), debug (copy), p70 (ref)
				if var125 then return end
				var125 = true
				var126 = p68.startPollingActiveTurn({
					rtnIdleFallbackSeconds = if p71 == nil or p71.rtnIdleFallbackSeconds == nil then turnDisplayModule.CAS_RTN_IDLE_FALLBACK_SECONDS else p71.rtnIdleFallbackSeconds,
					pollMinIntervalSeconds = if p71 == nil or p71.pollMinIntervalSeconds == nil then turnDisplayModule.CAS_POLL_MIN_INTERVAL_SECONDS else p71.pollMinIntervalSeconds,
					pollMaxIntervalSeconds = if p71 == nil or p71.pollMaxIntervalSeconds == nil then turnDisplayModule.CAS_POLL_MAX_INTERVAL_SECONDS else p71.pollMaxIntervalSeconds,
					afterSequenceId = if p71 ~= nil then nil else p71.afterSequenceId
				})
				task.spawn(function() --[[ line: 1053 ]]
					-- upvalues: turnDisplayModule (copy), p69 (copy), var117 (copy), var119 (copy), var121 (copy), syncSubagentTasks (copy), var111 (copy), var112 (copy), p68 (copy), var123 (copy), buildTurnFeedbackIds (copy), var113 (copy), var111 (copy), var114 (copy), var126 (copy), chatTurnToolsModule (copy), t_1 (copy), debug (copy), p70 (copy)
					turnDisplayModule.syncTurnResponseText(p69, var117, var119, var121, function(p72) --[[ line: 1054 ]]
						-- upvalues: syncSubagentTasks (copy), var111 (copy), var112 (copy), p68 (copy), var123 (copy), buildTurnFeedbackIds (copy), p69 (copy), var113 (copy), var111 (copy), var114 (copy)
						local var130 = syncSubagentTasks(p72, var111, var112)
						
						if var130 ~= nil then
							p68.setSubagentTaskState(var130)
						end
						var123(buildTurnFeedbackIds(p68, p69, p72))
						
						return if var114.syncClientLogsRequest(p72) then true elseif var111.syncPlanProposal(p72) then true else var113.syncAnswerStack(p72)
					end, var113.getSubmittedToolCallIds)
					
					if var126 ~= nil then
						var126()
						var126 = nil
					end
					local var127 = p69.state(false)
					local var128 = buildTurnFeedbackIds(p68, p69, var127)
					local t = {
						toolCallCount = var127.toolCallCount,
						includesPublishTool = chatTurnToolsModule.includesPublishPlaceTool(var127),
						sessionId = var127.sessionId,
						latestSequenceId = var128.sequenceId,
						turnFeedbackIds = var128
					}
					t_1.sessionId = var127.sessionId
					var123(var128)
					debug.log("info", "agent_turn_feedback resumed turn ids resolved", { feedbackIds = var128 })
					p70(t)
				end)
			end,
			stop = function() --[[ line: 1097 ]]
				-- upvalues: var126 (write), var113 (ref), var111 (ref), p69 (ref)
				if var126 ~= nil then
					var126()
					var126 = nil
				end
				var113.stopPendingAnswer()
				var111.stopPendingPlan()
				p69.cancel()
			end,
			trySubmitComposerText = function(p73) --[[ line: 1106 ]]
				-- upvalues: var113 (ref), var111 (ref)
				return if var113.trySubmitComposerText(p73) then true else var111.trySubmitComposerText(p73)
			end
		}
	end
}