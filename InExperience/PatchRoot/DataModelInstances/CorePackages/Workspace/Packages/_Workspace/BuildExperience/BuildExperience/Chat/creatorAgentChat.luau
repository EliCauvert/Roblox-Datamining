local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceClientDataModelTools = sharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local _ = require(script.Parent.chatTypes)
local askUserControllerModule = require(script.Parent.askUserController)
local var1 = if fFlagBuildExperienceClientDataModelTools then require(script.Parent.clientDataModelController) else nil
local clientLogsControllerModule = require(script.Parent.clientLogsController)
local localToolOverlayModule = require(script.Parent.localToolOverlay)
local proposePlanControllerModule = require(script.Parent.proposePlanController)
local var2 = if fFlagBuildExperienceManageDevProductModule then require(script.Parent.askManageDevProductController) else nil
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioClientDataModelTools = creatorAgentChatModule.StudioClientDataModelTools
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local studioManageDevProductTool = creatorAgentChatModule.StudioManageDevProductTool
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
	-- upvalues: localToolOverlayModule (ref), askUserControllerModule (ref), proposePlanControllerModule (ref), clientLogsControllerModule (ref), var1 (ref), var2 (ref)
	local t = {}
	local var3 = localToolOverlayModule()
	local var4 = askUserControllerModule(p1, t, var3, p2)
	local var5 = proposePlanControllerModule(p1, t, var3, p2)
	local var6 = clientLogsControllerModule(p1, t, p3)
	local var7 = if var1 ~= nil then nil else var1(p1, t, p3)
	local var8 = if var2 ~= nil then nil else var2(p1, t, var3, p2)
	
	return {
		getOptimisticLocalTools = var3.getOptimisticLocalTools,
		getLocalToolActions = var3.getLocalToolActions,
		hasDisplayedAnswerStack = var4.hasDisplayedAnswerStack,
		syncFromTurnState = function(p4)
			-- upvalues: var4 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref)
			var4.syncAnswerStack(p4)
			var5.syncPlanProposal(p4)
			var6.syncClientLogsRequest(p4)
			
			if var7 ~= nil then
				var7.syncClientDataModelRequests(p4)
			end
			if var8 ~= nil then
				var8.syncManageDevProductRequests(p4)
			end
		end,
		trySubmitComposerText = function(p4)
			-- upvalues: var4 (ref), var5 (ref), var8 (ref)
			return var4.trySubmitComposerText(p4) or (var5.trySubmitComposerText(p4) or (var8 ~= nil and var8.trySubmitComposerText(p4)))
		end,
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
	createLiveAssistantTurn = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: createLocalToolControllers (ref), studioAskUserTool (ref), studioProposePlanTool (ref), studioClientLogsTool (ref), fFlagBuildExperienceClientDataModelTools (ref), studioClientDataModelTools (ref), fFlagBuildExperienceManageDevProductModule (ref), studioManageDevProductTool (ref), fFlagEnableTeamTestLua (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), resolvePromptFailure (ref), debug (ref), getPromptFailureTelemetryParameters (ref), localizationStringsModule (ref), t_1 (ref)
		local var3 = createLocalToolControllers(p1, p4, p5)
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
		if fFlagBuildExperienceManageDevProductModule then
			table.insert(list, studioManageDevProductTool.LOCAL_TOOL_DEFINITION)
		end
		local var4 = nil
		var4 = p1.sendPrompt({
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
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p1 (ref)
				sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = universeId,
					placeId = p1.placeId,
					conversationId = p1.getCasSessionId(),
					messageId = p7
				})
			end,
			onReceived = if fFlagBuildEventsUpdate1Module or p6 ~= nil then function(p7)
				-- upvalues: fFlagBuildEventsUpdate1Module (copy), sendBuildExperienceEventModule (copy), universeId (ref), p1 (ref), p6 (ref)
				if fFlagBuildEventsUpdate1Module then
					sendBuildExperienceEventModule("SEND_PROMPT_RECIEVED", {
						universeId = universeId,
						placeId = p1.placeId,
						conversationId = p1.getCasSessionId(),
						turnId = p7
					})
				end
				if p6 ~= nil then
					p6(p7)
				end
			end else nil,
			onCompleted = function(p7)
				-- upvalues: resolvePromptFailure (copy), var4 (write), debug (copy), universeId (ref), p1 (ref), sendBuildExperienceEventModule (copy), getPromptFailureTelemetryParameters (copy), p3 (ref)
				local var5 = resolvePromptFailure(p7, var4.getSetupError(false))
				
				if var5 ~= nil then
					debug.log("info", "prompt send failed", {
						errorCode = var5.errorCode,
						isContentPolicy = var5.isContentPolicy,
						setupStage = var5.setupStage,
						universeId = universeId,
						placeId = p1.placeId
					})
					sendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = universeId,
						placeId = p1.placeId,
						conversationId = p1.getCasSessionId()
					}, getPromptFailureTelemetryParameters(var5))
				end
				p3(var5)
			end
		})
		
		return {
			getOptimisticLocalTools = var3.getOptimisticLocalTools,
			getLocalToolActions = var3.getLocalToolActions,
			getSetupErrorText = function(value)
				-- upvalues: var4 (write), localizationStringsModule (copy), t_1 (copy)
				local setupError = var4.getSetupError(value)
				
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
				-- upvalues: var4 (write)
				var4.start()
			end,
			stop = function()
				-- upvalues: var3 (ref), var4 (write)
				var3.stopPending()
				var4.stop()
			end,
			detach = var3.stopPending,
			syncFromTurnState = var3.syncFromTurnState,
			trySubmitComposerText = var3.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: createLocalToolControllers (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
		local var3 = createLocalToolControllers(p1, p5, p6)
		local var4 = signalsModule.createSignal(nil)
		local var5 = false
		local var6 = false
		local var7 = nil
		local var8 = nil
		
		local function _()
			-- upvalues: var8 (write), var7 (write)
			if var8 ~= nil then
				var8()
				var8 = nil
			end
			if var7 ~= nil then
				var7()
				var7 = nil
			end
		end
		
		local _ = function()
			-- upvalues: var6 (write), var8 (write), var7 (write), p3 (ref)
			if var6 then return end
			var6 = true
			
			if var8 ~= nil then
				var8()
				var8 = nil
			end
			if var7 ~= nil then
				var7()
				var7 = nil
			end
			p3(nil)
		end
		
		return {
			getOptimisticLocalTools = var3.getOptimisticLocalTools,
			getLocalToolActions = var3.getLocalToolActions,
			getSetupErrorText = var4,
			start = function()
				-- upvalues: var5 (write), sendBuildExperienceEventModule (copy), p1 (ref), p4 (ref), var7 (write), var8 (write), signalsModule (copy), p2 (ref), var6 (write), p3 (ref)
				if var5 then return end
				var5 = true
				local t = {
					onDroppedChatMessage = function(p7)
						-- upvalues: sendBuildExperienceEventModule (copy), p1 (copy)
						sendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p1.universeId,
							placeId = p1.placeId,
							conversationId = p1.getCasSessionId(),
							messageId = p7
						})
					end
				}
				
				if p4 ~= nil then
					t.afterSequenceId = p4
				end
				var7 = p1.startPollingActiveTurn(t)
				var8 = signalsModule.createEffect(function(p7)
					-- upvalues: p2 (copy), var6 (copy), var8 (copy), var7 (copy), p3 (copy)
					if p2.state(p7).isDone then
						if var6 then return end
						var6 = true
						
						if var8 ~= nil then
							var8()
							var8 = nil
						end
						if var7 ~= nil then
							var7()
							var7 = nil
						end
						p3(nil)
					end
				end)
			end,
			stop = function()
				-- upvalues: var6 (write), var8 (write), var7 (write), var3 (ref), p2 (ref)
				var6 = true
				
				if var8 ~= nil then
					var8()
					var8 = nil
				end
				if var7 ~= nil then
					var7()
					var7 = nil
				end
				var3.stopPending()
				p2.cancel()
			end,
			detach = function()
				-- upvalues: var6 (write), var8 (write), var7 (write), var3 (ref)
				var6 = true
				
				if var8 ~= nil then
					var8()
					var8 = nil
				end
				if var7 ~= nil then
					var7()
					var7 = nil
				end
				var3.stopPending()
			end,
			syncFromTurnState = var3.syncFromTurnState,
			trySubmitComposerText = var3.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = getPromptFailureComposerError,
	getToolResultFailureComposerError = getToolResultFailureComposerError
}