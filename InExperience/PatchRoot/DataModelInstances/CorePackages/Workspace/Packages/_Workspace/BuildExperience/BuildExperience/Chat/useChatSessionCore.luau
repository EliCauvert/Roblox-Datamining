local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperiencePersistChatDraftModule = require(buildExperience.Flags.FFlagBuildExperiencePersistChatDraft)
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
local fFlagBuildExperienceFixChatBottomLockModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatBottomLock)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local _ = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)
local sessionPromptMessageFilterModule = require(script.Parent.sessionPromptMessageFilter)
local useAgentRollbackRequestModule = require(script.Parent.useAgentRollbackRequest)
local useChatScrollModule = require(script.Parent.useChatScroll)
local buildAgentRollbackPromptModule = require(buildExperience.utils.buildAgentRollbackPrompt)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)
local var1 = if fFlagBuildExperiencePersistChatDraftModule then require(buildExperience.Storage.BuildAppStorage) else nil
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local var2 = if fFlagBuildExperienceChatImageAttachmentsModule then require(buildExperience.utils.uploadCaptureAsync) else nil
local debug = creatorAgentChatModule.debug
local var3 = signalsModule.createSignal(false)
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var4 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
})
local var5 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
})
local var6 = signalsModule.createSignal(nil)
local var7 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

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
			local var8 = if turnFeedbackIds == nil or typeof(turnFeedbackIds) == "function" then nil else turnFeedbackIds.turnId
			turnFeedbackIds = var8 ~= nil and p1.liveTurnIds[var8] == true
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
	local var9 = 8
	
	local function tryFocus()
		-- upvalues: p5 (ref), p4 (ref), var9 (write), tryFocus (ref)
		if p5() then return end
		local current = p4.current
		
		if current then
			current.focus()
			
			return
		end
		var9 -= 1
		
		if var9 > 0 then
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
	-- upvalues: fFlagBuildLocalization (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var7 (ref), signalsModule (ref), signalsReactModule (ref), var4 (ref), var5 (ref), var6 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), var3 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperiencePersistChatDraftModule (ref), var1 (ref), var2 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var9 = if fFlagBuildLocalization or fFlagBuildExperienceChatImageAttachmentsModule then reactModule.useContext(localizationRoactContext) else nil
	local var10 = if fFlagBuildLocalization then var9:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var11 = if fFlagBuildExperienceChatImageAttachmentsModule then var9:Format(localizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
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
	local var20 = if fFlagBuildAdUpsellModule then reactModule.useRef(p4.trackAdUpsellTurns == true).current else false
	local fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule or var20
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var21 = getAgentRollbackRequestStoreModule()
	local var22 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var22 (ref), sessionId (write)
		if var22 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var22.setCasSessionId(sessionId)
	end, { var22, sessionId })
	local var23 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var22 (ref), var7 (copy), signalsModule (copy)
		return if var22 == nil then var7 else signalsModule.createComputed(function(p5)
			-- upvalues: var22 (copy)
			return {
				session = var22,
				sessionId = var22.getCasSessionId(),
				events = var22.getMergedHistory(p5)
			}
		end)
	end, { var22 }))
	local var24 = if var22 ~= nil then nil else var22.getCasSessionId()
	local var25 = if var23.session == var22 and var23.sessionId == var24 then var23.events else {}
	local var26 = sessionId ~= nil and sessionId ~= ""
	local var27 = var26 or (universeId ~= nil and universeId ~= 0)
	local var28 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	
	if var28 then
		var28 = var19
		
		if var28 then
			var28 = false
			
			if var22 ~= nil then
				var28 = var27
				
				if var28 then
					var28 = not (var22.hasLoadedHistory() and #var25 > 0)
				end
			end
		end
	end
	local var29 = nil
	local var30 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 then
		local var31, var32 = reactModule.useState(function()
			-- upvalues: var22 (ref), sessionId (write), universeId (write), var19 (ref), var28 (ref)
			return {
				session = var22,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var19,
				isLoading = var28
			}
		end)
		var29 = var31
		var30 = var32
	end
	local var33 = if var29 ~= nil and (var29.session == var22 and (var29.sessionId == sessionId and (var29.universeId == universeId and var29.hydrateHistoryWhen == var19))) then not var29.isLoading else not var28
	local var34 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and (if var33 then var22 ~= nil and var22.getNextHistoryPageToken() ~= nil else not var33)
	local var35, var36 = reactModule.useState(nil)
	local var37, var38 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var38 (ref)
		var38(nil)
	end, { var22, sessionId })
	local var39 = sessionId
	local var40 = if if var37 == nil or var37.session ~= var22 then false else var39 == nil or var39 == "" or (if var37.sessionId ~= var39 then var37.sessionId == nil and var37.session.getCasSessionId() == var39 else true) then var37 else nil
	var81, var79 = reactModule.useState(nil)
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useRef(0)
	local var44 = reactModule.useRef(nil)
	local var45 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var41 (ref), var42 (ref), var39 (ref)
		assert(if p5 ~= nil then p6 ~= nil else true, "Active turns require an owning session")
		var41.current = p5
		var42.current = if p5 ~= nil then nil else { session = p6, sessionId = p6.getCasSessionId() }
		var39(p5)
	end, { var39 })
	local current = var42.current
	local var46 = sessionId
	local var47 = if if current == nil or current.session ~= var22 then false else var46 == nil or var46 == "" or (if current.sessionId ~= var46 then current.sessionId == nil and current.session.getCasSessionId() == var46 else true) then var81 else nil
	local var48 = if var47 ~= nil then var4 else var47.getOptimisticLocalTools
	current = if var47 ~= nil then var5 else var47.getLocalToolActions
	var46 = if var47 ~= nil then var6 else var47.getSetupErrorText
	local var49 = signalsReactModule.useSignalState(var48)
	local var50 = signalsReactModule.useSignalState(current)
	local var51 = signalsReactModule.useSignalState(var46)
	local _ = nil
	local var52 = if fFlagBuildLocalization and var51 ~= nil then var9:Format(var51) else var51
	local var53 = reactModule.useMemo(function()
		-- upvalues: var47 (ref), p4 (ref), var22 (ref), var35 (ref), var52 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var47 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p4.createUniverseOnFirstPrompt == true and (var22 == nil and var35 ~= nil))) then nil else { setupErrorText = var52 }
	end, {
		var47,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p4.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var35 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var22 else nil,
		var52
	})
	local var54 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var25 (ref), var22 (ref), sessionId (write), universeId (write), placeId (write), var49 (ref), var35 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var53 (ref), var40 (ref)
		return parseSessionStreamModule(var25, {
			sessionId = if var22 ~= nil then sessionId else var22.getCasSessionId() or sessionId,
			universeId = if var22 ~= nil then universeId else var22.universeId,
			placeId = if var22 ~= nil then placeId else var22.placeId,
			optimisticLocalTools = var49,
			pendingUserMessage = if var35 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var35.text) then nil else var35.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var35 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var35.text)) then var35.images else nil,
			pendingUserMessageAfterSequenceId = if var35 ~= nil then nil else var35.afterSequenceId,
			liveAssistantMessage = var53,
			optimisticCancelledStartSequenceId = if var40 ~= nil then nil else var40.startSequenceId
		})
	end, {
		var25, var22, sessionId, universeId, placeId, var49, var35, var53, var40
	})
	local var55 = if var20 then reactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = universeId,
		sessionId = if var22 ~= nil then sessionId else var22.getCasSessionId() or sessionId,
		historyWatermarkSequenceId = var54.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local var56 = if var55 ~= nil then reactModule.useCallback(function(p5)
		-- upvalues: var55 (write)
		if p5 ~= nil then
			var55.current.liveTurnIds[p5] = true
		end
	end, { var55 }) else nil
	local messages = var54.messages
	local var57 = var22 ~= nil and var22.getNextHistoryPageToken() ~= nil
	local var58 = if var22 ~= nil then not var27 or var22.hasLoadedHistory() else true
	local var59 = var33 and (var58 and (if var22 ~= nil then if #messages <= 0 then not var57 else true else true))
	local var60 = var59 and not var57
	local subagentTaskState = var54.subagentTaskState
	local includesPublishTool = var54.includesPublishTool
	local var61 = messages[#messages]
	local var62 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var21 (ref), var3 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var21.getIsPendingForPlaceId(placeId) else var3
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var21 else nil
	}))
	local var63 = if var47 == nil and var61 ~= nil then var61.kind == "assistant_turn" and (not var61.isDone or fFlagBuildAgentRollbackModule and var62) else true
	local var64 = var63 and (not (fFlagBuildAgentRollbackModule and var62) and hasPendingLocalToolResponse(var49))
	local activeTurnState = var54.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var47 (ref), activeTurnState (ref)
		if var47 == nil or activeTurnState == nil then
			return
		end
		var47.syncFromTurnState(activeTurnState)
	end, { var47, activeTurnState })
	
	if var20 then
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), var55 (write), var22 (ref), universeId (write), sessionId (write), var54 (ref), var59 (ref), noteLiveAdUpsellTurns (copy), messages (ref)
			local onAssistantTurnCompleted = p4.onAssistantTurnCompleted
			local var65 = if var22 ~= nil then universeId else var22.universeId or universeId
			local var66 = if var22 ~= nil then sessionId else var22.getCasSessionId() or sessionId
			local current = var55.current
			local var67 = current
			
			if (if var67.universeId ~= nil then if var65 ~= nil then var67.universeId == var65 else true else true) and (if var67.sessionId ~= nil then if var66 ~= nil then var67.sessionId == var66 else true else true) then
				current.universeId = var65 or current.universeId
				current.sessionId = var66 or current.sessionId
			else
				current = {
					isInitialized = false,
					lastProcessedSequenceId = nil,
					universeId = var65,
					sessionId = var66,
					historyWatermarkSequenceId = var54.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				var55.current = current
			end
			local var68
			if not var59 then
				current.historyWatermarkSequenceId = current.historyWatermarkSequenceId or var54.latestSequenceId
				noteLiveAdUpsellTurns(current, messages)
				
				return
			elseif not current.isInitialized then
				current.isInitialized = true
				noteLiveAdUpsellTurns(current, messages)
				var68 = nil
				
				for i in current.liveTurnStartSequenceIds do
					if var68 == nil or i < var68 then
						var68 = i
					end
				end
				if var68 == nil then
					current.lastProcessedSequenceId = current.historyWatermarkSequenceId or var54.latestSequenceId
				else
					current.lastProcessedSequenceId = var68 - 1
				end
				current.liveTurnIds = {}
				current.liveTurnStartSequenceIds = {}
			end
			if var65 == nil or var65 == 0 then return end
			var68 = current.lastProcessedSequenceId or -1
			
			for i, v in messages do
				local var69 = if v.kind == "assistant_turn" and v.isDone and (v.isOptimisticallyCancelled ~= true and v.turnState ~= nil) then v.endSequenceId or v.startSequenceId else nil
				
				if var69 ~= nil and var69 > var68 then
					if onAssistantTurnCompleted ~= nil then
						onAssistantTurnCompleted({
							universeId = var65,
							sessionId = v.sessionId or var66,
							turnState = v.turnState,
							latestSequenceId = var69
						})
					end
					current.lastProcessedSequenceId = var69
					var68 = var69
				end
			end
		end, {
			p4.onAssistantTurnCompleted, var22, universeId, sessionId, var59, messages,
			var54.latestSequenceId
		})
	end
	reactModule.useEffect(function()
		-- upvalues: var54 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var54.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var54.includesPublishTool, placeId })
	local var70, var71 = reactModule.useBinding("")
	local var72, var73 = reactModule.useState(nil)
	local var74 = reactModule.useRef("")
	local var75 = reactModule.useRef("")
	local var76 = reactModule.useRef(nil)
	local var77 = reactModule.useRef(var24)
	local var78 = reactModule.useRef(nil)
	var77.current = var24
	local t = {}
	local var79 = nil
	local t_1 = { current = {} }
	local var80 = reactModule.useRef({})
	local var81 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var82, var83 = reactModule.useState({})
		t = var82
		var79 = var83
		t_1 = reactModule.useRef({})
	end
	local v
	local var84 = reactModule.useRef(nil)
	local var85 = reactUtilsModule.useClock()
	local var86 = useChatScrollModule()
	local var87 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var88 = reactModule.useCallback(function(p5)
		-- upvalues: var86 (ref), var22 (ref)
		local var89 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var86.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var22 (copy), var89 (ref), var86 (copy), p5 (ref)
			if var22 == nil then return end
			if var22.loadOlderHistory(var89) and var22.getNextHistoryPageToken() ~= nil and var86.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var86 (copy), var22 (copy), var89 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var86.isViewportUnderfilled() then
						var22.loadOlderHistory(var89)
					end
				end)
			end
		end)
	end, { var22, var86 })
	local var89 = reactModule.useCallback(function(p5)
		-- upvalues: var22 (ref), var86 (ref), var88 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var22 (copy), var86 (copy), var88 (copy)
			if p5() then return end
			if var22 == nil then return end
			if var22.getNextHistoryPageToken() == nil then return end
			if var86.isViewportUnderfilled() then
				var88(p5)
				
				return
			end
		end)
	end, { var88, var86, var22 })
	local var90 = reactModule.useCallback(function(p5)
		-- upvalues: var22 (ref), var89 (ref)
		if var22 == nil then return end
		if var22.getNextHistoryPageToken() == nil then
			return
		end
		var89(p5)
	end, { var89, var22 })
	local var91 = reactModule.useRef(var90)
	var91.current = var90
	reactModule.useEffect(function()
		-- upvalues: var86 (ref), var88 (ref)
		var86.setOnScrolledToTop(function()
			-- upvalues: var88 (copy)
			var88(nil)
		end)
		
		return function()
			-- upvalues: var86 (copy)
			var86.setOnScrolledToTop(nil)
		end
	end, { var86.setOnScrolledToTop, var88 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var22 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var30 (write), sessionId (write), universeId (write), var91 (ref), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var15 (ref), placeId (write)
		if var19 and var22 ~= nil then
			local var92 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var30 (copy), var92 (write), var22 (copy), sessionId (copy), universeId (copy), var19 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil and not var92 then
					var30({
						session = var22,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var19,
						isLoading = value
					})
					
					return
				end
			end
			
			local var93 = not (var22.hasLoadedHistory() and #var22.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
				var30({
					session = var22,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var19,
					isLoading = var93
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var92 (write), sessionId (ref), var22 (copy)
				return if var92 then true elseif sessionId == nil or sessionId == "" then false else var22.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var92 (write), sessionId (ref), var22 (copy), var91 (copy), isHydrateCancelled (ref)
				local var94
				if var92 then
					var94 = true
				elseif sessionId == nil or sessionId == "" then
					var94 = false
				else
					var94 = var22.getCasSessionId() ~= sessionId
					var94 = nil
				end
				if var94 then
					return
				end
				var91.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var22 (copy), var92 (write), sessionId (ref), var91 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var30 (copy), sessionId (copy), universeId (copy), var19 (copy)
				var22.setCasSessionId(p5)
				
				if var22.hasLoadedHistory() and #var22.getMergedHistory(false) > 0 then
					local var94
					if var92 then
						var94 = true
					elseif sessionId == nil or sessionId == "" then
						var94 = false
					else
						var94 = var22.getCasSessionId() ~= sessionId
						var94 = nil
					end
					if not var94 then
						var91.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
						if var92 then return end
						var30({
							isLoading = false,
							session = var22,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var19
						})
					end
					return
				elseif var22.refreshSession(isHydrateCancelled) then
					local var95
					if var92 then
						var95 = true
					elseif sessionId == nil or sessionId == "" then
						var95 = false
					else
						var95 = var22.getCasSessionId() ~= sessionId
						var95 = nil
					end
					if not var95 then
						if var92 then
							var95 = true
						elseif sessionId == nil or sessionId == "" then
							var95 = false
						else
							var95 = var22.getCasSessionId() ~= sessionId
							var95 = nil
						end
						if not var95 then
							var91.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
					if var92 then return end
					var30({
						isLoading = false,
						session = var22,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var19
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var22 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var30 (copy), var92 (write), var19 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var15 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var22.hasLoadedHistory() and #var22.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
						if var92 then return end
						var30({
							isLoading = false,
							session = var22,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var19
						})
					end
					return
				else
					local var94 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var94.state(false).status == "pending" do
						local var95
						if var92 then
							var95 = true
						elseif sessionId == nil or sessionId == "" then
							var95 = false
						else
							var95 = var22.getCasSessionId() ~= sessionId
							var95 = nil
						end
						if var95 then break end
						task.wait()
					end
					local result
					if var92 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var22.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var94.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
							if var92 then return end
							var30({
								isLoading = false,
								session = var22,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var19
							})
						end
						return
					else
						result = var94.state(false).result
						local var96 = if result ~= nil then nil else result.sessions
						local var97 = if typeof(var96) == "table" then var96[1] else nil
						local var98 = if typeof(var97) == "table" then var97.sessionId else nil
						
						if typeof(var98) == "string" and var98 ~= "" then
							var15({
								universeId = universeId,
								placeId = placeId,
								sessionId = var98
							})
							
							return
						end
						var22.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
							if var92 then return end
							var30({
								isLoading = false,
								session = var22,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var19
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var92 (write)
				var92 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var30 ~= nil then
			var30({
				isLoading = false,
				session = var22,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var19
			})
		end
	end, {
		var22, sessionId, universeId, placeId, creatorAgentChatStore, var19,
		fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	})
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), sessionId (write), var91 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var16 (write), appLifecycleObserverService (copy)
		if var22 == nil then
			return
		end
		local var94 = false
		
		local function refreshKnownSession()
			-- upvalues: var22 (copy), sessionId (copy), var94 (write), var91 (copy)
			local casSessionId = var22.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var22 (copy), var94 (copy), var91 (copy)
				if var22.refreshSession(function()
					-- upvalues: var94 (copy)
					return var94
				end) and not var94 then
					var91.current(function()
						-- upvalues: var94 (copy)
						return var94
					end)
				end
			end)
		end
		
		local var95 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var16 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var16 ~= nil then
				var16.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var94 (write), var95 (ref), onUnhideConnection (ref)
			var94 = true
			var95:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var22, sessionId, var16 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var19 (ref), var86 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var19 then
			var86.lockToBottom()
			
			return
		end
	end, { var19, var22, sessionId, var86 })
	local var94 = reactModule.useCallback(function(p5)
		-- upvalues: var74 (ref), var71 (ref), var73 (ref)
		var74.current = p5
		var71(p5)
		var73(nil)
	end, { var71, var73 })
	local var95 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var76 (ref)
		if var76.current ~= nil then
			task.cancel(var76.current)
			var76.current = nil
		end
	end, {}) else nil
	local var96 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var75 (ref), var95 (ref), var77 (ref), var76 (ref), var1 (copy)
		var75.current = p5
		var95()
		local current = var77.current
		
		if current == nil or current == "" then
			return
		end
		var76.current = task.delay(0.5, function()
			-- upvalues: var76 (copy), var1 (copy), current (ref), p5 (ref)
			var76.current = nil
			var1.setChatDraft(current, p5)
		end)
	end, { var95 }) else nil
	local var97 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var77 (ref), var75 (ref), var95 (ref), var1 (copy)
		local current = var77.current
		
		if current == nil or current == "" then
			return
		end
		var75.current = p5
		var95()
		var1.setChatDraft(current, p5)
	end, { var95 }) else nil
	local var98 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5, p6)
		-- upvalues: var75 (ref), var95 (ref), var1 (copy)
		if p6 == nil or p6 == "" or var75.current ~= p5 then
			return
		end
		var75.current = ""
		var95()
		var1.setChatDraft(p6, "")
	end, { var95 }) else nil
	local var99 = reactModule.useCallback(function(p5)
		-- upvalues: var94 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var96 (ref)
		var94(p5)
		
		if fFlagBuildExperiencePersistChatDraftModule then
			var96(p5)
		end
	end, { var94, var96 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperiencePersistChatDraftModule (copy), var24 (ref), var78 (ref), var95 (ref), var74 (ref), var75 (ref), var1 (copy), var94 (ref), var76 (ref)
		if not fFlagBuildExperiencePersistChatDraftModule then return end
		if var24 == nil or var24 == "" then return end
		local current = var78.current
		var78.current = var24
		var95()
		
		if current == nil and var74.current ~= "" then
			var75.current = var74.current
			var1.setChatDraft(var24, var74.current)
		else
			local var100 = var1.getChatDraft(var24) or ""
			var75.current = var100
			var94(var100)
		end
		return function()
			-- upvalues: var76 (copy), var95 (copy), var1 (copy), var24 (copy), var75 (copy)
			local var101 = var76.current ~= nil
			var95()
			
			if var101 then
				var1.setChatDraft(var24, var75.current)
			end
		end
	end, { var24, var95, var94 })
	
	local function _(p5)
		-- upvalues: t_1 (write), var79 (write)
		t_1.current = p5
		
		if var79 ~= nil then
			var79(p5)
		end
	end
	
	local _ = function(p5)
		for i, v in p5 do
			if v.uploadStatus == "failed" then
				return true
			end
		end
		return false
	end
	
	local function updateComposerImage(p6, p7)
		-- upvalues: t_1 (write), var79 (write)
		local current = t_1.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p6 then
				cloned[i] = p7(v)
				t_1.current = cloned
				
				if var79 ~= nil then
					var79(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p8)
		-- upvalues: var81 (ref), var80 (ref), updateComposerImage (ref), var73 (ref), var2 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var11 (ref)
		local var100
		var81.current += 1
		local current = var81.current
		var80.current[p8] = current
		
		for i, v in updateComposerImage(p8, function(p9)
			local cloned = table.clone(p9)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var100 = true
				if not var100 then
					var73(nil)
				end
				var2(p8):andThen(function(p9)
					-- upvalues: var80 (copy), p8 (ref), current (ref), updateComposerImage (copy), var73 (copy)
					if var80.current[p8] ~= current then return end
					local var101
					var80.current[p8] = nil
					
					for i, v in updateComposerImage(p8, function(p10)
						-- upvalues: p9 (ref)
						local cloned = table.clone(p10)
						cloned.uri = `rbxassetid://{p9.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var101 = true
							if not var101 then
								var73(nil)
							end
							return
						end
					end
					var101 = false
				end):catch(function(p10)
					-- upvalues: var80 (copy), p8 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var73 (copy), var11 (copy)
					if var80.current[p8] ~= current then return end
					var80.current[p8] = nil
					updateComposerImage(p8, function(p11)
						-- upvalues: p10 (ref)
						local cloned = table.clone(p11)
						cloned.uri = nil
						cloned.uploadStatus = "failed"
						cloned.uploadError = p10
						
						return cloned
					end)
					
					if fFlagBuildExperienceChatImageAttachmentsModule then
						var73(var11)
					end
				end)
				
				return
			end
		end
		var100 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t_1 (write), var80 (ref), var79 (write), var73 (ref), beginComposerImageUpload (ref)
		local var101
		local current = t_1.current
		local t = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var102 = value[i]
			var101 = var102
			
			if var102.capture ~= nil and var102.uri == nil and var102.uploadStatus == nil then
				for i, v in current do
					if v.capture == var102.capture then
						var101 = v
						break
					end
				end
			end
			if var101.uri ~= nil and var101.uploadStatus == nil then
				var101 = table.clone(var101)
				var101.uploadStatus = "uploaded"
			elseif var101.capture ~= nil and var101.uri == nil and var101.uploadStatus == nil then
				var101 = table.clone(var101)
				var101.uploadStatus = "uploading"
				table.insert(t_2, var101.capture)
			end
			table.insert(t, var101)
		end
		local var103
		for i_1, var101 in current do
			var103 = false
			
			for i_3, v_1 in t do
				if v_1.capture == var101.capture then
					var103 = true
					break
				end
			end
			if not var103 and var101.capture ~= nil then
				var80.current[var101.capture] = nil
			end
		end
		t_1.current = t
		
		if var79 ~= nil then
			var79(t)
		end
		local var104
		for var101, v_1 in t do
			if v_1.uploadStatus == "failed" then
				var104 = true
				if not var104 then
					var73(nil)
				end
				for i_3, var101 in t_2 do
					beginComposerImageUpload(var101)
				end
				return
			end
		end
		var104 = false
	end
	
	local var105 = reactModule.useRef(setComposerImages)
	var105.current = setComposerImages
	
	local function retryComposerImage(p9)
		-- upvalues: t_1 (write), beginComposerImageUpload (ref)
		local var106 = t_1.current[p9]
		
		if var106 == nil or var106.capture == nil or var106.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var106.capture)
	end
	
	local var106 = false
	
	for i, v in t do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var106 = true
			break
		end
	end
	local var107 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p9)
		-- upvalues: var43 (ref), var42 (ref), var22 (ref), sessionId (write), var74 (ref), var99 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var9 (ref), var73 (ref)
		return function(p10, p11)
			-- upvalues: var43 (copy), p9 (ref), var42 (copy), var22 (copy), sessionId (copy), var74 (copy), var99 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var9 (copy), var73 (copy)
			if var43.current == p9 then
				local current = var42.current
				local var108 = sessionId
				
				if not (if current == nil or current.session ~= var22 then false else var108 == nil or var108 == "" or (if current.sessionId ~= var108 then current.sessionId == nil and current.session.getCasSessionId() == var108 else true)) then return end
				if p10 ~= nil and var74.current == "" then
					var99(p10)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p11)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var9:Format(toolResultFailureComposerError)
				end
				var73(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var22,
		sessionId,
		var99,
		var73,
		var9
	}) else nil
	local var108 = reactModule.useCallback(function(p9, p10, p11, p12, p13)
		-- upvalues: var43 (ref), var45 (ref), var44 (ref), var36 (ref), p4 (ref), var87 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var105 (ref), var99 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var9 (ref), var73 (ref), var86 (ref), sessionId (write), var13 (ref)
		if var43.current ~= p9 then return end
		var45(nil)
		var44.current = nil
		var36(nil)
		
		if p10 == nil then
			if p13.placeId ~= nil then
				var87(p13.placeId, "Completed")
			end
			var86.scrollToBottomAfterSend()
			local casSessionId = p13.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p4.createUniverseOnFirstPrompt and sessionId == nil and p13.universeId ~= nil then
					local t = {
						universeId = p13.universeId,
						placeId = p13.placeId,
						sessionId = casSessionId
					}
					var13(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p13 (ref), var43 (copy), p9 (ref)
					p13.refreshSession(function()
						-- upvalues: var43 (copy), p9 (copy)
						return var43.current ~= p9
					end)
				end)
			end
			return
		elseif p4.onPromptFailure ~= nil then
			p4.onPromptFailure(p10.errorCode, p10.outOfCreditsReason)
		end
		if p13.placeId ~= nil then
			var87(p13.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p12 ~= nil then
			var105.current(p12)
		end
		if p11 ~= nil then
			var99(p11)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p10)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var9:Format(promptFailureComposerError)
			end
			var73(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p13 (ref), var43 (copy), p9 (ref)
			p13.refreshSession(function()
				-- upvalues: var43 (copy), p9 (copy)
				return var43.current ~= p9
			end)
		end)
	end, {
		p4.createUniverseOnFirstPrompt, p4.onPromptFailure, p4.onProjectResolved,
		sessionId, var87, var13, var86, var99, var73, var45, var36, var9
	})
	local var109 = reactModule.useRef(var19)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var109 (ref), var63 (ref), var47 (ref), var86 (ref)
		local var110 = var19 and not var109.current
		var109.current = var19
		
		if not var19 then return end
		if var110 or var63 or var47 ~= nil then
			var86.scrollToBottomUnconditionally()
			task.defer(var86.scrollToBottomUnconditionally)
			task.delay(0.15, var86.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var19,
		var63,
		var47,
		#messages,
		var86
	})
	reactModule.useEffect(function()
		-- upvalues: var41 (ref), var42 (ref), var22 (ref), sessionId (write), var40 (ref), var43 (ref), var44 (ref), placeId (write), var87 (ref), creatorAgentChatModule_1 (copy), var108 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var107 (write), var17 (write), var45 (ref), var86 (ref), var54 (ref), var47 (ref), creatorAgentChatStore (ref), var63 (ref)
		local var110
		if var41.current ~= nil then
			local current = var42.current
			var110 = sessionId
			
			if if current == nil or current.session ~= var22 then false else var110 == nil or var110 == "" or (if current.sessionId ~= var110 then current.sessionId == nil and current.session.getCasSessionId() == var110 else true) then return end
		end
		if var40 ~= nil then return end
		if var22 == nil then return end
		local var111
		local casSessionId = var22.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var111 = casSessionId
		else
			var110 = var22.universeId
			local placeId_1 = var22.placeId
			var111 = if var110 == nil or placeId_1 == nil then nil else `{var110}:{placeId_1}`
		end
		if var111 == nil then return end
		local function current(p9, p10)
			-- upvalues: var43 (copy), var44 (copy), placeId (copy), var87 (copy), creatorAgentChatModule_1 (copy), var22 (copy), var108 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var107 (copy), var17 (copy), var45 (copy), var86 (copy)
			var43.current += 1
			local current = var43.current
			var44.current = p10
			
			if placeId ~= nil then
				var87(placeId, "Loading")
			end
			local var112 = creatorAgentChatModule_1.createResumedAssistantTurn(var22, p9, function(p11)
				-- upvalues: var108 (copy), current (ref), var22 (copy)
				var108(current, p11, nil, nil, var22)
			end, if p10 ~= nil then nil else p10 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var107(current) else nil, var17)
			var45(var112, var22)
			var112.start()
			var86.scrollToBottomUnconditionally()
		end
		
		if var54.activeTurnState == nil or var54.activeTurnItemIndex == nil or var54.activeTurnState.isDone then
			var44.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var111)
			var110 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var112 = casSessionId ~= nil and (var110 ~= nil and not var110.isDone)
			
			if not var63 and not var112 then return end
			if var112 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var54.activeTurnStartSequenceId
			
			if var44.current == casSessionId and var47 ~= nil then return end
			var110 = creatorAgentChatStore.resumeTurnFromHistory(var111, var54.activeTurnState, var54.activeTurnSequenceIds)
			
			if var110 ~= nil then
				current(var110, casSessionId)
			end
		end
	end, {
		var54, var22, sessionId, creatorAgentChatStore, var63, var47, placeId, var87,
		var108, var86, var45, var40, var107, var17
	})
	local var110 = reactModule.useCallback(function(p9, p10, p11, p12, p13, p14, p15, p16, p17)
		-- upvalues: var36 (ref), var56 (write), fFlagBuildExperiencePersistChatDraftModule (copy), var98 (ref), sessionId (write), fFlagBuildAgentRollbackModule (copy), creatorAgentChatModule_1 (copy), var108 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var107 (write), var17 (write), var87 (ref), var45 (ref), var86 (ref)
		var36({ text = p10, images = p12, afterSequenceId = p14 })
		local var111 = var56
		
		if fFlagBuildExperiencePersistChatDraftModule and p15 ~= nil then
			local var112 = var111
			
			var111 = function(p18)
				-- upvalues: var112 (ref), var98 (copy), p15 (ref), p9 (ref), sessionId (copy)
				if var112 ~= nil then
					var112(p18)
				end
				var98(p15, p9.getCasSessionId() or sessionId)
			end
		end
		if fFlagBuildAgentRollbackModule and p16 ~= nil then
			local var113 = var111
			
			var111 = function(p18)
				-- upvalues: var113 (ref), p16 (ref)
				if var113 ~= nil then
					var113(p18)
				end
				p16()
			end
		end
		local _ = nil
		local var114 = creatorAgentChatModule_1.createLiveAssistantTurn(p9, p11, function(p18)
			-- upvalues: var108 (copy), p13 (ref), p15 (ref), p12 (ref), p9 (ref), p17 (ref)
			var108(p13, p18, p15, p12, p9)
			
			if p17 ~= nil then
				p17()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var107(p13) else nil, var17, var111)
		
		if p9.placeId ~= nil then
			var87(p9.placeId, "Loading")
		end
		var45(var114, p9)
		var86.scrollToBottomAfterSend()
		var114.start()
	end, {
		var108, var87, var86, var45, var36, var107, var17, var56, var98, sessionId
	})
	v = nil
	
	if fFlagBuildAgentRollbackModule then
		local var111 = reactModule.useRef(var54.latestSequenceId)
		var111.current = var54.latestSequenceId
		v = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var22,
			activeTurnHandleRef = var41,
			startRollbackTurn = reactModule.useCallback(function(p9, p10, p11)
				-- upvalues: var22 (ref), var86 (ref), var43 (ref), var38 (ref), buildAgentRollbackPromptModule (copy), var110 (ref), var111 (ref)
				if var22 == nil then
					p11()
					
					return
				end
				var86.captureStickToBottomForSend()
				var43.current += 1
				local current = var43.current
				var38(nil)
				local var112 = buildAgentRollbackPromptModule(p9.versionNumber, p9.noteTitle, p9.noteDescription)
				var110(var22, var112, var112, nil, current, var111.current, nil, function()
					-- upvalues: var86 (copy), p10 (ref)
					var86.scrollToBottomUnconditionally()
					p10()
				end, p11)
			end, { var22, var86, var38, var110 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var81 (ref), var42 (ref), var22 (ref), sessionId (write), var43 (ref), var44 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var87 (ref), var45 (ref), var36 (ref), var38 (ref)
		if var81 ~= nil then
			local current = var42.current
			local var112 = sessionId
			
			if if current == nil or current.session ~= var22 then false else var112 == nil or var112 == "" or (if current.sessionId ~= var112 then current.sessionId == nil and current.session.getCasSessionId() == var112 else true) then return end
			local current = var42.current
			var43.current += 1
			var44.current = nil
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var81) then
				var81.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var87(current.session.placeId, "Idle")
			end
			var45(nil, nil)
			var36(nil)
			var38(nil)
			
			return
		end
	end, {
		var22, sessionId, var81, var45,
		if fFlagBuildAgentRollbackModule then v else nil,
		if fFlagBuildAgentRollbackModule then var87 else nil
	})
	local var112 = reactModule.useCallback(function(p9, p10, p11, p12, p13)
		-- upvalues: var36 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var43 (ref), universeConfigurationModule (copy), var13 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var110 (ref), var45 (ref), var99 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var105 (ref), var73 (ref), var10 (write)
		var36({ text = p9, images = p11, afterSequenceId = p13 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p14)
			-- upvalues: debug (copy), processTime (ref), var43 (copy), p12 (ref), universeConfigurationModule (copy), var13 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var110 (copy), p9 (ref), p10 (ref), p11 (ref), p13 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p14.universeId,
				rootPlaceId = p14.rootPlaceId
			})
			
			if var43.current == p12 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p14.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p14 (ref)
					return universeConfigurationStore.setTeamCreate(p14.universeId, true)
				end):andThen(function()
					-- upvalues: var43 (copy), p12 (copy), p14 (ref), var13 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var110 (copy), p9 (copy), p10 (copy), p11 (copy), p13 (copy)
					if var43.current ~= p12 then
						return nil
					end
					local t = { universeId = p14.universeId, placeId = p14.rootPlaceId }
					var13(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
					var110(creatorAgentChatStore.getSessionForProject(p14.universeId, p14.rootPlaceId, sessionId), p9, p10, p11, p12, p13, p9)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p14)
			-- upvalues: debug (copy), processTime (ref), var43 (copy), p12 (ref), var45 (copy), var36 (copy), var99 (copy), p9 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p11 (ref), var105 (copy), var73 (copy), var10 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p14
			})
			
			if var43.current ~= p12 then return end
			var45(nil)
			var36(nil)
			var99(p9)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p11 ~= nil then
				var105.current(p11)
			end
			var73(var10)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var45, var99, var73,
		var13, var36, var110, var10
	})
	local var113 = reactModule.useCallback(function()
		-- upvalues: var74 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t_1 (write), var99 (ref), var63 (ref), var42 (ref), var22 (ref), sessionId (write), var41 (ref), var84 (ref), var86 (ref), p4 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var21 (ref), var43 (ref), var38 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var97 (ref), var94 (ref), var105 (ref), var112 (ref), var54 (ref), var110 (ref)
		local v
		local replaced = string.gsub(var74.current, "^%s*(.-)%s*$", "%1")
		local var114 = if fFlagBuildExperienceChatImageAttachmentsModule then t_1.current else {}
		
		if replaced == "" and #var114 == 0 then
			var99("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var114 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var63 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var114 > 0 then
				return false
			end
			local current = var42.current
			v = sessionId
			local var115 = if if current == nil or current.session ~= var22 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var41.current else nil
			
			if var115 == nil or not var115.trySubmitComposerText(replaced) then
				return false
			end
			var99("")
			
			if var84.current then
				var84.current.releaseFocus()
			end
			var86.scrollToBottomAfterSend()
			
			return true
		else
			local var116 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var116 and var22 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var21.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var86.captureStickToBottomForSend()
			var43.current += 1
			local current = var43.current
			var38(nil)
			
			if fFlagBuildExperiencePersistChatDraftModule then
				var97(replaced)
			end
			var94("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var105.current({})
			end
			if var84.current then
				var84.current.releaseFocus()
			end
			local function current(p9, p10)
				-- upvalues: var116 (ref), var112 (copy), replaced (ref), current (ref), var54 (copy), var110 (copy), var22 (copy)
				if var116 then
					var112(replaced, p9, p10, current, var54.latestSequenceId)
					
					return
				end
				var110(var22, replaced, p9, p10, current, var54.latestSequenceId, replaced)
			end
			
			if fFlagBuildExperienceChatImageAttachmentsModule and #var114 ~= 0 then
				local t = {}
				
				if replaced ~= "" then
					table.insert(t, { type = "text", text = replaced })
				end
				v = {}
				
				for i, v_1 in var114 do
					local uri = v_1.uri
					table.insert(t, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_1.capture,
						uri = uri
					})
				end
				if var116 then
					var112(replaced, t, v, current, var54.latestSequenceId)
				else
					var110(var22, replaced, t, v, current, var54.latestSequenceId, replaced)
				end
				return true
			elseif var116 then
				var112(replaced, replaced, nil, current, var54.latestSequenceId)
			else
				var110(var22, replaced, replaced, nil, current, var54.latestSequenceId, replaced)
			end
			return true
		end
	end, {
		var22, sessionId, universeId, placeId, var63, var86, var99, var94, var97,
		var112, var110, p4.createUniverseOnFirstPrompt, var38, var54,
		if fFlagBuildAgentRollbackModule then var21 else nil
	})
	local var117 = reactModule.useCallback(function()
		-- upvalues: var42 (ref), var22 (ref), sessionId (write), var41 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var43 (ref), var45 (ref), var44 (ref), var36 (ref), var38 (ref), var54 (ref), placeId (write), var87 (ref)
		local current = var42.current
		local var118 = if if current == nil or current.session ~= var22 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var41.current else nil
		
		if var118 == nil then
			if fFlagBuildAgentRollbackModule then
				v.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var43.current += 1
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var118) then
				var118.stop()
			end
			var45(nil)
			var44.current = nil
			var36(nil)
			var38({
				session = var22,
				sessionId = var22.getCasSessionId(),
				startSequenceId = var54.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var87(placeId, "Idle")
			end
		end
	end, {
		var22, sessionId, placeId, var87, var45, var36, var38, var54,
		if fFlagBuildAgentRollbackModule then v else nil
	})
	local var118 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var119 = if p4.focusComposerWhen == nil then var118 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var118 (ref), var119 (ref), var84 (ref)
		if var118 and var119 then
			local var120 = false
			
			local var121 = function()
				-- upvalues: var120 (write)
				return var120
			end
			
			local var122 = 8
			
			local function tryFocus()
				-- upvalues: var121 (ref), var84 (ref), var122 (write), tryFocus (ref)
				if var121() then return end
				local current = var84.current
				
				if current then
					current.focus()
					
					return
				end
				var122 -= 1
				
				if var122 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var120 (write)
				var120 = true
			end
		end
		return function() end
	end, { var118, var119 })
	local t_2 = {
		messages = messages,
		localToolActions = var50,
		composerText = var70,
		composerErrorText = var72,
		setComposerText = var99,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then t else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var106,
		isAssistantResponding = var63,
		canStopAssistantResponse = u1805,
		canSendWhileResponding = var64,
		sendMessage = var113,
		stopAssistantResponse = var117,
		setScrollingFrame = var86.setScrollingFrame,
		textBoxRef = var84,
		clockBinding = var85,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p9)
			-- upvalues: placeId (write), var16 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var120 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var16 ~= nil) then function()
				-- upvalues: var16 (ref)
				var16.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p9, true, var120) and var120 ~= nil and var16 ~= nil then
				var16.current = false
			end
		end, { placeId, var16 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var34,
		isHistoryExhausted = var60
	}
	local _ = true
	local _ = var47 ~= nil and ((if var47 ~= nil then fFlagBuildAgentRollbackModule else nil) and var62)
	
	return t_2
end