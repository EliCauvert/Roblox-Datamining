local Parent = script:FindFirstAncestor("BuildExperience").Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.chatTypes)
local AskUserControllerModule = require(script.Parent.askUserController)
local ClientLogsControllerModule = require(script.Parent.clientLogsController)
local LocalToolOverlayModule = require(script.Parent.localToolOverlay)
local ProposePlanControllerModule = require(script.Parent.proposePlanController)
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioClientLogsTool = CreatorAgentChatModule.StudioClientLogsTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool
local Debug = CreatorAgentChatModule.debug
local ErrorCodes = CreatorAgentChatModule.ErrorCodes
local Forbidden = ErrorCodes.Forbidden
local config = {
	[ErrorCodes.InvalidParams] = "Something went wrong with your message. Please edit it and try again.",
	[ErrorCodes.Unauthorized] = "You're signed out. Please sign in and try again.",
	[ErrorCodes.Forbidden] = "The assistant isn't available for your account right now.",
	[ErrorCodes.NotFound] = "We couldn't find this chat. Please start a new one.",
	[ErrorCodes.Conflict] = "The assistant is busy with another request. Please wait a moment and try again.",
	[ErrorCodes.Gone] = "This chat is no longer available. Please start a new one.",
	[ErrorCodes.UpstreamUnavailable] = "The assistant is temporarily unavailable. Please try again in a moment.",
	[ErrorCodes.InternalError] = "The assistant ran into a problem. Please try again."
}

local function resolvePromptFailure(p1, SetupError)
	-- upvalues: Forbidden (copy)
	return if p1 == nil then if SetupError == nil then nil else {
		isContentPolicy = false,
		errorCode = SetupError.errorCode,
		setupStage = SetupError.stage
	} elseif p1.status == "failed" then {
		errorCode = p1.errorCode,
		isContentPolicy = p1.errorCode == Forbidden
	} else nil
end

local function _(p1)
	-- upvalues: config (copy)
	local config1 = {
		isContentPolicy = false,
		errorCode = p1.errorCode,
		setupStage = p1.stage
	}
	
	if config1.isContentPolicy then
		return "Your message violates Roblox safety policy. Edit it and try again."
	end
	if config1.setupStage == "missing_project" then
		return "An experience is required to chat with the assistant."
	end
	if config1.errorCode ~= nil then
		local Entry = config[config1.errorCode]
		
		if Entry ~= nil then
			return Entry
		end
	end
	return "The assistant couldn't connect. Please try again."
end

local function createLocalToolControllers(p1)
	-- upvalues: LocalToolOverlayModule (copy), AskUserControllerModule (copy), ProposePlanControllerModule (copy), ClientLogsControllerModule (copy)
	local t = {}
	local LocalToolOverlayModuleResult = LocalToolOverlayModule()
	local AskUserControllerModuleResult = AskUserControllerModule(p1, t, LocalToolOverlayModuleResult)
	local ProposePlanControllerModuleResult = ProposePlanControllerModule(p1, t, LocalToolOverlayModuleResult)
	local ClientLogsControllerModuleResult = ClientLogsControllerModule(p1, t)
	
	return {
		getOptimisticLocalTools = LocalToolOverlayModuleResult.getOptimisticLocalTools,
		getLocalToolActions = LocalToolOverlayModuleResult.getLocalToolActions,
		hasDisplayedAnswerStack = AskUserControllerModuleResult.hasDisplayedAnswerStack,
		syncFromTurnState = function(p2)
			-- upvalues: AskUserControllerModuleResult (copy), ProposePlanControllerModuleResult (copy), ClientLogsControllerModuleResult (copy)
			AskUserControllerModuleResult.syncAnswerStack(p2)
			ProposePlanControllerModuleResult.syncPlanProposal(p2)
			ClientLogsControllerModuleResult.syncClientLogsRequest(p2)
		end,
		trySubmitComposerText = function(p2)
			-- upvalues: AskUserControllerModuleResult (copy), ProposePlanControllerModuleResult (copy)
			return AskUserControllerModuleResult.trySubmitComposerText(p2) or ProposePlanControllerModuleResult.trySubmitComposerText(p2)
		end,
		stopPending = function()
			-- upvalues: AskUserControllerModuleResult (copy), ProposePlanControllerModuleResult (copy)
			AskUserControllerModuleResult.stopPendingAnswer()
			ProposePlanControllerModuleResult.stopPendingPlan()
		end
	}
end

