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

local function getPromptFailureComposerError(p0) --[[ line: 85 ]]
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

local function getToolResultFailureComposerError(p1) --[[ line: 101 ]]
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

local function _(p2) --[[ line: 110 | named "getOutOfCreditsReason" ]]
	-- upvalues: t (ref)
	return if p2 == nil then nil else t[p2]
end

local function resolvePromptFailure(p3, p4) --[[ line: 119 ]]
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
	local var20
	local t_1 = { errorCode = p3.errorCode }
	
	if p3.errorCode == errorCodes.OutOfCredits then
		local error = p3.error
		var20 = if error == nil then nil else t[error]
	else
		var20 = nil
	end
	t_1.outOfCreditsReason = var20
	t_1.isContentPolicy = p3.errorCode == forbidden
	
	return t_1
end

local function getPromptFailureTelemetryParameters(p5) --[[ line: 143 ]]
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

local _ = function(value) --[[ line: 159 | named "formatSetupErrorMessage" ]]
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

local function createLocalToolControllers(p6, p7, p8) --[[ line: 170 ]]
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref), var6 (ref)
	local t = {}
	local var24 = localToolOverlayModule()
	local var25 = askUserControllerModule(p6, t, var24, p7)
	local var26 = proposePlanControllerModule(p6, t, var24, p7)
	local var27 = clientLogsControllerModule(p6, t, p8)
	local var28 = if var6 ~= nil then nil else var6(p6, t, p8)
	
	return {
		getOptimisticLocalTools = var24.getOptimisticLocalTools,
		getLocalToolActions = var24.getLocalToolActions,
		hasDisplayedAnswerStack = var25.hasDisplayedAnswerStack,
		syncFromTurnState = function(p9) --[[ line: 190 ]]
			-- upvalues: var25 (ref), var26 (ref), var27 (ref), var28 (ref)
			var25.syncAnswerStack(p9)
			var26.syncPlanProposal(p9)
			var27.syncClientLogsRequest(p9)
			
			if var28 ~= nil then
				var28.syncClientDataModelRequests(p9)
			end
		end,
		trySubmitComposerText = function(p10) --[[ line: 198 ]]
			-- upvalues: var25 (ref), var26 (ref)
			return var25.trySubmitComposerText(p10) or var26.trySubmitComposerText(p10)
		end,
		stopPending = function() --[[ line: 201 ]]
			-- upvalues: var25 (ref), var26 (ref), var28 (ref)
			var25.stopPendingAnswer()
			var26.stopPendingPlan()
			
			if var28 ~= nil then
				var28.revokePending()
			end
		end
	}
end

