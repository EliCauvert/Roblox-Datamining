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
local sessionPromptMessageFilterModule = require(script.Parent.sessionPromptMessageFilter)
local useAgentRollbackRequestModule = require(script.Parent.useAgentRollbackRequest)
local useChatScrollModule = require(script.Parent.useChatScroll)
local buildAgentRollbackPromptModule = require(buildExperience.utils.buildAgentRollbackPrompt)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local _ = require(parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local var1 = creatorAgentChatModule.experimentOverride.isEnabled()
local var2 = if fFlagBuildExperiencePersistChatDraftModule then require(buildExperience.Storage.BuildAppStorage) else nil
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local var3 = if fFlagBuildExperienceChatImageAttachmentsModule then require(buildExperience.utils.uploadCaptureAsync) else nil
local debug = creatorAgentChatModule.debug
local requestFailureKind = creatorAgentChatModule.RequestFailureKind
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local var4 = signalsModule.createSignal(false)

local function noopSetAgentSpecVersion(_) end

local frozen = table.freeze({})
local _ = {
	CreateUniverse = "create_universe",
	ConfigureUniverse = "configure_universe"
}
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var5 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
})
local var6 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
})
local var7 = signalsModule.createSignal(nil)
local var8 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

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
			local var9 = if turnFeedbackIds == nil or typeof(turnFeedbackIds) == "function" then nil else turnFeedbackIds.turnId
			turnFeedbackIds = var9 ~= nil and p1.liveTurnIds[var9] == true
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
	local var10 = 8
	
	local function tryFocus()
		-- upvalues: p5 (ref), p4 (ref), var10 (write), tryFocus (ref)
		if p5() then return end
		local current = p4.current
		
		if current then
			current.focus()
			
			return
		end
		var10 -= 1
		
		if var10 > 0 then
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
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildExperienceLibrary (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var8 (ref), signalsModule (ref), signalsReactModule (ref), noopSetAgentSpecVersion (ref), var1 (ref), var5 (ref), var6 (ref), var7 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), sessionPromptMessageFilterModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), var4 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), fFlagBuildExperienceNewGameChatDraftModule (ref), fFlagBuildExperienceRestoreStoppedPromptModule (ref), frozen (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (ref), fFlagBuildExperiencePersistChatDraftModule (ref), var2 (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), getNewGameChatDraftKeyModule (ref), chatTypesModule (ref), var3 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), fFlagBuildExperiencePromptFailureTelemetry (ref), universeConfigurationModule (ref), chatConstantsModule (ref), requestFailureKind (ref), sendBuildExperienceEventModule (ref), launchPlaytestWithLoadingStateModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref)
	local var10 = reactModule.useContext(localizationRoactContext)
	local chat_create_universe_error = var10:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR)
	local var11 = if fFlagBuildExperienceChatImageAttachmentsModule then var10:Format(localizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(nil)
	local var16 = nil
	local var17 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var18 = reactModule.useRef(true)
		var16 = var18
		var17 = reactModule.useCallback(function()
			-- upvalues: var18 (ref)
			return var18.current
		end, { var18 })
	end
	local placeId = p4.placeId
	local universeId = p4.universeId
	local sessionId = p4.sessionId
	
	if var12 ~= nil then
		placeId = var12.placeId
		universeId = var12.universeId
		sessionId = var12.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var14 ~= nil and var14.universeId == universeId) and var14.placeId == placeId then
		sessionId = var14.sessionId
	end
	local var19 = p4.hydrateHistoryWhen == nil or p4.hydrateHistoryWhen
	local var20 = fFlagBuildExperienceLibrary and p4.isLibraryChat == true
	local var21 = if fFlagBuildAdUpsellModule then reactModule.useRef(p4.trackAdUpsellTurns == true).current else false
	local fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule or var21
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var22 = getAgentRollbackRequestStoreModule()
	local var23 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var23 (ref), sessionId (write)
		if var23 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var23.setCasSessionId(sessionId)
	end, { var23, sessionId })
	local var24 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var23 (ref), var8 (copy), signalsModule (copy)
		return if var23 == nil then var8 else signalsModule.createComputed(function(p5)
			-- upvalues: var23 (copy)
			return {
				session = var23,
				sessionId = var23.getCasSessionId(),
				events = var23.getMergedHistory(p5)
			}
		end)
	end, { var23 }))
	local var25 = if var23 ~= nil then nil else var23.getCasSessionId()
	local specVersion = nil
	local var26 = noopSetAgentSpecVersion
	local var27 = nil
	local var28 = nil
	
	if var1 then
		local var29 = reactModule.useRef(nil)
		
		if var29.current == nil then
			var29.current = creatorAgentChatModule.experimentOverride.createPendingKey()
		end
		local current = var29.current
		var27 = current
		local var30 = reactModule.useRef(false)
		var28 = var30
		local var31 = creatorAgentChatModule.experimentOverride.getKey(var25) or current
		specVersion = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: creatorAgentChatModule (copy), var31 (ref)
			return creatorAgentChatModule.experimentOverride.getStateSignal(var31)
		end, { var31 })).specVersion
		var26 = reactModule.useCallback(function(p5)
			-- upvalues: var23 (ref), creatorAgentChatModule (copy), current (ref), var30 (ref)
			local key = creatorAgentChatModule.experimentOverride.getKey(if var23 ~= nil then nil else var23.getCasSessionId())
			
			if key == nil then
				key = current
				var30.current = true
				
				if var23 ~= nil then
					var23.setPendingExperimentKey(current)
				end
			end
			creatorAgentChatModule.experimentOverride.set(key, p5)
		end, { var23, current })
		reactModule.useEffect(function()
			-- upvalues: var23 (ref), var30 (ref), current (ref)
			if var23 == nil or not var30.current then
				return
			end
			var23.setPendingExperimentKey(current)
		end, { var23, current })
		reactModule.useEffect(function()
			-- upvalues: creatorAgentChatModule (copy), current (ref)
			return function()
				-- upvalues: creatorAgentChatModule (copy), current (copy)
				creatorAgentChatModule.experimentOverride.clear(current)
			end
		end, { current })
	end
	local var32 = if var24.session == var23 and var24.sessionId == var25 then var24.events else {}
	local var33 = sessionId ~= nil and sessionId ~= ""
	local var34 = var33 or (universeId ~= nil and universeId ~= 0)
	local var35 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	
	if var35 then
		var35 = var19
		
		if var35 then
			var35 = false
			
			if var23 ~= nil then
				var35 = var34
				
				if var35 then
					var35 = not (var23.hasLoadedHistory() and #var32 > 0)
				end
			end
		end
	end
	local var36 = nil
	local var37 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 then
		local var38, var39 = reactModule.useState(function()
			-- upvalues: var23 (ref), sessionId (write), universeId (write), var19 (ref), var35 (ref)
			return {
				session = var23,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var19,
				isLoading = var35
			}
		end)
		var36 = var38
		var37 = var39
	end
	local var40 = if var36 ~= nil and (var36.session == var23 and (var36.sessionId == sessionId and (var36.universeId == universeId and var36.hydrateHistoryWhen == var19))) then not var36.isLoading else not var35
	local var41 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and (if var40 then var23 ~= nil and var23.getNextHistoryPageToken() ~= nil else not var40)
	local var42, var43 = reactModule.useState(nil)
	local var44, var45 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var45 (ref)
		var45(nil)
	end, { var23, sessionId })
	local var46 = sessionId
	local var47 = if if var44 == nil or var44.session ~= var23 then false else var46 == nil or var46 == "" or (if var44.sessionId ~= var46 then var44.sessionId == nil and var44.session.getCasSessionId() == var46 else true) then var44 else nil
	var98, var96 = reactModule.useState(nil)
	local var48 = reactModule.useRef(nil)
	local var49 = reactModule.useRef(nil)
	local var50 = reactModule.useRef(0)
	local var51 = reactModule.useRef(nil)
	local var52 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var48 (ref), var49 (ref), var46 (ref)
		assert(if p5 ~= nil then p6 ~= nil else true, "Active turns require an owning session")
		var48.current = p5
		var49.current = if p5 ~= nil then nil else { session = p6, sessionId = p6.getCasSessionId() }
		var46(p5)
	end, { var46 })
	local current = var49.current
	local var53 = sessionId
	local var54 = if if current == nil or current.session ~= var23 then false else var53 == nil or var53 == "" or (if current.sessionId ~= var53 then current.sessionId == nil and current.session.getCasSessionId() == var53 else true) then var98 else nil
	local var55 = if var54 ~= nil then var5 else var54.getOptimisticLocalTools
	current = if var54 ~= nil then var6 else var54.getLocalToolActions
	var53 = if var54 ~= nil then var7 else var54.getSetupErrorText
	local var56 = signalsReactModule.useSignalState(var55)
	local var57 = signalsReactModule.useSignalState(current)
	local var58 = signalsReactModule.useSignalState(var53)
	local var59 = if var58 ~= nil then var58 else var10:Format(var58)
	local var60 = reactModule.useMemo(function()
		-- upvalues: var54 (ref), p4 (ref), var23 (ref), var42 (ref), var59 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var54 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p4.createUniverseOnFirstPrompt == true and (var23 == nil and var42 ~= nil))) then nil else { setupErrorText = var59 }
	end, {
		var54,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p4.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var42 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var23 else nil,
		var59
	})
	local var61 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var32 (ref), var23 (ref), sessionId (write), universeId (write), placeId (write), var56 (ref), var42 (ref), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), fFlagBuildExperienceChatResourceAttachments (copy), var60 (ref), var47 (ref)
		return parseSessionStreamModule(var32, {
			sessionId = if var23 ~= nil then sessionId else var23.getCasSessionId() or sessionId,
			universeId = if var23 ~= nil then universeId else var23.universeId,
			placeId = if var23 ~= nil then placeId else var23.placeId,
			optimisticLocalTools = var56,
			pendingUserMessage = if var42 == nil or not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var42.text) then nil else var42.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var42 ~= nil and sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var42.text) then var42.images else nil,
			pendingUserResourceAttachments = if fFlagBuildExperienceChatResourceAttachments and var42 ~= nil and sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var42.text) then var42.resourceAttachments else nil,
			pendingUserMessageAfterSequenceId = if var42 ~= nil then nil else var42.afterSequenceId,
			liveAssistantMessage = var60,
			optimisticCancelledStartSequenceId = if var47 ~= nil then nil else var47.startSequenceId
		})
	end, {
		var32, var23, sessionId, universeId, placeId, var56, var42, var60, var47
	})
	local var62 = if var21 then reactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = universeId,
		sessionId = if var23 ~= nil then sessionId else var23.getCasSessionId() or sessionId,
		historyWatermarkSequenceId = var61.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local var63 = if var62 ~= nil then reactModule.useCallback(function(p5)
		-- upvalues: var62 (write)
		if p5 ~= nil then
			var62.current.liveTurnIds[p5] = true
		end
	end, { var62 }) else nil
	local messages = var61.messages
	local var64 = var23 ~= nil and var23.getNextHistoryPageToken() ~= nil
	local var65 = if var23 ~= nil then not var34 or var23.hasLoadedHistory() else true
	local var66 = var40 and (var65 and (if var23 ~= nil then if #messages <= 0 then not var64 else true else true))
	local var67 = var66 and not var64
	local subagentTaskState = var61.subagentTaskState
	local includesPublishTool = var61.includesPublishTool
	local var68 = messages[#messages]
	local var69 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: placeId (write), var22 (ref), var4 (copy)
		return if placeId == nil then var4 else var22.getIsPendingForPlaceId(placeId)
	end, { placeId, var22 }))
	local var70 = if var54 == nil and var68 ~= nil then var68.kind == "assistant_turn" and (not var68.isDone or var69) else true
	local var71 = var70 and (not var69 and hasPendingLocalToolResponse(var56))
	local activeTurnState = var61.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var54 (ref), activeTurnState (ref)
		if var54 == nil or activeTurnState == nil then
			return
		end
		var54.syncFromTurnState(activeTurnState)
	end, { var54, activeTurnState })
	
	if var21 then
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), var62 (write), var23 (ref), universeId (write), sessionId (write), var61 (ref), var66 (ref), noteLiveAdUpsellTurns (copy), messages (ref)
			local onAssistantTurnCompleted = p4.onAssistantTurnCompleted
			local var72 = if var23 ~= nil then universeId else var23.universeId or universeId
			local var73 = if var23 ~= nil then sessionId else var23.getCasSessionId() or sessionId
			local current = var62.current
			local var74 = current
			
			if (if var74.universeId ~= nil then if var72 ~= nil then var74.universeId == var72 else true else true) and (if var74.sessionId ~= nil then if var73 ~= nil then var74.sessionId == var73 else true else true) then
				current.universeId = var72 or current.universeId
				current.sessionId = var73 or current.sessionId
			else
				current = {
					isInitialized = false,
					lastProcessedSequenceId = nil,
					universeId = var72,
					sessionId = var73,
					historyWatermarkSequenceId = var61.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				var62.current = current
			end
			local var75
			if not var66 then
				current.historyWatermarkSequenceId = current.historyWatermarkSequenceId or var61.latestSequenceId
				noteLiveAdUpsellTurns(current, messages)
				
				return
			elseif not current.isInitialized then
				current.isInitialized = true
				noteLiveAdUpsellTurns(current, messages)
				var75 = nil
				
				for i in current.liveTurnStartSequenceIds do
					if var75 == nil or i < var75 then
						var75 = i
					end
				end
				if var75 == nil then
					current.lastProcessedSequenceId = current.historyWatermarkSequenceId or var61.latestSequenceId
				else
					current.lastProcessedSequenceId = var75 - 1
				end
				current.liveTurnIds = {}
				current.liveTurnStartSequenceIds = {}
			end
			if var72 == nil or var72 == 0 then return end
			var75 = current.lastProcessedSequenceId or -1
			
			for i, v in messages do
				local var76 = if v.kind == "assistant_turn" and v.isDone and (v.isOptimisticallyCancelled ~= true and v.turnState ~= nil) then v.endSequenceId or v.startSequenceId else nil
				
				if var76 ~= nil and var76 > var75 then
					if onAssistantTurnCompleted ~= nil then
						onAssistantTurnCompleted({
							universeId = var72,
							sessionId = v.sessionId or var73,
							turnState = v.turnState,
							latestSequenceId = var76
						})
					end
					current.lastProcessedSequenceId = var76
					var75 = var76
				end
			end
		end, {
			p4.onAssistantTurnCompleted, var23, universeId, sessionId, var66, messages,
			var61.latestSequenceId
		})
	end
	local var77, var78 = reactModule.useBinding("")
	local var79, var80 = reactModule.useState(nil)
	local var81 = reactModule.useRef("")
	local var82 = reactModule.useRef("")
	local var83 = reactModule.useRef(nil)
	local var84 = reactModule.useRef(var25)
	local var85 = reactModule.useRef(nil)
	var84.current = var25
	local var86 = p4.createUniverseOnFirstPrompt == true and universeId == nil
	local var87 = p4.createUniverseOnFirstPrompt == true
	local var88 = if fFlagBuildExperienceNewGameChatDraftModule then reactModule.useRef(var87) else { current = var87 }
	var88.current = var87
	local var89 = if fFlagBuildExperienceRestoreStoppedPromptModule then reactModule.useRef(nil) else nil
	local var90 = if var20 then frozen else {}
	local var91 = nil
	local t = { current = {} }
	local var92 = reactModule.useRef({})
	local var93 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var94, var95 = reactModule.useState({})
		var90 = var94
		var91 = var95
		t = reactModule.useRef({})
	end
	local t_1 = {}
	local var96 = nil
	local t_2 = { current = {} }
	local t_3 = {
		current = { universeId = p4.universeId, placeId = p4.placeId }
	}
	
	if fFlagBuildExperienceChatResourceAttachments then
		local var97, var98 = reactModule.useState({})
		t_1 = var97
		var96 = var98
		t_2 = reactModule.useRef({})
		t_3 = reactModule.useRef({ universeId = p4.universeId, placeId = p4.placeId })
	end
	local var99 = reactModule.useRef(nil)
	local var100 = reactUtilsModule.useClock()
	local var101 = useChatScrollModule(var20)
	local var102 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var103 = reactModule.useCallback(function(p5)
		-- upvalues: var101 (ref), var23 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
		local var104 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var101.captureDistanceFromBottom()
		
		if var23 == nil then return end
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var23.requestOlderHistoryWhile(var104, function()
				-- upvalues: var101 (copy)
				return var101.isNearTopRef.current
			end)
			
			return
		end
		task.spawn(function()
			-- upvalues: var23 (copy), var104 (ref), var101 (copy), p5 (ref)
			if var23.loadOlderHistory(var104) and var23.getNextHistoryPageToken() ~= nil and var101.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var101 (copy), var23 (copy), var104 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var101.isViewportUnderfilled() then
						var23.loadOlderHistory(var104)
					end
				end)
			end
		end)
	end, { var23, var101 })
	local var104 = reactModule.useCallback(function(p5)
		-- upvalues: var23 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var101 (ref), var103 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var23 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var101 (copy), var103 (copy)
			if p5() then return end
			if var23 == nil then return end
			if var23.getNextHistoryPageToken() == nil then return end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				if var101.isNearTopRef.current then
					var103(p5)
					
					return
				else
					return
				end
			elseif var101.isViewportUnderfilled() then
			else
			end
		end)
	end, { var103, var101, var23 })
	local var105 = reactModule.useCallback(function(p5)
		-- upvalues: var23 (ref), var104 (ref)
		if var23 == nil then return end
		if var23.getNextHistoryPageToken() == nil then
			return
		end
		var104(p5)
	end, { var104, var23 })
	local var106 = reactModule.useRef(var105)
	var106.current = var105
	reactModule.useEffect(function()
		-- upvalues: var101 (ref), var103 (ref)
		var101.setOnScrolledToTop(function()
			-- upvalues: var103 (copy)
			var103(nil)
		end)
		
		return function()
			-- upvalues: var101 (copy)
			var101.setOnScrolledToTop(nil)
		end
	end, { var101.setOnScrolledToTop, var103 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var23 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var37 (write), sessionId (write), universeId (write), var106 (ref), var20 (ref), var48 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var15 (ref), placeId (write)
		if var19 and var23 ~= nil then
			local var107 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var37 (copy), var107 (write), var23 (copy), sessionId (copy), universeId (copy), var19 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil and not var107 then
					var37({
						session = var23,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var19,
						isLoading = value
					})
					
					return
				end
			end
			
			local var108 = not (var23.hasLoadedHistory() and #var23.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
				var37({
					session = var23,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var19,
					isLoading = var108
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var107 (write), sessionId (ref), var23 (copy)
				return if var107 then true elseif sessionId == nil or sessionId == "" then false else var23.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var107 (write), sessionId (ref), var23 (copy), var106 (copy), isHydrateCancelled (ref)
				local var109
				if var107 then
					var109 = true
				elseif sessionId == nil or sessionId == "" then
					var109 = false
				else
					var109 = var23.getCasSessionId() ~= sessionId
					var109 = nil
				end
				if var109 then
					return
				end
				var106.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var23 (copy), var20 (copy), var48 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var37 (copy), var107 (write), sessionId (copy), universeId (copy), var19 (copy), sessionId (ref), var106 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
				local var109
				var23.setCasSessionId(p5)
				
				if var20 and var48.current ~= nil then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
						if var107 then return end
						var37({
							isLoading = false,
							session = var23,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var19
						})
					end
					return
				elseif var20 or not var23.hasLoadedHistory() or #var23.getMergedHistory(false) <= 0 then
					if if fFlagBuildExperienceChatHistoryPrefetchModule then var23.refreshSession(isHydrateCancelled, true) else var23.refreshSession(isHydrateCancelled) then
						local var110
						if var107 then
							var110 = true
						elseif sessionId == nil or sessionId == "" then
							var110 = false
						else
							var110 = var23.getCasSessionId() ~= sessionId
							var110 = nil
						end
						if not var110 then
							if var107 then
								var110 = true
							elseif sessionId == nil or sessionId == "" then
								var110 = false
							else
								var110 = var23.getCasSessionId() ~= sessionId
								var110 = nil
							end
							if not var110 then
								var106.current(isHydrateCancelled)
							end
						end
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
						if var107 then return end
						var37({
							isLoading = false,
							session = var23,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var19
						})
					end
					return
				elseif var107 then
					var109 = true
				elseif sessionId == nil or sessionId == "" then
					var109 = false
				else
					var109 = var23.getCasSessionId() ~= sessionId
					var109 = nil
				end
				if not var109 then
					var106.current(isHydrateCancelled)
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
					if var107 then return end
					var37({
						isLoading = false,
						session = var23,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var19
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), var20 (copy), var23 (copy), hydrateKnownSession (ref), universeId (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var37 (copy), var107 (write), var19 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var15 (copy), placeId (copy)
				local var109 = sessionId
				
				if var20 and (var109 == nil or var109 == "") then
					var109 = var23.getCasSessionId()
				end
				if var109 ~= nil and var109 ~= "" then
					hydrateKnownSession(var109)
					
					return
				elseif universeId == nil or universeId == 0 or var23.hasLoadedHistory() and #var23.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
						if var107 then return end
						var37({
							isLoading = false,
							session = var23,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var19
						})
					end
					return
				else
					local var110 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var110.state(false).status == "pending" do
						local var111
						if var107 then
							var111 = true
						elseif sessionId == nil or sessionId == "" then
							var111 = false
						else
							var111 = var23.getCasSessionId() ~= sessionId
							var111 = nil
						end
						if var111 then break end
						task.wait()
					end
					if var20 then
						local var112
						if var107 then
							var112 = true
						elseif sessionId == nil or sessionId == "" then
							var112 = false
						else
							var112 = var23.getCasSessionId() ~= sessionId
							var112 = nil
						end
						if var112 then return end
						local result
						local casSessionId = var23.getCasSessionId()
						
						if casSessionId ~= nil and casSessionId ~= "" then
							hydrateKnownSession(casSessionId)
							
							return
						elseif var107 then
							result = true
						elseif sessionId == nil or sessionId == "" then
							result = false
						else
							result = var23.getCasSessionId() ~= sessionId
							result = nil
						end
						if result or var110.state(false).status ~= "succeeded" then
							if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
								if var107 then return end
								var37({
									isLoading = false,
									session = var23,
									sessionId = sessionId,
									universeId = universeId,
									hydrateHistoryWhen = var19
								})
							end
							return
						else
							result = var110.state(false).result
							local var113 = if result ~= nil then nil else result.sessions
							local var114 = if typeof(var113) == "table" then var113[1] else nil
							local var115 = if typeof(var114) == "table" then var114.sessionId else nil
							
							if typeof(var115) == "string" and var115 ~= "" then
								var15({
									universeId = universeId,
									placeId = placeId,
									sessionId = var115
								})
								
								return
							end
							var23.markHistoryLoaded()
							
							if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
								if var107 then return end
								var37({
									isLoading = false,
									session = var23,
									sessionId = sessionId,
									universeId = universeId,
									hydrateHistoryWhen = var19
								})
							end
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var107 (write)
				var107 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
			var37({
				isLoading = false,
				session = var23,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var19
			})
		end
	end, {
		var23, sessionId, universeId, placeId, creatorAgentChatStore, var19,
		fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1, var20
	})
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), sessionId (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var106 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var16 (write), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), fFlagBuildExperiencePersistChatDraftModule (copy), var2 (copy), var82 (ref), var81 (ref), var78 (ref), var80 (ref), appLifecycleObserverService (copy)
		if var23 == nil then
			return
		end
		local var109 = false
		
		local function refreshKnownSession()
			-- upvalues: var23 (copy), sessionId (copy), var109 (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var106 (copy)
			local casSessionId = var23.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var109 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var23 (copy), var106 (copy)
				local function isRefreshCancelled()
					-- upvalues: var109 (copy)
					return var109
				end
				
				if (if fFlagBuildExperienceChatHistoryPrefetchModule then var23.refreshSession(isRefreshCancelled, true) else var23.refreshSession(isRefreshCancelled)) and not var109 then
					var106.current(function()
						-- upvalues: var109 (copy)
						return var109
					end)
				end
			end)
		end
		
		local var110 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var16 (copy), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), fFlagBuildExperiencePersistChatDraftModule (copy), var23 (copy), sessionId (copy), var2 (copy), var82 (copy), var81 (copy), var78 (copy), var80 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var16 ~= nil then
				var16.current = true
			end
			if fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule and fFlagBuildExperiencePersistChatDraftModule then
				local casSessionId = var23.getCasSessionId()
				
				if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
					casSessionId = sessionId
				end
				if casSessionId ~= nil and casSessionId ~= "" then
					local var111 = var2.getChatDraft(casSessionId) or ""
					var82.current = var111
					var81.current = var111
					var78(var111)
					var80(nil)
				end
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var109 (write), var110 (ref), onUnhideConnection (ref)
			var109 = true
			var110:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var23, sessionId, var16 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var20 (ref), var19 (ref), var101 (ref)
		if (fFlagBuildExperienceFixChatBottomLockModule or var20) and var19 then
			var101.lockToBottom()
			
			return
		end
	end, {
		var19,
		var20,
		var23,
		sessionId,
		var101
	})
	local var109 = reactModule.useCallback(function(p5)
		-- upvalues: var81 (ref), var78 (ref), var80 (ref)
		var81.current = p5
		var78(p5)
		var80(nil)
	end, { var78, var80 })
	local var110 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var83 (ref)
		if var83.current ~= nil then
			task.cancel(var83.current)
			var83.current = nil
		end
	end, {}) else nil
	local var111 = if fFlagBuildExperienceNewGameChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var84 (ref), var88 (write), getNewGameChatDraftKeyModule (copy)
		local current = var84.current
		
		return if not (current ~= nil and current ~= "") then if var88.current then getNewGameChatDraftKeyModule() else nil else current
	end, {}) else nil
	local var112 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var82 (ref), var110 (ref), fFlagBuildExperienceNewGameChatDraftModule (copy), var111 (ref), var84 (ref), var83 (ref), var2 (copy)
		var82.current = p5
		var110()
		local var113 = if fFlagBuildExperienceNewGameChatDraftModule then var111() else var84.current
		
		if var113 == nil or var113 == "" then
			return
		end
		var83.current = task.delay(0.5, function()
			-- upvalues: var83 (copy), var2 (copy), var113 (ref), p5 (ref)
			var83.current = nil
			var2.setChatDraft(var113, p5)
		end)
	end, { var110, var111 }) else nil
	local var113 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: fFlagBuildExperienceNewGameChatDraftModule (copy), var111 (ref), var84 (ref), var82 (ref), var110 (ref), var2 (copy)
		local var114 = if fFlagBuildExperienceNewGameChatDraftModule then var111() else var84.current
		
		if var114 == nil or var114 == "" then
			return
		end
		var82.current = p5
		var110()
		var2.setChatDraft(var114, p5)
	end, { var110, var111 }) else nil
	local var114 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5, p6)
		-- upvalues: fFlagBuildExperienceNewGameChatDraftModule (copy), var88 (write), getNewGameChatDraftKeyModule (copy), var2 (copy), var82 (ref), var110 (ref)
		local var115 = if fFlagBuildExperienceNewGameChatDraftModule and var88.current then getNewGameChatDraftKeyModule() else nil
		
		if var115 ~= nil then
			var2.setChatDraft(var115, "")
		end
		if p6 == nil or p6 == "" or var82.current ~= p5 then
			return
		end
		var82.current = ""
		var110()
		var2.setChatDraft(p6, "")
	end, { var110 }) else nil
	local var115 = reactModule.useCallback(function(p5)
		-- upvalues: var109 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var112 (ref)
		var109(p5)
		
		if fFlagBuildExperiencePersistChatDraftModule then
			var112(p5)
		end
	end, { var109, var112 })
	
	if fFlagBuildExperienceNewGameChatDraftModule and fFlagBuildExperiencePersistChatDraftModule then
		reactModule.useEffect(function()
			-- upvalues: var86 (ref), var25 (ref), getNewGameChatDraftKeyModule (copy), var2 (copy), var81 (ref), var82 (ref), var109 (ref)
			if not var86 or var25 ~= nil and var25 ~= "" then return end
			local var116 = getNewGameChatDraftKeyModule()
			
			if var116 == nil then return end
			local var117 = var2.getChatDraft(var116) or ""
			
			if var117 ~= "" and var81.current == "" then
				var82.current = var117
				var109(var117)
			end
		end, { var86, var25, var109 })
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperiencePersistChatDraftModule (copy), var25 (ref), var85 (ref), var110 (ref), var81 (ref), var82 (ref), var2 (copy), var109 (ref), var83 (ref)
		if not fFlagBuildExperiencePersistChatDraftModule then return end
		if var25 == nil or var25 == "" then return end
		local current = var85.current
		var85.current = var25
		var110()
		
		if current == nil and var81.current ~= "" then
			var82.current = var81.current
			var2.setChatDraft(var25, var81.current)
		else
			local var116 = var2.getChatDraft(var25) or ""
			var82.current = var116
			var109(var116)
		end
		return function()
			-- upvalues: var83 (copy), var110 (copy), var2 (copy), var25 (copy), var82 (copy)
			local var117 = var83.current ~= nil
			var110()
			
			if var117 then
				var2.setChatDraft(var25, var82.current)
			end
		end
	end, { var25, var110, var109 })
	
	local function commitComposerResourceAttachments(p5)
		-- upvalues: t_2 (write), var96 (write), var80 (ref)
		t_2.current = p5
		
		if var96 ~= nil then
			var96(p5)
		end
		var80(nil)
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
		-- upvalues: t_2 (write), var96 (write), var80 (ref)
		local cloned = table.clone(t_2.current)
		table.insert(cloned, p6)
		t_2.current = cloned
		
		if var96 ~= nil then
			var96(cloned)
		end
		var80(nil)
	end
	
	local function removeComposerResourceAttachmentAtIndex(p6)
		-- upvalues: t_2 (write), var96 (write), var80 (ref)
		local cloned = table.clone(t_2.current)
		table.remove(cloned, p6)
		t_2.current = cloned
		
		if var96 ~= nil then
			var96(cloned)
		end
		var80(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: t_2 (write), var96 (write), var80 (ref)
		local t = {}
		t_2.current = t
		
		if var96 ~= nil then
			var96(t)
		end
		var80(nil)
	end
	
	local var116 = reactModule.useRef(commitComposerResourceAttachments)
	var116.current = commitComposerResourceAttachments
	
	if fFlagBuildExperienceChatResourceAttachments then
		reactModule.useLayoutEffect(function()
			-- upvalues: t_3 (write), p4 (ref), var116 (ref)
			local current = t_3.current
			
			if current.universeId ~= p4.universeId or current.placeId ~= p4.placeId then
				var116.current({})
			end
			t_3.current = { universeId = p4.universeId, placeId = p4.placeId }
		end, { p4.universeId, p4.placeId })
	end
	local v
	local function _(p6)
		-- upvalues: t (write), var91 (write)
		t.current = p6
		
		if var91 ~= nil then
			var91(p6)
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
		-- upvalues: t (write), var91 (write)
		local current = t.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p7 then
				cloned[i] = p8(v)
				t.current = cloned
				
				if var91 ~= nil then
					var91(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p9)
		-- upvalues: var93 (ref), var92 (ref), updateComposerImage (ref), var80 (ref), var3 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var11 (ref)
		local var117
		var93.current += 1
		local current = var93.current
		var92.current[p9] = current
		
		for i, v in updateComposerImage(p9, function(p10)
			local cloned = table.clone(p10)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var117 = true
				if not var117 then
					var80(nil)
				end
				var3(p9):andThen(function(p10)
					-- upvalues: var92 (copy), p9 (ref), current (ref), updateComposerImage (copy), var80 (copy)
					if var92.current[p9] ~= current then return end
					local var118
					var92.current[p9] = nil
					
					for i, v in updateComposerImage(p9, function(p11)
						-- upvalues: p10 (ref)
						local cloned = table.clone(p11)
						cloned.uri = `rbxassetid://{p10.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var118 = true
							if not var118 then
								var80(nil)
							end
							return
						end
					end
					var118 = false
				end):catch(function(p11)
					-- upvalues: var92 (copy), p9 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var80 (copy), var11 (copy)
					if var92.current[p9] ~= current then return end
					var92.current[p9] = nil
					updateComposerImage(p9, function(p12)
						-- upvalues: p11 (ref)
						local cloned = table.clone(p12)
						cloned.uri = nil
						cloned.uploadStatus = "failed"
						cloned.uploadError = p11
						
						return cloned
					end)
					
					if fFlagBuildExperienceChatImageAttachmentsModule then
						var80(var11)
					end
				end)
				
				return
			end
		end
		var117 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t (write), var92 (ref), var91 (write), var80 (ref), beginComposerImageUpload (ref)
		local var118
		local current = t.current
		local t_1 = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var119 = value[i]
			var118 = var119
			
			if var119.capture ~= nil and var119.uri == nil and var119.uploadStatus == nil then
				for i, v in current do
					if v.capture == var119.capture then
						var118 = v
						break
					end
				end
			end
			if var118.uri ~= nil and var118.uploadStatus == nil then
				var118 = table.clone(var118)
				var118.uploadStatus = "uploaded"
			elseif var118.capture ~= nil and var118.uri == nil and var118.uploadStatus == nil then
				var118 = table.clone(var118)
				var118.uploadStatus = "uploading"
				table.insert(t_2, var118.capture)
			end
			table.insert(t_1, var118)
		end
		local var120
		for i_1, var118 in current do
			var120 = false
			
			for i_3, v_1 in t_1 do
				if v_1.capture == var118.capture then
					var120 = true
					break
				end
			end
			if not var120 and var118.capture ~= nil then
				var92.current[var118.capture] = nil
			end
		end
		t.current = t_1
		
		if var91 ~= nil then
			var91(t_1)
		end
		local var121
		for var118, v_1 in t_1 do
			if v_1.uploadStatus == "failed" then
				var121 = true
				if not var121 then
					var80(nil)
				end
				for i_3, var118 in t_2 do
					beginComposerImageUpload(var118)
				end
				return
			end
		end
		var121 = false
	end
	
	local var122 = reactModule.useRef(setComposerImages)
	var122.current = setComposerImages
	
	local function retryComposerImage(p10)
		-- upvalues: t (write), beginComposerImageUpload (ref)
		local var123 = t.current[p10]
		
		if var123 == nil or var123.capture == nil or var123.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var123.capture)
	end
	
	local var123 = false
	
	for i, v in var90 do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var123 = true
			break
		end
	end
	local var124 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p10)
		-- upvalues: var50 (ref), var49 (ref), var23 (ref), sessionId (write), var81 (ref), var115 (ref), creatorAgentChatModule_1 (copy), var10 (ref), var80 (ref)
		return function(p11, p12)
			-- upvalues: var50 (copy), p10 (ref), var49 (copy), var23 (copy), sessionId (copy), var81 (copy), var115 (copy), creatorAgentChatModule_1 (copy), var10 (copy), var80 (copy)
			if var50.current == p10 then
				local current = var49.current
				local var125 = sessionId
				
				if not (if current == nil or current.session ~= var23 then false else var125 == nil or var125 == "" or (if current.sessionId ~= var125 then current.sessionId == nil and current.session.getCasSessionId() == var125 else true)) then return end
				if p11 ~= nil and var81.current == "" then
					var115(p11)
				end
				var80(var10:Format(creatorAgentChatModule_1.getToolResultFailureComposerError(p12)))
				
				return
			end
		end
	end, {
		var23,
		sessionId,
		var115,
		var80,
		var10
	}) else nil
	local var125 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15)
		-- upvalues: var50 (ref), var52 (ref), var51 (ref), var43 (ref), p4 (ref), var102 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var122 (ref), fFlagBuildExperienceChatResourceAttachments (copy), var116 (ref), var115 (ref), creatorAgentChatModule_1 (copy), var10 (ref), var80 (ref), var101 (ref), sessionId (write), var13 (ref)
		if var50.current ~= p10 then return end
		var52(nil)
		var51.current = nil
		var43(nil)
		
		if p11 == nil then
			if p15.placeId ~= nil then
				var102(p15.placeId, "Completed")
			end
			var101.scrollToBottomAfterSend()
			local casSessionId = p15.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p4.createUniverseOnFirstPrompt and sessionId == nil and p15.universeId ~= nil then
					local t = {
						universeId = p15.universeId,
						placeId = p15.placeId,
						sessionId = casSessionId
					}
					var13(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p15 (ref), var50 (copy), p10 (ref)
					p15.refreshSession(function()
						-- upvalues: var50 (copy), p10 (copy)
						return var50.current ~= p10
					end)
				end)
			end
			return
		elseif p4.onPromptFailure ~= nil then
			p4.onPromptFailure(p11.errorCode, p11.outOfCreditsReason)
		end
		if p15.placeId ~= nil then
			var102(p15.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p13 ~= nil then
			var122.current(p13)
		end
		if fFlagBuildExperienceChatResourceAttachments and p14 ~= nil then
			var116.current(p14)
		end
		if p12 ~= nil then
			var115(p12)
			var80(var10:Format(creatorAgentChatModule_1.getPromptFailureComposerError(p11)))
		end
		task.spawn(function()
			-- upvalues: p15 (ref), var50 (copy), p10 (ref)
			p15.refreshSession(function()
				-- upvalues: var50 (copy), p10 (copy)
				return var50.current ~= p10
			end)
		end)
	end, {
		p4.createUniverseOnFirstPrompt, p4.onPromptFailure, p4.onProjectResolved,
		sessionId, var102, var13, var101, var115, var80, var52, var43, var10
	})
	local var126 = reactModule.useRef(var19)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var126 (ref), var20 (ref), var70 (ref), var54 (ref), var101 (ref)
		local var127 = var19 and not var126.current
		var126.current = var19
		
		if var20 then return end
		if not var19 then return end
		if var127 or var70 or var54 ~= nil then
			var101.scrollToBottomUnconditionally()
			task.defer(var101.scrollToBottomUnconditionally)
			task.delay(0.15, var101.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var19, var20, var70, var54, #messages, var101
	})
	reactModule.useEffect(function()
		-- upvalues: var48 (ref), var49 (ref), var23 (ref), sessionId (write), var47 (ref), var50 (ref), var51 (ref), placeId (write), var102 (ref), creatorAgentChatModule_1 (copy), var125 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var124 (write), var17 (write), var52 (ref), var101 (ref), var61 (ref), var54 (ref), creatorAgentChatStore (ref), var70 (ref)
		local var127
		if var48.current ~= nil then
			local current = var49.current
			var127 = sessionId
			
			if if current == nil or current.session ~= var23 then false else var127 == nil or var127 == "" or (if current.sessionId ~= var127 then current.sessionId == nil and current.session.getCasSessionId() == var127 else true) then return end
		end
		if var47 ~= nil then return end
		if var23 == nil then return end
		local var128
		local casSessionId = var23.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var128 = casSessionId
		else
			var127 = var23.universeId
			local placeId_1 = var23.placeId
			var128 = if var127 == nil or placeId_1 == nil then nil else `{var127}:{placeId_1}`
		end
		if var128 == nil then return end
		local function current(p10, p11)
			-- upvalues: var50 (copy), var51 (copy), placeId (copy), var102 (copy), creatorAgentChatModule_1 (copy), var23 (copy), var125 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var124 (copy), var17 (copy), var52 (copy), var101 (copy)
			var50.current += 1
			local current = var50.current
			var51.current = p11
			
			if placeId ~= nil then
				var102(placeId, "Loading")
			end
			local var129 = creatorAgentChatModule_1.createResumedAssistantTurn(var23, p10, function(p12)
				-- upvalues: var125 (copy), current (ref), var23 (copy)
				var125(current, p12, nil, nil, nil, var23)
			end, if p11 ~= nil then nil else p11 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var124(current) else nil, var17)
			var52(var129, var23)
			var129.start()
			var101.scrollToBottomUnconditionally()
		end
		
		if var61.activeTurnState == nil or var61.activeTurnItemIndex == nil or var61.activeTurnState.isDone then
			var51.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var128)
			var127 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var129 = casSessionId ~= nil and (var127 ~= nil and not var127.isDone)
			
			if not var70 and not var129 then return end
			if var129 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var61.activeTurnStartSequenceId
			
			if var51.current == casSessionId and var54 ~= nil then return end
			var127 = creatorAgentChatStore.resumeTurnFromHistory(var128, var61.activeTurnState, var61.activeTurnSequenceIds)
			
			if var127 ~= nil then
				current(var127, casSessionId)
			end
		end
	end, {
		var61, var23, sessionId, creatorAgentChatStore, var70, var54, placeId,
		var102, var125, var101, var52, var47, var124, var17
	})
	local var127 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19)
		-- upvalues: var43 (ref), var63 (write), fFlagBuildExperiencePersistChatDraftModule (copy), var114 (ref), sessionId (write), fFlagBuildExperienceRestoreStoppedPromptModule (copy), var89 (write), creatorAgentChatModule_1 (copy), var125 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var124 (write), var17 (write), var102 (ref), var52 (ref), var101 (ref)
		var43({
			text = p11,
			images = p13,
			resourceAttachments = p14,
			afterSequenceId = p16
		})
		local var128 = var63
		
		if fFlagBuildExperiencePersistChatDraftModule and p17 ~= nil then
			local var129 = var128
			
			var128 = function(p20)
				-- upvalues: var129 (ref), var114 (copy), p17 (ref), p10 (ref), sessionId (copy)
				if var129 ~= nil then
					var129(p20)
				end
				var114(p17, p10.getCasSessionId() or sessionId)
			end
		end
		if fFlagBuildExperienceRestoreStoppedPromptModule and var89 ~= nil then
			local var130 = var128
			local var131 = var89
			
			var128 = function(p20)
				-- upvalues: var131 (ref), p15 (ref), var130 (ref)
				var131.current = p15
				
				if var130 ~= nil then
					var130(p20)
				end
			end
		end
		if p18 ~= nil then
			local var132 = var128
			
			var128 = function(p20)
				-- upvalues: var132 (ref), p18 (ref), p10 (ref)
				if var132 ~= nil then
					var132(p20)
				end
				p18(p10.getCasSessionId())
			end
		end
		local _ = nil
		local var133 = creatorAgentChatModule_1.createLiveAssistantTurn(p10, p12, function(p20)
			-- upvalues: var125 (copy), p15 (ref), p17 (ref), p13 (ref), p14 (ref), p10 (ref), p19 (ref)
			var125(p15, p20, p17, p13, p14, p10)
			
			if p19 ~= nil then
				p19()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var124(p15) else nil, var17, var128)
		
		if p10.placeId ~= nil then
			var102(p10.placeId, "Loading")
		end
		var52(var133, p10)
		var101.scrollToBottomAfterSend()
		var133.start()
	end, {
		var125, var102, var101, var52, var43, var124, var17, var63, var114, sessionId
	})
	v = nil
	local var128 = reactModule.useRef(var61.latestSequenceId)
	var128.current = var61.latestSequenceId
	v = useAgentRollbackRequestModule({
		universeId = universeId,
		placeId = placeId,
		session = var23,
		activeTurnHandleRef = var48,
		startRollbackTurn = reactModule.useCallback(function(p10, p11, p12)
			-- upvalues: var23 (ref), var101 (ref), var50 (ref), var45 (ref), buildAgentRollbackPromptModule (copy), var127 (ref), var128 (ref)
			if var23 == nil then
				p12()
				
				return
			end
			var101.captureStickToBottomForSend()
			var50.current += 1
			local current = var50.current
			var45(nil)
			local var129 = buildAgentRollbackPromptModule(p10.versionNumber, p10.noteTitle, p10.noteDescription)
			var127(var23, var129, var129, nil, nil, current, var128.current, nil, function()
				-- upvalues: var101 (copy), p11 (ref)
				var101.scrollToBottomUnconditionally()
				p11()
			end, p12)
		end, { var23, var101, var45, var127 })
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: var98 (ref), var49 (ref), var23 (ref), sessionId (write), var50 (ref), var51 (ref), v (write), var102 (ref), var52 (ref), var43 (ref), var45 (ref)
		if var98 ~= nil then
			local current = var49.current
			local var129 = sessionId
			
			if if current == nil or current.session ~= var23 then false else var129 == nil or var129 == "" or (if current.sessionId ~= var129 then current.sessionId == nil and current.session.getCasSessionId() == var129 else true) then return end
			local current = var49.current
			var50.current += 1
			var51.current = nil
			
			if not v.stopRequestBeforeReceipt(var98) then
				var98.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var102(current.session.placeId, "Idle")
			end
			var52(nil, nil)
			var43(nil)
			var45(nil)
			
			return
		end
	end, {
		var23, sessionId, var98, var52, v, var102
	})
	local var129 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15)
		-- upvalues: var43 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), fFlagBuildExperiencePromptFailureTelemetry (copy), var50 (ref), universeConfigurationModule (copy), var13 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var1 (copy), var28 (write), var27 (write), var127 (ref), localizationStringsModule (copy), chatConstantsModule (copy), requestFailureKind (copy), sendBuildExperienceEventModule (copy), var52 (ref), var115 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var122 (ref), fFlagBuildExperienceChatResourceAttachments (copy), var116 (ref), var80 (ref), chat_create_universe_error (ref)
		var43({
			text = p10,
			images = p12,
			resourceAttachments = p13,
			afterSequenceId = p15
		})
		local processTime = os.clock()
		local var130 = nil
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p16)
			-- upvalues: debug (copy), processTime (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), var130 (write), var50 (copy), p14 (ref), universeConfigurationModule (copy), var13 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var1 (copy), var28 (copy), var27 (copy), var127 (copy), p10 (ref), p11 (ref), p12 (ref), p13 (ref), p15 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p16.universeId,
				rootPlaceId = p16.rootPlaceId
			})
			
			if fFlagBuildExperiencePromptFailureTelemetry then
				var130 = { universeId = p16.universeId, placeId = p16.rootPlaceId }
			end
			if var50.current == p14 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p16.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p16 (ref)
					return universeConfigurationStore.setTeamCreate(p16.universeId, true)
				end):andThen(function()
					-- upvalues: var50 (copy), p14 (copy), p16 (ref), var13 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var1 (copy), var28 (copy), var27 (copy), var127 (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p15 (copy)
					if var50.current ~= p14 then
						return nil
					end
					local t = { universeId = p16.universeId, placeId = p16.rootPlaceId }
					var13(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
					local sessionForProject = creatorAgentChatStore.getSessionForProject(p16.universeId, p16.rootPlaceId, sessionId)
					
					if var1 and var28 ~= nil and var28.current then
						sessionForProject.setPendingExperimentKey(var27)
					end
					var127(sessionForProject, p10, p11, p12, p13, p14, p15, p10)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p16)
			-- upvalues: debug (copy), processTime (ref), var50 (copy), p14 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), var130 (write), localizationStringsModule (copy), chatConstantsModule (copy), requestFailureKind (copy), sendBuildExperienceEventModule (copy), var52 (copy), var43 (copy), var115 (copy), p10 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p12 (ref), var122 (copy), fFlagBuildExperienceChatResourceAttachments (copy), p13 (ref), var116 (copy), var80 (copy), chat_create_universe_error (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p16
			})
			
			if var50.current ~= p14 then return end
			if fFlagBuildExperiencePromptFailureTelemetry then
				local rounded = math.round((os.clock() - processTime) * 1000)
				local var131 = if var130 ~= nil then {} else { universeId = var130.universeId, placeId = var130.placeId }
				local t = {
					isContentPolicy = "false",
					receivedResponse = "false",
					setupStage = if var130 ~= nil then "create_universe" else "configure_universe",
					errorCopyKey = localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR,
					elapsedMs = tostring(rounded),
					stalled = tostring(chatConstantsModule.PROMPT_STALL_SECONDS * 1000 <= rounded),
					failureKind = requestFailureKind.Unknown
				}
				
				if typeof(p16) == "table" and typeof(p16.responseCode) == "number" then
					t.failureKind = requestFailureKind.Http
					t.httpStatusCode = tostring(p16.responseCode)
				end
				sendBuildExperienceEventModule("SEND_PROMPT_START", var131)
				sendBuildExperienceEventModule("SEND_PROMPT_FAILED", var131, t)
			end
			var52(nil)
			var43(nil)
			var115(p10)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p12 ~= nil then
				var122.current(p12)
			end
			if fFlagBuildExperienceChatResourceAttachments and p13 ~= nil then
				var116.current(p13)
			end
			var80(chat_create_universe_error)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var52, var115,
		var80, var13, var43, var127, chat_create_universe_error, var27, var28
	})
	local var130 = reactModule.useCallback(function(p10)
		-- upvalues: var81 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t (write), fFlagBuildExperienceChatResourceAttachments (copy), t_2 (write), var115 (ref), var70 (ref), var49 (ref), var23 (ref), sessionId (write), var48 (ref), var99 (ref), var101 (ref), p4 (ref), universeId (write), placeId (write), var22 (ref), var50 (ref), var45 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var113 (ref), var109 (ref), var122 (ref), var116 (ref), var129 (ref), var61 (ref), var127 (ref), fFlagBuildExperienceLibrary (copy)
		local v
		local replaced = string.gsub(var81.current, "^%s*(.-)%s*$", "%1")
		local var131 = if fFlagBuildExperienceChatImageAttachmentsModule then t.current else {}
		local var132 = if fFlagBuildExperienceChatResourceAttachments then t_2.current else {}
		
		if replaced == "" and #var131 == 0 then
			var115("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var131 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var70 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var131 > 0 or fFlagBuildExperienceChatResourceAttachments and #var132 > 0 then
				return false
			end
			local current = var49.current
			v = sessionId
			local var133 = if if current == nil or current.session ~= var23 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var48.current else nil
			
			if var133 == nil or not var133.trySubmitComposerText(replaced) then
				return false
			end
			var115("")
			
			if var99.current then
				var99.current.releaseFocus()
			end
			var101.scrollToBottomAfterSend()
			
			return true
		else
			local var134 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var134 and var23 == nil then
				return false
			elseif placeId ~= nil and var22.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var101.captureStickToBottomForSend()
			var50.current += 1
			local current = var50.current
			var45(nil)
			
			if fFlagBuildExperiencePersistChatDraftModule then
				var113(replaced)
			end
			var109("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var122.current({})
			end
			if fFlagBuildExperienceChatResourceAttachments then
				var116.current({})
			end
			if var99.current then
				var99.current.releaseFocus()
			end
			local function current(p11, p12)
				-- upvalues: var134 (ref), var129 (copy), replaced (ref), var132 (ref), current (ref), var61 (copy), var127 (copy), var23 (copy), fFlagBuildExperienceLibrary (copy), p10 (ref)
				if var134 then
					var129(replaced, p11, p12, var132, current, var61.latestSequenceId)
					
					return
				end
				var127(var23, replaced, p11, p12, var132, current, var61.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
			end
			
			if #var131 == 0 and #var132 == 0 then
				if var134 then
					var129(replaced, replaced, nil, var132, current, var61.latestSequenceId)
				else
					var127(var23, replaced, replaced, nil, var132, current, var61.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
				end
				return true
			else
				local t_1 = {}
				
				if replaced ~= "" then
					table.insert(t_1, { type = "text", text = replaced })
				end
				for i, v_1 in var132 do
					if v_1.type == "resource_link" then
						table.insert(t_1, {
							type = v_1.type,
							uri = v_1.uri,
							name = v_1.name,
							mimeType = v_1.mimeType
						})
					else
						table.insert(t_1, {
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
				v = {}
				
				for i_1, v_2 in var131 do
					local uri = v_2.uri
					table.insert(t_1, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_2.capture,
						uri = uri
					})
				end
				if var134 then
					var129(replaced, t_1, v, var132, current, var61.latestSequenceId)
				else
					var127(var23, replaced, t_1, v, var132, current, var61.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
				end
				return true
			end
		end
	end, {
		var23, sessionId, universeId, placeId, var70, var101, var115, var109, var113,
		var129, var127, p4.createUniverseOnFirstPrompt, var45, var61, var22
	})
	local var135 = reactModule.useCallback(function()
		-- upvalues: var49 (ref), var23 (ref), sessionId (write), var48 (ref), v (write), var50 (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), var52 (ref), var51 (ref), fFlagBuildExperienceRestoreStoppedPromptModule (copy), var89 (write), var42 (ref), var81 (ref), var61 (ref), var115 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t (write), var122 (ref), fFlagBuildExperienceChatResourceAttachments (copy), t_2 (write), var116 (ref), var43 (ref), var45 (ref), placeId (write), var102 (ref)
		local current = var49.current
		local var136 = if if current == nil or current.session ~= var23 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var48.current else nil
		
		if var136 == nil then
			v.cancelRequestBeforeTurnStarts()
			
			return
		end
		local current_1 = var50.current
		var50.current += 1
		
		if fFlagBuildExperiencePromptFailureTelemetry and var136.reportUserStop ~= nil then
			var136.reportUserStop()
		end
		if not v.stopRequestBeforeReceipt(var136) then
			var136.stop()
		end
		var52(nil)
		var51.current = nil
		
		if fFlagBuildExperienceRestoreStoppedPromptModule and var89 ~= nil and (var89.current ~= current_1 and var42 ~= nil) and (var81.current == "" and var61.isAwaitingUserMessageEcho) then
			var115(var42.text)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and var42.images ~= nil and #t.current == 0 then
				var122.current(var42.images)
			end
			if fFlagBuildExperienceChatResourceAttachments and var42.resourceAttachments ~= nil and #t_2.current == 0 then
				var116.current(var42.resourceAttachments)
			end
		end
		var43(nil)
		var45({
			session = var23,
			sessionId = var23.getCasSessionId(),
			startSequenceId = var61.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var102(placeId, "Idle")
		end
	end, {
		var23, sessionId, placeId, var102, var52, var43, var45, var61, v,
		if fFlagBuildExperienceRestoreStoppedPromptModule then var42 else nil,
		if fFlagBuildExperienceRestoreStoppedPromptModule then var115 else nil
	})
	local var136 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var137 = if p4.focusComposerWhen == nil then var136 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var136 (ref), var137 (ref), var99 (ref)
		if var136 and var137 then
			local var138 = false
			
			local var139 = function()
				-- upvalues: var138 (write)
				return var138
			end
			
			local var140 = 8
			
			local function tryFocus()
				-- upvalues: var139 (ref), var99 (ref), var140 (write), tryFocus (ref)
				if var139() then return end
				local current = var99.current
				
				if current then
					current.focus()
					
					return
				end
				var54 -= 1
				
				if var54 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var138 (write)
				var138 = true
			end
		end
		return function() end
	end, { var136, var137 })
	
	return {
		agentSpecVersion = specVersion,
		setAgentSpecVersion = var26,
		messages = messages,
		localToolActions = var57,
		composerText = var77,
		composerErrorText = var79,
		setComposerText = var115,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then var90 else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = if fFlagBuildExperienceChatResourceAttachments then t_1 else {},
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var123,
		isAssistantResponding = var70,
		canStopAssistantResponse = if var54 == nil then var69 else true,
		canSendWhileResponding = var71,
		sendMessage = var130,
		stopAssistantResponse = var135,
		setScrollingFrame = var101.setScrollingFrame,
		anchorScrollToInstance = if fFlagBuildExperienceChatAccordionScrollAnchorModule then var101.anchorToInstance else nil,
		textBoxRef = var99,
		clockBinding = var100,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p11)
			-- upvalues: placeId (write), var16 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var138 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var16 ~= nil) then function()
				-- upvalues: var16 (ref)
				var16.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p11, true, var138) and var138 ~= nil and var16 ~= nil then
				var16.current = false
			end
		end, { placeId, var16 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var41,
		isHistoryExhausted = var67
	}
end