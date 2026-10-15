local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceClientDataModelTools = sharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local fFlagBuildExperiencePromptFailureTelemetry = sharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local _ = require(script.Parent.chatTypes)
local askUserControllerModule = require(script.Parent.askUserController)
local var1 = if fFlagBuildExperienceClientDataModelTools then require(script.Parent.clientDataModelController) else nil
local clientLogsControllerModule = require(script.Parent.clientLogsController)
local localToolOverlayModule = require(script.Parent.localToolOverlay)
local isWaitingOnUserInputModule = require(script.Parent.isWaitingOnUserInput)
local proposePlanControllerModule = require(script.Parent.proposePlanController)
local var2 = if fFlagBuildExperienceManageDevProductModule then require(script.Parent.askManageDevProductController) else nil
local createPromptLifecycleTelemetryModule = require(buildExperience.Telemetry.createPromptLifecycleTelemetry)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioClientDataModelTools = creatorAgentChatModule.StudioClientDataModelTools
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local studioManageDevProductTool = creatorAgentChatModule.StudioManageDevProductTool
local debug = creatorAgentChatModule.debug
local turnStateReducer = creatorAgentChatModule.TurnStateReducer
local errorCodes = creatorAgentChatModule.ErrorCodes
local forbidden = errorCodes.Forbidden
local t = {
	FreeTrialExhausted = "FreeTrialExhausted",
	DailyLimitReached = "DailyLimitReached",
	InsufficientRobuxBalance = "InsufficientRobuxBalance"
}
local t_1 = {
	[errorCodes.InvalidParams] = localizationStringsModule.CHAT_ERROR_INVALID_PARAMS,
	[errorCodes.Unauthorized] = localizationStringsModule.CHAT_ERROR_UNAUTHORIZED,
	[errorCodes.Forbidden] = localizationStringsModule.CHAT_ERROR_FORBIDDEN,
	[errorCodes.NotFound] = localizationStringsModule.CHAT_ERROR_NOT_FOUND,
	[errorCodes.Conflict] = localizationStringsModule.CHAT_ERROR_CONFLICT,
	[errorCodes.Gone] = localizationStringsModule.CHAT_ERROR_GONE,
	[errorCodes.UpstreamUnavailable] = localizationStringsModule.CHAT_ERROR_UPSTREAM_UNAVAILABLE,
	[errorCodes.InternalError] = localizationStringsModule.CHAT_ERROR_INTERNAL,
	[errorCodes.OutOfCredits] = localizationStringsModule.CHAT_ERROR_OUT_OF_CREDITS
}

local function getPromptFailureComposerError(p1)
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	if p1.isContentPolicy then
		return localizationStringsModule.CHAT_POLICY_REJECTION
	elseif p1.setupStage == "missing_project" then
		return localizationStringsModule.CHAT_MISSING_PROJECT
	elseif p1.errorCode ~= nil then
		local errorCode = t_1[p1.errorCode]
		
		return if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
	end
end

local function getToolResultFailureComposerError(p1)
	-- upvalues: forbidden (ref), localizationStringsModule (ref), t_1 (ref)
	local t = {
		outOfCreditsReason = nil,
		setupStage = nil,
		errorCode = p1,
		isContentPolicy = p1 == forbidden
	}
	
	if t.isContentPolicy then
		return localizationStringsModule.CHAT_POLICY_REJECTION
	elseif t.setupStage == "missing_project" then
		return localizationStringsModule.CHAT_MISSING_PROJECT
	elseif t.errorCode ~= nil then
		local errorCode = t_1[t.errorCode]
		
		return if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
	end
end

local function _(p1)
	-- upvalues: t (ref)
	return if p1 == nil then nil else t[p1]
end

