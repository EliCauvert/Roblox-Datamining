local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local sharedFlagsModule = require(parent.SharedFlags)
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
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
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

local function getPromptFailureComposerError(p0) --[[ line: 80 ]]
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

local function getToolResultFailureComposerError(p1) --[[ line: 96 ]]
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

local function _(p2) --[[ line: 105 | named "getOutOfCreditsReason" ]]
	-- upvalues: t (ref)
	return if p2 == nil then nil else t[p2]
end

local function resolvePromptFailure(p3, p4) --[[ line: 114 ]]
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
	local var19
	local t_1 = { errorCode = p3.errorCode }
	
	if p3.errorCode == errorCodes.OutOfCredits then
		local error = p3.error
		var19 = if error == nil then nil else t[error]
	else
		var19 = nil
	end
	t_1.outOfCreditsReason = var19
	t_1.isContentPolicy = p3.errorCode == forbidden
	
	return t_1
end

local function getPromptFailureTelemetryParameters(p5) --[[ line: 138 ]]
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

local _ = function(value) --[[ line: 154 | named "formatSetupErrorMessage" ]]
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

local function createLocalToolControllers(p6, p7) --[[ line: 165 ]]
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref)
	local t = {}
	local var23 = localToolOverlayModule()
	local var24 = askUserControllerModule(p6, t, var23, p7)
	local var25 = proposePlanControllerModule(p6, t, var23, p7)
	local var26 = clientLogsControllerModule(p6, t)
	
	return {
		getOptimisticLocalTools = var23.getOptimisticLocalTools,
		getLocalToolActions = var23.getLocalToolActions,
		hasDisplayedAnswerStack = var24.hasDisplayedAnswerStack,
		syncFromTurnState = function(p8) --[[ line: 180 ]]
			-- upvalues: var24 (ref), var25 (ref), var26 (ref)
			var24.syncAnswerStack(p8)
			var25.syncPlanProposal(p8)
			var26.syncClientLogsRequest(p8)
		end,
		trySubmitComposerText = function(p9) --[[ line: 185 ]]
			-- upvalues: var24 (ref), var25 (ref)
			return var24.trySubmitComposerText(p9) or var25.trySubmitComposerText(p9)
		end,
		stopPending = function() --[[ line: 188 ]]
			-- upvalues: var24 (ref), var25 (ref)
			var24.stopPendingAnswer()
			var25.stopPendingPlan()
		end
	}
end

return {
	createLiveAssistantTurn = function(p10, p11, p12, p13) --[[ line: 197 ]]
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagEnableTeamTestLua (ref), sendBuildExperienceEventModule (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var27 = createLocalToolControllers(p10, p13)
		local universeId = p10.universeId
		local var28 = nil
		var28 = p10.sendPrompt({
			prompt = p11,
			promptMeta = {
				_roblox = {
					localTools = {
						studioAskUserTool.LOCAL_TOOL_DEFINITION,
						studioProposePlanTool.LOCAL_TOOL_DEFINITION,
						studioClientLogsTool.LOCAL_TOOL_DEFINITION
					},
					providerConfig = { universeId = universeId },
					teamTestEnabled = fFlagEnableTeamTestLua
				}
			},
			onDroppedChatMessage = function(p14) --[[ line: 222 ]]
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p10 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p10.placeId,
					conversationId = p10.getCasSessionId(),
					messageId = p14
				})
			end,
			onCompleted = function(p15) --[[ line: 236 ]]
				-- upvalues: resolvePromptFailure (copy), var28 (write), debug (copy), universeId (ref), p10 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p12 (ref)
				local var30 = resolvePromptFailure(p15, var28.getSetupError(false))
				
				if var30 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var30.errorCode,
						isContentPolicy = var30.isContentPolicy,
						setupStage = var30.setupStage,
						universeId = universeId,
						placeId = p10.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p10.placeId,
						conversationId = p10.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var30))
				end
				p12(var30)
			end
		})
		
		local function getSetupErrorText(value) --[[ line: 259 ]]
			-- upvalues: var28 (write), localizationStringsModule (copy), t_1 (copy)
			local setupError = var28.getSetupError(value)
			
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
			getOptimisticLocalTools = var27.getOptimisticLocalTools,
			getLocalToolActions = var27.getLocalToolActions,
			getSetupErrorText = getSetupErrorText,
			start = function() --[[ line: 272 ]]
				-- upvalues: var28 (write)
				var28.start()
			end,
			stop = function() --[[ line: 278 ]]
				-- upvalues: var27 (ref), var28 (write)
				var27.stopPending()
				var28.stop()
			end,
			detach = var27.stopPending,
			syncFromTurnState = var27.syncFromTurnState,
			trySubmitComposerText = var27.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p16, p17, p18, p19, p20) --[[ line: 295 ]]
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var33 = createLocalToolControllers(p16, p20)
		local var34 = signalsModule.createSignal(nil)
		local var35 = false
		local var36 = false
		local var37 = nil
		local var38 = nil
		
		local function _() --[[ line: 316 | named "cleanupObservers" ]]
			-- upvalues: var38 (write), var37 (write)
			if var38 ~= nil then
				var38()
				var38 = nil
			end
			if var37 ~= nil then
				var37()
				var37 = nil
			end
		end
		
		local _ = function() --[[ line: 327 | named "finish" ]]
			-- upvalues: var36 (write), var38 (write), var37 (write), p18 (ref)
			if var36 then return end
			var36 = true
			
			if var38 ~= nil then
				var38()
				var38 = nil
			end
			if var37 ~= nil then
				var37()
				var37 = nil
			end
			p18(nil)
		end
		
		return {
			getOptimisticLocalTools = var33.getOptimisticLocalTools,
			getLocalToolActions = var33.getLocalToolActions,
			getSetupErrorText = var34,
			start = function() --[[ line: 338 ]]
				-- upvalues: var35 (write), sendBuildExperienceEventModule (copy), p16 (ref), p19 (ref), var37 (write), var38 (write), signalsModule (copy), p17 (ref), var36 (write), p18 (ref)
				if var35 then return end
				var35 = true
				local t = {
					onDroppedChatMessage = function(p21) --[[ line: 344 ]]
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
				var37 = p16.startPollingActiveTurn(t)
				var38 = signalsModule.createEffect(function(p22) --[[ line: 358 ]]
					-- upvalues: p17 (copy), var36 (copy), var38 (copy), var37 (copy), p18 (copy)
					if p17.state(p22).isDone then
						if var36 then return end
						var36 = true
						
						if var38 ~= nil then
							var38()
							var38 = nil
						end
						if var37 ~= nil then
							var37()
							var37 = nil
						end
						p18(nil)
					end
				end)
			end,
			stop = function() --[[ line: 370 ]]
				-- upvalues: var36 (write), var38 (write), var37 (write), var33 (ref), p17 (ref)
				var36 = true
				
				if var38 ~= nil then
					var38()
					var38 = nil
				end
				if var37 ~= nil then
					var37()
					var37 = nil
				end
				var33.stopPending()
				p17.cancel()
			end,
			detach = function() --[[ line: 376 ]]
				-- upvalues: var36 (write), var38 (write), var37 (write), var33 (ref)
				var36 = true
				
				if var38 ~= nil then
					var38()
					var38 = nil
				end
				if var37 ~= nil then
					var37()
					var37 = nil
				end
				var33.stopPending()
			end,
			syncFromTurnState = var33.syncFromTurnState,
			trySubmitComposerText = var33.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}