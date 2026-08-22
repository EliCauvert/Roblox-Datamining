local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceClientDataModelTools = sharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local _ = require(script.Parent.chatTypes)
local askUserControllerModule = require(script.Parent.askUserController)
local var6 = if fFlagBuildExperienceClientDataModelTools then require(script.Parent.clientDataModelController) else nil
local clientLogsControllerModule = require(script.Parent.clientLogsController)
local localToolOverlayModule = require(script.Parent.localToolOverlay)
local proposePlanControllerModule = require(script.Parent.proposePlanController)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioClientDataModelTools = creatorAgentChatModule.StudioClientDataModelTools
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

local function getPromptFailureComposerError(p0) --[[ line: 86 ]]
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

local function getToolResultFailureComposerError(p1) --[[ line: 102 ]]
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

local function _(p2) --[[ line: 111 | named "getOutOfCreditsReason" ]]
	-- upvalues: t (ref)
	return if p2 == nil then nil else t[p2]
end

local function resolvePromptFailure(p3, p4) --[[ line: 120 ]]
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
	local var21
	local t_1 = { errorCode = p3.errorCode }
	
	if p3.errorCode == errorCodes.OutOfCredits then
		local error = p3.error
		var21 = if error == nil then nil else t[error]
	else
		var21 = nil
	end
	t_1.outOfCreditsReason = var21
	t_1.isContentPolicy = p3.errorCode == forbidden
	
	return t_1
end

local function getPromptFailureTelemetryParameters(p5) --[[ line: 144 ]]
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

local _ = function(value) --[[ line: 160 | named "formatSetupErrorMessage" ]]
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

local function createLocalToolControllers(p6, p7, p8) --[[ line: 171 ]]
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref), var6 (ref)
	local t = {}
	local var25 = localToolOverlayModule()
	local var26 = askUserControllerModule(p6, t, var25, p7)
	local var27 = proposePlanControllerModule(p6, t, var25, p7)
	local var28 = clientLogsControllerModule(p6, t, p8)
	local var29 = if var6 ~= nil then nil else var6(p6, t, p8)
	
	return {
		getOptimisticLocalTools = var25.getOptimisticLocalTools,
		getLocalToolActions = var25.getLocalToolActions,
		hasDisplayedAnswerStack = var26.hasDisplayedAnswerStack,
		syncFromTurnState = function(p9) --[[ line: 191 ]]
			-- upvalues: var26 (ref), var27 (ref), var28 (ref), var29 (ref)
			var26.syncAnswerStack(p9)
			var27.syncPlanProposal(p9)
			var28.syncClientLogsRequest(p9)
			
			if var29 ~= nil then
				var29.syncClientDataModelRequests(p9)
			end
		end,
		trySubmitComposerText = function(p10) --[[ line: 199 ]]
			-- upvalues: var26 (ref), var27 (ref)
			return var26.trySubmitComposerText(p10) or var27.trySubmitComposerText(p10)
		end,
		stopPending = function() --[[ line: 202 ]]
			-- upvalues: var26 (ref), var27 (ref), var29 (ref)
			var26.stopPendingAnswer()
			var27.stopPendingPlan()
			
			if var29 ~= nil then
				var29.revokePending()
			end
		end
	}
end