local function resolvePromptFailure(p1, p2)
	-- upvalues: fFlagBuildExperiencePromptFailureTelemetry (ref), errorCodes (ref), t (ref), forbidden (ref)
	if p1 == nil then
		return if p2 == nil then nil else {
			outOfCreditsReason = nil,
			isContentPolicy = false,
			errorCode = p2.errorCode,
			setupStage = p2.stage,
			requestFailure = if fFlagBuildExperiencePromptFailureTelemetry then p2.requestFailure else nil
		}
	elseif p1.status ~= "failed" then
		return nil
	end
	local var3
	local t_1 = { errorCode = p1.errorCode }
	
	if p1.errorCode == errorCodes.OutOfCredits then
		local error = p1.error
		var3 = if error == nil then nil else t[error]
	else
		var3 = nil
	end
	t_1.outOfCreditsReason = var3
	t_1.isContentPolicy = p1.errorCode == forbidden
	t_1.requestFailure = if fFlagBuildExperiencePromptFailureTelemetry then p1.requestFailure else nil
	
	return t_1
end

local function getPromptFailureTelemetryParameters(p1)
	local t = { isContentPolicy = tostring(p1.isContentPolicy) }
	
	if p1.errorCode ~= nil then
		t.errorCode = tostring(p1.errorCode)
	end
	if p1.outOfCreditsReason ~= nil then
		t.outOfCreditsReason = p1.outOfCreditsReason
	end
	if p1.setupStage ~= nil then
		t.setupStage = p1.setupStage
	end
	return t
end

local _ = function(p1, p2)
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	local requestFailure = p2.requestFailure
	
	if requestFailure ~= nil then
		local CHAT_POLICY_REJECTION
		p1.failureKind = requestFailure.kind
		
		if requestFailure.httpStatusCode ~= nil then
			p1.httpStatusCode = tostring(requestFailure.httpStatusCode)
		end
	end
	if p2.isContentPolicy then
		CHAT_POLICY_REJECTION = localizationStringsModule.CHAT_POLICY_REJECTION
	elseif p2.setupStage == "missing_project" then
		CHAT_POLICY_REJECTION = localizationStringsModule.CHAT_MISSING_PROJECT
	elseif p2.errorCode ~= nil then
		local errorCode = t_1[p2.errorCode]
		CHAT_POLICY_REJECTION = if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
	end
	p1.errorCopyKey = CHAT_POLICY_REJECTION
end

local _ = function(p1, p2)
	for i, v in p2 do
		p1[i] = v
	end
end

local _ = function(p3)
	local t = { status = p3.status }
	
	if p3.stopReason ~= nil then
		t.stopReason = p3.stopReason
	end
	if p3.errorCode ~= nil then
		t.errorCode = tostring(p3.errorCode)
	end
	return t
end

local t_2 = {
	agent_message = true,
	agent_message_chunk = true,
	tool_call_update = true,
	tool_call_content_chunk = true
}
local t_3 = { tool_call_update = true, tool_call_content_chunk = true }

local function trackPromptActivity(p3, p4, p5)
	-- upvalues: turnStateReducer (ref), t_2 (ref), t_3 (ref), isWaitingOnUserInputModule (ref), signalsModule (ref)
	local var3 = turnStateReducer.createEmptyTurnState("", nil)
	local var4 = false
	local var5 = false
	local var6 = nil
	local var7 = nil
	
	local function _()
		-- upvalues: p4 (ref), var4 (write), var5 (write)
		p4.markActivity({ hasResponse = var4, isWaitingOnUser = var5 })
	end
	
	local function onUpdate(p6, p7)
		-- upvalues: t_2 (copy), var4 (write), t_3 (copy), var3 (write), turnStateReducer (copy), var5 (write), isWaitingOnUserInputModule (copy), p5 (ref), p4 (ref)
		if t_2[p6.sessionUpdate] == true then
			var4 = true
		end
		if t_3[p6.sessionUpdate] == true then
			var3 = turnStateReducer.applySessionUpdate(var3, p6, { sequenceNumber = p7 })
			var5 = isWaitingOnUserInputModule(var3, p5(false).submittedToolCallIds)
		end
		p4.markActivity({ hasResponse = var4, isWaitingOnUser = var5 })
	end
	
	local var8 = signalsModule.createEffect(function(p6)
		-- upvalues: p3 (ref), p5 (ref), var6 (write), var7 (write), onUpdate (ref), isWaitingOnUserInputModule (copy), var3 (write), var5 (write), p4 (ref), var4 (write)
		local turnHandle = p3.getTurnHandle(p6)
		local submittedToolCallIds = p5(p6).submittedToolCallIds
		
		if turnHandle ~= nil and turnHandle ~= var6 and turnHandle.onUpdate ~= nil then
			var6 = turnHandle
			var7 = turnHandle.onUpdate(onUpdate)
		end
		local var9 = isWaitingOnUserInputModule(var3, submittedToolCallIds)
		
		if var9 ~= var5 then
			var5 = var9
			p4.markActivity({ hasResponse = var4, isWaitingOnUser = var5 })
		end
	end)
	
	return function()
		-- upvalues: var8 (ref), var7 (write)
		var8()
		
		if var7 ~= nil then
			var7()
			var7 = nil
		end
	end
