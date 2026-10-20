local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceClientDataModelTools = SharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local _ = require(script.Parent.chatTypes)
local AskUserControllerModule = require(script.Parent.askUserController)
local ClientDataModelControllerModule = if FFlagBuildExperienceClientDataModelTools then require(script.Parent.clientDataModelController) else nil
local ClientLogsControllerModule = require(script.Parent.clientLogsController)
local LocalToolOverlayModule = require(script.Parent.localToolOverlay)
local IsWaitingOnUserInputModule = require(script.Parent.isWaitingOnUserInput)
local ProposePlanControllerModule = require(script.Parent.proposePlanController)
local AskManageDevProductControllerModule = if FFlagBuildExperienceManageDevProductModule then require(script.Parent.askManageDevProductController) else nil
local CreatePromptLifecycleTelemetryModule = require(BuildExperience.Telemetry.createPromptLifecycleTelemetry)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildEventsUpdate1Module = require(BuildExperience.Flags.FFlagBuildEventsUpdate1)
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioClientDataModelTools = CreatorAgentChatModule.StudioClientDataModelTools
local StudioClientLogsTool = CreatorAgentChatModule.StudioClientLogsTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local Debug = CreatorAgentChatModule.debug
local TurnStateReducer = CreatorAgentChatModule.TurnStateReducer
local ErrorCodes = CreatorAgentChatModule.ErrorCodes
local Forbidden = ErrorCodes.Forbidden
local config = {
	FreeTrialExhausted = "FreeTrialExhausted",
	DailyLimitReached = "DailyLimitReached",
	InsufficientRobuxBalance = "InsufficientRobuxBalance"
}
local config1 = {
	[ErrorCodes.InvalidParams] = LocalizationStringsModule.CHAT_ERROR_INVALID_PARAMS,
	[ErrorCodes.Unauthorized] = LocalizationStringsModule.CHAT_ERROR_UNAUTHORIZED,
	[ErrorCodes.Forbidden] = LocalizationStringsModule.CHAT_ERROR_FORBIDDEN,
	[ErrorCodes.NotFound] = LocalizationStringsModule.CHAT_ERROR_NOT_FOUND,
	[ErrorCodes.Conflict] = LocalizationStringsModule.CHAT_ERROR_CONFLICT,
	[ErrorCodes.Gone] = LocalizationStringsModule.CHAT_ERROR_GONE,
	[ErrorCodes.UpstreamUnavailable] = LocalizationStringsModule.CHAT_ERROR_UPSTREAM_UNAVAILABLE,
	[ErrorCodes.InternalError] = LocalizationStringsModule.CHAT_ERROR_INTERNAL,
	[ErrorCodes.OutOfCredits] = LocalizationStringsModule.CHAT_ERROR_OUT_OF_CREDITS
}

local function _(p1)
	-- upvalues: config (copy)
	return if p1 == nil then nil else config[p1]
end

local function resolvePromptFailure(p1, SetupError)
	-- upvalues: FFlagBuildExperiencePromptFailureTelemetry (copy), ErrorCodes (copy), config (copy), Forbidden (copy)
	if p1 == nil then
		return if SetupError == nil then nil else {
			outOfCreditsReason = nil,
			isContentPolicy = false,
			errorCode = SetupError.errorCode,
			setupStage = SetupError.stage,
			requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then SetupError.requestFailure else nil
		}
	end
	if p1.status ~= "failed" then
		return nil
	end
	local config1 = { errorCode = p1.errorCode }
	local Entry = nil
	
	if p1.errorCode == ErrorCodes.OutOfCredits then
		local Error = p1.error
		Entry = if Error == nil then nil else config[Error]
	else
		Entry = nil
	end
	config1.outOfCreditsReason = Entry
	config1.isContentPolicy = p1.errorCode == Forbidden
	config1.requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then p1.requestFailure else nil
	
	return config1
end

local function getPromptFailureTelemetryParameters(p1)
	local config = { isContentPolicy = tostring(p1.isContentPolicy) }
	
	if p1.errorCode ~= nil then
		config.errorCode = tostring(p1.errorCode)
	end
	if p1.outOfCreditsReason ~= nil then
		config.outOfCreditsReason = p1.outOfCreditsReason
	end
	if p1.setupStage ~= nil then
		config.setupStage = p1.setupStage
	end
	return config
