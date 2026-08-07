local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local signalsModule = require(parent.Signals)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.chatTypes)
local askUserControllerModule = require(script.Parent.askUserController)
local clientLogsControllerModule = require(script.Parent.clientLogsController)
local localToolOverlayModule = require(script.Parent.localToolOverlay)
local proposePlanControllerModule = require(script.Parent.proposePlanController)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local debug = creatorAgentChatModule.debug
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

local function getPromptFailureComposerError(p0) --[[ line: 78 ]]
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	if p0.isContentPolicy then
		return localizationStringsModule.CHAT_POLICY_REJECTION
	elseif p0.setupStage == "missing_project" then
		return localizationStringsModule.CHAT_MISSING_PROJECT
	elseif p0.errorCode ~= nil then
		local errorCode = t_1[p0.errorCode]
		
		return if errorCode == nil then localizationStringsModule.CHAT_DEFAULT_FAILURE else errorCode
	end
end

local function getToolResultFailureComposerError(p1) --[[ line: 94 ]]
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

local function _(p2) --[[ line: 103 | named "getOutOfCreditsReason" ]]
	-- upvalues: t (ref)
	return if p2 == nil then nil else t[p2]
end

local function resolvePromptFailure(p3, p4) --[[ line: 112 ]]
	-- upvalues: errorCodes (ref), t (ref), forbidden (ref)
	if p3 == nil then
		return if p4 == nil then nil else {
			outOfCreditsReason = nil,
			isContentPolicy = false,
			errorCode = p4.errorCode,
			setupStage = p4.stage
		}
	elseif p3.status ~= "failed" then
		return nil
	end
	local var18
	local t_1 = { errorCode = p3.errorCode }
	
	if p3.errorCode == errorCodes.OutOfCredits then
		local error = p3.error
		var18 = if error == nil then nil else t[error]
	else
		var18 = nil
	end
	t_1.outOfCreditsReason = var18
	t_1.isContentPolicy = p3.errorCode == forbidden
	
	return t_1
end

local function getPromptFailureTelemetryParameters(p5) --[[ line: 136 ]]
	local t = { isContentPolicy = tostring(p5.isContentPolicy) }
	
	if p5.errorCode ~= nil then
		t.errorCode = tostring(p5.errorCode)
	end
	if p5.outOfCreditsReason ~= nil then
		t.outOfCreditsReason = p5.outOfCreditsReason
	end
	if p5.setupStage ~= nil then
		t.setupStage = p5.setupStage
	end
	return t
end

local _ = function(value) --[[ line: 152 | named "formatSetupErrorMessage" ]]
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

local function createLocalToolControllers(p6, p7) --[[ line: 163 ]]
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref)
	local t = {}
	local var22 = localToolOverlayModule()
	local var23 = askUserControllerModule(p6, t, var22, p7)
	local var24 = proposePlanControllerModule(p6, t, var22, p7)
	local var25 = clientLogsControllerModule(p6, t)
	
	return {
		getOptimisticLocalTools = var22.getOptimisticLocalTools,
		getLocalToolActions = var22.getLocalToolActions,
		hasDisplayedAnswerStack = var23.hasDisplayedAnswerStack,
		syncFromTurnState = function(p8) --[[ line: 178 ]]
			-- upvalues: var23 (ref), var24 (ref), var25 (ref)
			var23.syncAnswerStack(p8)
			var24.syncPlanProposal(p8)
			var25.syncClientLogsRequest(p8)
		end,
		trySubmitComposerText = function(p9) --[[ line: 183 ]]
			-- upvalues: var23 (ref), var24 (ref)
			return var23.trySubmitComposerText(p9) or var24.trySubmitComposerText(p9)
		end,
		stopPending = function() --[[ line: 186 ]]
			-- upvalues: var23 (ref), var24 (ref)
			var23.stopPendingAnswer()
			var24.stopPendingPlan()
		end
	}
end