end

local _ = function(p3)
	return if p3.status ~= "failed" then p3.stopReason == "error" else true
end

local _ = function(value)
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	local t = {
		isContentPolicy = false,
		errorCode = value.errorCode,
		setupStage = value.stage
	}
	
	if t.isContentPolicy then
		return localizationStringsModule.CHAT_POLICY_REJECTION
	elseif t.setupStage == "missing_project" then
		return localizationStringsModule.CHAT_MISSING_PROJECT
	elseif t.errorCode ~= nil then
		local errorCode = t_1[t.errorCode]
		
		return if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
	end
end

local function createLocalToolControllers(p3, p4, p5)
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref), var1 (ref), var2 (ref)
	local t = {}
	local var3 = localToolOverlayModule()
	local var4 = askUserControllerModule(p3, t, var3, p4)
	local var5 = proposePlanControllerModule(p3, t, var3, p4)
	local var6 = clientLogsControllerModule(p3, t, p5)
	local var7 = if var1 ~= nil then nil else var1(p3, t, p5)
	local var8 = if var2 ~= nil then nil else var2(p3, t, var3, p4)
	
	return {
		getOptimisticLocalTools = var3.getOptimisticLocalTools,
		getLocalToolActions = var3.getLocalToolActions,
		hasDisplayedAnswerStack = var4.hasDisplayedAnswerStack,
		syncFromTurnState = function(p6)
			-- upvalues: var4 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref)
			var4.syncAnswerStack(p6)
			var5.syncPlanProposal(p6)
			var6.syncClientLogsRequest(p6)
			
			if var7 ~= nil then
				var7.syncClientDataModelRequests(p6)
			end
			if var8 ~= nil then
				var8.syncManageDevProductRequests(p6)
			end
		end,
		trySubmitComposerText = function(p6)
			-- upvalues: var4 (ref), var5 (ref), var8 (ref)
			return var4.trySubmitComposerText(p6) or (var5.trySubmitComposerText(p6) or (var8 ~= nil and var8.trySubmitComposerText(p6)))
		end,
		trySubmitAnswerText = var4.trySubmitAnswerText,
		stopPending = function()
			-- upvalues: var4 (ref), var5 (ref), var7 (ref), var8 (ref)
			var4.stopPendingAnswer()
			var5.stopPendingPlan()
			
			if var7 ~= nil then
				var7.revokePending()
			end
			if var8 ~= nil then
				var8.stopPending()
			end
		end
	}
end

