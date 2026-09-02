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
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var7 (ref), signalsModule (ref), signalsReactModule (ref), var4 (ref), var5 (ref), var6 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), var3 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperiencePersistChatDraftModule (ref), var1 (ref), var2 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var9 = reactModule.useContext(localizationRoactContext)
	local chat_create_universe_error = var9:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR)
	local var10 = if fFlagBuildExperienceChatImageAttachmentsModule then var9:Format(localizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15 = nil
	local var16 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var17 = reactModule.useRef(true)
		var15 = var17
		var16 = reactModule.useCallback(function()
			-- upvalues: var17 (ref)
			return var17.current
		end, { var17 })
	end
	local placeId = p4.placeId
	local universeId = p4.universeId
	local sessionId = p4.sessionId
	
	if var11 ~= nil then
		placeId = var11.placeId
		universeId = var11.universeId
		sessionId = var11.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var13 ~= nil and var13.universeId == universeId) and var13.placeId == placeId then
		sessionId = var13.sessionId
	end
	local var18 = p4.hydrateHistoryWhen == nil or p4.hydrateHistoryWhen
	local var19 = if fFlagBuildAdUpsellModule then reactModule.useRef(p4.trackAdUpsellTurns == true).current else false
	local fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule or var19
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var20 = getAgentRollbackRequestStoreModule()
	local var21 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var21 (ref), sessionId (write)
		if var21 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var21.setCasSessionId(sessionId)
	end, { var21, sessionId })
	local var22 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var21 (ref), var7 (copy), signalsModule (copy)
		return if var21 == nil then var7 else signalsModule.createComputed(function(p5)
			-- upvalues: var21 (copy)
			return {
				session = var21,
				sessionId = var21.getCasSessionId(),
				events = var21.getMergedHistory(p5)
			}
		end)
	end, { var21 }))
	local var23 = if var21 ~= nil then nil else var21.getCasSessionId()
	local var24 = if var22.session == var21 and var22.sessionId == var23 then var22.events else {}
	local var25 = sessionId ~= nil and sessionId ~= ""
	local var26 = var25 or (universeId ~= nil and universeId ~= 0)
	local var27 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	
	if var27 then
		var27 = var18
		
		if var27 then
			var27 = false
			
			if var21 ~= nil then
				var27 = var26
				
				if var27 then
					var27 = not (var21.hasLoadedHistory() and #var24 > 0)
				end
			end
		end
	end
	local var28 = nil
	local var29 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 then
		local var30, var31 = reactModule.useState(function()
			-- upvalues: var21 (ref), sessionId (write), universeId (write), var18 (ref), var27 (ref)
			return {
				session = var21,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var18,
				isLoading = var27
			}
		end)
		var28 = var30
		var29 = var31
	end
	local var32 = if var28 ~= nil and (var28.session == var21 and (var28.sessionId == sessionId and (var28.universeId == universeId and var28.hydrateHistoryWhen == var18))) then not var28.isLoading else not var27
	local var33 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and (if var32 then var21 ~= nil and var21.getNextHistoryPageToken() ~= nil else not var32)
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var37 (ref)
		var37(nil)
	end, { var21, sessionId })
	local var38 = sessionId
	local var39 = if if var36 == nil or var36.session ~= var21 then false else var38 == nil or var38 == "" or (if var36.sessionId ~= var38 then var36.sessionId == nil and var36.session.getCasSessionId() == var38 else true) then var36 else nil
	var81, var79 = reactModule.useState(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useRef(0)
	local var43 = reactModule.useRef(nil)
	local var44 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var40 (ref), var41 (ref), var38 (ref)
		assert(if p5 ~= nil then p6 ~= nil else true, "Active turns require an owning session")
		var40.current = p5
		var41.current = if p5 ~= nil then nil else { session = p6, sessionId = p6.getCasSessionId() }
		var38(p5)
	end, { var38 })
	local current = var41.current
	local var45 = sessionId
	local var46 = if if current == nil or current.session ~= var21 then false else var45 == nil or var45 == "" or (if current.sessionId ~= var45 then current.sessionId == nil and current.session.getCasSessionId() == var45 else true) then var81 else nil
	local var47 = if var46 ~= nil then var4 else var46.getOptimisticLocalTools
	current = if var46 ~= nil then var5 else var46.getLocalToolActions
	var45 = if var46 ~= nil then var6 else var46.getSetupErrorText
	local var48 = signalsReactModule.useSignalState(var47)
	local var49 = signalsReactModule.useSignalState(current)
	local var50 = signalsReactModule.useSignalState(var45)
	local var51 = if var50 ~= nil then var50 else var9:Format(var50)
	local var52 = reactModule.useMemo(function()
		-- upvalues: var46 (ref), p4 (ref), var21 (ref), var34 (ref), var51 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var46 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p4.createUniverseOnFirstPrompt == true and (var21 == nil and var34 ~= nil))) then nil else { setupErrorText = var51 }
	end, {
		var46,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p4.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var34 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var21 else nil,
		var51
	})
	local var53 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var24 (ref), var21 (ref), sessionId (write), universeId (write), placeId (write), var48 (ref), var34 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var52 (ref), var39 (ref)
		return parseSessionStreamModule(var24, {
			sessionId = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId,
			universeId = if var21 ~= nil then universeId else var21.universeId,
			placeId = if var21 ~= nil then placeId else var21.placeId,
			optimisticLocalTools = var48,
			pendingUserMessage = if var34 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var34.text) then nil else var34.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var34 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var34.text)) then var34.images else nil,
			pendingUserMessageAfterSequenceId = if var34 ~= nil then nil else var34.afterSequenceId,
			liveAssistantMessage = var52,
			optimisticCancelledStartSequenceId = if var39 ~= nil then nil else var39.startSequenceId
		})
	end, {
		var24, var21, sessionId, universeId, placeId, var48, var34, var52, var39
	})
	local var54 = if var19 then reactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = universeId,
		sessionId = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId,
		historyWatermarkSequenceId = var53.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local var55 = if var54 ~= nil then reactModule.useCallback(function(p5)
		-- upvalues: var54 (write)
		if p5 ~= nil then
			var54.current.liveTurnIds[p5] = true
		end
	end, { var54 }) else nil
	local messages = var53.messages
	local var56 = var21 ~= nil and var21.getNextHistoryPageToken() ~= nil
	local var57 = if var21 ~= nil then not var26 or var21.hasLoadedHistory() else true
	local var58 = var32 and (var57 and (if var21 ~= nil then if #messages <= 0 then not var56 else true else true))
	local var59 = var58 and not var56
	local subagentTaskState = var53.subagentTaskState
	local includesPublishTool = var53.includesPublishTool
	local var60 = messages[#messages]
	local var61 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var20 (ref), var3 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var20.getIsPendingForPlaceId(placeId) else var3
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var20 else nil
	}))
	local var62 = if var46 == nil and var60 ~= nil then var60.kind == "assistant_turn" and (not var60.isDone or fFlagBuildAgentRollbackModule and var61) else true
	local var63 = var62 and (not (fFlagBuildAgentRollbackModule and var61) and hasPendingLocalToolResponse(var48))
	local activeTurnState = var53.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var46 (ref), activeTurnState (ref)
		if var46 == nil or activeTurnState == nil then
			return
		end
		var46.syncFromTurnState(activeTurnState)
	end, { var46, activeTurnState })
	
	if var19 then
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), var54 (write), var21 (ref), universeId (write), sessionId (write), var53 (ref), var58 (ref), noteLiveAdUpsellTurns (copy), messages (ref)
			local onAssistantTurnCompleted = p4.onAssistantTurnCompleted
			local var64 = if var21 ~= nil then universeId else var21.universeId or universeId
			local var65 = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId
			local current = var54.current
			local var66 = current
			
			if (if var66.universeId ~= nil then if var64 ~= nil then var66.universeId == var64 else true else true) and (if var66.sessionId ~= nil then if var65 ~= nil then var66.sessionId == var65 else true else true) then
				current.universeId = var64 or current.universeId
				current.sessionId = var65 or current.sessionId
			else
				current = {
					isInitialized = false,
					lastProcessedSequenceId = nil,
					universeId = var64,
					sessionId = var65,
					historyWatermarkSequenceId = var53.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				var54.current = current
			end
			local var67
			if not var58 then
				current.historyWatermarkSequenceId = current.historyWatermarkSequenceId or var53.latestSequenceId
				noteLiveAdUpsellTurns(current, messages)
				
				return
			elseif not current.isInitialized then
				current.isInitialized = true
				noteLiveAdUpsellTurns(current, messages)
				var67 = nil
				
				for i in current.liveTurnStartSequenceIds do
					if var67 == nil or i < var67 then
						var67 = i
					end
				end
				if var67 == nil then
					current.lastProcessedSequenceId = current.historyWatermarkSequenceId or var53.latestSequenceId
				else
					current.lastProcessedSequenceId = var67 - 1
				end
				current.liveTurnIds = {}
				current.liveTurnStartSequenceIds = {}
			end
			if var64 == nil or var64 == 0 then return end
			var67 = current.lastProcessedSequenceId or -1
			
			for i, v in messages do
				local var68 = if v.kind == "assistant_turn" and v.isDone and (v.isOptimisticallyCancelled ~= true and v.turnState ~= nil) then v.endSequenceId or v.startSequenceId else nil
				
				if var68 ~= nil and var68 > var67 then
					if onAssistantTurnCompleted ~= nil then
						onAssistantTurnCompleted({
							universeId = var64,
							sessionId = v.sessionId or var65,
							turnState = v.turnState,
							latestSequenceId = var68
						})
					end
					current.lastProcessedSequenceId = var68
					var67 = var68
				end
			end
		end, {
			p4.onAssistantTurnCompleted, var21, universeId, sessionId, var58, messages,
			var53.latestSequenceId
		})
	end
	reactModule.useEffect(function()
		-- upvalues: var53 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var53.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var53.includesPublishTool, placeId })
	local var69, var70 = reactModule.useBinding("")
	local var71, var72 = reactModule.useState(nil)
	local var73 = reactModule.useRef("")
	local var74 = reactModule.useRef("")
	local var75 = reactModule.useRef(nil)
	local var76 = reactModule.useRef(var23)
	local var77 = reactModule.useRef(nil)
	var76.current = var23
	local t = {}
	local var78 = nil
	local t_1 = { current = {} }
	local var79 = reactModule.useRef({})
	local var80 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var81, var82 = reactModule.useState({})
		t = var81
		var78 = var82
		t_1 = reactModule.useRef({})
	end
	local v
	local var83 = reactModule.useRef(nil)
	local var84 = reactUtilsModule.useClock()
	local var85 = useChatScrollModule()
	local var86 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var87 = reactModule.useCallback(function(p5)
		-- upvalues: var85 (ref), var21 (ref)
		local var88 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var85.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var21 (copy), var88 (ref), var85 (copy), p5 (ref)
			if var21 == nil then return end
			if var21.loadOlderHistory(var88) and var21.getNextHistoryPageToken() ~= nil and var85.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var85 (copy), var21 (copy), var88 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var85.isViewportUnderfilled() then
						var21.loadOlderHistory(var88)
					end
				end)
			end
		end)
	end, { var21, var85 })
	local var88 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref), var85 (ref), var87 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var21 (copy), var85 (copy), var87 (copy)
			if p5() then return end
			if var21 == nil then return end
			if var21.getNextHistoryPageToken() == nil then return end
			if var85.isViewportUnderfilled() then
				var87(p5)
				
				return
			end
		end)
	end, { var87, var85, var21 })
	local var89 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref), var88 (ref)
		if var21 == nil then return end
		if var21.getNextHistoryPageToken() == nil then
			return
		end
		var88(p5)
	end, { var88, var21 })
	local var90 = reactModule.useRef(var89)
	var90.current = var89
	reactModule.useEffect(function()
		-- upvalues: var85 (ref), var87 (ref)
		var85.setOnScrolledToTop(function()
			-- upvalues: var87 (copy)
			var87(nil)
		end)
		
		return function()
			-- upvalues: var85 (copy)
			var85.setOnScrolledToTop(nil)
		end
	end, { var85.setOnScrolledToTop, var87 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var21 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var29 (write), sessionId (write), universeId (write), var90 (ref), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var14 (ref), placeId (write)
		if var18 and var21 ~= nil then
			local var91 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var29 (copy), var91 (write), var21 (copy), sessionId (copy), universeId (copy), var18 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil and not var91 then
					var29({
						session = var21,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var18,
						isLoading = value
					})
					
					return
				end
			end
			
			local var92 = not (var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
				var29({
					session = var21,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var18,
					isLoading = var92
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var91 (write), sessionId (ref), var21 (copy)
				return if var91 then true elseif sessionId == nil or sessionId == "" then false else var21.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var91 (write), sessionId (ref), var21 (copy), var90 (copy), isHydrateCancelled (ref)
				local var93
				if var91 then
					var93 = true
				elseif sessionId == nil or sessionId == "" then
					var93 = false
				else
					var93 = var21.getCasSessionId() ~= sessionId
					var93 = nil
				end
				if var93 then
					return
				end
				var90.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var21 (copy), var91 (write), sessionId (ref), var90 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var29 (copy), sessionId (copy), universeId (copy), var18 (copy)
				var21.setCasSessionId(p5)
				
				if var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0 then
					local var93
					if var91 then
						var93 = true
					elseif sessionId == nil or sessionId == "" then
						var93 = false
					else
						var93 = var21.getCasSessionId() ~= sessionId
						var93 = nil
					end
					if not var93 then
						var90.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
						if var91 then return end
						var29({
							isLoading = false,
							session = var21,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var18
						})
					end
					return
				elseif var21.refreshSession(isHydrateCancelled) then
					local var94
					if var91 then
						var94 = true
					elseif sessionId == nil or sessionId == "" then
						var94 = false
					else
						var94 = var21.getCasSessionId() ~= sessionId
						var94 = nil
					end
					if not var94 then
						if var91 then
							var94 = true
						elseif sessionId == nil or sessionId == "" then
							var94 = false
						else
							var94 = var21.getCasSessionId() ~= sessionId
							var94 = nil
						end
						if not var94 then
							var90.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
					if var91 then return end
					var29({
						isLoading = false,
						session = var21,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var18
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var21 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var29 (copy), var91 (write), var18 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var14 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
						if var91 then return end
						var29({
							isLoading = false,
							session = var21,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var18
						})
					end
					return
				else
					local var93 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var93.state(false).status == "pending" do
						local var94
						if var91 then
							var94 = true
						elseif sessionId == nil or sessionId == "" then
							var94 = false
						else
							var94 = var21.getCasSessionId() ~= sessionId
							var94 = nil
						end
						if var94 then break end
						task.wait()
					end
					local result
					if var91 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var21.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var93.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
							if var91 then return end
							var29({
								isLoading = false,
								session = var21,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var18
							})
						end
						return
					else
						result = var93.state(false).result
						local var95 = if result ~= nil then nil else result.sessions
						local var96 = if typeof(var95) == "table" then var95[1] else nil
						local var97 = if typeof(var96) == "table" then var96.sessionId else nil
						
						if typeof(var97) == "string" and var97 ~= "" then
							var14({
								universeId = universeId,
								placeId = placeId,
								sessionId = var97
							})
							
							return
						end
						var21.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
							if var91 then return end
							var29({
								isLoading = false,
								session = var21,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var18
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var91 (write)
				var91 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
			var29({
				isLoading = false,
				session = var21,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var18
			})
		end
	end, {
		var21, sessionId, universeId, placeId, creatorAgentChatStore, var18,
		fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	})
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), sessionId (write), var90 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var15 (write), appLifecycleObserverService (copy)
		if var21 == nil then
			return
		end
		local var93 = false
		
		local function refreshKnownSession()
			-- upvalues: var21 (copy), sessionId (copy), var93 (write), var90 (copy)
			local casSessionId = var21.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var21 (copy), var93 (copy), var90 (copy)
				if var21.refreshSession(function()
					-- upvalues: var93 (copy)
					return var93
				end) and not var93 then
					var90.current(function()
						-- upvalues: var93 (copy)
						return var93
					end)
				end
			end)
		end
		
		local var94 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var15 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var15 ~= nil then
				var15.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var93 (write), var94 (ref), onUnhideConnection (ref)
			var93 = true
			var94:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var21, sessionId, var15 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var18 (ref), var85 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var18 then
			var85.lockToBottom()
			
			return
		end
	end, { var18, var21, sessionId, var85 })
	local var93 = reactModule.useCallback(function(p5)
		-- upvalues: var73 (ref), var70 (ref), var72 (ref)
		var73.current = p5
		var70(p5)
		var72(nil)
	end, { var70, var72 })
	local var94 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var75 (ref)
		if var75.current ~= nil then
			task.cancel(var75.current)
			var75.current = nil
		end
	end, {}) else nil
	local var95 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var74 (ref), var94 (ref), var76 (ref), var75 (ref), var1 (copy)
		var74.current = p5
		var94()
		local current = var76.current
		
		if current == nil or current == "" then
			return
		end
		var75.current = task.delay(0.5, function()
			-- upvalues: var75 (copy), var1 (copy), current (ref), p5 (ref)
			var75.current = nil
			var1.setChatDraft(current, p5)
		end)
	end, { var94 }) else nil
	local var96 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var76 (ref), var74 (ref), var94 (ref), var1 (copy)
		local current = var76.current
		
		if current == nil or current == "" then
			return
		end
		var74.current = p5
		var94()
		var1.setChatDraft(current, p5)
	end, { var94 }) else nil
	local var97 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5, p6)
		-- upvalues: var74 (ref), var94 (ref), var1 (copy)
		if p6 == nil or p6 == "" or var74.current ~= p5 then
			return
		end
		var74.current = ""
		var94()
		var1.setChatDraft(p6, "")
	end, { var94 }) else nil
	local var98 = reactModule.useCallback(function(p5)
		-- upvalues: var93 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var95 (ref)
		var93(p5)
		
		if fFlagBuildExperiencePersistChatDraftModule then
			var95(p5)
		end
	end, { var93, var95 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperiencePersistChatDraftModule (copy), var23 (ref), var77 (ref), var94 (ref), var73 (ref), var74 (ref), var1 (copy), var93 (ref), var75 (ref)
		if not fFlagBuildExperiencePersistChatDraftModule then return end
		if var23 == nil or var23 == "" then return end
		local current = var77.current
		var77.current = var23
		var94()
		
		if current == nil and var73.current ~= "" then
			var74.current = var73.current
			var1.setChatDraft(var23, var73.current)
		else
			local var99 = var1.getChatDraft(var23) or ""
			var74.current = var99
			var93(var99)
		end
		return function()
			-- upvalues: var75 (copy), var94 (copy), var1 (copy), var23 (copy), var74 (copy)
			local var100 = var75.current ~= nil
			var94()
			
			if var100 then
				var1.setChatDraft(var23, var74.current)
			end
		end
	end, { var23, var94, var93 })
	
	local function _(p5)
		-- upvalues: t_1 (write), var78 (write)
		t_1.current = p5
		
		if var78 ~= nil then
			var78(p5)
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
		-- upvalues: t_1 (write), var78 (write)
		local current = t_1.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p6 then
				cloned[i] = p7(v)
				t_1.current = cloned
				
				if var78 ~= nil then
					var78(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p8)
		-- upvalues: var80 (ref), var79 (ref), updateComposerImage (ref), var72 (ref), var2 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var10 (ref)
		local var99
		var80.current += 1
		local current = var80.current
		var79.current[p8] = current
		
		for i, v in updateComposerImage(p8, function(p9)
			local cloned = table.clone(p9)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var99 = true
				if not var99 then
					var72(nil)
				end
				var2(p8):andThen(function(p9)
					-- upvalues: var79 (copy), p8 (ref), current (ref), updateComposerImage (copy), var72 (copy)
					if var79.current[p8] ~= current then return end
					local var100
					var79.current[p8] = nil
					
					for i, v in updateComposerImage(p8, function(p10)
						-- upvalues: p9 (ref)
						local cloned = table.clone(p10)
						cloned.uri = `rbxassetid://{p9.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var100 = true
							if not var100 then
								var72(nil)
							end
							return
						end
					end
					var100 = false
				end):catch(function(p10)
					-- upvalues: var79 (copy), p8 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var72 (copy), var10 (copy)
					if var79.current[p8] ~= current then return end
					var79.current[p8] = nil
					updateComposerImage(p8, function(p11)
						-- upvalues: p10 (ref)
						local cloned = table.clone(p11)
						cloned.uri = nil
						cloned.uploadStatus = "failed"
						cloned.uploadError = p10
						
						return cloned
					end)
					
					if fFlagBuildExperienceChatImageAttachmentsModule then
						var72(var10)
					end
				end)
				
				return
			end
		end
		var99 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t_1 (write), var79 (ref), var78 (write), var72 (ref), beginComposerImageUpload (ref)
		local var100
		local current = t_1.current
		local t = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var101 = value[i]
			var100 = var101
			
			if var101.capture ~= nil and var101.uri == nil and var101.uploadStatus == nil then
				for i, v in current do
					if v.capture == var101.capture then
						var100 = v
						break
					end
				end
			end
			if var100.uri ~= nil and var100.uploadStatus == nil then
				var100 = table.clone(var100)
				var100.uploadStatus = "uploaded"
			elseif var100.capture ~= nil and var100.uri == nil and var100.uploadStatus == nil then
				var100 = table.clone(var100)
				var100.uploadStatus = "uploading"
				table.insert(t_2, var100.capture)
			end
			table.insert(t, var100)
		end
		local var102
		for i_1, var100 in current do
			var102 = false
			
			for i_3, v_1 in t do
				if v_1.capture == var100.capture then
					var102 = true
					break
				end
			end
			if not var102 and var100.capture ~= nil then
				var79.current[var100.capture] = nil
			end
		end
		t_1.current = t
		
		if var78 ~= nil then
			var78(t)
		end
		local var103
		for var100, v_1 in t do
			if v_1.uploadStatus == "failed" then
				var103 = true
				if not var103 then
					var72(nil)
				end
				for i_3, var100 in t_2 do
					beginComposerImageUpload(var100)
				end
				return
			end
		end
		var103 = false
	end
	
	local var104 = reactModule.useRef(setComposerImages)
	var104.current = setComposerImages
	
	local function retryComposerImage(p9)
		-- upvalues: t_1 (write), beginComposerImageUpload (ref)
		local var105 = t_1.current[p9]
		
		if var105 == nil or var105.capture == nil or var105.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var105.capture)
	end
	
	local var105 = false
	
	for i, v in t do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var105 = true
			break
		end
	end
	local var106 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p9)
		-- upvalues: var42 (ref), var41 (ref), var21 (ref), sessionId (write), var73 (ref), var98 (ref), creatorAgentChatModule_1 (copy), var9 (ref), var72 (ref)
		return function(p10, p11)
			-- upvalues: var42 (copy), p9 (ref), var41 (copy), var21 (copy), sessionId (copy), var73 (copy), var98 (copy), creatorAgentChatModule_1 (copy), var9 (copy), var72 (copy)
			if var42.current == p9 then
				local current = var41.current
				local var107 = sessionId
				
				if not (if current == nil or current.session ~= var21 then false else var107 == nil or var107 == "" or (if current.sessionId ~= var107 then current.sessionId == nil and current.session.getCasSessionId() == var107 else true)) then return end
				if p10 ~= nil and var73.current == "" then
					var98(p10)
				end
				var72(var9:Format(creatorAgentChatModule_1.getToolResultFailureComposerError(p11)))
				
				return
			end
		end
	end, {
		var21,
		sessionId,
		var98,
		var72,
		var9
	}) else nil
	local var107 = reactModule.useCallback(function(p9, p10, p11, p12, p13)
		-- upvalues: var42 (ref), var44 (ref), var43 (ref), var35 (ref), p4 (ref), var86 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var104 (ref), var98 (ref), creatorAgentChatModule_1 (copy), var9 (ref), var72 (ref), var85 (ref), sessionId (write), var12 (ref)
		if var42.current ~= p9 then return end
		var44(nil)
		var43.current = nil
		var35(nil)
		
		if p10 == nil then
			if p13.placeId ~= nil then
				var86(p13.placeId, "Completed")
			end
			var85.scrollToBottomAfterSend()
			local casSessionId = p13.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p4.createUniverseOnFirstPrompt and sessionId == nil and p13.universeId ~= nil then
					local t = {
						universeId = p13.universeId,
						placeId = p13.placeId,
						sessionId = casSessionId
					}
					var12(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p13 (ref), var42 (copy), p9 (ref)
					p13.refreshSession(function()
						-- upvalues: var42 (copy), p9 (copy)
						return var42.current ~= p9
					end)
				end)
			end
			return
		elseif p4.onPromptFailure ~= nil then
			p4.onPromptFailure(p10.errorCode, p10.outOfCreditsReason)
		end
		if p13.placeId ~= nil then
			var86(p13.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p12 ~= nil then
			var104.current(p12)
		end
		if p11 ~= nil then
			var98(p11)
			var72(var9:Format(creatorAgentChatModule_1.getPromptFailureComposerError(p10)))
		end
		task.spawn(function()
			-- upvalues: p13 (ref), var42 (copy), p9 (ref)
			p13.refreshSession(function()
				-- upvalues: var42 (copy), p9 (copy)
				return var42.current ~= p9
			end)
		end)
	end, {
		p4.createUniverseOnFirstPrompt, p4.onPromptFailure, p4.onProjectResolved,
		sessionId, var86, var12, var85, var98, var72, var44, var35, var9
	})
	local var108 = reactModule.useRef(var18)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var108 (ref), var62 (ref), var46 (ref), var85 (ref)
		local var109 = var18 and not var108.current
		var108.current = var18
		
		if not var18 then return end
		if var109 or var62 or var46 ~= nil then
			var85.scrollToBottomUnconditionally()
			task.defer(var85.scrollToBottomUnconditionally)
			task.delay(0.15, var85.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var18,
		var62,
		var46,
		#messages,
		var85
	})
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var41 (ref), var21 (ref), sessionId (write), var39 (ref), var42 (ref), var43 (ref), placeId (write), var86 (ref), creatorAgentChatModule_1 (copy), var107 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var106 (write), var16 (write), var44 (ref), var85 (ref), var53 (ref), var46 (ref), creatorAgentChatStore (ref), var62 (ref)
		local var109
		if var40.current ~= nil then
			local current = var41.current
			var109 = sessionId
			
			if if current == nil or current.session ~= var21 then false else var109 == nil or var109 == "" or (if current.sessionId ~= var109 then current.sessionId == nil and current.session.getCasSessionId() == var109 else true) then return end
		end
		if var39 ~= nil then return end
		if var21 == nil then return end
		local var110
		local casSessionId = var21.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var110 = casSessionId
		else
			var109 = var21.universeId
			local placeId_1 = var21.placeId
			var110 = if var109 == nil or placeId_1 == nil then nil else `{var109}:{placeId_1}`
		end
		if var110 == nil then return end
		local function current(p9, p10)
			-- upvalues: var42 (copy), var43 (copy), placeId (copy), var86 (copy), creatorAgentChatModule_1 (copy), var21 (copy), var107 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var106 (copy), var16 (copy), var44 (copy), var85 (copy)
			var42.current += 1
			local current = var42.current
			var43.current = p10
			
			if placeId ~= nil then
				var86(placeId, "Loading")
			end
			local var111 = creatorAgentChatModule_1.createResumedAssistantTurn(var21, p9, function(p11)
				-- upvalues: var107 (copy), current (ref), var21 (copy)
				var107(current, p11, nil, nil, var21)
			end, if p10 ~= nil then nil else p10 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var106(current) else nil, var16)
			var44(var111, var21)
			var111.start()
			var85.scrollToBottomUnconditionally()
		end
		
		if var53.activeTurnState == nil or var53.activeTurnItemIndex == nil or var53.activeTurnState.isDone then
			var43.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var110)
			var109 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var111 = casSessionId ~= nil and (var109 ~= nil and not var109.isDone)
			
			if not var62 and not var111 then return end
			if var111 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var53.activeTurnStartSequenceId
			
			if var43.current == casSessionId and var46 ~= nil then return end
			var109 = creatorAgentChatStore.resumeTurnFromHistory(var110, var53.activeTurnState, var53.activeTurnSequenceIds)
			
			if var109 ~= nil then
				current(var109, casSessionId)
			end
		end
	end, {
		var53, var21, sessionId, creatorAgentChatStore, var62, var46, placeId, var86,
		var107, var85, var44, var39, var106, var16
	})
	local var109 = reactModule.useCallback(function(p9, p10, p11, p12, p13, p14, p15, p16, p17)
		-- upvalues: var35 (ref), var55 (write), fFlagBuildExperiencePersistChatDraftModule (copy), var97 (ref), sessionId (write), fFlagBuildAgentRollbackModule (copy), creatorAgentChatModule_1 (copy), var107 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var106 (write), var16 (write), var86 (ref), var44 (ref), var85 (ref)
		var35({ text = p10, images = p12, afterSequenceId = p14 })
		local var110 = var55
		
		if fFlagBuildExperiencePersistChatDraftModule and p15 ~= nil then
			local var111 = var110
			
			var110 = function(p18)
				-- upvalues: var111 (ref), var97 (copy), p15 (ref), p9 (ref), sessionId (copy)
				if var111 ~= nil then
					var111(p18)
				end
				var97(p15, p9.getCasSessionId() or sessionId)
			end
		end
		if fFlagBuildAgentRollbackModule and p16 ~= nil then
			local var112 = var110
			
			var110 = function(p18)
				-- upvalues: var112 (ref), p16 (ref)
				if var112 ~= nil then
					var112(p18)
				end
				p16()
			end
		end
		local _ = nil
		local var113 = creatorAgentChatModule_1.createLiveAssistantTurn(p9, p11, function(p18)
			-- upvalues: var107 (copy), p13 (ref), p15 (ref), p12 (ref), p9 (ref), p17 (ref)
			var107(p13, p18, p15, p12, p9)
			
			if p17 ~= nil then
				p17()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var106(p13) else nil, var16, var110)
		
		if p9.placeId ~= nil then
			var86(p9.placeId, "Loading")
		end
		var44(var113, p9)
		var85.scrollToBottomAfterSend()
		var113.start()
	end, {
		var107, var86, var85, var44, var35, var106, var16, var55, var97, sessionId
	})
	v = nil
	
	if fFlagBuildAgentRollbackModule then
		local var110 = reactModule.useRef(var53.latestSequenceId)
		var110.current = var53.latestSequenceId
		v = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var21,
			activeTurnHandleRef = var40,
			startRollbackTurn = reactModule.useCallback(function(p9, p10, p11)
				-- upvalues: var21 (ref), var85 (ref), var42 (ref), var37 (ref), buildAgentRollbackPromptModule (copy), var109 (ref), var110 (ref)
				if var21 == nil then
					p11()
					
					return
				end
				var85.captureStickToBottomForSend()
				var42.current += 1
				local current = var42.current
				var37(nil)
				local var111 = buildAgentRollbackPromptModule(p9.versionNumber, p9.noteTitle, p9.noteDescription)
				var109(var21, var111, var111, nil, current, var110.current, nil, function()
					-- upvalues: var85 (copy), p10 (ref)
					var85.scrollToBottomUnconditionally()
					p10()
				end, p11)
			end, { var21, var85, var37, var109 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var81 (ref), var41 (ref), var21 (ref), sessionId (write), var42 (ref), var43 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var86 (ref), var44 (ref), var35 (ref), var37 (ref)
		if var81 ~= nil then
			local current = var41.current
			local var111 = sessionId
			
			if if current == nil or current.session ~= var21 then false else var111 == nil or var111 == "" or (if current.sessionId ~= var111 then current.sessionId == nil and current.session.getCasSessionId() == var111 else true) then return end
			local current = var41.current
			var42.current += 1
			var43.current = nil
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var81) then
				var81.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var86(current.session.placeId, "Idle")
			end
			var44(nil, nil)
			var35(nil)
			var37(nil)
			
			return
		end
	end, {
		var21, sessionId, var81, var44,
		if fFlagBuildAgentRollbackModule then v else nil,
		if fFlagBuildAgentRollbackModule then var86 else nil
	})
	local var111 = reactModule.useCallback(function(p9, p10, p11, p12, p13)
		-- upvalues: var35 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var42 (ref), universeConfigurationModule (copy), var12 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var109 (ref), var44 (ref), var98 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var104 (ref), var72 (ref), chat_create_universe_error (ref)
		var35({ text = p9, images = p11, afterSequenceId = p13 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p14)
			-- upvalues: debug (copy), processTime (ref), var42 (copy), p12 (ref), universeConfigurationModule (copy), var12 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var109 (copy), p9 (ref), p10 (ref), p11 (ref), p13 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p14.universeId,
				rootPlaceId = p14.rootPlaceId
			})
			
			if var42.current == p12 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p14.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p14 (ref)
					return universeConfigurationStore.setTeamCreate(p14.universeId, true)
				end):andThen(function()
					-- upvalues: var42 (copy), p12 (copy), p14 (ref), var12 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var109 (copy), p9 (copy), p10 (copy), p11 (copy), p13 (copy)
					if var42.current ~= p12 then
						return nil
					end
					local t = { universeId = p14.universeId, placeId = p14.rootPlaceId }
					var12(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
					var109(creatorAgentChatStore.getSessionForProject(p14.universeId, p14.rootPlaceId, sessionId), p9, p10, p11, p12, p13, p9)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p14)
			-- upvalues: debug (copy), processTime (ref), var42 (copy), p12 (ref), var44 (copy), var35 (copy), var98 (copy), p9 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p11 (ref), var104 (copy), var72 (copy), chat_create_universe_error (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p14
			})
			
			if var42.current ~= p12 then return end
			var44(nil)
			var35(nil)
			var98(p9)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p11 ~= nil then
				var104.current(p11)
			end
			var72(chat_create_universe_error)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var44, var98, var72,
		var12, var35, var109, chat_create_universe_error
	})
	local var112 = reactModule.useCallback(function()
		-- upvalues: var73 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t_1 (write), var98 (ref), var62 (ref), var41 (ref), var21 (ref), sessionId (write), var40 (ref), var83 (ref), var85 (ref), p4 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var20 (ref), var42 (ref), var37 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var96 (ref), var93 (ref), var104 (ref), var111 (ref), var53 (ref), var109 (ref)
		local v
		local replaced = string.gsub(var73.current, "^%s*(.-)%s*$", "%1")
		local var113 = if fFlagBuildExperienceChatImageAttachmentsModule then t_1.current else {}
		
		if replaced == "" and #var113 == 0 then
			var98("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var113 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var62 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var113 > 0 then
				return false
			end
			local current = var41.current
			v = sessionId
			local var114 = if if current == nil or current.session ~= var21 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var40.current else nil
			
			if var114 == nil or not var114.trySubmitComposerText(replaced) then
				return false
			end
			var98("")
			
			if var83.current then
				var83.current.releaseFocus()
			end
			var85.scrollToBottomAfterSend()
			
			return true
		else
			local var115 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var115 and var21 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var20.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var85.captureStickToBottomForSend()
			var42.current += 1
			local current = var42.current
			var37(nil)
			
			if fFlagBuildExperiencePersistChatDraftModule then
				var96(replaced)
			end
			var93("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var104.current({})
			end
			if var83.current then
				var83.current.releaseFocus()
			end
			local function current(p9, p10)
				-- upvalues: var115 (ref), var111 (copy), replaced (ref), current (ref), var53 (copy), var109 (copy), var21 (copy)
				if var115 then
					var111(replaced, p9, p10, current, var53.latestSequenceId)
					
					return
				end
				var109(var21, replaced, p9, p10, current, var53.latestSequenceId, replaced)
			end
			
			if fFlagBuildExperienceChatImageAttachmentsModule and #var113 ~= 0 then
				local t = {}
				
				if replaced ~= "" then
					table.insert(t, { type = "text", text = replaced })
				end
				v = {}
				
				for i, v_1 in var113 do
					local uri = v_1.uri
					table.insert(t, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_1.capture,
						uri = uri
					})
				end
				if var115 then
					var111(replaced, t, v, current, var53.latestSequenceId)
				else
					var109(var21, replaced, t, v, current, var53.latestSequenceId, replaced)
				end
				return true
			elseif var115 then
				var111(replaced, replaced, nil, current, var53.latestSequenceId)
			else
				var109(var21, replaced, replaced, nil, current, var53.latestSequenceId, replaced)
			end
			return true
		end
	end, {
		var21, sessionId, universeId, placeId, var62, var85, var98, var93, var96,
		var111, var109, p4.createUniverseOnFirstPrompt, var37, var53,
		if fFlagBuildAgentRollbackModule then var20 else nil
	})
	local var116 = reactModule.useCallback(function()
		-- upvalues: var41 (ref), var21 (ref), sessionId (write), var40 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var42 (ref), var44 (ref), var43 (ref), var35 (ref), var37 (ref), var53 (ref), placeId (write), var86 (ref)
		local current = var41.current
		local var117 = if if current == nil or current.session ~= var21 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var40.current else nil
		
		if var117 == nil then
			if fFlagBuildAgentRollbackModule then
				v.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var42.current += 1
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var117) then
				var117.stop()
			end
			var44(nil)
			var43.current = nil
			var35(nil)
			var37({
				session = var21,
				sessionId = var21.getCasSessionId(),
				startSequenceId = var53.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var86(placeId, "Idle")
			end
		end
	end, {
		var21, sessionId, placeId, var86, var44, var35, var37, var53,
		if fFlagBuildAgentRollbackModule then v else nil
	})
	local var117 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var118 = if p4.focusComposerWhen == nil then var117 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var117 (ref), var118 (ref), var83 (ref)
		if var117 and var118 then
			local var119 = false
			
			local var120 = function()
				-- upvalues: var119 (write)
				return var119
			end
			
			local var121 = 8
			
			local function tryFocus()
				-- upvalues: var120 (ref), var83 (ref), var121 (write), tryFocus (ref)
				if var120() then return end
				local current = var83.current
				
				if current then
					current.focus()
					
					return
				end
				var121 -= 1
				
				if var121 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var119 (write)
				var119 = true
			end
		end
		return function() end
	end, { var117, var118 })
	local t_2 = {
		messages = messages,
		localToolActions = var49,
		composerText = var69,
		composerErrorText = var71,
		setComposerText = var98,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then t else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var105,
		isAssistantResponding = var62,
		canStopAssistantResponse = u1791,
		canSendWhileResponding = var63,
		sendMessage = var112,
		stopAssistantResponse = var116,
		setScrollingFrame = var85.setScrollingFrame,
		textBoxRef = var83,
		clockBinding = var84,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p9)
			-- upvalues: placeId (write), var15 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var119 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var15 ~= nil) then function()
				-- upvalues: var15 (ref)
				var15.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p9, true, var119) and var119 ~= nil and var15 ~= nil then
				var15.current = false
			end
		end, { placeId, var15 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var33,
		isHistoryExhausted = var59
	}
	local _ = true
	local _ = var46 ~= nil and ((if var46 ~= nil then fFlagBuildAgentRollbackModule else nil) and var61)
	
	return t_2
end