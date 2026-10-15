local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local fFlagBuildExperiencePersistChatDraftModule = require(buildExperience.Flags.FFlagBuildExperiencePersistChatDraft)
local fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule = require(buildExperience.Flags.FFlagBuildExperienceRefreshChatDraftOnGameLeave)
local messageBusService = game:GetService("MessageBusService")
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeCreateModule = require(parent.DataHydration.UniverseCreate)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceClientDataModelTools = sharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceChatHistoryPrefetchModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)
local fFlagBuildExperienceFixChatBottomLockModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatBottomLock)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local fFlagBuildExperienceLibrary = sharedFlagsModule.FFlagBuildExperienceLibrary
local fFlagBuildExperiencePromptFailureTelemetry = sharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local fFlagBuildExperienceNewGameChatDraftModule = require(buildExperience.Flags.FFlagBuildExperienceNewGameChatDraft)
local fFlagBuildExperienceRestoreStoppedPromptModule = require(buildExperience.Flags.FFlagBuildExperienceRestoreStoppedPrompt)
local chatConstantsModule = require(script.Parent.chatConstants)
local chatTypesModule = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local getNewGameChatDraftKeyModule = require(script.Parent.getNewGameChatDraftKey)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)
local fFlagBuildExperienceAnswerFormModule = require(buildExperience.Flags.FFlagBuildExperienceAnswerForm)
local var1 = if fFlagBuildExperienceAnswerFormModule then require(script.Parent.getActiveAnswerForm) else nil
local sessionPromptMessageFilterModule = require(script.Parent.sessionPromptMessageFilter)
local useAgentRollbackRequestModule = require(script.Parent.useAgentRollbackRequest)
local useChatScrollModule = require(script.Parent.useChatScroll)
local buildAgentRollbackPromptModule = require(buildExperience.utils.buildAgentRollbackPrompt)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local _ = require(parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local var2 = creatorAgentChatModule.experimentOverride.isEnabled()
local var3 = if fFlagBuildExperiencePersistChatDraftModule then require(buildExperience.Storage.BuildAppStorage) else nil
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local var4 = if fFlagBuildExperienceChatImageAttachmentsModule then require(buildExperience.utils.uploadCaptureAsync) else nil
local debug = creatorAgentChatModule.debug
local requestFailureKind = creatorAgentChatModule.RequestFailureKind
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local var5 = signalsModule.createSignal(false)

local function noopSetAgentSpecVersion(_) end

local frozen = table.freeze({})
local _ = {
	CreateUniverse = "create_universe",
	ConfigureUniverse = "configure_universe"
}
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var6 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
})
local var7 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
})
local var8 = signalsModule.createSignal(nil)
local var9 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p1, p2, p3)
	return if p1 == nil or p1.session ~= p2 then false else p3 == nil or p3 == "" or (if p1.sessionId ~= p3 then p1.sessionId == nil and p1.session.getCasSessionId() == p3 else true)
end

local _ = function(p1, p2, p3)
	return (if p1.universeId ~= nil then if p2 ~= nil then p1.universeId == p2 else true else true) and (if p1.sessionId ~= nil then if p3 ~= nil then p1.sessionId == p3 else true else true)
end

local _ = function(p1)
	return if p1.kind == "assistant_turn" and p1.isDone and (p1.isOptimisticallyCancelled ~= true and p1.turnState ~= nil) then p1.endSequenceId or p1.startSequenceId else nil
end

local _ = function(p1)
	local turnFeedbackIds = p1.turnFeedbackIds
	
	return if turnFeedbackIds == nil or typeof(turnFeedbackIds) == "function" then nil else turnFeedbackIds.turnId
end

local function noteLiveAdUpsellTurns(p1, p2)
	for i, v in p2 do
		if v.kind == "assistant_turn" and v.startSequenceId ~= nil then
			local turnFeedbackIds = v.turnFeedbackIds
			local var10 = if turnFeedbackIds == nil or typeof(turnFeedbackIds) == "function" then nil else turnFeedbackIds.turnId
			turnFeedbackIds = var10 ~= nil and p1.liveTurnIds[var10] == true
			local historyWatermarkSequenceId = p1.historyWatermarkSequenceId
			
			if turnFeedbackIds or (not v.isDone and (historyWatermarkSequenceId ~= nil and historyWatermarkSequenceId < v.startSequenceId)) then
				p1.liveTurnStartSequenceIds[v.startSequenceId] = true
			end
		end
	end
end

local function hasPendingLocalToolResponse(p3)
	-- upvalues: fFlagBuildExperienceManageDevProductModule (ref)
	for i in p3.askUserByToolCallId do
		if not p3.submittedToolCallIds[i] then
			return true
		end
	end
	for i in p3.planByToolCallId do
		if not p3.submittedToolCallIds[i] then
			return true
		end
	end
	if fFlagBuildExperienceManageDevProductModule then
		for i in p3.devProductByToolCallId do
			if not p3.submittedToolCallIds[i] then
				return true
			end
		end
	end
	return false
end

local _ = function(p4)
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p4, p5)
	local var11 = 8
	
	local function tryFocus()
		-- upvalues: p5 (ref), p4 (ref), var11 (write), tryFocus (ref)
		if p5() then return end
		local current = p4.current
		
		if current then
			current.focus()
			
			return
		end
		var11 -= 1
		
		if var11 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p4)
	local casSessionId = p4.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p4.universeId
	local placeId = p4.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

local _ = function(p4, p5, p6, p7, p8)
	-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref)
	return if p4 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p5 == true and (p6 == nil and p7 ~= nil))) then nil else { setupErrorText = p8 }
end