return {
	createLiveAssistantTurn = function(p3, p4, p5, p6, p7, p8)
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagBuildExperienceClientDataModelTools (ref), studioClientDataModelTools (ref), fFlagBuildExperienceManageDevProductModule (ref), studioManageDevProductTool (ref), fFlagBuildExperiencePromptFailureTelemetry (ref), createPromptLifecycleTelemetryModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref), trackPromptActivity (ref)
		local var3 = createLocalToolControllers(p3, p6, p7)
		local universeId = p3.universeId
		local list = {
			studioAskUserTool.LOCAL_TOOL_DEFINITION,
			studioProposePlanTool.LOCAL_TOOL_DEFINITION,
			studioClientLogsTool.LOCAL_TOOL_DEFINITION
		}
		
		if fFlagBuildExperienceClientDataModelTools then
			table.insert(list, studioClientDataModelTools.SEARCH_LOCAL_TOOL_DEFINITION)
			table.insert(list, studioClientDataModelTools.INSPECT_LOCAL_TOOL_DEFINITION)
		end
		if fFlagBuildExperienceManageDevProductModule then
			table.insert(list, studioManageDevProductTool.LOCAL_TOOL_DEFINITION)
		end
		local t = {
			_roblox = {
				application = if fFlagBuildExperienceClientDataModelTools then "build-on-mobile" else nil,
				localTools = list,
				providerConfig = { universeId = universeId }
			}
		}
		local var4 = if fFlagBuildExperiencePromptFailureTelemetry then createPromptLifecycleTelemetryModule(function()
			-- upvalues: universeId (ref), p3 (ref)
			return {
				universeId = universeId,
				placeId = p3.placeId,
				conversationId = p3.getCasSessionId()
			}
		end) else nil
		
		local function onDroppedChatMessage(p9)
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p3 (ref)
			sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
				universeId = universeId,
				placeId = p3.placeId,
				conversationId = p3.getCasSessionId(),
				messageId = p9
			})
		end
		
		local function handleReceived(p9)
			-- upvalues: fFlagBuildEventsUpdate1Module (copy), sendBuildExperienceEventModule (copy), universeId (ref), p3 (ref), p8 (ref)
			if fFlagBuildEventsUpdate1Module then
				sendBuildExperienceEventModule("SEND_PROMPT_RECIEVED", {
					universeId = universeId,
					placeId = p3.placeId,
					conversationId = p3.getCasSessionId(),
					turnId = p9
				})
			end
			if p8 ~= nil then
				p8(p9)
			end
		end
		
		local var5 = nil
		local var6 = nil
		
		local function _(p9)
			-- upvalues: var6 (write)
			if var6 ~= nil then
				var6()
				var6 = nil
			end
			p9.finish()
		end
		
		var5 = p3.sendPrompt({
			prompt = p4,
			promptMeta = t,
			onDroppedChatMessage = onDroppedChatMessage,
			onReceived = if fFlagBuildEventsUpdate1Module or p8 ~= nil then handleReceived else nil,
			onCompleted = function(p9)
				-- upvalues: resolvePromptFailure (copy), var5 (write), debug (copy), universeId (ref), p3 (ref), getPromptFailureTelemetryParameters (copy), fFlagBuildExperiencePromptFailureTelemetry (copy), var4 (ref), localizationStringsModule (copy), t_1 (copy), sendBuildExperienceEventModule (copy), var6 (write), p5 (ref)
				local var7 = resolvePromptFailure(p9, var5.getSetupError(false))
				
				if var7 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var7.errorCode,
						isContentPolicy = var7.isContentPolicy,
						setupStage = var7.setupStage,
						universeId = universeId,
						placeId = p3.placeId
					})
					local var8 = getPromptFailureTelemetryParameters(var7)
					
					if fFlagBuildExperiencePromptFailureTelemetry and var4 ~= nil then
						local requestFailure = var7.requestFailure
						
						if requestFailure ~= nil then
							local CHAT_POLICY_REJECTION
							var8.failureKind = requestFailure.kind
							
							if requestFailure.httpStatusCode ~= nil then
								var8.httpStatusCode = tostring(requestFailure.httpStatusCode)
							end
						end
						if var7.isContentPolicy then
							CHAT_POLICY_REJECTION = localizationStringsModule.CHAT_POLICY_REJECTION
						elseif var7.setupStage == "missing_project" then
							CHAT_POLICY_REJECTION = localizationStringsModule.CHAT_MISSING_PROJECT
						elseif var7.errorCode ~= nil then
							local errorCode = t_1[var7.errorCode]
							CHAT_POLICY_REJECTION = if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
						end
						var8.errorCopyKey = CHAT_POLICY_REJECTION
						
						for i, v in var4.getLifecycleParameters() do
							var8[i] = v
						end
					end
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p3.placeId,
						conversationId = p3.getCasSessionId()
					}, var8)
				elseif fFlagBuildExperiencePromptFailureTelemetry and var4 ~= nil and p9 ~= nil then
					local var9 = if p9.status ~= "failed" then p9.stopReason == "error" else true
					
					if var9 then
						local t = { status = p9.status }
						
						if p9.stopReason ~= nil then
							t.stopReason = p9.stopReason
						end
						if p9.errorCode ~= nil then
							t.errorCode = tostring(p9.errorCode)
						end
						var9 = t
						
						for i, v in var4.getLifecycleParameters() do
							var9[i] = v
						end
						sendBuildExperienceEventModule("AGENT_TURN_FAILED", {
							universeId = universeId,
							placeId = p3.placeId,
							conversationId = p3.getCasSessionId()
						}, var9)
					end
				end
				if fFlagBuildExperiencePromptFailureTelemetry and var4 ~= nil then
					local var10 = var4
					
					if var6 ~= nil then
						var6()
						var6 = nil
					end
					var10.finish()
				end
				p5(var7)
			end
		})
		
		return {
			getOptimisticLocalTools = var3.getOptimisticLocalTools,
			getLocalToolActions = var3.getLocalToolActions,
			getSetupErrorText = function(value)
				-- upvalues: var5 (write), localizationStringsModule (copy), t_1 (copy)
				local setupError = var5.getSetupError(value)
				
				if setupError == nil then
					return nil
				end
				local t = {
					isContentPolicy = false,
					errorCode = setupError.errorCode,
					setupStage = setupError.stage
				}
				
				if t.isContentPolicy then
					return localizationStringsModule.CHAT_POLICY_REJECTION
				elseif t.setupStage == "missing_project" then
					return localizationStringsModule.CHAT_MISSING_PROJECT
				elseif t.errorCode ~= nil then
					local errorCode = t_1[t.errorCode]
					
					return if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
				end
			end,
			start = function()
				-- upvalues: fFlagBuildExperiencePromptFailureTelemetry (copy), var4 (ref), var6 (write), trackPromptActivity (copy), var5 (write), var3 (ref)
				if fFlagBuildExperiencePromptFailureTelemetry and var4 ~= nil then
					var4.start()
					
					if var6 == nil then
						var6 = trackPromptActivity(var5, var4, var3.getOptimisticLocalTools)
					end
				end
				var5.start()
			end,
			stop = function()
				-- upvalues: var3 (ref), var5 (write)
				var3.stopPending()
				var5.stop()
			end,
			reportUserStop = if fFlagBuildExperiencePromptFailureTelemetry and var4 ~= nil then var4.reportUserStop else nil,
			detach = if fFlagBuildExperiencePromptFailureTelemetry and var4 ~= nil then function()
				-- upvalues: var3 (ref), var4 (ref), var6 (write)
				var3.stopPending()
				
				if var6 ~= nil then
					var6()
					var6 = nil
				end
				var4.finish()
			end else var3.stopPending,
			syncFromTurnState = var3.syncFromTurnState,
			trySubmitComposerText = var3.trySubmitComposerText,
			trySubmitAnswerText = var3.trySubmitAnswerText
		}
	end,
	createResumedAssistantTurn = function(p10, p11, p12, p13, p14, p15)
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), fFlagBuildExperiencePromptFailureTelemetry (ref), sendBuildExperienceEventModule (ref)
		local var11 = createLocalToolControllers(p10, p14, p15)
		local var12 = signalsModule.createSignal(nil)
		local var13 = false
		local var14 = false
		local var15 = nil
		local var16 = nil
		
		local function _()
			-- upvalues: var16 (write), var15 (write)
			if var16 ~= nil then
				var16()
				var16 = nil
			end
			if var15 ~= nil then
				var15()
				var15 = nil
			end
		end
		
		local function finish()
			-- upvalues: var14 (write), var16 (write), var15 (write), fFlagBuildExperiencePromptFailureTelemetry (copy), p11 (ref), sendBuildExperienceEventModule (copy), p10 (ref), p12 (ref)
			if var14 then return end
			var14 = true
			
			if var16 ~= nil then
				var16()
				var16 = nil
			end
			if var15 ~= nil then
				var15()
				var15 = nil
			end
			if fFlagBuildExperiencePromptFailureTelemetry then
				local var17 = p11.state(false)
				local var18 = if var17.status ~= "failed" then var17.stopReason == "error" else true
				
				if var18 and var17.requestId == nil then
					local t = { status = var17.status }
					
					if var17.stopReason ~= nil then
						t.stopReason = var17.stopReason
					end
					if var17.errorCode ~= nil then
						t.errorCode = tostring(var17.errorCode)
					end
					var18 = t
					var18.isResumedTurn = "true"
					sendBuildExperienceEventModule("AGENT_TURN_FAILED", {
						universeId = p10.universeId,
						placeId = p10.placeId,
						conversationId = p10.getCasSessionId()
					}, var18)
				end
			end
			p12(nil)
		end
		
		local var17 = false
		
		return {
			getOptimisticLocalTools = var11.getOptimisticLocalTools,
			getLocalToolActions = var11.getLocalToolActions,
			getSetupErrorText = var12,
			start = function()
				-- upvalues: var13 (write), sendBuildExperienceEventModule (copy), p10 (ref), p13 (ref), var15 (write), var16 (write), signalsModule (copy), p11 (ref), finish (ref)
				if var13 then return end
				var13 = true
				local t = {
					onDroppedChatMessage = function(p16)
						-- upvalues: sendBuildExperienceEventModule (copy), p10 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p10.universeId,
							placeId = p10.placeId,
							conversationId = p10.getCasSessionId(),
							messageId = p16
						})
					end
				}
				
				if p13 ~= nil then
					t.afterSequenceId = p13
				end
				var15 = p10.startPollingActiveTurn(t)
				var16 = signalsModule.createEffect(function(p16)
					-- upvalues: p11 (copy), finish (copy)
					if p11.state(p16).isDone then
						finish()
					end
				end)
			end,
			stop = function()
				-- upvalues: var14 (write), var16 (write), var15 (write), var11 (ref), p11 (ref)
				var14 = true
				
				if var16 ~= nil then
					var16()
					var16 = nil
				end
				if var15 ~= nil then
					var15()
					var15 = nil
				end
				var11.stopPending()
				p11.cancel()
			end,
			reportUserStop = if fFlagBuildExperiencePromptFailureTelemetry then function()
				-- upvalues: var14 (write), var17 (write), sendBuildExperienceEventModule (copy), p10 (ref)
				if var14 or var17 then
					return
				end
				var17 = true
				sendBuildExperienceEventModule("SEND_PROMPT_STOPPED", {
					universeId = p10.universeId,
					placeId = p10.placeId,
					conversationId = p10.getCasSessionId()
				}, { isResumedTurn = "true" })
			end else nil,
			detach = function()
				-- upvalues: var14 (write), var16 (write), var15 (write), var11 (ref)
				var14 = true
				
				if var16 ~= nil then
					var16()
					var16 = nil
				end
				if var15 ~= nil then
					var15()
					var15 = nil
				end
				var11.stopPending()
			end,
			syncFromTurnState = var11.syncFromTurnState,
			trySubmitComposerText = var11.trySubmitComposerText,
			trySubmitAnswerText = var11.trySubmitAnswerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}