end

local _ = function(p1, p2)
	-- upvalues: LocalizationStringsModule (copy), config1 (copy)
	local RequestFailure = p2.requestFailure
	local CHATPOLICYREJECTION = nil
	
	if RequestFailure ~= nil then
		p1.failureKind = RequestFailure.kind
		
		if RequestFailure.httpStatusCode ~= nil then
			p1.httpStatusCode = tostring(RequestFailure.httpStatusCode)
		end
	end
	repeat
		if p2.isContentPolicy then
			CHATPOLICYREJECTION = LocalizationStringsModule.CHAT_POLICY_REJECTION
			break
		end
		if p2.setupStage == "missing_project" then
			CHATPOLICYREJECTION = LocalizationStringsModule.CHAT_MISSING_PROJECT
			break
		end
		if p2.errorCode ~= nil then
			local Entry = config1[p2.errorCode]
			
			if Entry ~= nil then
				CHATPOLICYREJECTION = Entry
				break
			end
		end
		CHATPOLICYREJECTION = LocalizationStringsModule.CHAT_DEFAULT_FAILURE
	until true
	p1.errorCopyKey = CHATPOLICYREJECTION
end

local _ = function(p1, List)
	for i, value in List do
		p1[i] = value
	end
end

local _ = function(p2)
	local config = { status = p2.status }
	
	if p2.stopReason ~= nil then
		config.stopReason = p2.stopReason
	end
	if p2.errorCode ~= nil then
		config.errorCode = tostring(p2.errorCode)
	end
	return config
end

local config2 = {
	agent_message = true,
	agent_message_chunk = true,
	tool_call_update = true,
	tool_call_content_chunk = true
}
local config3 = { tool_call_update = true, tool_call_content_chunk = true }

local function trackPromptActivity(SendPromptResult, p2, Callback)
	-- upvalues: TurnStateReducer (copy), config2 (copy), config3 (copy), IsWaitingOnUserInputModule (copy), SignalsModule (copy)
	local EmptyTurnState = TurnStateReducer.createEmptyTurnState("", nil)
	local HasResponse = false
	local IsWaitingOnUser = false
	local TurnHandle = nil
	local OnUpdateResult = nil
	
	local function _()
		-- upvalues: p2 (copy), HasResponse (ref), IsWaitingOnUser (ref)
		p2.markActivity({
			hasResponse = HasResponse,
			isWaitingOnUser = IsWaitingOnUser
		})
	end
	
	local function onUpdate(p3, SequenceNumber)
		-- upvalues: config2 (upval), HasResponse (ref), config3 (upval), EmptyTurnState (ref), TurnStateReducer (upval), IsWaitingOnUser (ref), IsWaitingOnUserInputModule (upval), Callback (copy), p2 (copy)
		if config2[p3.sessionUpdate] == true then
			HasResponse = true
		end
		if config3[p3.sessionUpdate] == true then
			EmptyTurnState = TurnStateReducer.applySessionUpdate(EmptyTurnState, p3, { sequenceNumber = SequenceNumber })
			IsWaitingOnUser = IsWaitingOnUserInputModule(EmptyTurnState, Callback(false).submittedToolCallIds)
		end
		p2.markActivity({
			hasResponse = HasResponse,
			isWaitingOnUser = IsWaitingOnUser
		})
	end
	
	local Effect = SignalsModule.createEffect(function(p3)
		-- upvalues: SendPromptResult (copy), Callback (copy), TurnHandle (ref), OnUpdateResult (ref), onUpdate (copy), IsWaitingOnUserInputModule (upval), EmptyTurnState (ref), IsWaitingOnUser (ref), p2 (copy), HasResponse (ref)
		local TurnHandle1 = SendPromptResult.getTurnHandle(p3)
		local SubmittedToolCallIds = Callback(p3).submittedToolCallIds
		
		if TurnHandle1 ~= nil and TurnHandle1 ~= TurnHandle and TurnHandle1.onUpdate ~= nil then
			TurnHandle = TurnHandle1
			OnUpdateResult = TurnHandle1.onUpdate(onUpdate)
		end
		local IsWaitingOnUserInputModule1 = IsWaitingOnUserInputModule(EmptyTurnState, SubmittedToolCallIds)
		
		if IsWaitingOnUserInputModule1 ~= IsWaitingOnUser then
			IsWaitingOnUser = IsWaitingOnUserInputModule1
			p2.markActivity({
				hasResponse = HasResponse,
				isWaitingOnUser = IsWaitingOnUser
			})
		end
	end)
	
	return function()
		-- upvalues: Effect (copy), OnUpdateResult (ref)
		Effect()
		
		if OnUpdateResult ~= nil then
			OnUpdateResult()
			OnUpdateResult = nil
		end
	end
