local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceClientDataModelTools = sharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local _ = require(script.Parent.chatTypes)
local askUserControllerModule = require(script.Parent.askUserController)
local var1 = if fFlagBuildExperienceClientDataModelTools then require(script.Parent.clientDataModelController) else nil
local clientLogsControllerModule = require(script.Parent.clientLogsController)
local localToolOverlayModule = require(script.Parent.localToolOverlay)
local proposePlanControllerModule = require(script.Parent.proposePlanController)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
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
	-- upvalues: errorCodes (ref), t (ref), forbidden (ref)
	if p1 == nil then
		return if p2 == nil then nil else {
			outOfCreditsReason = nil,
			isContentPolicy = false,
			errorCode = p2.errorCode,
			setupStage = p2.stage
		}
	elseif p1.status ~= "failed" then
		return nil
	end
	local var1
	local t_1 = { errorCode = p1.errorCode }
	
	if p1.errorCode == errorCodes.OutOfCredits then
		local error = p1.error
		var1 = if error == nil then nil else t[error]
	else
		var1 = nil
	end
	t_1.outOfCreditsReason = var1
	t_1.isContentPolicy = p1.errorCode == forbidden
	
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

local function createLocalToolControllers(p1, p2, p3)
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref), var1 (ref)
	local t = {}
	local var1 = localToolOverlayModule()
	local var2 = askUserControllerModule(p1, t, var1, p2)
	local var3 = proposePlanControllerModule(p1, t, var1, p2)
	local var4 = clientLogsControllerModule(p1, t, p3)
	local var5 = if var1 ~= nil then nil else var1(p1, t, p3)
	
	return {
		getOptimisticLocalTools = var1.getOptimisticLocalTools,
		getLocalToolActions = var1.getLocalToolActions,
		hasDisplayedAnswerStack = var2.hasDisplayedAnswerStack,
		syncFromTurnState = function(p1)
			-- upvalues: var2 (ref), var3 (ref), var4 (ref), var5 (ref)
			var2.syncAnswerStack(p1)
			var3.syncPlanProposal(p1)
			var4.syncClientLogsRequest(p1)
			
			if var5 ~= nil then
				var5.syncClientDataModelRequests(p1)
			end
		end,
		trySubmitComposerText = function(p1)
			-- upvalues: var2 (ref), var3 (ref)
			return var2.trySubmitComposerText(p1) or var3.trySubmitComposerText(p1)
		end,
		stopPending = function()
			-- upvalues: var2 (ref), var3 (ref), var5 (ref)
			var2.stopPendingAnswer()
			var3.stopPendingPlan()
			
			if var5 ~= nil then
				var5.revokePending()
			end
		end
	}
end

