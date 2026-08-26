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
	local var2
	local t_1 = { errorCode = p1.errorCode }
	
	if p1.errorCode == errorCodes.OutOfCredits then
		local error = p1.error
		var2 = if error == nil then nil else t[error]
	else
		var2 = nil
	end
	t_1.outOfCreditsReason = var2
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
	local var2 = localToolOverlayModule()
	local var3 = askUserControllerModule(p1, t, var2, p2)
	local var4 = proposePlanControllerModule(p1, t, var2, p2)
	local var5 = clientLogsControllerModule(p1, t, p3)
	local var6 = if var2 ~= nil then nil else var2(p1, t, p3)
	
	return {
		getOptimisticLocalTools = var2.getOptimisticLocalTools,
		getLocalToolActions = var2.getLocalToolActions,
		hasDisplayedAnswerStack = var3.hasDisplayedAnswerStack,
		syncFromTurnState = function(p4)
			-- upvalues: var3 (ref), var4 (ref), var5 (ref), var6 (ref)
			var3.syncAnswerStack(p4)
			var4.syncPlanProposal(p4)
			var5.syncClientLogsRequest(p4)
			
			if var6 ~= nil then
				var6.syncClientDataModelRequests(p4)
			end
		end,
		trySubmitComposerText = function(p4)
			-- upvalues: var3 (ref), var4 (ref)
			return var3.trySubmitComposerText(p4) or var4.trySubmitComposerText(p4)
		end,
		stopPending = function()
			-- upvalues: var3 (ref), var4 (ref), var6 (ref)
			var3.stopPendingAnswer()
			var4.stopPendingPlan()
			
			if var6 ~= nil then
				var6.revokePending()
			end
		end
	}
end

return {
	createLiveAssistantTurn = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagBuildExperienceClientDataModelTools (ref), studioClientDataModelTools (ref), fFlagEnableTeamTestLua (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), fFlagBuildAgentRollbackModule (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var2 = createLocalToolControllers(p1, p4, p5)
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
		local var3 = nil
		var3 = p1.sendPrompt({
			prompt = p2,
			promptMeta = {
				_roblox = {
					application = if fFlagBuildExperienceClientDataModelTools then "build-on-mobile" else nil,
					localTools = list,
					providerConfig = { universeId = universeId },
					teamTestEnabled = fFlagEnableTeamTestLua
				}
			},
			onDroppedChatMessage = function(p7)
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p7 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p7.placeId,
					conversationId = p7.getCasSessionId(),
					messageId = p7
				})
			end,
			onReceived = if fFlagBuildEventsUpdate1Module or fFlagBuildAgentRollbackModule and p6 ~= nil then function(p7)
				-- upvalues: fFlagBuildEventsUpdate1Module (copy), sendBuildExperienceEventModule (copy), universeId (ref), p7 (ref), fFlagBuildAgentRollbackModule (copy), p6 (ref)
				if fFlagBuildEventsUpdate1Module then
					sendBuildExperienceEventModule("SEND_PROMPT_RECIEVED", {
						universeId = universeId,
						placeId = p7.placeId,
						conversationId = p7.getCasSessionId(),
						turnId = p7
					})
				end
				if fFlagBuildAgentRollbackModule and p6 ~= nil then
					p6()
				end
			end else nil,
			onCompleted = function(p7)
				-- upvalues: resolvePromptFailure (copy), var3 (write), debug (copy), universeId (ref), p7 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p3 (ref)
				local var4 = resolvePromptFailure(p7, var3.getSetupError(false))
				
				if var4 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var4.errorCode,
						isContentPolicy = var4.isContentPolicy,
						setupStage = var4.setupStage,
						universeId = universeId,
						placeId = p7.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p7.placeId,
						conversationId = p7.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var4))
				end
				p3(var4)
			end
		})
		
		return {
			getOptimisticLocalTools = var2.getOptimisticLocalTools,
			getLocalToolActions = var2.getLocalToolActions,
			getSetupErrorText = function(value)
				-- upvalues: var3 (write), localizationStringsModule (copy), t_1 (copy)
				local setupError = var3.getSetupError(value)
				
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
				-- upvalues: var3 (write)
				var3.start()
			end,
			stop = function()
				-- upvalues: var2 (ref), var3 (write)
				var2.stopPending()
				var3.stop()
			end,
			detach = var2.stopPending,
			syncFromTurnState = var2.syncFromTurnState,
			trySubmitComposerText = var2.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var2 = createLocalToolControllers(p1, p5, p6)
		local var3 = signalsModule.createSignal(nil)
		local var4 = false
		local var5 = false
		local var6 = nil
		local var7 = nil
		
		local function _()
			-- upvalues: var7 (write), var6 (write)
			if var7 ~= nil then
				var7()
				var7 = nil
			end
			if var6 ~= nil then
				var6()
				var6 = nil
			end
		end
		
		local _ = function()
			-- upvalues: var5 (write), var7 (write), var6 (write), p3 (ref)
			if var5 then return end
			var5 = true
			
			if var7 ~= nil then
				var7()
				var7 = nil
			end
			if var6 ~= nil then
				var6()
				var6 = nil
			end
			p3(nil)
		end
		
		return {
			getOptimisticLocalTools = var2.getOptimisticLocalTools,
			getLocalToolActions = var2.getLocalToolActions,
			getSetupErrorText = var3,
			start = function()
				-- upvalues: var4 (write), sendBuildExperienceEventModule (copy), p1 (ref), p4 (ref), var6 (write), var7 (write), signalsModule (copy), p2 (ref), var5 (write), p3 (ref)
				if var4 then return end
				var4 = true
				local t = {
					onDroppedChatMessage = function(p7)
						-- upvalues: sendBuildExperienceEventModule (copy), p7 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p7.universeId,
							placeId = p7.placeId,
							conversationId = p7.getCasSessionId(),
							messageId = p7
						})
					end
				}
				
				if p4 ~= nil then
					t.afterSequenceId = p4
				end
				var6 = p1.startPollingActiveTurn(t)
				var7 = signalsModule.createEffect(function(p7)
					-- upvalues: p2 (copy), var5 (copy), var7 (copy), var6 (copy), p3 (copy)
					if p2.state(p7).isDone then
						if var5 then return end
						var5 = true
						
						if var7 ~= nil then
							var7()
							var7 = nil
						end
						if var6 ~= nil then
							var6()
							var6 = nil
						end
						p3(nil)
					end
				end)
			end,
			stop = function()
				-- upvalues: var5 (write), var7 (write), var6 (write), var2 (ref), p2 (ref)
				var5 = true
				
				if var7 ~= nil then
					var7()
					var7 = nil
				end
				if var6 ~= nil then
					var6()
					var6 = nil
				end
				var2.stopPending()
				p2.cancel()
			end,
			detach = function()
				-- upvalues: var5 (write), var7 (write), var6 (write), var2 (ref)
				var5 = true
				
				if var7 ~= nil then
					var7()
					var7 = nil
				end
				if var6 ~= nil then
					var6()
					var6 = nil
				end
				var2.stopPending()
			end,
			syncFromTurnState = var2.syncFromTurnState,
			trySubmitComposerText = var2.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}