return {
	createLiveAssistantTurn = function(p1, Prompt, Callback)
		-- upvalues: createLocalToolControllers (copy), StudioAskUserTool (copy), StudioProposePlanTool (copy), StudioClientLogsTool (copy), resolvePromptFailure (copy), Debug (copy), config (copy)
		local LocalToolControllers = createLocalToolControllers(p1)
		local UniverseId = p1.universeId
		local SendPromptResult = nil
		SendPromptResult = p1.sendPrompt({
			prompt = Prompt,
			promptMeta = {
				_roblox = {
					localTools = {
						StudioAskUserTool.LOCAL_TOOL_DEFINITION,
						StudioProposePlanTool.LOCAL_TOOL_DEFINITION,
						StudioClientLogsTool.LOCAL_TOOL_DEFINITION
					},
					providerConfig = { universeId = UniverseId }
				}
			},
			onCompleted = function(p2)
				-- upvalues: resolvePromptFailure (upval), SendPromptResult (ref), Debug (upval), UniverseId (copy), p1 (copy), Callback (copy)
				local ResolvePromptFailureResult = resolvePromptFailure(p2, SendPromptResult.getSetupError(false))
				
				if ResolvePromptFailureResult ~= nil then
					Debug.log("info", "prompt send failed", {
						errorCode = ResolvePromptFailureResult.errorCode,
						isContentPolicy = ResolvePromptFailureResult.isContentPolicy,
						setupStage = ResolvePromptFailureResult.setupStage,
						universeId = UniverseId,
						placeId = p1.placeId
					})
				end
				Callback(ResolvePromptFailureResult)
			end
		})
		
		local function getSetupErrorText(p2)
			-- upvalues: SendPromptResult (ref), config (upval)
			local SetupError = SendPromptResult.getSetupError(p2)
			
			if SetupError == nil then
				return nil
			end
			local config1 = {
				isContentPolicy = false,
				errorCode = SetupError.errorCode,
				setupStage = SetupError.stage
			}
			
			if config1.isContentPolicy then
				return "Your message violates Roblox safety policy. Edit it and try again."
			end
			if config1.setupStage == "missing_project" then
				return "An experience is required to chat with the assistant."
			end
			if config1.errorCode ~= nil then
				local Entry = config[config1.errorCode]
				
				if Entry ~= nil then
					return Entry
				end
			end
			return "The assistant couldn't connect. Please try again."
		end
		
		Debug.log("info", "creator agent local tools registered for prompt", {
			universeId = UniverseId,
			placeId = p1.placeId,
			toolName = StudioAskUserTool.TOOL_NAME,
			planToolName = StudioProposePlanTool.TOOL_NAME,
			logsToolName = StudioClientLogsTool.TOOL_NAME
		})
		
		return {
			getOptimisticLocalTools = LocalToolControllers.getOptimisticLocalTools,
			getLocalToolActions = LocalToolControllers.getLocalToolActions,
			getSetupErrorText = getSetupErrorText,
			start = function()
				-- upvalues: SendPromptResult (ref)
				SendPromptResult.start()
			end,
			stop = function()
				-- upvalues: LocalToolControllers (copy), SendPromptResult (ref)
				LocalToolControllers.stopPending()
				SendPromptResult.stop()
			end,
			syncFromTurnState = LocalToolControllers.syncFromTurnState,
			trySubmitComposerText = LocalToolControllers.trySubmitComposerText
		}
	end,
	createResumedAssistantTurn = function(p1, p2, Callback, AfterSequenceId)
		-- upvalues: createLocalToolControllers (copy), SignalsModule (copy)
		local LocalToolControllers = createLocalToolControllers(p1)
		local Flag = false
		local Flag1 = false
		local StartPollingActiveTurnResult: (() -> ())? = nil
		local Effect: (() -> ())? = nil
		
		local function _()
			-- upvalues: Flag1 (ref), Effect (ref), StartPollingActiveTurnResult (ref), Callback (copy)
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
			Callback(nil)
		end
		
		return {
			getOptimisticLocalTools = LocalToolControllers.getOptimisticLocalTools,
			getLocalToolActions = LocalToolControllers.getLocalToolActions,
			getSetupErrorText = SignalsModule.createSignal(nil),
			start = function()
				-- upvalues: Flag (ref), AfterSequenceId (copy), StartPollingActiveTurnResult (ref), p1 (copy), Effect (ref), SignalsModule (upval), p2 (copy), Flag1 (ref), Callback (copy)
				if Flag then return end
				Flag = true
				local t = {}
				
				if AfterSequenceId ~= nil then
					t.afterSequenceId = AfterSequenceId
				end
				StartPollingActiveTurnResult = p1.startPollingActiveTurn(t)
				Effect = SignalsModule.createEffect(function(p3)
					-- upvalues: p2 (upval), Flag1 (upval), Effect (upval), StartPollingActiveTurnResult (upval), Callback (upval)
					if p2.state(p3).isDone then
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
						Callback(nil)
					end
				end)
			end,
			stop = function()
				-- upvalues: Flag1 (ref), Effect (ref), StartPollingActiveTurnResult (ref), LocalToolControllers (copy), p2 (copy)
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
				p2.cancel()
			end,
			syncFromTurnState = LocalToolControllers.syncFromTurnState,
			trySubmitComposerText = LocalToolControllers.trySubmitComposerText
		}
	end,
	getPromptFailureComposerError = function(p1)
		-- upvalues: config (copy)
		if p1.isContentPolicy then
			return "Your message violates Roblox safety policy. Edit it and try again."
		end
		if p1.setupStage == "missing_project" then
			return "An experience is required to chat with the assistant."
		end
		if p1.errorCode ~= nil then
			local Entry = config[p1.errorCode]
			
			if Entry ~= nil then
				return Entry
			end
		end
		return "The assistant couldn't connect. Please try again."
	end
}