return {
	createLiveAssistantTurn = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagBuildExperienceClientDataModelTools (ref), studioClientDataModelTools (ref), fFlagEnableTeamTestLua (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), fFlagBuildAgentRollbackModule (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var1 = createLocalToolControllers(p1, p4, p5)
		local universeId = p1.universeId
		local list = {
			studioAskUserTool.LOCAL_TOOL_DEFINITION,
			studioProposePlanTool.LOCAL_TOOL_DEFINITION,
			studioClientLogsTool.LOCAL_TOOL_DEFINITION
		}
		
		if fFlagBuildExperienceClientDataModelTools then
			table.insert(list, studioClientDataModelTools.SEARCH_LOCAL_TOOL_DEFINITION)
			table.insert(list, studioClientDataModelTools.INSPECT_LOCAL_TOOL_DEFINITION)
		end
		local var2 = nil
		var2 = p1.sendPrompt({
			prompt = p2,
			promptMeta = {
				_roblox = {
					application = if fFlagBuildExperienceClientDataModelTools then "build-on-mobile" else nil,
					localTools = list,
					providerConfig = { universeId = universeId },
					teamTestEnabled = fFlagEnableTeamTestLua
				}
			},
			onDroppedChatMessage = function(p1)
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p1 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p1.placeId,
					conversationId = p1.getCasSessionId(),
					messageId = p1
				})
			end,
			onReceived = if fFlagBuildEventsUpdate1Module or fFlagBuildAgentRollbackModule and p6 ~= nil then function(p1)
				-- upvalues: fFlagBuildEventsUpdate1Module (copy), sendBuildExperienceEventModule (copy), universeId (ref), p1 (ref), fFlagBuildAgentRollbackModule (copy), p6 (ref)
				if fFlagBuildEventsUpdate1Module then
					sendBuildExperienceEventModule("SEND_PROMPT_RECIEVED", {
						universeId = universeId,
						placeId = p1.placeId,
						conversationId = p1.getCasSessionId(),
						turnId = p1
					})
				end
				if fFlagBuildAgentRollbackModule and p6 ~= nil then
					p6()
				end
			end else nil,
			onCompleted = function(p1)
				-- upvalues: resolvePromptFailure (copy), var2 (write), debug (copy), universeId (ref), p1 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p3 (ref)
				local var1 = resolvePromptFailure(p1, var2.getSetupError(false))
				
				if var1 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var1.errorCode,
						isContentPolicy = var1.isContentPolicy,
						setupStage = var1.setupStage,
						universeId = universeId,
						placeId = p1.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p1.placeId,
						conversationId = p1.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var1))
				end
				p3(var1)
			end
		})
		
		return {
			getOptimisticLocalTools = var1.getOptimisticLocalTools,
			getLocalToolActions = var1.getLocalToolActions,
			getSetupErrorText = function(value)
				-- upvalues: var2 (write), localizationStringsModule (copy), t_1 (copy)
				local setupError = var2.getSetupError(value)
				
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
				-- upvalues: var2 (write)
				var2.start()
			end,
			stop = function()
				-- upvalues: var1 (ref), var2 (write)
				var1.stopPending()
				var2.stop()
			end,
			detach = var1.stopPending,
			syncFromTurnState = var1.syncFromTurnState,
			trySubmitComposerText = var1.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var1 = createLocalToolControllers(p1, p5, p6)
		local var2 = signalsModule.createSignal(nil)
		local var3 = false
		local var4 = false
		local var5 = nil
		local var6 = nil
		
		local function _()
			-- upvalues: var6 (write), var5 (write)
			if var6 ~= nil then
				var6()
				var6 = nil
			end
			if var5 ~= nil then
				var5()
				var5 = nil
			end
		end
		
		local _ = function()
			-- upvalues: var4 (write), var6 (write), var5 (write), p3 (ref)
			if var4 then return end
			var4 = true
			
			if var6 ~= nil then
				var6()
				var6 = nil
			end
			if var5 ~= nil then
				var5()
				var5 = nil
			end
			p3(nil)
		end
		
		return {
			getOptimisticLocalTools = var1.getOptimisticLocalTools,
			getLocalToolActions = var1.getLocalToolActions,
			getSetupErrorText = var2,
			start = function()
				-- upvalues: var3 (write), sendBuildExperienceEventModule (copy), p1 (ref), p4 (ref), var5 (write), var6 (write), signalsModule (copy), p2 (ref), var4 (write), p3 (ref)
				if var3 then return end
				var3 = true
				local t = {
					onDroppedChatMessage = function(p1)
						-- upvalues: sendBuildExperienceEventModule (copy), p1 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p1.universeId,
							placeId = p1.placeId,
							conversationId = p1.getCasSessionId(),
							messageId = p1
						})
					end
				}
				
				if p4 ~= nil then
					t.afterSequenceId = p4
				end
				var5 = p1.startPollingActiveTurn(t)
				var6 = signalsModule.createEffect(function(p1)
					-- upvalues: p2 (copy), var4 (copy), var6 (copy), var5 (copy), p3 (copy)
					if p2.state(p1).isDone then
						if var4 then return end
						var4 = true
						
						if var6 ~= nil then
							var6()
							var6 = nil
						end
						if var5 ~= nil then
							var5()
							var5 = nil
						end
						p3(nil)
					end
				end)
			end,
			stop = function()
				-- upvalues: var4 (write), var6 (write), var5 (write), var1 (ref), p2 (ref)
				var4 = true
				
				if var6 ~= nil then
					var6()
					var6 = nil
				end
				if var5 ~= nil then
					var5()
					var5 = nil
				end
				var1.stopPending()
				p2.cancel()
			end,
			detach = function()
				-- upvalues: var4 (write), var6 (write), var5 (write), var1 (ref)
				var4 = true
				
				if var6 ~= nil then
					var6()
					var6 = nil
				end
				if var5 ~= nil then
					var5()
					var5 = nil
				end
				var1.stopPending()
			end,
			syncFromTurnState = var1.syncFromTurnState,
			trySubmitComposerText = var1.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}