return function(p4)
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildExperienceLibrary (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var9 (ref), signalsModule (ref), signalsReactModule (ref), noopSetAgentSpecVersion (ref), var2 (ref), var6 (ref), var7 (ref), var8 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), sessionPromptMessageFilterModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), var5 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), fFlagBuildExperienceNewGameChatDraftModule (ref), fFlagBuildExperienceRestoreStoppedPromptModule (ref), frozen (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (ref), fFlagBuildExperiencePersistChatDraftModule (ref), var3 (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), getNewGameChatDraftKeyModule (ref), chatTypesModule (ref), var4 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), fFlagBuildExperienceAnswerFormModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), fFlagBuildExperiencePromptFailureTelemetry (ref), universeConfigurationModule (ref), chatConstantsModule (ref), requestFailureKind (ref), sendBuildExperienceEventModule (ref), launchPlaytestWithLoadingStateModule (ref), var1 (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref)
	local var11 = reactModule.useContext(localizationRoactContext)
	local chat_create_universe_error = var11:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR)
	local var12 = if fFlagBuildExperienceChatImageAttachmentsModule then var11:Format(localizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState(nil)
	local var17 = nil
	local var18 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var19 = reactModule.useRef(true)
		var17 = var19
		var18 = reactModule.useCallback(function()
			-- upvalues: var19 (ref)
			return var19.current
		end, { var19 })
	end
	local placeId = p4.placeId
	local universeId = p4.universeId
	local sessionId = p4.sessionId
	
	if var13 ~= nil then
		placeId = var13.placeId
		universeId = var13.universeId
		sessionId = var13.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var15 ~= nil and var15.universeId == universeId) and var15.placeId == placeId then
		sessionId = var15.sessionId
	end
	local var20 = p4.hydrateHistoryWhen == nil or p4.hydrateHistoryWhen
	local var21 = fFlagBuildExperienceLibrary and p4.isLibraryChat == true
	local var22 = if fFlagBuildAdUpsellModule then reactModule.useRef(p4.trackAdUpsellTurns == true).current else false
	local fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule or var22
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var23 = getAgentRollbackRequestStoreModule()
	local var24 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var24 (ref), sessionId (write)
		if var24 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var24.setCasSessionId(sessionId)
	end, { var24, sessionId })
	local var25 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var24 (ref), var9 (copy), signalsModule (copy)
		return if var24 == nil then var9 else signalsModule.createComputed(function(p5)
			-- upvalues: var24 (copy)
			return {
				session = var24,
				sessionId = var24.getCasSessionId(),
				events = var24.getMergedHistory(p5)
			}
		end)
	end, { var24 }))
	local var26 = if var24 ~= nil then nil else var24.getCasSessionId()
	local specVersion = nil
	local var27 = noopSetAgentSpecVersion
	local var28 = nil
	local var29 = nil
	
	if var2 then
		local var30 = reactModule.useRef(nil)
		
		if var30.current == nil then
			var30.current = creatorAgentChatModule.experimentOverride.createPendingKey()
		end
		local current = var30.current
		var28 = current
		local var31 = reactModule.useRef(false)
		var29 = var31
		local var32 = creatorAgentChatModule.experimentOverride.getKey(var26) or current
		specVersion = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: creatorAgentChatModule (copy), var32 (ref)
			return creatorAgentChatModule.experimentOverride.getStateSignal(var32)
		end, { var32 })).specVersion
		var27 = reactModule.useCallback(function(p5)
			-- upvalues: var24 (ref), creatorAgentChatModule (copy), current (ref), var31 (ref)
			local key = creatorAgentChatModule.experimentOverride.getKey(if var24 ~= nil then nil else var24.getCasSessionId())
			
			if key == nil then
				key = current
				var31.current = true
				
				if var24 ~= nil then
					var24.setPendingExperimentKey(current)
				end
			end
			creatorAgentChatModule.experimentOverride.set(key, p5)
		end, { var24, current })
		reactModule.useEffect(function()
			-- upvalues: var24 (ref), var31 (ref), current (ref)
			if var24 == nil or not var31.current then
				return
			end
			var24.setPendingExperimentKey(current)
		end, { var24, current })
		reactModule.useEffect(function()
			-- upvalues: creatorAgentChatModule (copy), current (ref)
			return function()
				-- upvalues: creatorAgentChatModule (copy), current (copy)
				creatorAgentChatModule.experimentOverride.clear(current)
			end
		end, { current })
	end
	local var33 = if var25.session == var24 and var25.sessionId == var26 then var25.events else {}
	local var34 = sessionId ~= nil and sessionId ~= ""
	local var35 = var34 or (universeId ~= nil and universeId ~= 0)
	local var36 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	
	if var36 then
		var36 = var20
		
		if var36 then
			var36 = false
			
			if var24 ~= nil then
				var36 = var35
				
				if var36 then
					var36 = not (var24.hasLoadedHistory() and #var33 > 0)
				end
			end
		end
	end
	local var37 = nil
	local var38 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 then
		local var39, var40 = reactModule.useState(function()
			-- upvalues: var24 (ref), sessionId (write), universeId (write), var20 (ref), var36 (ref)
			return {
				session = var24,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var20,
				isLoading = var36
			}
		end)
		var37 = var39
		var38 = var40
	end
	local var41 = if var37 ~= nil and (var37.session == var24 and (var37.sessionId == sessionId and (var37.universeId == universeId and var37.hydrateHistoryWhen == var20))) then not var37.isLoading else not var36
	local var42 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and (if var41 then var24 ~= nil and var24.getNextHistoryPageToken() ~= nil else not var41)
	local var43, var44 = reactModule.useState(nil)
	local var45, var46 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var46 (ref)
		var46(nil)
	end, { var24, sessionId })
	local var47 = sessionId
	local var48 = if if var45 == nil or var45.session ~= var24 then false else var47 == nil or var47 == "" or (if var45.sessionId ~= var47 then var45.sessionId == nil and var45.session.getCasSessionId() == var47 else true) then var45 else nil
	var100, var98 = reactModule.useState(nil)
	local var49 = reactModule.useRef(nil)
	local var50 = reactModule.useRef(nil)
	local var51 = reactModule.useRef(0)
	local var52 = reactModule.useRef(nil)
	local var53 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var49 (ref), var50 (ref), var47 (ref)
		assert(if p5 ~= nil then p6 ~= nil else true, "Active turns require an owning session")
		var49.current = p5
		var50.current = if p5 ~= nil then nil else { session = p6, sessionId = p6.getCasSessionId() }
		var47(p5)
	end, { var47 })
	local current = var50.current
	local var54 = sessionId
	local var55 = if if current == nil or current.session ~= var24 then false else var54 == nil or var54 == "" or (if current.sessionId ~= var54 then current.sessionId == nil and current.session.getCasSessionId() == var54 else true) then var100 else nil
	local var56 = if var55 ~= nil then var6 else var55.getOptimisticLocalTools
	current = if var55 ~= nil then var7 else var55.getLocalToolActions
	var54 = if var55 ~= nil then var8 else var55.getSetupErrorText
	local var57 = signalsReactModule.useSignalState(var56)
	local var58 = signalsReactModule.useSignalState(current)
	local var59 = signalsReactModule.useSignalState(var54)
	local var60 = if var59 ~= nil then var59 else var11:Format(var59)
	local var61 = reactModule.useMemo(function()
		-- upvalues: var55 (ref), p4 (ref), var24 (ref), var43 (ref), var60 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var55 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p4.createUniverseOnFirstPrompt == true and (var24 == nil and var43 ~= nil))) then nil else { setupErrorText = var60 }
	end, {
		var55,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p4.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var43 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var24 else nil,
		var60
	})
	local var62 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var33 (ref), var24 (ref), sessionId (write), universeId (write), placeId (write), var57 (ref), var43 (ref), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), fFlagBuildExperienceChatResourceAttachments (copy), var61 (ref), var48 (ref)
		return parseSessionStreamModule(var33, {
			sessionId = if var24 ~= nil then sessionId else var24.getCasSessionId() or sessionId,
			universeId = if var24 ~= nil then universeId else var24.universeId,
			placeId = if var24 ~= nil then placeId else var24.placeId,
			optimisticLocalTools = var57,
			pendingUserMessage = if var43 == nil or not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var43.text) then nil else var43.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var43 ~= nil and sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var43.text) then var43.images else nil,
			pendingUserResourceAttachments = if fFlagBuildExperienceChatResourceAttachments and var43 ~= nil and sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var43.text) then var43.resourceAttachments else nil,
			pendingUserMessageAfterSequenceId = if var43 ~= nil then nil else var43.afterSequenceId,
			liveAssistantMessage = var61,
			optimisticCancelledStartSequenceId = if var48 ~= nil then nil else var48.startSequenceId
		})
	end, {
		var33, var24, sessionId, universeId, placeId, var57, var43, var61, var48
	})
	local var63 = if var22 then reactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = universeId,
		sessionId = if var24 ~= nil then sessionId else var24.getCasSessionId() or sessionId,
		historyWatermarkSequenceId = var62.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local var64 = if var63 ~= nil then reactModule.useCallback(function(p5)
		-- upvalues: var63 (write)
		if p5 ~= nil then
			var63.current.liveTurnIds[p5] = true
		end
	end, { var63 }) else nil
	local messages = var62.messages
	local var65 = var24 ~= nil and var24.getNextHistoryPageToken() ~= nil
	local var66 = if var24 ~= nil then not var35 or var24.hasLoadedHistory() else true
	local var67 = var41 and (var66 and (if var24 ~= nil then if #messages <= 0 then not var65 else true else true))
	local var68 = var67 and not var65
	local subagentTaskState = var62.subagentTaskState
	local includesPublishTool = var62.includesPublishTool
	local var69 = messages[#messages]
	local var70 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: placeId (write), var23 (ref), var5 (copy)
		return if placeId == nil then var5 else var23.getIsPendingForPlaceId(placeId)
	end, { placeId, var23 }))
	local var71 = if var55 == nil and var69 ~= nil then var69.kind == "assistant_turn" and (not var69.isDone or var70) else true
	local var72 = var71 and (not var70 and hasPendingLocalToolResponse(var57))
	local activeTurnState = var62.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var55 (ref), activeTurnState (ref)
		if var55 == nil or activeTurnState == nil then
			return
		end
		var55.syncFromTurnState(activeTurnState)
	end, { var55, activeTurnState })
	
	if var22 then
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), var63 (write), var24 (ref), universeId (write), sessionId (write), var62 (ref), var67 (ref), noteLiveAdUpsellTurns (copy), messages (ref)
			local onAssistantTurnCompleted = p4.onAssistantTurnCompleted
			local var73 = if var24 ~= nil then universeId else var24.universeId or universeId
			local var74 = if var24 ~= nil then sessionId else var24.getCasSessionId() or sessionId
			local current = var63.current
			local var75 = current
			
			if (if var75.universeId ~= nil then if var73 ~= nil then var75.universeId == var73 else true else true) and (if var75.sessionId ~= nil then if var74 ~= nil then var75.sessionId == var74 else true else true) then
				current.universeId = var73 or current.universeId
				current.sessionId = var74 or current.sessionId
			else
				current = {
					isInitialized = false,
					lastProcessedSequenceId = nil,
					universeId = var73,
					sessionId = var74,
					historyWatermarkSequenceId = var62.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				var63.current = current
			end
			local var76
			if not var67 then
				current.historyWatermarkSequenceId = current.historyWatermarkSequenceId or var62.latestSequenceId
				noteLiveAdUpsellTurns(current, messages)
				
				return
			elseif not current.isInitialized then
				current.isInitialized = true
				noteLiveAdUpsellTurns(current, messages)
				var76 = nil
				
				for i in current.liveTurnStartSequenceIds do
					if var76 == nil or i < var76 then
						var76 = i
					end
				end
				if var76 == nil then
					current.lastProcessedSequenceId = current.historyWatermarkSequenceId or var62.latestSequenceId
				else
					current.lastProcessedSequenceId = var76 - 1
				end
				current.liveTurnIds = {}
				current.liveTurnStartSequenceIds = {}
			end
			if var73 == nil or var73 == 0 then return end
			var76 = current.lastProcessedSequenceId or -1
			
			for i, v in messages do
				local var77 = if v.kind == "assistant_turn" and v.isDone and (v.isOptimisticallyCancelled ~= true and v.turnState ~= nil) then v.endSequenceId or v.startSequenceId else nil
				
				if var77 ~= nil and var77 > var76 then
					if onAssistantTurnCompleted ~= nil then
						onAssistantTurnCompleted({
							universeId = var73,
							sessionId = v.sessionId or var74,
							turnState = v.turnState,
							latestSequenceId = var77
						})
					end
					current.lastProcessedSequenceId = var77
					var76 = var77
				end
			end
		end, {
			p4.onAssistantTurnCompleted, var24, universeId, sessionId, var67, messages,
			var62.latestSequenceId
		})
	end
	local var78, var79 = reactModule.useBinding("")
	local var80, var81 = reactModule.useState(nil)
	local var82 = reactModule.useRef("")
	local var83 = reactModule.useRef("")
	local var84 = reactModule.useRef(nil)
	local var85 = reactModule.useRef(var26)
	local var86 = reactModule.useRef(nil)
	var85.current = var26
	local var87 = p4.createUniverseOnFirstPrompt == true and universeId == nil
	local var88 = p4.createUniverseOnFirstPrompt == true
	local var89 = if fFlagBuildExperienceNewGameChatDraftModule then reactModule.useRef(var88) else { current = var88 }
	var89.current = var88
	local var90 = if fFlagBuildExperienceRestoreStoppedPromptModule then reactModule.useRef(nil) else nil
	local var91 = if var21 then frozen else {}
	local var92 = nil
	local t = { current = {} }
	local var93 = reactModule.useRef({})
	local var94 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var95, var96 = reactModule.useState({})
		var91 = var95
		var92 = var96
		t = reactModule.useRef({})
	end
	local t_1 = {}
	local var97 = nil
	local t_2 = { current = {} }
	local t_3 = {
		current = { universeId = p4.universeId, placeId = p4.placeId }
	}
	
	if fFlagBuildExperienceChatResourceAttachments then
		local var98, var99 = reactModule.useState({})
		t_1 = var98
		var97 = var99
		t_2 = reactModule.useRef({})
		t_3 = reactModule.useRef({ universeId = p4.universeId, placeId = p4.placeId })
	end
	local var100 = reactModule.useRef(nil)
	local var101 = reactUtilsModule.useClock()
	local var102 = useChatScrollModule(var21)
	local var103 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var104 = reactModule.useCallback(function(p5)
		-- upvalues: var102 (ref), var24 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
		local var105 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var102.captureDistanceFromBottom()
		
		if var24 == nil then return end
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var24.requestOlderHistoryWhile(var105, function()
				-- upvalues: var102 (copy)
				return var102.isNearTopRef.current
			end)
			
			return
		end
		task.spawn(function()
			-- upvalues: var24 (copy), var105 (ref), var102 (copy), p5 (ref)
			if var24.loadOlderHistory(var105) and var24.getNextHistoryPageToken() ~= nil and var102.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var102 (copy), var24 (copy), var105 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var102.isViewportUnderfilled() then
						var24.loadOlderHistory(var105)
					end
				end)
			end
		end)
	end, { var24, var102 })
	local var105 = reactModule.useCallback(function(p5)
		-- upvalues: var24 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var102 (ref), var104 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var24 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var102 (copy), var104 (copy)
			if p5() then return end
			if var24 == nil then return end
			if var24.getNextHistoryPageToken() == nil then return end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				if var102.isNearTopRef.current then
					var104(p5)
					
					return
				else
					return
				end
			elseif var102.isViewportUnderfilled() then
			else
			end
		end)
	end, { var104, var102, var24 })
	local var106 = reactModule.useCallback(function(p5)
		-- upvalues: var24 (ref), var105 (ref)
		if var24 == nil then return end
		if var24.getNextHistoryPageToken() == nil then
			return
		end
		var105(p5)
	end, { var105, var24 })
	local var107 = reactModule.useRef(var106)
	var107.current = var106
	reactModule.useEffect(function()
		-- upvalues: var102 (ref), var104 (ref)
		var102.setOnScrolledToTop(function()
			-- upvalues: var104 (copy)
			var104(nil)
		end)
		
		return function()
			-- upvalues: var102 (copy)
			var102.setOnScrolledToTop(nil)
		end
	end, { var102.setOnScrolledToTop, var104 })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var24 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var38 (write), sessionId (write), universeId (write), var107 (ref), var21 (ref), var49 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var16 (ref), placeId (write)
		if var20 and var24 ~= nil then
			local var108 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var38 (copy), var108 (write), var24 (copy), sessionId (copy), universeId (copy), var20 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil and not var108 then
					var38({
						session = var24,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var20,
						isLoading = value
					})
					
					return
				end
			end
			
			local var109 = not (var24.hasLoadedHistory() and #var24.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
				var38({
					session = var24,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var20,
					isLoading = var109
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var108 (write), sessionId (ref), var24 (copy)
				return if var108 then true elseif sessionId == nil or sessionId == "" then false else var24.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var108 (write), sessionId (ref), var24 (copy), var107 (copy), isHydrateCancelled (ref)
				local var110
				if var108 then
					var110 = true
				elseif sessionId == nil or sessionId == "" then
					var110 = false
				else
					var110 = var24.getCasSessionId() ~= sessionId
					var110 = nil
				end
				if var110 then
					return
				end
				var107.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var24 (copy), var21 (copy), var49 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var38 (copy), var108 (write), sessionId (copy), universeId (copy), var20 (copy), sessionId (ref), var107 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
				local var110
				var24.setCasSessionId(p5)
				
				if var21 and var49.current ~= nil then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
						if var108 then return end
						var38({
							isLoading = false,
							session = var24,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var20
						})
					end
					return
				elseif var21 or not var24.hasLoadedHistory() or #var24.getMergedHistory(false) <= 0 then
					if if fFlagBuildExperienceChatHistoryPrefetchModule then var24.refreshSession(isHydrateCancelled, true) else var24.refreshSession(isHydrateCancelled) then
						local var111
						if var108 then
							var111 = true
						elseif sessionId == nil or sessionId == "" then
							var111 = false
						else
							var111 = var24.getCasSessionId() ~= sessionId
							var111 = nil
						end
						if not var111 then
							if var108 then
								var111 = true
							elseif sessionId == nil or sessionId == "" then
								var111 = false
							else
								var111 = var24.getCasSessionId() ~= sessionId
								var111 = nil
							end
							if not var111 then
								var107.current(isHydrateCancelled)
							end
						end
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
						if var108 then return end
						var38({
							isLoading = false,
							session = var24,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var20
						})
					end
					return
				elseif var108 then
					var110 = true
				elseif sessionId == nil or sessionId == "" then
					var110 = false
				else
					var110 = var24.getCasSessionId() ~= sessionId
					var110 = nil
				end
				if not var110 then
					var107.current(isHydrateCancelled)
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
					if var108 then return end
					var38({
						isLoading = false,
						session = var24,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var20
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), var21 (copy), var24 (copy), hydrateKnownSession (ref), universeId (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var38 (copy), var108 (write), var20 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var16 (copy), placeId (copy)
				local var110 = sessionId
				
				if var21 and (var110 == nil or var110 == "") then
					var110 = var24.getCasSessionId()
				end
				if var110 ~= nil and var110 ~= "" then
					hydrateKnownSession(var110)
					
					return
				elseif universeId == nil or universeId == 0 or var24.hasLoadedHistory() and #var24.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
						if var108 then return end
						var38({
							isLoading = false,
							session = var24,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var20
						})
					end
					return
				else
					local var111 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var111.state(false).status == "pending" do
						local var112
						if var108 then
							var112 = true
						elseif sessionId == nil or sessionId == "" then
							var112 = false
						else
							var112 = var24.getCasSessionId() ~= sessionId
							var112 = nil
						end
						if var112 then break end
						task.wait()
					end
					if var21 then
						local var113
						if var108 then
							var113 = true
						elseif sessionId == nil or sessionId == "" then
							var113 = false
						else
							var113 = var24.getCasSessionId() ~= sessionId
							var113 = nil
						end
						if var113 then return end
						local result
						local casSessionId = var24.getCasSessionId()
						
						if casSessionId ~= nil and casSessionId ~= "" then
							hydrateKnownSession(casSessionId)
							
							return
						elseif var108 then
							result = true
						elseif sessionId == nil or sessionId == "" then
							result = false
						else
							result = var24.getCasSessionId() ~= sessionId
							result = nil
						end
						if result or var111.state(false).status ~= "succeeded" then
							if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
								if var108 then return end
								var38({
									isLoading = false,
									session = var24,
									sessionId = sessionId,
									universeId = universeId,
									hydrateHistoryWhen = var20
								})
							end
							return
						else
							result = var111.state(false).result
							local var114 = if result ~= nil then nil else result.sessions
							local var115 = if typeof(var114) == "table" then var114[1] else nil
							local var116 = if typeof(var115) == "table" then var115.sessionId else nil
							
							if typeof(var116) == "string" and var116 ~= "" then
								var16({
									universeId = universeId,
									placeId = placeId,
									sessionId = var116
								})
								
								return
							end
							var24.markHistoryLoaded()
							
							if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
								if var108 then return end
								var38({
									isLoading = false,
									session = var24,
									sessionId = sessionId,
									universeId = universeId,
									hydrateHistoryWhen = var20
								})
							end
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var108 (write)
				var108 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var38 ~= nil then
			var38({
				isLoading = false,
				session = var24,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var20
			})
		end
	end, {
		var24, sessionId, universeId, placeId, creatorAgentChatStore, var20,
		fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1, var21
	})
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), sessionId (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var107 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var17 (write), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), fFlagBuildExperiencePersistChatDraftModule (copy), var3 (copy), var83 (ref), var82 (ref), var79 (ref), var81 (ref), appLifecycleObserverService (copy)
		if var24 == nil then
			return
		end
		local var110 = false
		
		local function refreshKnownSession()
			-- upvalues: var24 (copy), sessionId (copy), var110 (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var107 (copy)
			local casSessionId = var24.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var110 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var24 (copy), var107 (copy)
				local function isRefreshCancelled()
					-- upvalues: var110 (copy)
					return var110
				end
				
				if (if fFlagBuildExperienceChatHistoryPrefetchModule then var24.refreshSession(isRefreshCancelled, true) else var24.refreshSession(isRefreshCancelled)) and not var110 then
					var107.current(function()
						-- upvalues: var110 (copy)
						return var110
					end)
				end
			end)
		end
		
		local var111 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var17 (copy), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), fFlagBuildExperiencePersistChatDraftModule (copy), var24 (copy), sessionId (copy), var3 (copy), var83 (copy), var82 (copy), var79 (copy), var81 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var17 ~= nil then
				var17.current = true
			end
			if fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule and fFlagBuildExperiencePersistChatDraftModule then
				local casSessionId = var24.getCasSessionId()
				
				if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
					casSessionId = sessionId
				end
				if casSessionId ~= nil and casSessionId ~= "" then
					local var112 = var3.getChatDraft(casSessionId) or ""
					var83.current = var112
					var82.current = var112
					var79(var112)
					var81(nil)
				end
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var110 (write), var111 (ref), onUnhideConnection (ref)
			var110 = true
			var111:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var24, sessionId, var17 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var21 (ref), var20 (ref), var102 (ref)
		if (fFlagBuildExperienceFixChatBottomLockModule or var21) and var20 then
			var102.lockToBottom()
			
			return
		end
	end, {
		var20,
		var21,
		var24,
		sessionId,
		var102
	})
	local var110 = reactModule.useCallback(function(p5)
		-- upvalues: var82 (ref), var79 (ref), var81 (ref)
		var82.current = p5
		var79(p5)
		var81(nil)
	end, { var79, var81 })
	local var111 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var84 (ref)
		if var84.current ~= nil then
			task.cancel(var84.current)
			var84.current = nil
		end
	end, {}) else nil
	local var112 = if fFlagBuildExperienceNewGameChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var85 (ref), var89 (write), getNewGameChatDraftKeyModule (copy)
		local current = var85.current
		
		return if not (current ~= nil and current ~= "") then if var89.current then getNewGameChatDraftKeyModule() else nil else current
	end, {}) else nil
	local var113 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var83 (ref), var111 (ref), fFlagBuildExperienceNewGameChatDraftModule (copy), var112 (ref), var85 (ref), var84 (ref), var3 (copy)
		var83.current = p5
		var111()
		local var114 = if fFlagBuildExperienceNewGameChatDraftModule then var112() else var85.current
		
		if var114 == nil or var114 == "" then
			return
		end
		var84.current = task.delay(0.5, function()
			-- upvalues: var84 (copy), var3 (copy), var114 (ref), p5 (ref)
			var84.current = nil
			var3.setChatDraft(var114, p5)
		end)
	end, { var111, var112 }) else nil
	local var114 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: fFlagBuildExperienceNewGameChatDraftModule (copy), var112 (ref), var85 (ref), var83 (ref), var111 (ref), var3 (copy)
		local var115 = if fFlagBuildExperienceNewGameChatDraftModule then var112() else var85.current
		
		if var115 == nil or var115 == "" then
			return
		end
		var83.current = p5
		var111()
		var3.setChatDraft(var115, p5)
	end, { var111, var112 }) else nil
	local var115 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5, p6)
		-- upvalues: fFlagBuildExperienceNewGameChatDraftModule (copy), var89 (write), getNewGameChatDraftKeyModule (copy), var3 (copy), var83 (ref), var111 (ref)
		local var116 = if fFlagBuildExperienceNewGameChatDraftModule and var89.current then getNewGameChatDraftKeyModule() else nil
		
		if var116 ~= nil then
			var3.setChatDraft(var116, "")
		end
		if p6 == nil or p6 == "" or var83.current ~= p5 then
			return
		end
		var83.current = ""
		var111()
		var3.setChatDraft(p6, "")
	end, { var111 }) else nil
	local var116 = reactModule.useCallback(function(p5)
		-- upvalues: var110 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var113 (ref)
		var110(p5)
		
		if fFlagBuildExperiencePersistChatDraftModule then
			var113(p5)
		end
	end, { var110, var113 })
	
	if fFlagBuildExperienceNewGameChatDraftModule and fFlagBuildExperiencePersistChatDraftModule then
		reactModule.useEffect(function()
			-- upvalues: var87 (ref), var26 (ref), getNewGameChatDraftKeyModule (copy), var3 (copy), var82 (ref), var83 (ref), var110 (ref)
			if not var87 or var26 ~= nil and var26 ~= "" then return end
			local var117 = getNewGameChatDraftKeyModule()
			
			if var117 == nil then return end
			local var118 = var3.getChatDraft(var117) or ""
			
			if var118 ~= "" and var82.current == "" then
				var83.current = var118
				var110(var118)
			end
		end, { var87, var26, var110 })
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperiencePersistChatDraftModule (copy), var26 (ref), var86 (ref), var111 (ref), var82 (ref), var83 (ref), var3 (copy), var110 (ref), var84 (ref)
		if not fFlagBuildExperiencePersistChatDraftModule then return end
		if var26 == nil or var26 == "" then return end
		local current = var86.current
		var86.current = var26
		var111()
		
		if current == nil and var82.current ~= "" then
			var83.current = var82.current
			var3.setChatDraft(var26, var82.current)
		else
			local var117 = var3.getChatDraft(var26) or ""
			var83.current = var117
			var110(var117)
		end
		return function()
			-- upvalues: var84 (copy), var111 (copy), var3 (copy), var26 (copy), var83 (copy)
			local var118 = var84.current ~= nil
			var111()
			
			if var118 then
				var3.setChatDraft(var26, var83.current)
			end
		end
	end, { var26, var111, var110 })
	
	local function commitComposerResourceAttachments(p5)
		-- upvalues: t_2 (write), var97 (write), var81 (ref)
		t_2.current = p5
		
		if var97 ~= nil then
			var97(p5)
		end
		var81(nil)
	end
	
	local function findComposerResourceAttachmentIndexByUri(p5)
		-- upvalues: t_2 (write), chatTypesModule (copy)
		for i, v in t_2.current do
			if chatTypesModule.getResourceAttachmentUri(v) == p5 then
				return i
			end
		end
		return nil
	end
	
	local function addComposerResourceAttachment(p6)
		-- upvalues: t_2 (write), var97 (write), var81 (ref)
		local cloned = table.clone(t_2.current)
		table.insert(cloned, p6)
		t_2.current = cloned
		
		if var97 ~= nil then
			var97(cloned)
		end
		var81(nil)
	end
	
	local function removeComposerResourceAttachmentAtIndex(p6)
		-- upvalues: t_2 (write), var97 (write), var81 (ref)
		local cloned = table.clone(t_2.current)
		table.remove(cloned, p6)
		t_2.current = cloned
		
		if var97 ~= nil then
			var97(cloned)
		end
		var81(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: t_2 (write), var97 (write), var81 (ref)
		local t = {}
		t_2.current = t
		
		if var97 ~= nil then
			var97(t)
		end
		var81(nil)
	end
	
	local var117 = reactModule.useRef(commitComposerResourceAttachments)
	var117.current = commitComposerResourceAttachments
	
	if fFlagBuildExperienceChatResourceAttachments then
		reactModule.useLayoutEffect(function()
			-- upvalues: t_3 (write), p4 (ref), var117 (ref)
			local current = t_3.current
			
			if current.universeId ~= p4.universeId or current.placeId ~= p4.placeId then
				var117.current({})
			end
			t_3.current = { universeId = p4.universeId, placeId = p4.placeId }
		end, { p4.universeId, p4.placeId })
	end
	local v
	local function _(p6)
		-- upvalues: t (write), var92 (write)
		t.current = p6
		
		if var92 ~= nil then
			var92(p6)
		end
	end
	
	local _ = function(p6)
		for i, v in p6 do
			if v.uploadStatus == "failed" then
				return true
			end
		end
		return false
	end
	
	local function updateComposerImage(p7, p8)
		-- upvalues: t (write), var92 (write)
		local current = t.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p7 then
				cloned[i] = p8(v)
				t.current = cloned
				
				if var92 ~= nil then
					var92(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p9)
		-- upvalues: var94 (ref), var93 (ref), updateComposerImage (ref), var81 (ref), var4 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var12 (ref)
		local var118
		var94.current += 1
		local current = var94.current
		var93.current[p9] = current
		
		for i, v in updateComposerImage(p9, function(p10)
			local cloned = table.clone(p10)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var118 = true
				if not var118 then
					var81(nil)
				end
				var4(p9):andThen(function(p10)
					-- upvalues: var93 (copy), p9 (ref), current (ref), updateComposerImage (copy), var81 (copy)
					if var93.current[p9] ~= current then return end
					local var119
					var93.current[p9] = nil
					
					for i, v in updateComposerImage(p9, function(p11)
						-- upvalues: p10 (ref)
						local cloned = table.clone(p11)
						cloned.uri = `rbxassetid://{p10.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var119 = true
							if not var119 then
								var81(nil)
							end
							return
						end
					end
					var119 = false
				end):catch(function(p11)
					-- upvalues: var93 (copy), p9 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var81 (copy), var12 (copy)
					if var93.current[p9] ~= current then return end
					var93.current[p9] = nil
					updateComposerImage(p9, function(p12)
						-- upvalues: p11 (ref)
						local cloned = table.clone(p12)
						cloned.uri = nil
						cloned.uploadStatus = "failed"
						cloned.uploadError = p11
						
						return cloned
					end)
					
					if fFlagBuildExperienceChatImageAttachmentsModule then
						var81(var12)
					end
				end)
				
				return
			end
		end
		var118 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t (write), var93 (ref), var92 (write), var81 (ref), beginComposerImageUpload (ref)
		local var119
		local current = t.current
		local t_1 = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var120 = value[i]
			var119 = var120
			
			if var120.capture ~= nil and var120.uri == nil and var120.uploadStatus == nil then
				for i, v in current do
					if v.capture == var120.capture then
						var119 = v
						break
					end
				end
			end
			if var119.uri ~= nil and var119.uploadStatus == nil then
				var119 = table.clone(var119)
				var119.uploadStatus = "uploaded"
			elseif var119.capture ~= nil and var119.uri == nil and var119.uploadStatus == nil then
				var119 = table.clone(var119)
				var119.uploadStatus = "uploading"
				table.insert(t_2, var119.capture)
			end
			table.insert(t_1, var119)
		end
		local var121
		for i_1, var119 in current do
			var121 = false
			
			for i_3, v_1 in t_1 do
				if v_1.capture == var119.capture then
					var121 = true
					break
				end
			end
			if not var121 and var119.capture ~= nil then
				var93.current[var119.capture] = nil
			end
		end
		t.current = t_1
		
		if var92 ~= nil then
			var92(t_1)
		end
		local var122
		for var119, v_1 in t_1 do
			if v_1.uploadStatus == "failed" then
				var122 = true
				if not var122 then
					var81(nil)
				end
				for i_3, var119 in t_2 do
					beginComposerImageUpload(var119)
				end
				return
			end
		end
		var122 = false
	end
	
	local var123 = reactModule.useRef(setComposerImages)
	var123.current = setComposerImages
	
	local function retryComposerImage(p10)
		-- upvalues: t (write), beginComposerImageUpload (ref)
		local var124 = t.current[p10]
		
		if var124 == nil or var124.capture == nil or var124.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var124.capture)
	end
	
	local var124 = false
	
	for i, v in var91 do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var124 = true
			break
		end
	end
	local var125 = if fFlagBuildExperienceToolResultFailureRecoveryModule or fFlagBuildExperienceAnswerFormModule then reactModule.useCallback(function(p10)
		-- upvalues: var51 (ref), var50 (ref), var24 (ref), sessionId (write), fFlagBuildExperienceAnswerFormModule (copy), var49 (ref), var82 (ref), var116 (ref), creatorAgentChatModule_1 (copy), var11 (ref), var81 (ref)
		return function(p11, p12)
			-- upvalues: var51 (copy), p10 (ref), var50 (copy), var24 (copy), sessionId (copy), fFlagBuildExperienceAnswerFormModule (copy), var49 (copy), var82 (copy), var116 (copy), creatorAgentChatModule_1 (copy), var11 (copy), var81 (copy)
			local current
			if var51.current == p10 then
				current = var50.current
				local var126 = sessionId
				
				if not (if current == nil or current.session ~= var24 then false else var126 == nil or var126 == "" or (if current.sessionId ~= var126 then current.sessionId == nil and current.session.getCasSessionId() == var126 else true)) then return end
				local var127 = false
				
				if fFlagBuildExperienceAnswerFormModule then
					current = var49.current
					
					if current ~= nil then
						var127 = next(current.getLocalToolActions(false).onAnswerSelectedByToolCallId) ~= nil
					end
				end
				if p11 ~= nil and var82.current == "" and not var127 then
					var116(p11)
				end
				var81(var11:Format(creatorAgentChatModule_1.getToolResultFailureComposerError(p12)))
				
				return
			end
		end
	end, {
		var24,
		sessionId,
		var116,
		var81,
		var11
	}) else nil
	local var126 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15)
		-- upvalues: var51 (ref), var53 (ref), var52 (ref), var44 (ref), p4 (ref), var103 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var123 (ref), fFlagBuildExperienceChatResourceAttachments (copy), var117 (ref), var116 (ref), creatorAgentChatModule_1 (copy), var11 (ref), var81 (ref), var102 (ref), sessionId (write), var14 (ref)
		if var51.current ~= p10 then return end
		var53(nil)
		var52.current = nil
		var44(nil)
		
		if p11 == nil then
			if p15.placeId ~= nil then
				var103(p15.placeId, "Completed")
			end
			var102.scrollToBottomAfterSend()
			local casSessionId = p15.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p4.createUniverseOnFirstPrompt and sessionId == nil and p15.universeId ~= nil then
					local t = {
						universeId = p15.universeId,
						placeId = p15.placeId,
						sessionId = casSessionId
					}
					var14(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p15 (ref), var51 (copy), p10 (ref)
					p15.refreshSession(function()
						-- upvalues: var51 (copy), p10 (copy)
						return var51.current ~= p10
					end)
				end)
			end
			return
		elseif p4.onPromptFailure ~= nil then
			p4.onPromptFailure(p11.errorCode, p11.outOfCreditsReason)
		end
		if p15.placeId ~= nil then
			var103(p15.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p13 ~= nil then
			var123.current(p13)
		end
		if fFlagBuildExperienceChatResourceAttachments and p14 ~= nil then
			var117.current(p14)
		end
		if p12 ~= nil then
			var116(p12)
			var81(var11:Format(creatorAgentChatModule_1.getPromptFailureComposerError(p11)))
		end
		task.spawn(function()
			-- upvalues: p15 (ref), var51 (copy), p10 (ref)
			p15.refreshSession(function()
				-- upvalues: var51 (copy), p10 (copy)
				return var51.current ~= p10
			end)
		end)
	end, {
		p4.createUniverseOnFirstPrompt, p4.onPromptFailure, p4.onProjectResolved,
		sessionId, var103, var14, var102, var116, var81, var53, var44, var11
	})
	local var127 = reactModule.useRef(var20)
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var127 (ref), var21 (ref), var71 (ref), var55 (ref), var102 (ref)
		local var128 = var20 and not var127.current
		var127.current = var20
		
		if var21 then return end
		if not var20 then return end
		if var128 or var71 or var55 ~= nil then
			var102.scrollToBottomUnconditionally()
			task.defer(var102.scrollToBottomUnconditionally)
			task.delay(0.15, var102.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var20, var21, var71, var55, #messages, var102
	})
	reactModule.useEffect(function()
		-- upvalues: var49 (ref), var50 (ref), var24 (ref), sessionId (write), var48 (ref), var51 (ref), var52 (ref), placeId (write), var103 (ref), creatorAgentChatModule_1 (copy), var126 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), fFlagBuildExperienceAnswerFormModule (copy), var125 (write), var18 (write), var53 (ref), var102 (ref), var62 (ref), var55 (ref), creatorAgentChatStore (ref), var71 (ref)
		local var128
		if var49.current ~= nil then
			local current = var50.current
			var128 = sessionId
			
			if if current == nil or current.session ~= var24 then false else var128 == nil or var128 == "" or (if current.sessionId ~= var128 then current.sessionId == nil and current.session.getCasSessionId() == var128 else true) then return end
		end
		if var48 ~= nil then return end
		if var24 == nil then return end
		local var129
		local casSessionId = var24.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var129 = casSessionId
		else
			var128 = var24.universeId
			local placeId_1 = var24.placeId
			var129 = if var128 == nil or placeId_1 == nil then nil else `{var128}:{placeId_1}`
		end
		if var129 == nil then return end
		local function current(p10, p11)
			-- upvalues: var51 (copy), var52 (copy), placeId (copy), var103 (copy), creatorAgentChatModule_1 (copy), var24 (copy), var126 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), fFlagBuildExperienceAnswerFormModule (copy), var125 (copy), var18 (copy), var53 (copy), var102 (copy)
			var51.current += 1
			local current = var51.current
			var52.current = p11
			
			if placeId ~= nil then
				var103(placeId, "Loading")
			end
			local createResumedAssistantTurn = creatorAgentChatModule_1.createResumedAssistantTurn
			createResumedAssistantTurn = createResumedAssistantTurn(var24, p10, function(p12)
				-- upvalues: var126 (copy), current (ref), var24 (copy)
				var126(current, p12, nil, nil, nil, var24)
			end, if p11 ~= nil then nil else p11 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule or fFlagBuildExperienceAnswerFormModule then var125(current) else nil, var18)
			var53(createResumedAssistantTurn, var24)
			createResumedAssistantTurn.start()
			var102.scrollToBottomUnconditionally()
		end
		
		if var62.activeTurnState == nil or var62.activeTurnItemIndex == nil or var62.activeTurnState.isDone then
			var52.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var129)
			var128 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var130 = casSessionId ~= nil and (var128 ~= nil and not var128.isDone)
			
			if not var71 and not var130 then return end
			if var130 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var62.activeTurnStartSequenceId
			
			if var52.current == casSessionId and var55 ~= nil then return end
			var128 = creatorAgentChatStore.resumeTurnFromHistory(var129, var62.activeTurnState, var62.activeTurnSequenceIds)
			
			if var128 ~= nil then
				current(var128, casSessionId)
			end
		end
	end, {
		var62, var24, sessionId, creatorAgentChatStore, var71, var55, placeId,
		var103, var126, var102, var53, var48, var125, var18
	})
	local var128 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19)
		-- upvalues: var44 (ref), var64 (write), fFlagBuildExperiencePersistChatDraftModule (copy), var115 (ref), sessionId (write), fFlagBuildExperienceRestoreStoppedPromptModule (copy), var90 (write), creatorAgentChatModule_1 (copy), var126 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), fFlagBuildExperienceAnswerFormModule (copy), var125 (write), var18 (write), var103 (ref), var53 (ref), var102 (ref)
		var44({
			text = p11,
			images = p13,
			resourceAttachments = p14,
			afterSequenceId = p16
		})
		local var129 = var64
		
		if fFlagBuildExperiencePersistChatDraftModule and p17 ~= nil then
			local var130 = var129
			
			var129 = function(p20)
				-- upvalues: var130 (ref), var115 (copy), p17 (ref), p10 (ref), sessionId (copy)
				if var130 ~= nil then
					var130(p20)
				end
				var115(p17, p10.getCasSessionId() or sessionId)
			end
		end
		if fFlagBuildExperienceRestoreStoppedPromptModule and var90 ~= nil then
			local var131 = var129
			local var132 = var90
			
			var129 = function(p20)
				-- upvalues: var132 (ref), p15 (ref), var131 (ref)
				var132.current = p15
				
				if var131 ~= nil then
					var131(p20)
				end
			end
		end
		if p18 ~= nil then
			local var133 = var129
			
			var129 = function(p20)
				-- upvalues: var133 (ref), p18 (ref), p10 (ref)
				if var133 ~= nil then
					var133(p20)
				end
				p18(p10.getCasSessionId())
			end
		end
		local _ = nil
		local createLiveAssistantTurn = creatorAgentChatModule_1.createLiveAssistantTurn
		createLiveAssistantTurn = createLiveAssistantTurn(p10, p12, function(p20)
			-- upvalues: var126 (copy), p15 (ref), p17 (ref), p13 (ref), p14 (ref), p10 (ref), p19 (ref)
			var126(p15, p20, p17, p13, p14, p10)
			
			if p19 ~= nil then
				p19()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule or fFlagBuildExperienceAnswerFormModule then var125(p15) else nil, var18, var129)
		
		if p10.placeId ~= nil then
			var103(p10.placeId, "Loading")
		end
		var53(createLiveAssistantTurn, p10)
		var102.scrollToBottomAfterSend()
		createLiveAssistantTurn.start()
	end, {
		var126, var103, var102, var53, var44, var125, var18, var64, var115, sessionId
	})
	v = reactModule.useRef(var62.latestSequenceId)
	v.current = var62.latestSequenceId
	local var129 = useAgentRollbackRequestModule({
		universeId = universeId,
		placeId = placeId,
		session = var24,
		activeTurnHandleRef = var49,
		startRollbackTurn = reactModule.useCallback(function(p10, p11, p12)
			-- upvalues: var24 (ref), var102 (ref), var51 (ref), var46 (ref), buildAgentRollbackPromptModule (copy), var128 (ref), v (ref)
			if var24 == nil then
				p12()
				
				return
			end
			var102.captureStickToBottomForSend()
			var51.current += 1
			local current = var51.current
			var46(nil)
			local var130 = buildAgentRollbackPromptModule(p10.versionNumber, p10.noteTitle, p10.noteDescription)
			var128(var24, var130, var130, nil, nil, current, v.current, nil, function()
				-- upvalues: var102 (copy), p11 (ref)
				var102.scrollToBottomUnconditionally()
				p11()
			end, p12)
		end, { var24, var102, var46, var128 })
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: var100 (ref), var50 (ref), var24 (ref), sessionId (write), var51 (ref), var52 (ref), var129 (ref), var103 (ref), var53 (ref), var44 (ref), var46 (ref)
		if var100 ~= nil then
			local current = var50.current
			local var130 = sessionId
			
			if if current == nil or current.session ~= var24 then false else var130 == nil or var130 == "" or (if current.sessionId ~= var130 then current.sessionId == nil and current.session.getCasSessionId() == var130 else true) then return end
			local current = var50.current
			var51.current += 1
			var52.current = nil
			
			if not var129.stopRequestBeforeReceipt(var100) then
				var100.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var103(current.session.placeId, "Idle")
			end
			var53(nil, nil)
			var44(nil)
			var46(nil)
			
			return
		end
	end, {
		var24, sessionId, var100, var53, var129, var103
	})
	local var130 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15)
		-- upvalues: var44 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), fFlagBuildExperiencePromptFailureTelemetry (copy), var51 (ref), universeConfigurationModule (copy), var14 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var2 (copy), var29 (write), var28 (write), var128 (ref), localizationStringsModule (copy), chatConstantsModule (copy), requestFailureKind (copy), sendBuildExperienceEventModule (copy), var53 (ref), var116 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var123 (ref), fFlagBuildExperienceChatResourceAttachments (copy), var117 (ref), var81 (ref), chat_create_universe_error (ref)
		var44({
			text = p10,
			images = p12,
			resourceAttachments = p13,
			afterSequenceId = p15
		})
		local processTime = os.clock()
		local var131 = nil
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p16)
			-- upvalues: debug (copy), processTime (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), var131 (write), var51 (copy), p14 (ref), universeConfigurationModule (copy), var14 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var2 (copy), var29 (copy), var28 (copy), var128 (copy), p10 (ref), p11 (ref), p12 (ref), p13 (ref), p15 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p16.universeId,
				rootPlaceId = p16.rootPlaceId
			})
			
			if fFlagBuildExperiencePromptFailureTelemetry then
				var131 = { universeId = p16.universeId, placeId = p16.rootPlaceId }
			end
			if var51.current == p14 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p16.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p16 (ref)
					return universeConfigurationStore.setTeamCreate(p16.universeId, true)
				end):andThen(function()
					-- upvalues: var51 (copy), p14 (copy), p16 (ref), var14 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var2 (copy), var29 (copy), var28 (copy), var128 (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p15 (copy)
					if var51.current ~= p14 then
						return nil
					end
					local t = { universeId = p16.universeId, placeId = p16.rootPlaceId }
					var14(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
					local sessionForProject = creatorAgentChatStore.getSessionForProject(p16.universeId, p16.rootPlaceId, sessionId)
					
					if var2 and var29 ~= nil and var29.current then
						sessionForProject.setPendingExperimentKey(var28)
					end
					var128(sessionForProject, p10, p11, p12, p13, p14, p15, p10)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p16)
			-- upvalues: debug (copy), processTime (ref), var51 (copy), p14 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), var131 (write), localizationStringsModule (copy), chatConstantsModule (copy), requestFailureKind (copy), sendBuildExperienceEventModule (copy), var53 (copy), var44 (copy), var116 (copy), p10 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p12 (ref), var123 (copy), fFlagBuildExperienceChatResourceAttachments (copy), p13 (ref), var117 (copy), var81 (copy), chat_create_universe_error (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p16
			})
			
			if var51.current ~= p14 then return end
			if fFlagBuildExperiencePromptFailureTelemetry then
				local rounded = math.round((os.clock() - processTime) * 1000)
				local var132 = if var131 ~= nil then {} else { universeId = var131.universeId, placeId = var131.placeId }
				local t = {
					isContentPolicy = "false",
					receivedResponse = "false",
					setupStage = if var131 ~= nil then "create_universe" else "configure_universe",
					errorCopyKey = localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR,
					elapsedMs = tostring(rounded),
					stalled = tostring(chatConstantsModule.PROMPT_STALL_SECONDS * 1000 <= rounded),
					failureKind = requestFailureKind.Unknown
				}
				
				if typeof(p16) == "table" and typeof(p16.responseCode) == "number" then
					t.failureKind = requestFailureKind.Http
					t.httpStatusCode = tostring(p16.responseCode)
				end
				sendBuildExperienceEventModule("SEND_PROMPT_START", var132)
				sendBuildExperienceEventModule("SEND_PROMPT_FAILED", var132, t)
			end
			var53(nil)
			var44(nil)
			var116(p10)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p12 ~= nil then
				var123.current(p12)
			end
			if fFlagBuildExperienceChatResourceAttachments and p13 ~= nil then
				var117.current(p13)
			end
			var81(chat_create_universe_error)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var53, var116,
		var81, var14, var44, var128, chat_create_universe_error, var28, var29
	})
	local var131 = reactModule.useCallback(function(p10)
		-- upvalues: var82 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t (write), fFlagBuildExperienceChatResourceAttachments (copy), t_2 (write), var116 (ref), var50 (ref), var24 (ref), sessionId (write), var49 (ref), var71 (ref), var21 (ref), var100 (ref), var102 (ref), p4 (ref), universeId (write), placeId (write), var23 (ref), var51 (ref), var46 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var114 (ref), var110 (ref), var123 (ref), var117 (ref), var130 (ref), var62 (ref), var128 (ref), fFlagBuildExperienceLibrary (copy)
		local v
		local replaced = string.gsub(var82.current, "^%s*(.-)%s*$", "%1")
		local var132 = if fFlagBuildExperienceChatImageAttachmentsModule then t.current else {}
		local var133 = if fFlagBuildExperienceChatResourceAttachments then t_2.current else {}
		
		if replaced == "" and #var132 == 0 then
			var116("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var132 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		local current = var50.current
		local var134 = if if current == nil or current.session ~= var24 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var49.current else nil
		
		if var71 or var21 and var134 ~= nil then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var132 > 0 or fFlagBuildExperienceChatResourceAttachments and #var133 > 0 then
				return false
			elseif var134 == nil or not var134.trySubmitComposerText(replaced) then
				return false
			end
			var116("")
			
			if var100.current then
				var100.current.releaseFocus()
			end
			var102.scrollToBottomAfterSend()
			
			return true
		else
			local var135 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var135 and var24 == nil then
				return false
			elseif placeId ~= nil and var23.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var102.captureStickToBottomForSend()
			var51.current += 1
			current = var51.current
			var46(nil)
			
			if fFlagBuildExperiencePersistChatDraftModule then
				var114(replaced)
			end
			var110("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var123.current({})
			end
			if fFlagBuildExperienceChatResourceAttachments then
				var117.current({})
			end
			if var100.current then
				var100.current.releaseFocus()
			end
			local function _(p11, p12)
				-- upvalues: var135 (ref), var130 (copy), replaced (ref), var133 (ref), current (ref), var62 (copy), var128 (copy), var24 (copy), fFlagBuildExperienceLibrary (copy), p10 (ref)
				if var135 then
					var130(replaced, p11, p12, var133, current, var62.latestSequenceId)
					
					return
				end
				var128(var24, replaced, p11, p12, var133, current, var62.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
			end
			
			if #var132 == 0 and #var133 == 0 then
				if var135 then
					var130(replaced, replaced, nil, var133, current, var62.latestSequenceId)
				else
					var128(var24, replaced, replaced, nil, var133, current, var62.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
				end
				return true
			else
				v = {}
				
				if replaced ~= "" then
					table.insert(v, { type = "text", text = replaced })
				end
				for i, v_1 in var133 do
					if v_1.type == "resource_link" then
						table.insert(v, {
							type = v_1.type,
							uri = v_1.uri,
							name = v_1.name,
							mimeType = v_1.mimeType
						})
					else
						table.insert(v, {
							type = v_1.type,
							resource = {
								blob = nil,
								uri = v_1.resource.uri,
								text = v_1.resource.text,
								mimeType = v_1.resource.mimeType
							}
						})
					end
				end
				local t_1 = {}
				
				for i_1, v_2 in var132 do
					local uri = v_2.uri
					table.insert(v, { type = "image", uri = uri })
					table.insert(t_1, {
						uploadStatus = "uploaded",
						capture = v_2.capture,
						uri = uri
					})
				end
				if var135 then
					var130(replaced, v, t_1, var133, current, var62.latestSequenceId)
				else
					var128(var24, replaced, v, t_1, var133, current, var62.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
				end
				return true
			end
		end
	end, {
		var24, sessionId, universeId, placeId, var71, var21, var102, var116, var110,
		var114, var130, var128, p4.createUniverseOnFirstPrompt, var46, var62, var23
	})
	local var136 = reactModule.useCallback(function()
		-- upvalues: var50 (ref), var24 (ref), sessionId (write), var49 (ref), var129 (ref), var51 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), var53 (ref), var52 (ref), fFlagBuildExperienceRestoreStoppedPromptModule (copy), var90 (write), var43 (ref), var82 (ref), var62 (ref), var116 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t (write), var123 (ref), fFlagBuildExperienceChatResourceAttachments (copy), t_2 (write), var117 (ref), var44 (ref), var46 (ref), placeId (write), var103 (ref)
		local current = var50.current
		local var137 = if if current == nil or current.session ~= var24 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var49.current else nil
		
		if var137 == nil then
			var129.cancelRequestBeforeTurnStarts()
			
			return
		end
		local current_1 = var51.current
		var51.current += 1
		
		if fFlagBuildExperiencePromptFailureTelemetry and var137.reportUserStop ~= nil then
			var137.reportUserStop()
		end
		if not var129.stopRequestBeforeReceipt(var137) then
			var137.stop()
		end
		var53(nil)
		var52.current = nil
		
		if fFlagBuildExperienceRestoreStoppedPromptModule and var90 ~= nil and (var90.current ~= current_1 and var43 ~= nil) and (var82.current == "" and var62.isAwaitingUserMessageEcho) then
			var116(var43.text)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and var43.images ~= nil and #t.current == 0 then
				var123.current(var43.images)
			end
			if fFlagBuildExperienceChatResourceAttachments and var43.resourceAttachments ~= nil and #t_2.current == 0 then
				var117.current(var43.resourceAttachments)
			end
		end
		var44(nil)
		var46({
			session = var24,
			sessionId = var24.getCasSessionId(),
			startSequenceId = var62.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var103(placeId, "Idle")
		end
	end, {
		var24, sessionId, placeId, var103, var53, var44, var46, var62, var129,
		if fFlagBuildExperienceRestoreStoppedPromptModule then var43 else nil,
		if fFlagBuildExperienceRestoreStoppedPromptModule then var116 else nil
	})
	local var137 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var138 = if p4.focusComposerWhen == nil then var137 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var137 (ref), var138 (ref), var100 (ref)
		if var137 and var138 then
			local var139 = false
			
			local var140 = function()
				-- upvalues: var139 (write)
				return var139
			end
			
			local var141 = 8
			
			local function tryFocus()
				-- upvalues: var140 (ref), var100 (ref), var141 (write), tryFocus (ref)
				if var140() then return end
				local current = var100.current
				
				if current then
					current.focus()
					
					return
				end
				var56 -= 1
				
				if var56 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var139 (write)
				var139 = true
			end
		end
		return function() end
	end, { var137, var138 })
	local var139 = if fFlagBuildExperienceAnswerFormModule then reactModule.useMemo(function()
		-- upvalues: var58 (ref), var81 (ref)
		local t = {}
		
		for i, v in var58.onAnswerSelectedByToolCallId do
			t[i] = function(p11, p12, p13)
				-- upvalues: var81 (copy), v (ref)
				var81(nil)
				v(p11, p12, p13)
			end
		end
		local t_1 = {}
		
		for i_1, v_1 in var58.onAnswerConfirmedByToolCallId do
			t_1[i_1] = function()
				-- upvalues: var81 (copy), v_1 (ref)
				var81(nil)
				v_1()
			end
		end
		return {
			onAnswerSelectedByToolCallId = t,
			onAnswerConfirmedByToolCallId = t_1,
			onPlanAcceptedByToolCallId = var58.onPlanAcceptedByToolCallId,
			onDevProductApprovedByToolCallId = var58.onDevProductApprovedByToolCallId,
			onDevProductRejectedByToolCallId = var58.onDevProductRejectedByToolCallId
		}
	end, { var58, var81 }) else var58
	
	return {
		agentSpecVersion = specVersion,
		setAgentSpecVersion = var27,
		messages = messages,
		localToolActions = var139,
		answerForm = if fFlagBuildExperienceAnswerFormModule then reactModule.useMemo(function()
			-- upvalues: var1 (copy), activeTurnState (ref), var57 (ref), var139 (write)
			return var1(activeTurnState, var57, var139)
		end, { activeTurnState, var57, var139 }) else nil,
		submitAnswerText = if fFlagBuildExperienceAnswerFormModule then reactModule.useCallback(function(p11, p12, p13)
			-- upvalues: var49 (ref), var50 (ref), var24 (ref), sessionId (write), var81 (ref)
			local current = var49.current
			
			if current ~= nil then
				local current_1 = var50.current
				local var140 = sessionId
				
				if if current_1 == nil or current_1.session ~= var24 then false else var140 == nil or var140 == "" or (if current_1.sessionId ~= var140 then current_1.sessionId == nil and current_1.session.getCasSessionId() == var140 else true) then
					var81(nil)
					
					return current.trySubmitAnswerText(p11, p12, p13)
				end
			end
			return false
		end, { var24, sessionId, var81 }) else nil,
		composerText = var78,
		composerErrorText = var80,
		setComposerText = var116,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then var91 else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = if fFlagBuildExperienceChatResourceAttachments then t_1 else {},
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var124,
		isAssistantResponding = var71,
		canStopAssistantResponse = if var55 == nil then var70 else true,
		canSendWhileResponding = var72,
		sendMessage = var131,
		stopAssistantResponse = var136,
		setScrollingFrame = var102.setScrollingFrame,
		anchorScrollToInstance = if fFlagBuildExperienceChatAccordionScrollAnchorModule then var102.anchorToInstance else nil,
		textBoxRef = var100,
		clockBinding = var101,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p11)
			-- upvalues: placeId (write), var17 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var140 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var17 ~= nil) then function()
				-- upvalues: var17 (ref)
				var17.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p11, true, var140) and var140 ~= nil and var17 ~= nil then
				var17.current = false
			end
		end, { placeId, var17 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var42,
		isHistoryExhausted = var68
	}
end