return {
	createLiveAssistantTurn = function(p10, p11, p12, p13) --[[ line: 195 ]]
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), sendBuildExperienceEventModule (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var26 = createLocalToolControllers(p10, p13)
		local universeId = p10.universeId
		local var27 = nil
		var27 = p10.sendPrompt({
			prompt = p11,
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
			onDroppedChatMessage = function(p14) --[[ line: 219 ]]
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p10 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p10.placeId,
					conversationId = p10.getCasSessionId(),
					messageId = p14
				})
			end,
			onCompleted = function(p15) --[[ line: 233 ]]
				-- upvalues: resolvePromptFailure (copy), var27 (write), debug (copy), universeId (ref), p10 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p12 (ref)
				local var29 = resolvePromptFailure(p15, var27.getSetupError(false))
				
				if var29 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var29.errorCode,
						isContentPolicy = var29.isContentPolicy,
						setupStage = var29.setupStage,
						universeId = universeId,
						placeId = p10.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p10.placeId,
						conversationId = p10.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var29))
				end
				p12(var29)
			end
		})
		
		local function getSetupErrorText(value) --[[ line: 256 ]]
			-- upvalues: var27 (write), localizationStringsModule (copy), t_1 (copy)
			local setupError = var27.getSetupError(value)
			
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
		end
		
		debug.log("info", "creator agent local tools registered for prompt", {
			universeId = universeId,
			placeId = p10.placeId,
			toolName = studioAskUserTool.TOOL_NAME,
			planToolName = studioProposePlanTool.TOOL_NAME,
			logsToolName = studioClientLogsTool.TOOL_NAME
		})
		
		return {
			getOptimisticLocalTools = var26.getOptimisticLocalTools,
			getLocalToolActions = var26.getLocalToolActions,
			getSetupErrorText = getSetupErrorText,
			start = function() --[[ line: 269 ]]
				-- upvalues: var27 (write)
				var27.start()
			end,
			stop = function() --[[ line: 275 ]]
				-- upvalues: var26 (ref), var27 (write)
				var26.stopPending()
				var27.stop()
			end,
			detach = var26.stopPending,
			syncFromTurnState = var26.syncFromTurnState,
			trySubmitComposerText = var26.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p16, p17, p18, p19, p20) --[[ line: 292 ]]
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var32 = createLocalToolControllers(p16, p20)
		local var33 = signalsModule.createSignal(nil)
		local var34 = false
		local var35 = false
		local var36 = nil
		local var37 = nil
		
		local function _() --[[ line: 313 | named "cleanupObservers" ]]
			-- upvalues: var37 (write), var36 (write)
			if var37 ~= nil then
				var37()
				var37 = nil
			end
			if var36 ~= nil then
				var36()
				var36 = nil
			end
		end
		
		local _ = function() --[[ line: 324 | named "finish" ]]
			-- upvalues: var35 (write), var37 (write), var36 (write), p18 (ref)
			if var35 then return end
			var35 = true
			
			if var37 ~= nil then
				var37()
				var37 = nil
			end
			if var36 ~= nil then
				var36()
				var36 = nil
			end
			p18(nil)
		end
		
		return {
			getOptimisticLocalTools = var32.getOptimisticLocalTools,
			getLocalToolActions = var32.getLocalToolActions,
			getSetupErrorText = var33,
			start = function() --[[ line: 335 ]]
				-- upvalues: var34 (write), sendBuildExperienceEventModule (copy), p16 (ref), p19 (ref), var36 (write), var37 (write), signalsModule (copy), p17 (ref), var35 (write), p18 (ref)
				if var34 then return end
				var34 = true
				local t = {
					onDroppedChatMessage = function(p21) --[[ line: 341 ]]
						-- upvalues: sendBuildExperienceEventModule (copy), p16 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p16.universeId,
							placeId = p16.placeId,
							conversationId = p16.getCasSessionId(),
							messageId = p21
						})
					end
				}
				
				if p19 ~= nil then
					t.afterSequenceId = p19
				end
				var36 = p16.startPollingActiveTurn(t)
				var37 = signalsModule.createEffect(function(p22) --[[ line: 355 ]]
					-- upvalues: p17 (copy), var35 (copy), var37 (copy), var36 (copy), p18 (copy)
					if p17.state(p22).isDone then
						if var35 then return end
						var35 = true
						
						if var37 ~= nil then
							var37()
							var37 = nil
						end
						if var36 ~= nil then
							var36()
							var36 = nil
						end
						p18(nil)
					end
				end)
			end,
			stop = function() --[[ line: 367 ]]
				-- upvalues: var35 (write), var37 (write), var36 (write), var32 (ref), p17 (ref)
				var35 = true
				
				if var37 ~= nil then
					var37()
					var37 = nil
				end
				if var36 ~= nil then
					var36()
					var36 = nil
				end
				var32.stopPending()
				p17.cancel()
			end,
			detach = function() --[[ line: 373 ]]
				-- upvalues: var35 (write), var37 (write), var36 (write), var32 (ref)
				var35 = true
				
				if var37 ~= nil then
					var37()
					var37 = nil
				end
				if var36 ~= nil then
					var36()
					var36 = nil
				end
				var32.stopPending()
			end,
			syncFromTurnState = var32.syncFromTurnState,
			trySubmitComposerText = var32.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}