return {
	createLiveAssistantTurn = function(p11, p12, p13, p14, p15) --[[ line: 213 ]]
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagBuildExperienceClientDataModelTools (ref), studioClientDataModelTools (ref), fFlagEnableTeamTestLua (ref), sendBuildExperienceEventModule (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var29 = createLocalToolControllers(p11, p14, p15)
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
		local var31 = nil
		var31 = p11.sendPrompt({
			prompt = p12,
			promptMeta = {
				_roblox = {
					application = if fFlagBuildExperienceClientDataModelTools then "build-on-mobile" else nil,
					localTools = list,
					providerConfig = { universeId = universeId },
					teamTestEnabled = fFlagEnableTeamTestLua
				}
			},
			onDroppedChatMessage = function(p16) --[[ line: 244 ]]
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p11 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p11.placeId,
					conversationId = p11.getCasSessionId(),
					messageId = p16
				})
			end,
			onCompleted = function(p17) --[[ line: 258 ]]
				-- upvalues: resolvePromptFailure (copy), var31 (write), debug (copy), universeId (ref), p11 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p13 (ref)
				local var32 = resolvePromptFailure(p17, var31.getSetupError(false))
				
				if var32 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var32.errorCode,
						isContentPolicy = var32.isContentPolicy,
						setupStage = var32.setupStage,
						universeId = universeId,
						placeId = p11.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p11.placeId,
						conversationId = p11.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var32))
				end
				p13(var32)
			end
		})
		
		return {
			getOptimisticLocalTools = var29.getOptimisticLocalTools,
			getLocalToolActions = var29.getLocalToolActions,
			getSetupErrorText = function(value) --[[ line: 281 ]]
				-- upvalues: var31 (write), localizationStringsModule (copy), t_1 (copy)
				local setupError = var31.getSetupError(value)
				
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
			start = function() --[[ line: 286 ]]
				-- upvalues: var31 (write)
				var31.start()
			end,
			stop = function() --[[ line: 292 ]]
				-- upvalues: var29 (ref), var31 (write)
				var29.stopPending()
				var31.stop()
			end,
			detach = var29.stopPending,
			syncFromTurnState = var29.syncFromTurnState,
			trySubmitComposerText = var29.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p18, p19, p20, p21, p22, p23) --[[ line: 309 ]]
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var35 = createLocalToolControllers(p18, p22, p23)
		local var36 = signalsModule.createSignal(nil)
		local var37 = false
		local var38 = false
		local var39 = nil
		local var40 = nil
		
		local function _() --[[ line: 331 | named "cleanupObservers" ]]
			-- upvalues: var40 (write), var39 (write)
			if var40 ~= nil then
				var40()
				var40 = nil
			end
			if var39 ~= nil then
				var39()
				var39 = nil
			end
		end
		
		local _ = function() --[[ line: 342 | named "finish" ]]
			-- upvalues: var38 (write), var40 (write), var39 (write), p20 (ref)
			if var38 then return end
			var38 = true
			
			if var40 ~= nil then
				var40()
				var40 = nil
			end
			if var39 ~= nil then
				var39()
				var39 = nil
			end
			p20(nil)
		end
		
		return {
			getOptimisticLocalTools = var35.getOptimisticLocalTools,
			getLocalToolActions = var35.getLocalToolActions,
			getSetupErrorText = var36,
			start = function() --[[ line: 353 ]]
				-- upvalues: var37 (write), sendBuildExperienceEventModule (copy), p18 (ref), p21 (ref), var39 (write), var40 (write), signalsModule (copy), p19 (ref), var38 (write), p20 (ref)
				if var37 then return end
				var37 = true
				local t = {
					onDroppedChatMessage = function(p24) --[[ line: 359 ]]
						-- upvalues: sendBuildExperienceEventModule (copy), p18 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p18.universeId,
							placeId = p18.placeId,
							conversationId = p18.getCasSessionId(),
							messageId = p24
						})
					end
				}
				
				if p21 ~= nil then
					t.afterSequenceId = p21
				end
				var39 = p18.startPollingActiveTurn(t)
				var40 = signalsModule.createEffect(function(p25) --[[ line: 373 ]]
					-- upvalues: p19 (copy), var38 (copy), var40 (copy), var39 (copy), p20 (copy)
					if p19.state(p25).isDone then
						if var38 then return end
						var38 = true
						
						if var40 ~= nil then
							var40()
							var40 = nil
						end
						if var39 ~= nil then
							var39()
							var39 = nil
						end
						p20(nil)
					end
				end)
			end,
			stop = function() --[[ line: 385 ]]
				-- upvalues: var38 (write), var40 (write), var39 (write), var35 (ref), p19 (ref)
				var38 = true
				
				if var40 ~= nil then
					var40()
					var40 = nil
				end
				if var39 ~= nil then
					var39()
					var39 = nil
				end
				var35.stopPending()
				p19.cancel()
			end,
			detach = function() --[[ line: 391 ]]
				-- upvalues: var38 (write), var40 (write), var39 (write), var35 (ref)
				var38 = true
				
				if var40 ~= nil then
					var40()
					var40 = nil
				end
				if var39 ~= nil then
					var39()
					var39 = nil
				end
				var35.stopPending()
			end,
			syncFromTurnState = var35.syncFromTurnState,
			trySubmitComposerText = var35.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}