return {
	createLiveAssistantTurn = function(p11, p12, p13, p14, p15) --[[ line: 214 ]]
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagBuildExperienceClientDataModelTools (ref), studioClientDataModelTools (ref), fFlagEnableTeamTestLua (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var30 = createLocalToolControllers(p11, p14, p15)
		local universeId = p11.universeId
		local list = {
			studioAskUserTool.LOCAL_TOOL_DEFINITION,
			studioProposePlanTool.LOCAL_TOOL_DEFINITION,
			studioClientLogsTool.LOCAL_TOOL_DEFINITION
		}
		
		if fFlagBuildExperienceClientDataModelTools then
			table.insert(list, studioClientDataModelTools.SEARCH_LOCAL_TOOL_DEFINITION)
			table.insert(list, studioClientDataModelTools.INSPECT_LOCAL_TOOL_DEFINITION)
		end
		local var32 = nil
		var32 = p11.sendPrompt({
			prompt = p12,
			promptMeta = {
				_roblox = {
					application = if fFlagBuildExperienceClientDataModelTools then "build-on-mobile" else nil,
					localTools = list,
					providerConfig = { universeId = universeId },
					teamTestEnabled = fFlagEnableTeamTestLua
				}
			},
			onDroppedChatMessage = function(p16) --[[ line: 245 ]]
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p11 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p11.placeId,
					conversationId = p11.getCasSessionId(),
					messageId = p16
				})
			end,
			onReceived = if fFlagBuildEventsUpdate1Module then function(p17) --[[ line: 254 | named "onReceived" ]]
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p11 (ref)
				sendBuildExperienceEventModule("SEND_PROMPT_RECIEVED", {
					universeId = universeId,
					placeId = p11.placeId,
					conversationId = p11.getCasSessionId(),
					turnId = p17
				})
			end else nil,
			onCompleted = function(p18) --[[ line: 269 ]]
				-- upvalues: resolvePromptFailure (copy), var32 (write), debug (copy), universeId (ref), p11 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p13 (ref)
				local var33 = resolvePromptFailure(p18, var32.getSetupError(false))
				
				if var33 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var33.errorCode,
						isContentPolicy = var33.isContentPolicy,
						setupStage = var33.setupStage,
						universeId = universeId,
						placeId = p11.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p11.placeId,
						conversationId = p11.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var33))
				end
				p13(var33)
			end
		})
		
		return {
			getOptimisticLocalTools = var30.getOptimisticLocalTools,
			getLocalToolActions = var30.getLocalToolActions,
			getSetupErrorText = function(value) --[[ line: 292 ]]
				-- upvalues: var32 (write), localizationStringsModule (copy), t_1 (copy)
				local setupError = var32.getSetupError(value)
				
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
			start = function() --[[ line: 297 ]]
				-- upvalues: var32 (write)
				var32.start()
			end,
			stop = function() --[[ line: 303 ]]
				-- upvalues: var30 (ref), var32 (write)
				var30.stopPending()
				var32.stop()
			end,
			detach = var30.stopPending,
			syncFromTurnState = var30.syncFromTurnState,
			trySubmitComposerText = var30.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p19, p20, p21, p22, p23, p24) --[[ line: 320 ]]
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var36 = createLocalToolControllers(p19, p23, p24)
		local var37 = signalsModule.createSignal(nil)
		local var38 = false
		local var39 = false
		local var40 = nil
		local var41 = nil
		
		local function _() --[[ line: 342 | named "cleanupObservers" ]]
			-- upvalues: var41 (write), var40 (write)
			if var41 ~= nil then
				var41()
				var41 = nil
			end
			if var40 ~= nil then
				var40()
				var40 = nil
			end
		end
		
		local _ = function() --[[ line: 353 | named "finish" ]]
			-- upvalues: var39 (write), var41 (write), var40 (write), p21 (ref)
			if var39 then return end
			var39 = true
			
			if var41 ~= nil then
				var41()
				var41 = nil
			end
			if var40 ~= nil then
				var40()
				var40 = nil
			end
			p21(nil)
		end
		
		return {
			getOptimisticLocalTools = var36.getOptimisticLocalTools,
			getLocalToolActions = var36.getLocalToolActions,
			getSetupErrorText = var37,
			start = function() --[[ line: 364 ]]
				-- upvalues: var38 (write), sendBuildExperienceEventModule (copy), p19 (ref), p22 (ref), var40 (write), var41 (write), signalsModule (copy), p20 (ref), var39 (write), p21 (ref)
				if var38 then return end
				var38 = true
				local t = {
					onDroppedChatMessage = function(p25) --[[ line: 370 ]]
						-- upvalues: sendBuildExperienceEventModule (copy), p19 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p19.universeId,
							placeId = p19.placeId,
							conversationId = p19.getCasSessionId(),
							messageId = p25
						})
					end
				}
				
				if p22 ~= nil then
					t.afterSequenceId = p22
				end
				var40 = p19.startPollingActiveTurn(t)
				var41 = signalsModule.createEffect(function(p26) --[[ line: 384 ]]
					-- upvalues: p20 (copy), var39 (copy), var41 (copy), var40 (copy), p21 (copy)
					if p20.state(p26).isDone then
						if var39 then return end
						var39 = true
						
						if var41 ~= nil then
							var41()
							var41 = nil
						end
						if var40 ~= nil then
							var40()
							var40 = nil
						end
						p21(nil)
					end
				end)
			end,
			stop = function() --[[ line: 396 ]]
				-- upvalues: var39 (write), var41 (write), var40 (write), var36 (ref), p20 (ref)
				var39 = true
				
				if var41 ~= nil then
					var41()
					var41 = nil
				end
				if var40 ~= nil then
					var40()
					var40 = nil
				end
				var36.stopPending()
				p20.cancel()
			end,
			detach = function() --[[ line: 402 ]]
				-- upvalues: var39 (write), var41 (write), var40 (write), var36 (ref)
				var39 = true
				
				if var41 ~= nil then
					var41()
					var41 = nil
				end
				if var40 ~= nil then
					var40()
					var40 = nil
				end
				var36.stopPending()
			end,
			syncFromTurnState = var36.syncFromTurnState,
			trySubmitComposerText = var36.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}