end

local _ = function(p2): boolean
	return p2.status == "failed" or p2.stopReason == "error"
end

local _ = function(p2)
	-- upvalues: LocalizationStringsModule (copy), config1 (copy)
	local config = {
		isContentPolicy = false,
		errorCode = p2.errorCode,
		setupStage = p2.stage
	}
	
	if config.isContentPolicy then
		return LocalizationStringsModule.CHAT_POLICY_REJECTION
	end
	if config.setupStage == "missing_project" then
		return LocalizationStringsModule.CHAT_MISSING_PROJECT
	end
	if config.errorCode ~= nil then
		local Entry = config1[config.errorCode]
		
		if Entry ~= nil then
			return Entry
		end
	end
	return LocalizationStringsModule.CHAT_DEFAULT_FAILURE
end

local function createLocalToolControllers(p2, p3, p4)
	-- upvalues: LocalToolOverlayModule (copy), AskUserControllerModule (copy), ProposePlanControllerModule (copy), ClientLogsControllerModule (copy), ClientDataModelControllerModule (copy), AskManageDevProductControllerModule (copy)
	local t = {}
	local LocalToolOverlayModuleResult = LocalToolOverlayModule()
	local AskUserControllerModuleResult = AskUserControllerModule(p2, t, LocalToolOverlayModuleResult, p3)
	local ProposePlanControllerModuleResult = ProposePlanControllerModule(p2, t, LocalToolOverlayModuleResult, p3)
	local ClientLogsControllerModuleResult = ClientLogsControllerModule(p2, t, p4)
	local ClientDataModelControllerModuleResult = if ClientDataModelControllerModule == nil then nil else ClientDataModelControllerModule(p2, t, p4)
	local AskManageDevProductControllerModuleResult = if AskManageDevProductControllerModule == nil then nil else AskManageDevProductControllerModule(p2, t, LocalToolOverlayModuleResult, p3)
	
	return {
		getOptimisticLocalTools = LocalToolOverlayModuleResult.getOptimisticLocalTools,
		getLocalToolActions = LocalToolOverlayModuleResult.getLocalToolActions,
		hasDisplayedAnswerStack = AskUserControllerModuleResult.hasDisplayedAnswerStack,
		syncFromTurnState = function(p5)
			-- upvalues: AskUserControllerModuleResult (copy), ProposePlanControllerModuleResult (copy), ClientLogsControllerModuleResult (copy), ClientDataModelControllerModuleResult (copy), AskManageDevProductControllerModuleResult (copy)
			AskUserControllerModuleResult.syncAnswerStack(p5)
			ProposePlanControllerModuleResult.syncPlanProposal(p5)
			ClientLogsControllerModuleResult.syncClientLogsRequest(p5)
			
			if ClientDataModelControllerModuleResult ~= nil then
				ClientDataModelControllerModuleResult.syncClientDataModelRequests(p5)
			end
			if AskManageDevProductControllerModuleResult ~= nil then
				AskManageDevProductControllerModuleResult.syncManageDevProductRequests(p5)
			end
		end,
		trySubmitComposerText = function(p5)
			-- upvalues: AskUserControllerModuleResult (copy), ProposePlanControllerModuleResult (copy), AskManageDevProductControllerModuleResult (copy)
			return AskUserControllerModuleResult.trySubmitComposerText(p5) or (ProposePlanControllerModuleResult.trySubmitComposerText(p5) or AskManageDevProductControllerModuleResult ~= nil and AskManageDevProductControllerModuleResult.trySubmitComposerText(p5))
		end,
		trySubmitAnswerText = AskUserControllerModuleResult.trySubmitAnswerText,
		stopPending = function()
			-- upvalues: AskUserControllerModuleResult (copy), ProposePlanControllerModuleResult (copy), ClientDataModelControllerModuleResult (copy), AskManageDevProductControllerModuleResult (copy)
			AskUserControllerModuleResult.stopPendingAnswer()
			ProposePlanControllerModuleResult.stopPendingPlan()
			
			if ClientDataModelControllerModuleResult ~= nil then
				ClientDataModelControllerModuleResult.revokePending()
			end
			if AskManageDevProductControllerModuleResult ~= nil then
				AskManageDevProductControllerModuleResult.stopPending()
			end
		end
	}
