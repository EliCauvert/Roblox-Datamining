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
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
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
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildExperienceForceRefreshVersionHistoryModule = require(buildExperience.Flags.FFlagBuildExperienceForceRefreshVersionHistory)
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local fFlagBuildExperienceLibrary = sharedFlagsModule.FFlagBuildExperienceLibrary
local chatTypesModule = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
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
local var4 = signalsModule.createSignal(false)

local function noopSetAgentSpecVersion(_) end

local frozen = table.freeze({})
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

local _ = function(p4)
	-- upvalues: placeVersionHistoryModule (ref)
	if p4 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p4)
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
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildExperienceLibrary (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var8 (ref), signalsModule (ref), signalsReactModule (ref), noopSetAgentSpecVersion (ref), var1 (ref), var5 (ref), var6 (ref), var7 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), var4 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), fFlagBuildExperienceForceRefreshVersionHistoryModule (ref), placeVersionHistoryModule (ref), frozen (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (ref), fFlagBuildExperiencePersistChatDraftModule (ref), var2 (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), chatTypesModule (ref), var3 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref)
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
	var96, var94 = reactModule.useState(nil)
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
	local var54 = if if current == nil or current.session ~= var23 then false else var53 == nil or var53 == "" or (if current.sessionId ~= var53 then current.sessionId == nil and current.session.getCasSessionId() == var53 else true) then var96 else nil
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
		-- upvalues: parseSessionStreamModule (copy), var32 (ref), var23 (ref), sessionId (write), universeId (write), placeId (write), var56 (ref), var42 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), fFlagBuildExperienceChatResourceAttachments (copy), var60 (ref), var47 (ref)
		return parseSessionStreamModule(var32, {
			sessionId = if var23 ~= nil then sessionId else var23.getCasSessionId() or sessionId,
			universeId = if var23 ~= nil then universeId else var23.universeId,
			placeId = if var23 ~= nil then placeId else var23.placeId,
			optimisticLocalTools = var56,
			pendingUserMessage = if var42 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var42.text) then nil else var42.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var42 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var42.text)) then var42.images else nil,
			pendingUserResourceAttachments = if fFlagBuildExperienceChatResourceAttachments and var42 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var42.text)) then var42.resourceAttachments else nil,
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
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var22 (ref), var4 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var22.getIsPendingForPlaceId(placeId) else var4
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var22 else nil
	}))
	local var70 = if var54 == nil and var68 ~= nil then var68.kind == "assistant_turn" and (not var68.isDone or fFlagBuildAgentRollbackModule and var69) else true
	local var71 = var70 and (not (fFlagBuildAgentRollbackModule and var69) and hasPendingLocalToolResponse(var56))
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
	if not fFlagBuildExperienceForceRefreshVersionHistoryModule then
		reactModule.useEffect(function()
			-- upvalues: var61 (ref), placeId (write), placeVersionHistoryModule (copy)
			if not var61.includesPublishTool then return end
			if placeId == nil then
				return
			end
			placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
		end, { var61.includesPublishTool, placeId })
	end
	local var77, var78 = reactModule.useBinding("")
	local var79, var80 = reactModule.useState(nil)
	local var81 = reactModule.useRef("")
	local var82 = reactModule.useRef("")
	local var83 = reactModule.useRef(nil)
	local var84 = reactModule.useRef(var25)
	local var85 = reactModule.useRef(nil)
	var84.current = var25
	local var86 = if var20 then frozen else {}
	local var87 = nil
	local t = { current = {} }
	local var88 = reactModule.useRef({})
	local var89 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var90, var91 = reactModule.useState({})
		var86 = var90
		var87 = var91
		t = reactModule.useRef({})
	end
	local t_1 = {}
	local var92 = nil
	local t_2 = { current = {} }
	local t_3 = {
		current = { universeId = p4.universeId, placeId = p4.placeId }
	}
	
	if fFlagBuildExperienceChatResourceAttachments then
		local var93, var94 = reactModule.useState({})
		t_1 = var93
		var92 = var94
		t_2 = reactModule.useRef({})
		t_3 = reactModule.useRef({ universeId = p4.universeId, placeId = p4.placeId })
	end
	local var95 = reactModule.useRef(nil)
	local var96 = reactUtilsModule.useClock()
	local var97 = useChatScrollModule(var20)
	local var98 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var99 = reactModule.useCallback(function(p5)
		-- upvalues: var97 (ref), var23 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
		local var100 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var97.captureDistanceFromBottom()
		
		if var23 == nil then return end
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var23.requestOlderHistoryWhile(var100, function()
				-- upvalues: var97 (copy)
				return var97.isNearTopRef.current
			end)
			
			return
		end
		task.spawn(function()
			-- upvalues: var23 (copy), var100 (ref), var97 (copy), p5 (ref)
			if var23.loadOlderHistory(var100) and var23.getNextHistoryPageToken() ~= nil and var97.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var97 (copy), var23 (copy), var100 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var97.isViewportUnderfilled() then
						var23.loadOlderHistory(var100)
					end
				end)
			end
		end)
	end, { var23, var97 })
	local var100 = reactModule.useCallback(function(p5)
		-- upvalues: var23 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var97 (ref), var99 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var23 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var97 (copy), var99 (copy)
			if p5() then return end
			if var23 == nil then return end
			if var23.getNextHistoryPageToken() == nil then return end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				if var97.isNearTopRef.current then
					var99(p5)
					
					return
				else
					return
				end
			elseif var97.isViewportUnderfilled() then
			else
			end
		end)
	end, { var99, var97, var23 })
	local var101 = reactModule.useCallback(function(p5)
		-- upvalues: var23 (ref), var100 (ref)
		if var23 == nil then return end
		if var23.getNextHistoryPageToken() == nil then
			return
		end
		var100(p5)
	end, { var100, var23 })
	local var102 = reactModule.useRef(var101)
	var102.current = var101
	reactModule.useEffect(function()
		-- upvalues: var97 (ref), var99 (ref)
		var97.setOnScrolledToTop(function()
			-- upvalues: var99 (copy)
			var99(nil)
		end)
		
		return function()
			-- upvalues: var97 (copy)
			var97.setOnScrolledToTop(nil)
		end
	end, { var97.setOnScrolledToTop, var99 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var23 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var37 (write), sessionId (write), universeId (write), var102 (ref), var20 (ref), var48 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var15 (ref), placeId (write)
		if var19 and var23 ~= nil then
			local var103 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var37 (copy), var103 (write), var23 (copy), sessionId (copy), universeId (copy), var19 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil and not var103 then
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
			
			local var104 = not (var23.hasLoadedHistory() and #var23.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
				var37({
					session = var23,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var19,
					isLoading = var104
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var103 (write), sessionId (ref), var23 (copy)
				return if var103 then true elseif sessionId == nil or sessionId == "" then false else var23.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var103 (write), sessionId (ref), var23 (copy), var102 (copy), isHydrateCancelled (ref)
				local var105
				if var103 then
					var105 = true
				elseif sessionId == nil or sessionId == "" then
					var105 = false
				else
					var105 = var23.getCasSessionId() ~= sessionId
					var105 = nil
				end
				if var105 then
					return
				end
				var102.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var23 (copy), var20 (copy), var48 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var37 (copy), var103 (write), sessionId (copy), universeId (copy), var19 (copy), sessionId (ref), var102 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
				local var105
				var23.setCasSessionId(p5)
				
				if var20 and var48.current ~= nil then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
						if var103 then return end
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
						local var106
						if var103 then
							var106 = true
						elseif sessionId == nil or sessionId == "" then
							var106 = false
						else
							var106 = var23.getCasSessionId() ~= sessionId
							var106 = nil
						end
						if not var106 then
							if var103 then
								var106 = true
							elseif sessionId == nil or sessionId == "" then
								var106 = false
							else
								var106 = var23.getCasSessionId() ~= sessionId
								var106 = nil
							end
							if not var106 then
								var102.current(isHydrateCancelled)
							end
						end
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
						if var103 then return end
						var37({
							isLoading = false,
							session = var23,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var19
						})
					end
					return
				elseif var103 then
					var105 = true
				elseif sessionId == nil or sessionId == "" then
					var105 = false
				else
					var105 = var23.getCasSessionId() ~= sessionId
					var105 = nil
				end
				if not var105 then
					var102.current(isHydrateCancelled)
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
					if var103 then return end
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
				-- upvalues: sessionId (copy), var20 (copy), var23 (copy), hydrateKnownSession (ref), universeId (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var37 (copy), var103 (write), var19 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var15 (copy), placeId (copy)
				local var105 = sessionId
				
				if var20 and (var105 == nil or var105 == "") then
					var105 = var23.getCasSessionId()
				end
				if var105 ~= nil and var105 ~= "" then
					hydrateKnownSession(var105)
					
					return
				elseif universeId == nil or universeId == 0 or var23.hasLoadedHistory() and #var23.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
						if var103 then return end
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
					local var106 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var106.state(false).status == "pending" do
						local var107
						if var103 then
							var107 = true
						elseif sessionId == nil or sessionId == "" then
							var107 = false
						else
							var107 = var23.getCasSessionId() ~= sessionId
							var107 = nil
						end
						if var107 then break end
						task.wait()
					end
					if var20 then
						local var108
						if var103 then
							var108 = true
						elseif sessionId == nil or sessionId == "" then
							var108 = false
						else
							var108 = var23.getCasSessionId() ~= sessionId
							var108 = nil
						end
						if var108 then return end
						local result
						local casSessionId = var23.getCasSessionId()
						
						if casSessionId ~= nil and casSessionId ~= "" then
							hydrateKnownSession(casSessionId)
							
							return
						elseif var103 then
							result = true
						elseif sessionId == nil or sessionId == "" then
							result = false
						else
							result = var23.getCasSessionId() ~= sessionId
							result = nil
						end
						if result or var106.state(false).status ~= "succeeded" then
							if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
								if var103 then return end
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
							result = var106.state(false).result
							local var109 = if result ~= nil then nil else result.sessions
							local var110 = if typeof(var109) == "table" then var109[1] else nil
							local var111 = if typeof(var110) == "table" then var110.sessionId else nil
							
							if typeof(var111) == "string" and var111 ~= "" then
								var15({
									universeId = universeId,
									placeId = placeId,
									sessionId = var111
								})
								
								return
							end
							var23.markHistoryLoaded()
							
							if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var37 ~= nil then
								if var103 then return end
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
				-- upvalues: var103 (write)
				var103 = true
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
		-- upvalues: var23 (ref), sessionId (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var102 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var16 (write), fFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), fFlagBuildExperiencePersistChatDraftModule (copy), var2 (copy), var82 (ref), var81 (ref), var78 (ref), var80 (ref), appLifecycleObserverService (copy)
		if var23 == nil then
			return
		end
		local var105 = false
		
		local function refreshKnownSession()
			-- upvalues: var23 (copy), sessionId (copy), var105 (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var102 (copy)
			local casSessionId = var23.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var105 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var23 (copy), var102 (copy)
				local function isRefreshCancelled()
					-- upvalues: var105 (copy)
					return var105
				end
				
				if (if fFlagBuildExperienceChatHistoryPrefetchModule then var23.refreshSession(isRefreshCancelled, true) else var23.refreshSession(isRefreshCancelled)) and not var105 then
					var102.current(function()
						-- upvalues: var105 (copy)
						return var105
					end)
				end
			end)
		end
		
		local var106 = messageBusService:Subscribe(gameMessageId, function(_)
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
					local var107 = var2.getChatDraft(casSessionId) or ""
					var82.current = var107
					var81.current = var107
					var78(var107)
					var80(nil)
				end
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var105 (write), var106 (ref), onUnhideConnection (ref)
			var105 = true
			var106:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var23, sessionId, var16 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var20 (ref), var19 (ref), var97 (ref)
		if (fFlagBuildExperienceFixChatBottomLockModule or var20) and var19 then
			var97.lockToBottom()
			
			return
		end
	end, {
		var19,
		var20,
		var23,
		sessionId,
		var97
	})
	local var105 = reactModule.useCallback(function(p5)
		-- upvalues: var81 (ref), var78 (ref), var80 (ref)
		var81.current = p5
		var78(p5)
		var80(nil)
	end, { var78, var80 })
	local var106 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var83 (ref)
		if var83.current ~= nil then
			task.cancel(var83.current)
			var83.current = nil
		end
	end, {}) else nil
	local var107 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var82 (ref), var106 (ref), var84 (ref), var83 (ref), var2 (copy)
		var82.current = p5
		var106()
		local current = var84.current
		
		if current == nil or current == "" then
			return
		end
		var83.current = task.delay(0.5, function()
			-- upvalues: var83 (copy), var2 (copy), current (ref), p5 (ref)
			var83.current = nil
			var2.setChatDraft(current, p5)
		end)
	end, { var106 }) else nil
	local var108 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var84 (ref), var82 (ref), var106 (ref), var2 (copy)
		local current = var84.current
		
		if current == nil or current == "" then
			return
		end
		var82.current = p5
		var106()
		var2.setChatDraft(current, p5)
	end, { var106 }) else nil
	local var109 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5, p6)
		-- upvalues: var82 (ref), var106 (ref), var2 (copy)
		if p6 == nil or p6 == "" or var82.current ~= p5 then
			return
		end
		var82.current = ""
		var106()
		var2.setChatDraft(p6, "")
	end, { var106 }) else nil
	local var110 = reactModule.useCallback(function(p5)
		-- upvalues: var105 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var107 (ref)
		var105(p5)
		
		if fFlagBuildExperiencePersistChatDraftModule then
			var107(p5)
		end
	end, { var105, var107 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperiencePersistChatDraftModule (copy), var25 (ref), var85 (ref), var106 (ref), var81 (ref), var82 (ref), var2 (copy), var105 (ref), var83 (ref)
		if not fFlagBuildExperiencePersistChatDraftModule then return end
		if var25 == nil or var25 == "" then return end
		local current = var85.current
		var85.current = var25
		var106()
		
		if current == nil and var81.current ~= "" then
			var82.current = var81.current
			var2.setChatDraft(var25, var81.current)
		else
			local var111 = var2.getChatDraft(var25) or ""
			var82.current = var111
			var105(var111)
		end
		return function()
			-- upvalues: var83 (copy), var106 (copy), var2 (copy), var25 (copy), var82 (copy)
			local var112 = var83.current ~= nil
			var106()
			
			if var112 then
				var2.setChatDraft(var25, var82.current)
			end
		end
	end, { var25, var106, var105 })
	
	local function commitComposerResourceAttachments(p5)
		-- upvalues: t_2 (write), var92 (write), var80 (ref)
		t_2.current = p5
		
		if var92 ~= nil then
			var92(p5)
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
		-- upvalues: t_2 (write), var92 (write), var80 (ref)
		local cloned = table.clone(t_2.current)
		table.insert(cloned, p6)
		t_2.current = cloned
		
		if var92 ~= nil then
			var92(cloned)
		end
		var80(nil)
	end
	
	local function removeComposerResourceAttachmentAtIndex(p6)
		-- upvalues: t_2 (write), var92 (write), var80 (ref)
		local cloned = table.clone(t_2.current)
		table.remove(cloned, p6)
		t_2.current = cloned
		
		if var92 ~= nil then
			var92(cloned)
		end
		var80(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: t_2 (write), var92 (write), var80 (ref)
		local t = {}
		t_2.current = t
		
		if var92 ~= nil then
			var92(t)
		end
		var80(nil)
	end
	
	local var111 = reactModule.useRef(commitComposerResourceAttachments)
	var111.current = commitComposerResourceAttachments
	
	if fFlagBuildExperienceChatResourceAttachments then
		reactModule.useLayoutEffect(function()
			-- upvalues: t_3 (write), p4 (ref), var111 (ref)
			local current = t_3.current
			
			if current.universeId ~= p4.universeId or current.placeId ~= p4.placeId then
				var111.current({})
			end
			t_3.current = { universeId = p4.universeId, placeId = p4.placeId }
		end, { p4.universeId, p4.placeId })
	end
	local v
	local function _(p6)
		-- upvalues: t (write), var87 (write)
		t.current = p6
		
		if var87 ~= nil then
			var87(p6)
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
		-- upvalues: t (write), var87 (write)
		local current = t.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p7 then
				cloned[i] = p8(v)
				t.current = cloned
				
				if var87 ~= nil then
					var87(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p9)
		-- upvalues: var89 (ref), var88 (ref), updateComposerImage (ref), var80 (ref), var3 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var11 (ref)
		local var112
		var89.current += 1
		local current = var89.current
		var88.current[p9] = current
		
		for i, v in updateComposerImage(p9, function(p10)
			local cloned = table.clone(p10)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var112 = true
				if not var112 then
					var80(nil)
				end
				var3(p9):andThen(function(p10)
					-- upvalues: var88 (copy), p9 (ref), current (ref), updateComposerImage (copy), var80 (copy)
					if var88.current[p9] ~= current then return end
					local var113
					var88.current[p9] = nil
					
					for i, v in updateComposerImage(p9, function(p11)
						-- upvalues: p10 (ref)
						local cloned = table.clone(p11)
						cloned.uri = `rbxassetid://{p10.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var113 = true
							if not var113 then
								var80(nil)
							end
							return
						end
					end
					var113 = false
				end):catch(function(p11)
					-- upvalues: var88 (copy), p9 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var80 (copy), var11 (copy)
					if var88.current[p9] ~= current then return end
					var88.current[p9] = nil
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
		var112 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t (write), var88 (ref), var87 (write), var80 (ref), beginComposerImageUpload (ref)
		local var113
		local current = t.current
		local t_1 = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var114 = value[i]
			var113 = var114
			
			if var114.capture ~= nil and var114.uri == nil and var114.uploadStatus == nil then
				for i, v in current do
					if v.capture == var114.capture then
						var113 = v
						break
					end
				end
			end
			if var113.uri ~= nil and var113.uploadStatus == nil then
				var113 = table.clone(var113)
				var113.uploadStatus = "uploaded"
			elseif var113.capture ~= nil and var113.uri == nil and var113.uploadStatus == nil then
				var113 = table.clone(var113)
				var113.uploadStatus = "uploading"
				table.insert(t_2, var113.capture)
			end
			table.insert(t_1, var113)
		end
		local var115
		for i_1, var113 in current do
			var115 = false
			
			for i_3, v_1 in t_1 do
				if v_1.capture == var113.capture then
					var115 = true
					break
				end
			end
			if not var115 and var113.capture ~= nil then
				var88.current[var113.capture] = nil
			end
		end
		t.current = t_1
		
		if var87 ~= nil then
			var87(t_1)
		end
		local var116
		for var113, v_1 in t_1 do
			if v_1.uploadStatus == "failed" then
				var116 = true
				if not var116 then
					var80(nil)
				end
				for i_3, var113 in t_2 do
					beginComposerImageUpload(var113)
				end
				return
			end
		end
		var116 = false
	end
	
	local var117 = reactModule.useRef(setComposerImages)
	var117.current = setComposerImages
	
	local function retryComposerImage(p10)
		-- upvalues: t (write), beginComposerImageUpload (ref)
		local var118 = t.current[p10]
		
		if var118 == nil or var118.capture == nil or var118.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var118.capture)
	end
	
	local var118 = false
	
	for i, v in var86 do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var118 = true
			break
		end
	end
	local var119 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p10)
		-- upvalues: var50 (ref), var49 (ref), var23 (ref), sessionId (write), var81 (ref), var110 (ref), creatorAgentChatModule_1 (copy), var10 (ref), var80 (ref)
		return function(p11, p12)
			-- upvalues: var50 (copy), p10 (ref), var49 (copy), var23 (copy), sessionId (copy), var81 (copy), var110 (copy), creatorAgentChatModule_1 (copy), var10 (copy), var80 (copy)
			if var50.current == p10 then
				local current = var49.current
				local var120 = sessionId
				
				if not (if current == nil or current.session ~= var23 then false else var120 == nil or var120 == "" or (if current.sessionId ~= var120 then current.sessionId == nil and current.session.getCasSessionId() == var120 else true)) then return end
				if p11 ~= nil and var81.current == "" then
					var110(p11)
				end
				var80(var10:Format(creatorAgentChatModule_1.getToolResultFailureComposerError(p12)))
				
				return
			end
		end
	end, {
		var23,
		sessionId,
		var110,
		var80,
		var10
	}) else nil
	local var120 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15)
		-- upvalues: var50 (ref), var52 (ref), var51 (ref), var43 (ref), p4 (ref), var98 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var117 (ref), fFlagBuildExperienceChatResourceAttachments (copy), var111 (ref), var110 (ref), creatorAgentChatModule_1 (copy), var10 (ref), var80 (ref), var97 (ref), sessionId (write), var13 (ref)
		if var50.current ~= p10 then return end
		var52(nil)
		var51.current = nil
		var43(nil)
		
		if p11 == nil then
			if p15.placeId ~= nil then
				var98(p15.placeId, "Completed")
			end
			var97.scrollToBottomAfterSend()
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
			var98(p15.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p13 ~= nil then
			var117.current(p13)
		end
		if fFlagBuildExperienceChatResourceAttachments and p14 ~= nil then
			var111.current(p14)
		end
		if p12 ~= nil then
			var110(p12)
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
		sessionId, var98, var13, var97, var110, var80, var52, var43, var10
	})
	local var121 = reactModule.useRef(var19)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var121 (ref), var20 (ref), var70 (ref), var54 (ref), var97 (ref)
		local var122 = var19 and not var121.current
		var121.current = var19
		
		if var20 then return end
		if not var19 then return end
		if var122 or var70 or var54 ~= nil then
			var97.scrollToBottomUnconditionally()
			task.defer(var97.scrollToBottomUnconditionally)
			task.delay(0.15, var97.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var19, var20, var70, var54, #messages, var97
	})
	reactModule.useEffect(function()
		-- upvalues: var48 (ref), var49 (ref), var23 (ref), sessionId (write), var47 (ref), var50 (ref), var51 (ref), placeId (write), var98 (ref), creatorAgentChatModule_1 (copy), var120 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var119 (write), var17 (write), var52 (ref), var97 (ref), var61 (ref), var54 (ref), creatorAgentChatStore (ref), var70 (ref)
		local var122
		if var48.current ~= nil then
			local current = var49.current
			var122 = sessionId
			
			if if current == nil or current.session ~= var23 then false else var122 == nil or var122 == "" or (if current.sessionId ~= var122 then current.sessionId == nil and current.session.getCasSessionId() == var122 else true) then return end
		end
		if var47 ~= nil then return end
		if var23 == nil then return end
		local var123
		local casSessionId = var23.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var123 = casSessionId
		else
			var122 = var23.universeId
			local placeId_1 = var23.placeId
			var123 = if var122 == nil or placeId_1 == nil then nil else `{var122}:{placeId_1}`
		end
		if var123 == nil then return end
		local function current(p10, p11)
			-- upvalues: var50 (copy), var51 (copy), placeId (copy), var98 (copy), creatorAgentChatModule_1 (copy), var23 (copy), var120 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var119 (copy), var17 (copy), var52 (copy), var97 (copy)
			var50.current += 1
			local current = var50.current
			var51.current = p11
			
			if placeId ~= nil then
				var98(placeId, "Loading")
			end
			local var124 = creatorAgentChatModule_1.createResumedAssistantTurn(var23, p10, function(p12)
				-- upvalues: var120 (copy), current (ref), var23 (copy)
				var120(current, p12, nil, nil, nil, var23)
			end, if p11 ~= nil then nil else p11 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var119(current) else nil, var17)
			var52(var124, var23)
			var124.start()
			var97.scrollToBottomUnconditionally()
		end
		
		if var61.activeTurnState == nil or var61.activeTurnItemIndex == nil or var61.activeTurnState.isDone then
			var51.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var123)
			var122 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var124 = casSessionId ~= nil and (var122 ~= nil and not var122.isDone)
			
			if not var70 and not var124 then return end
			if var124 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var61.activeTurnStartSequenceId
			
			if var51.current == casSessionId and var54 ~= nil then return end
			var122 = creatorAgentChatStore.resumeTurnFromHistory(var123, var61.activeTurnState, var61.activeTurnSequenceIds)
			
			if var122 ~= nil then
				current(var122, casSessionId)
			end
		end
	end, {
		var61, var23, sessionId, creatorAgentChatStore, var70, var54, placeId,
		var98, var120, var97, var52, var47, var119, var17
	})
	local var122 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19)
		-- upvalues: var43 (ref), var63 (write), fFlagBuildExperiencePersistChatDraftModule (copy), var109 (ref), sessionId (write), fFlagBuildAgentRollbackModule (copy), fFlagBuildExperienceLibrary (copy), creatorAgentChatModule_1 (copy), var120 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var119 (write), var17 (write), var98 (ref), var52 (ref), var97 (ref)
		var43({
			text = p11,
			images = p13,
			resourceAttachments = p14,
			afterSequenceId = p16
		})
		local var123 = var63
		
		if fFlagBuildExperiencePersistChatDraftModule and p17 ~= nil then
			local var124 = var123
			
			var123 = function(p20)
				-- upvalues: var124 (ref), var109 (copy), p17 (ref), p10 (ref), sessionId (copy)
				if var124 ~= nil then
					var124(p20)
				end
				var109(p17, p10.getCasSessionId() or sessionId)
			end
		end
		if (fFlagBuildAgentRollbackModule or fFlagBuildExperienceLibrary) and p18 ~= nil then
			local var125 = var123
			
			var123 = function(p20)
				-- upvalues: var125 (ref), p18 (ref), p10 (ref)
				if var125 ~= nil then
					var125(p20)
				end
				p18(p10.getCasSessionId())
			end
		end
		local _ = nil
		local var126 = creatorAgentChatModule_1.createLiveAssistantTurn(p10, p12, function(p20)
			-- upvalues: var120 (copy), p15 (ref), p17 (ref), p13 (ref), p14 (ref), p10 (ref), p19 (ref)
			var120(p15, p20, p17, p13, p14, p10)
			
			if p19 ~= nil then
				p19()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var119(p15) else nil, var17, var123)
		
		if p10.placeId ~= nil then
			var98(p10.placeId, "Loading")
		end
		var52(var126, p10)
		var97.scrollToBottomAfterSend()
		var126.start()
	end, {
		var120, var98, var97, var52, var43, var119, var17, var63, var109, sessionId
	})
	v = nil
	
	if fFlagBuildAgentRollbackModule then
		local var123 = reactModule.useRef(var61.latestSequenceId)
		var123.current = var61.latestSequenceId
		v = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var23,
			activeTurnHandleRef = var48,
			startRollbackTurn = reactModule.useCallback(function(p10, p11, p12)
				-- upvalues: var23 (ref), var97 (ref), var50 (ref), var45 (ref), buildAgentRollbackPromptModule (copy), var122 (ref), var123 (ref)
				if var23 == nil then
					p12()
					
					return
				end
				var97.captureStickToBottomForSend()
				var50.current += 1
				local current = var50.current
				var45(nil)
				local var124 = buildAgentRollbackPromptModule(p10.versionNumber, p10.noteTitle, p10.noteDescription)
				var122(var23, var124, var124, nil, nil, current, var123.current, nil, function()
					-- upvalues: var97 (copy), p11 (ref)
					var97.scrollToBottomUnconditionally()
					p11()
				end, p12)
			end, { var23, var97, var45, var122 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var96 (ref), var49 (ref), var23 (ref), sessionId (write), var50 (ref), var51 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var98 (ref), var52 (ref), var43 (ref), var45 (ref)
		if var96 ~= nil then
			local current = var49.current
			local var124 = sessionId
			
			if if current == nil or current.session ~= var23 then false else var124 == nil or var124 == "" or (if current.sessionId ~= var124 then current.sessionId == nil and current.session.getCasSessionId() == var124 else true) then return end
			local current = var49.current
			var50.current += 1
			var51.current = nil
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var96) then
				var96.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var98(current.session.placeId, "Idle")
			end
			var52(nil, nil)
			var43(nil)
			var45(nil)
			
			return
		end
	end, {
		var23, sessionId, var96, var52,
		if fFlagBuildAgentRollbackModule then v else nil,
		if fFlagBuildAgentRollbackModule then var98 else nil
	})
	local var124 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15)
		-- upvalues: var43 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var50 (ref), universeConfigurationModule (copy), var13 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var1 (copy), var28 (write), var27 (write), var122 (ref), var52 (ref), var110 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var117 (ref), fFlagBuildExperienceChatResourceAttachments (copy), var111 (ref), var80 (ref), chat_create_universe_error (ref)
		var43({
			text = p10,
			images = p12,
			resourceAttachments = p13,
			afterSequenceId = p15
		})
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p16)
			-- upvalues: debug (copy), processTime (ref), var50 (copy), p14 (ref), universeConfigurationModule (copy), var13 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var1 (copy), var28 (copy), var27 (copy), var122 (copy), p10 (ref), p11 (ref), p12 (ref), p13 (ref), p15 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p16.universeId,
				rootPlaceId = p16.rootPlaceId
			})
			
			if var50.current == p14 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p16.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p16 (ref)
					return universeConfigurationStore.setTeamCreate(p16.universeId, true)
				end):andThen(function()
					-- upvalues: var50 (copy), p14 (copy), p16 (ref), var13 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var1 (copy), var28 (copy), var27 (copy), var122 (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p15 (copy)
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
					var122(sessionForProject, p10, p11, p12, p13, p14, p15, p10)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p16)
			-- upvalues: debug (copy), processTime (ref), var50 (copy), p14 (ref), var52 (copy), var43 (copy), var110 (copy), p10 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p12 (ref), var117 (copy), fFlagBuildExperienceChatResourceAttachments (copy), p13 (ref), var111 (copy), var80 (copy), chat_create_universe_error (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p16
			})
			
			if var50.current ~= p14 then return end
			var52(nil)
			var43(nil)
			var110(p10)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p12 ~= nil then
				var117.current(p12)
			end
			if fFlagBuildExperienceChatResourceAttachments and p13 ~= nil then
				var111.current(p13)
			end
			var80(chat_create_universe_error)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var52, var110,
		var80, var13, var43, var122, chat_create_universe_error, var27, var28
	})
	local var125 = reactModule.useCallback(function(p10)
		-- upvalues: var81 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t (write), fFlagBuildExperienceChatResourceAttachments (copy), t_2 (write), var110 (ref), var70 (ref), var49 (ref), var23 (ref), sessionId (write), var48 (ref), var95 (ref), var97 (ref), p4 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var22 (ref), var50 (ref), var45 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var108 (ref), var105 (ref), var117 (ref), var111 (ref), var124 (ref), var61 (ref), var122 (ref), fFlagBuildExperienceLibrary (copy)
		local v
		local replaced = string.gsub(var81.current, "^%s*(.-)%s*$", "%1")
		local var126 = if fFlagBuildExperienceChatImageAttachmentsModule then t.current else {}
		local var127 = if fFlagBuildExperienceChatResourceAttachments then t_2.current else {}
		
		if replaced == "" and #var126 == 0 then
			var110("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var126 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var70 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var126 > 0 or fFlagBuildExperienceChatResourceAttachments and #var127 > 0 then
				return false
			end
			local current = var49.current
			v = sessionId
			local var128 = if if current == nil or current.session ~= var23 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var48.current else nil
			
			if var128 == nil or not var128.trySubmitComposerText(replaced) then
				return false
			end
			var110("")
			
			if var95.current then
				var95.current.releaseFocus()
			end
			var97.scrollToBottomAfterSend()
			
			return true
		else
			local var129 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var129 and var23 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var22.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var97.captureStickToBottomForSend()
			var50.current += 1
			local current = var50.current
			var45(nil)
			
			if fFlagBuildExperiencePersistChatDraftModule then
				var108(replaced)
			end
			var105("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var117.current({})
			end
			if fFlagBuildExperienceChatResourceAttachments then
				var111.current({})
			end
			if var95.current then
				var95.current.releaseFocus()
			end
			local function current(p11, p12)
				-- upvalues: var129 (ref), var124 (copy), replaced (ref), var127 (ref), current (ref), var61 (copy), var122 (copy), var23 (copy), fFlagBuildExperienceLibrary (copy), p10 (ref)
				if var129 then
					var124(replaced, p11, p12, var127, current, var61.latestSequenceId)
					
					return
				end
				var122(var23, replaced, p11, p12, var127, current, var61.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
			end
			
			if #var126 == 0 and #var127 == 0 then
				if var129 then
					var124(replaced, replaced, nil, var127, current, var61.latestSequenceId)
				else
					var122(var23, replaced, replaced, nil, var127, current, var61.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
				end
				return true
			else
				local t_1 = {}
				
				if replaced ~= "" then
					table.insert(t_1, { type = "text", text = replaced })
				end
				for i, v_1 in var127 do
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
				
				for i_1, v_2 in var126 do
					local uri = v_2.uri
					table.insert(t_1, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_2.capture,
						uri = uri
					})
				end
				if var129 then
					var124(replaced, t_1, v, var127, current, var61.latestSequenceId)
				else
					var122(var23, replaced, t_1, v, var127, current, var61.latestSequenceId, replaced, if fFlagBuildExperienceLibrary then p10 else nil)
				end
				return true
			end
		end
	end, {
		var23, sessionId, universeId, placeId, var70, var97, var110, var105, var108,
		var124, var122, p4.createUniverseOnFirstPrompt, var45, var61,
		if fFlagBuildAgentRollbackModule then var22 else nil
	})
	local var130 = reactModule.useCallback(function()
		-- upvalues: var49 (ref), var23 (ref), sessionId (write), var48 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var50 (ref), var52 (ref), var51 (ref), var43 (ref), var45 (ref), var61 (ref), placeId (write), var98 (ref)
		local current = var49.current
		local var131 = if if current == nil or current.session ~= var23 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var48.current else nil
		
		if var131 == nil then
			if fFlagBuildAgentRollbackModule then
				v.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var50.current += 1
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var131) then
				var131.stop()
			end
			var52(nil)
			var51.current = nil
			var43(nil)
			var45({
				session = var23,
				sessionId = var23.getCasSessionId(),
				startSequenceId = var61.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var98(placeId, "Idle")
			end
		end
	end, {
		var23, sessionId, placeId, var98, var52, var43, var45, var61,
		if fFlagBuildAgentRollbackModule then v else nil
	})
	local var131 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var132 = if p4.focusComposerWhen == nil then var131 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var131 (ref), var132 (ref), var95 (ref)
		if var131 and var132 then
			local var133 = false
			
			local var134 = function()
				-- upvalues: var133 (write)
				return var133
			end
			
			local var135 = 8
			
			local function tryFocus()
				-- upvalues: var134 (ref), var95 (ref), var135 (write), tryFocus (ref)
				if var134() then return end
				local current = var95.current
				
				if current then
					current.focus()
					
					return
				end
				var135 -= 1
				
				if var135 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var133 (write)
				var133 = true
			end
		end
		return function() end
	end, { var131, var132 })
	local t_4 = {
		agentSpecVersion = specVersion,
		setAgentSpecVersion = var26,
		messages = messages,
		localToolActions = var57,
		composerText = var77,
		composerErrorText = var79,
		setComposerText = var110,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then var86 else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = if fFlagBuildExperienceChatResourceAttachments then t_1 else {},
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var118,
		isAssistantResponding = var70,
		canStopAssistantResponse = u2044,
		canSendWhileResponding = var71,
		sendMessage = var125,
		stopAssistantResponse = var130,
		setScrollingFrame = var97.setScrollingFrame,
		anchorScrollToInstance = if fFlagBuildExperienceChatAccordionScrollAnchorModule then var97.anchorToInstance else nil,
		textBoxRef = var95,
		clockBinding = var96,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p11)
			-- upvalues: placeId (write), var16 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var133 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var16 ~= nil) then function()
				-- upvalues: var16 (ref)
				var16.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p11, true, var133) and var133 ~= nil and var16 ~= nil then
				var16.current = false
			end
		end, { placeId, var16 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var41,
		isHistoryExhausted = var67
	}
	local _ = true
	local _ = var54 ~= nil and ((if var54 ~= nil then fFlagBuildAgentRollbackModule else nil) and var69)
	
	return t_4
end