end

return {
	createLiveAssistantTurn = function(p2, Prompt, Callback2, p3, p4, Callback)
		-- upvalues: createLocalToolControllers (copy), StudioAskUserTool (copy), StudioProposePlanTool (copy), StudioClientLogsTool (copy), FFlagBuildExperienceClientDataModelTools (copy), StudioClientDataModelTools (copy), FFlagBuildExperienceManageDevProductModule (copy), StudioManageDevProductTool (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), CreatePromptLifecycleTelemetryModule (copy), SendBuildExperienceEventModule (copy), FFlagBuildEventsUpdate1Module (copy), resolvePromptFailure (copy), Debug (copy), getPromptFailureTelemetryParameters (copy), LocalizationStringsModule (copy), config1 (copy), trackPromptActivity (copy)
		local LocalToolControllers = createLocalToolControllers(p2, p3, p4)
		local UniverseId = p2.universeId
		local List = {
			StudioAskUserTool.LOCAL_TOOL_DEFINITION,
			StudioProposePlanTool.LOCAL_TOOL_DEFINITION,
			StudioClientLogsTool.LOCAL_TOOL_DEFINITION
		}
		
		if FFlagBuildExperienceClientDataModelTools then
			table.insert(List, StudioClientDataModelTools.SEARCH_LOCAL_TOOL_DEFINITION)
			table.insert(List, StudioClientDataModelTools.INSPECT_LOCAL_TOOL_DEFINITION)
		end
		if FFlagBuildExperienceManageDevProductModule then
			table.insert(List, StudioManageDevProductTool.LOCAL_TOOL_DEFINITION)
		end
		local PromptLifecycleTelemetryModule = if FFlagBuildExperiencePromptFailureTelemetry then CreatePromptLifecycleTelemetryModule(function()
			-- upvalues: UniverseId (copy), p2 (copy)
			return {
				universeId = UniverseId,
				placeId = p2.placeId,
				conversationId = p2.getCasSessionId()
			}
		end) else nil
		
		local function handleReceived(TurnId)
			-- upvalues: FFlagBuildEventsUpdate1Module (upval), SendBuildExperienceEventModule (upval), UniverseId (copy), p2 (copy), Callback (copy)
			if FFlagBuildEventsUpdate1Module then
				SendBuildExperienceEventModule("SEND_PROMPT_RECIEVED", {
					universeId = UniverseId,
					placeId = p2.placeId,
					conversationId = p2.getCasSessionId(),
					turnId = TurnId
				})
			end
			if Callback ~= nil then
				Callback(TurnId)
			end
		end
		
		local SendPromptResult = nil
		local Callback1: (() -> ())? = nil
		
		local function _(p5)
			-- upvalues: Callback1 (ref)
			if Callback1 ~= nil then
				Callback1()
				Callback1 = nil
			end
			p5.finish()
		end
		
		SendPromptResult = p2.sendPrompt({
			prompt = Prompt,
			promptMeta = {
				_roblox = {
					application = if FFlagBuildExperienceClientDataModelTools then "build-on-mobile" else nil,
					localTools = List,
					providerConfig = { universeId = UniverseId }
				}
			},
			onDroppedChatMessage = function(MessageId)
				-- upvalues: SendBuildExperienceEventModule (upval), UniverseId (copy), p2 (copy)
				SendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
					universeId = UniverseId,
					placeId = p2.placeId,
					conversationId = p2.getCasSessionId(),
					messageId = MessageId
				})
			end,
			onReceived = if FFlagBuildEventsUpdate1Module or Callback ~= nil then handleReceived else nil,
			onCompleted = function(p5)
				-- upvalues: resolvePromptFailure (upval), SendPromptResult (ref), Debug (upval), UniverseId (copy), p2 (copy), getPromptFailureTelemetryParameters (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), PromptLifecycleTelemetryModule (copy), LocalizationStringsModule (upval), config1 (upval), SendBuildExperienceEventModule (upval), Callback1 (ref), Callback2 (copy)
				local ResolvePromptFailureResult = resolvePromptFailure(p5, SendPromptResult.getSetupError(false))
				
				if ResolvePromptFailureResult == nil then
					if FFlagBuildExperiencePromptFailureTelemetry and PromptLifecycleTelemetryModule ~= nil and p5 ~= nil and (p5.status == "failed" or p5.stopReason == "error") then
						local config = { status = p5.status }
						
						if p5.stopReason ~= nil then
							config.stopReason = p5.stopReason
						end
						if p5.errorCode ~= nil then
							config.errorCode = tostring(p5.errorCode)
						end
						for i1, value1 in PromptLifecycleTelemetryModule.getLifecycleParameters() do
							config[i1] = value1
						end
						SendBuildExperienceEventModule("AGENT_TURN_FAILED", {
							universeId = UniverseId,
							placeId = p2.placeId,
							conversationId = p2.getCasSessionId()
						}, config)
					end
				else
					Debug.log("info", "prompt send failed", {
						errorCode = ResolvePromptFailureResult.errorCode,
						isContentPolicy = ResolvePromptFailureResult.isContentPolicy,
						setupStage = ResolvePromptFailureResult.setupStage,
						universeId = UniverseId,
						placeId = p2.placeId
					})
					local PromptFailureTelemetryParameters = getPromptFailureTelemetryParameters(ResolvePromptFailureResult)
					
					if FFlagBuildExperiencePromptFailureTelemetry and PromptLifecycleTelemetryModule ~= nil then
						local RequestFailure = ResolvePromptFailureResult.requestFailure
						local CHATPOLICYREJECTION = nil
						
						if RequestFailure ~= nil then
							PromptFailureTelemetryParameters.failureKind = RequestFailure.kind
							
							if RequestFailure.httpStatusCode ~= nil then
								PromptFailureTelemetryParameters.httpStatusCode = tostring(RequestFailure.httpStatusCode)
							end
						end
						repeat
							if ResolvePromptFailureResult.isContentPolicy then
								CHATPOLICYREJECTION = LocalizationStringsModule.CHAT_POLICY_REJECTION
								break
							end
							if ResolvePromptFailureResult.setupStage == "missing_project" then
								CHATPOLICYREJECTION = LocalizationStringsModule.CHAT_MISSING_PROJECT
								break
							end
							if ResolvePromptFailureResult.errorCode ~= nil then
								local Entry = config1[ResolvePromptFailureResult.errorCode]
								
								if Entry ~= nil then
									CHATPOLICYREJECTION = Entry
									break
								end
							end
							CHATPOLICYREJECTION = LocalizationStringsModule.CHAT_DEFAULT_FAILURE
						until true
						PromptFailureTelemetryParameters.errorCopyKey = CHATPOLICYREJECTION
						
						for i, value in PromptLifecycleTelemetryModule.getLifecycleParameters() do
							PromptFailureTelemetryParameters[i] = value
						end
					end
					SendBuildExperienceEventModule("SEND_PROMPT_FAILED", {
						universeId = UniverseId,
						placeId = p2.placeId,
						conversationId = p2.getCasSessionId()
					}, PromptFailureTelemetryParameters)
				end
				if FFlagBuildExperiencePromptFailureTelemetry and PromptLifecycleTelemetryModule ~= nil then
					if Callback1 ~= nil then
						Callback1()
						Callback1 = nil
					end
					PromptLifecycleTelemetryModule.finish()
				end
				Callback2(ResolvePromptFailureResult)
			end
		})
		
		return {
			getOptimisticLocalTools = LocalToolControllers.getOptimisticLocalTools,
			getLocalToolActions = LocalToolControllers.getLocalToolActions,
			getSetupErrorText = function(p6)
				-- upvalues: SendPromptResult (ref), LocalizationStringsModule (upval), config1 (upval)
				local SetupError = SendPromptResult.getSetupError(p6)
				
				if SetupError == nil then
					return nil
				end
				local config = {
					isContentPolicy = false,
					errorCode = SetupError.errorCode,
					setupStage = SetupError.stage
				}
				
				if config.isContentPolicy then
					return LocalizationStringsModule.CHAT_POLICY_REJECTION
				end
				if config.setupStage == "missing_project" then
					return LocalizationStringsModule.CHAT_MISSING_PROJECT
				end
				if config.errorCode ~= nil then
					local Entry = config1[config.errorCode]
					
					if Entry ~= nil then
						return Entry
					end
				end
				return LocalizationStringsModule.CHAT_DEFAULT_FAILURE
			end,
			start = function()
				-- upvalues: FFlagBuildExperiencePromptFailureTelemetry (upval), PromptLifecycleTelemetryModule (copy), Callback1 (ref), trackPromptActivity (upval), SendPromptResult (ref), LocalToolControllers (copy)
				if FFlagBuildExperiencePromptFailureTelemetry and PromptLifecycleTelemetryModule ~= nil then
					PromptLifecycleTelemetryModule.start()
					
					if Callback1 == nil then
						Callback1 = trackPromptActivity(SendPromptResult, PromptLifecycleTelemetryModule, LocalToolControllers.getOptimisticLocalTools)
					end
				end
				SendPromptResult.start()
			end,
			stop = function()
				-- upvalues: LocalToolControllers (copy), SendPromptResult (ref)
				LocalToolControllers.stopPending()
				SendPromptResult.stop()
			end,
			reportUserStop = if FFlagBuildExperiencePromptFailureTelemetry and PromptLifecycleTelemetryModule ~= nil then PromptLifecycleTelemetryModule.reportUserStop else nil,
			detach = if FFlagBuildExperiencePromptFailureTelemetry and PromptLifecycleTelemetryModule ~= nil then function()
				-- upvalues: LocalToolControllers (copy), PromptLifecycleTelemetryModule (copy), Callback1 (ref)
				LocalToolControllers.stopPending()
				
				if Callback1 ~= nil then
					Callback1()
					Callback1 = nil
				end
				PromptLifecycleTelemetryModule.finish()
			end else LocalToolControllers.stopPending,
			syncFromTurnState = LocalToolControllers.syncFromTurnState,
			trySubmitComposerText = LocalToolControllers.trySubmitComposerText,
			trySubmitAnswerText = LocalToolControllers.trySubmitAnswerText
		}
	end,
	createResumedAssistantTurn = function(p6, p7, Callback, AfterSequenceId, p8, p9)
		-- upvalues: createLocalToolControllers (copy), SignalsModule (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), SendBuildExperienceEventModule (copy)
		local LocalToolControllers = createLocalToolControllers(p6, p8, p9)
		local Flag = false
		local Flag1 = false
		local StartPollingActiveTurnResult: (() -> ())? = nil
		local Effect: (() -> ())? = nil
		
		local function _()
			-- upvalues: Effect (ref), StartPollingActiveTurnResult (ref)
			if Effect ~= nil then
				Effect()
				Effect = nil
			end
			if StartPollingActiveTurnResult ~= nil then
				StartPollingActiveTurnResult()
				StartPollingActiveTurnResult = nil
			end
		end
		
		local function finish()
			-- upvalues: Flag1 (ref), Effect (ref), StartPollingActiveTurnResult (ref), FFlagBuildExperiencePromptFailureTelemetry (upval), p7 (copy), SendBuildExperienceEventModule (upval), p6 (copy), Callback (copy)
			if Flag1 then return end
			Flag1 = true
			
			if Effect ~= nil then
				Effect()
				Effect = nil
			end
			if StartPollingActiveTurnResult ~= nil then
				StartPollingActiveTurnResult()
				StartPollingActiveTurnResult = nil
			end
			if FFlagBuildExperiencePromptFailureTelemetry then
				local StateResult = p7.state(false)
				
				if (StateResult.status == "failed" or StateResult.stopReason == "error") and StateResult.requestId == nil then
					local config = { status = StateResult.status }
					
					if StateResult.stopReason ~= nil then
						config.stopReason = StateResult.stopReason
					end
					if StateResult.errorCode ~= nil then
						config.errorCode = tostring(StateResult.errorCode)
					end
					config.isResumedTurn = "true"
					SendBuildExperienceEventModule("AGENT_TURN_FAILED", {
						universeId = p6.universeId,
						placeId = p6.placeId,
						conversationId = p6.getCasSessionId()
					}, config)
				end
			end
			Callback(nil)
		end
		
		local Flag2 = false
		
		return {
			getOptimisticLocalTools = LocalToolControllers.getOptimisticLocalTools,
			getLocalToolActions = LocalToolControllers.getLocalToolActions,
			getSetupErrorText = SignalsModule.createSignal(nil),
			start = function()
				-- upvalues: Flag (ref), SendBuildExperienceEventModule (upval), p6 (copy), AfterSequenceId (copy), StartPollingActiveTurnResult (ref), Effect (ref), SignalsModule (upval), p7 (copy), finish (copy)
				if Flag then return end
				Flag = true
				local config = {
					onDroppedChatMessage = function(MessageId)
						-- upvalues: SendBuildExperienceEventModule (upval), p6 (upval)
						SendBuildExperienceEventModule("DROPPED_CHAT_MESSAGE", {
							universeId = p6.universeId,
							placeId = p6.placeId,
							conversationId = p6.getCasSessionId(),
							messageId = MessageId
						})
					end
				}
				
				if AfterSequenceId ~= nil then
					config.afterSequenceId = AfterSequenceId
				end
				StartPollingActiveTurnResult = p6.startPollingActiveTurn(config)
				Effect = SignalsModule.createEffect(function(p10)
					-- upvalues: p7 (upval), finish (upval)
					if p7.state(p10).isDone then
						finish()
					end
				end)
			end,
			stop = function()
				-- upvalues: Flag1 (ref), Effect (ref), StartPollingActiveTurnResult (ref), LocalToolControllers (copy), p7 (copy)
				Flag1 = true
				
				if Effect ~= nil then
					Effect()
					Effect = nil
				end
				if StartPollingActiveTurnResult ~= nil then
					StartPollingActiveTurnResult()
					StartPollingActiveTurnResult = nil
				end
				LocalToolControllers.stopPending()
				p7.cancel()
			end,
			reportUserStop = if FFlagBuildExperiencePromptFailureTelemetry then function()
				-- upvalues: Flag1 (ref), Flag2 (ref), SendBuildExperienceEventModule (upval), p6 (copy)
				if not Flag1 and not Flag2 then
					Flag2 = true
					SendBuildExperienceEventModule("SEND_PROMPT_STOPPED", {
						universeId = p6.universeId,
						placeId = p6.placeId,
						conversationId = p6.getCasSessionId()
					}, { isResumedTurn = "true" })
					
					return
				end
			end else nil,
			detach = function()
				-- upvalues: Flag1 (ref), Effect (ref), StartPollingActiveTurnResult (ref), LocalToolControllers (copy)
				Flag1 = true
				
				if Effect ~= nil then
					Effect()
					Effect = nil
				end
				if StartPollingActiveTurnResult ~= nil then
					StartPollingActiveTurnResult()
					StartPollingActiveTurnResult = nil
				end
				LocalToolControllers.stopPending()
			end,
			syncFromTurnState = LocalToolControllers.syncFromTurnState,
			trySubmitComposerText = LocalToolControllers.trySubmitComposerText,
			trySubmitAnswerText = LocalToolControllers.trySubmitAnswerText
		}
	end,
	getPromptFailureComposerError = function(p6)
		-- upvalues: LocalizationStringsModule (copy), config1 (copy)
		if p6.isContentPolicy then
			return LocalizationStringsModule.CHAT_POLICY_REJECTION
		end
		if p6.setupStage == "missing_project" then
			return LocalizationStringsModule.CHAT_MISSING_PROJECT
		end
		if p6.errorCode ~= nil then
			local Entry = config1[p6.errorCode]
			
			if Entry ~= nil then
				return Entry
			end
		end
		return LocalizationStringsModule.CHAT_DEFAULT_FAILURE
	end,
	getToolResultFailureComposerError = function(ErrorCode)
		-- upvalues: Forbidden (copy), LocalizationStringsModule (copy), config1 (copy)
		local config = {
			outOfCreditsReason = nil,
			setupStage = nil,
			errorCode = ErrorCode,
			isContentPolicy = ErrorCode == Forbidden
		}
		
		if config.isContentPolicy then
			return LocalizationStringsModule.CHAT_POLICY_REJECTION
		end
		if config.setupStage == "missing_project" then
			return LocalizationStringsModule.CHAT_MISSING_PROJECT
		end
		if config.errorCode ~= nil then
			local Entry = config1[config.errorCode]
			
			if Entry ~= nil then
				return Entry
			end
		end
		return LocalizationStringsModule.CHAT_DEFAULT_FAILURE
	end
}