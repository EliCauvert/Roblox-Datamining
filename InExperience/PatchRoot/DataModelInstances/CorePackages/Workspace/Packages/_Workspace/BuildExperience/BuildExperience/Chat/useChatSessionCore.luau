local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
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
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local var1 = if fFlagBuildExperienceChatImageAttachmentsModule then require(buildExperience.utils.uploadCaptureAsync) else nil
local debug = creatorAgentChatModule.debug
local var2 = signalsModule.createSignal(false)
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var3 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
})
local var4 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
})
local var5 = signalsModule.createSignal(nil)
local var6 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

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
			local var7 = if turnFeedbackIds == nil or typeof(turnFeedbackIds) == "function" then nil else turnFeedbackIds.turnId
			turnFeedbackIds = var7 ~= nil and p1.liveTurnIds[var7] == true
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
	local var8 = 8
	
	local function tryFocus()
		-- upvalues: p5 (ref), p4 (ref), var8 (write), tryFocus (ref)
		if p5() then return end
		local current = p4.current
		
		if current then
			current.focus()
			
			return
		end
		var8 -= 1
		
		if var8 > 0 then
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
	-- upvalues: fFlagBuildLocalization (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var6 (ref), signalsModule (ref), signalsReactModule (ref), var3 (ref), var4 (ref), var5 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), var2 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), var1 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var8 = if fFlagBuildLocalization or fFlagBuildExperienceChatImageAttachmentsModule then reactModule.useContext(localizationRoactContext) else nil
	local var9 = if fFlagBuildLocalization then var8:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var10 = if fFlagBuildExperienceChatImageAttachmentsModule then var8:Format(localizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
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
		-- upvalues: var21 (ref), var6 (copy), signalsModule (copy)
		return if var21 == nil then var6 else signalsModule.createComputed(function(p5)
			-- upvalues: var21 (copy)
			return {
				session = var21,
				sessionId = var21.getCasSessionId(),
				events = var21.getMergedHistory(p5)
			}
		end)
	end, { var21 }))
	local var23 = if var22.session == var21 and var22.sessionId == (if var21 ~= nil then nil else var21.getCasSessionId()) then var22.events else {}
	local var24 = sessionId ~= nil and sessionId ~= ""
	local var25 = var24 or (universeId ~= nil and universeId ~= 0)
	local var26 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1
	
	if var26 then
		var26 = var18
		
		if var26 then
			var26 = false
			
			if var21 ~= nil then
				var26 = var25
				
				if var26 then
					var26 = not (var21.hasLoadedHistory() and #var23 > 0)
				end
			end
		end
	end
	local var27 = nil
	local var28 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 then
		local var29, var30 = reactModule.useState(function()
			-- upvalues: var21 (ref), sessionId (write), universeId (write), var18 (ref), var26 (ref)
			return {
				session = var21,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var18,
				isLoading = var26
			}
		end)
		var27 = var29
		var28 = var30
	end
	local var31 = if var27 ~= nil and (var27.session == var21 and (var27.sessionId == sessionId and (var27.universeId == universeId and var27.hydrateHistoryWhen == var18))) then not var27.isLoading else not var26
	local var32 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and (if var31 then var21 ~= nil and var21.getNextHistoryPageToken() ~= nil else not var31)
	local var33, var34 = reactModule.useState(nil)
	local var35, var36 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var36 (ref)
		var36(nil)
	end, { var21, sessionId })
	local var37 = sessionId
	local var38 = if if var35 == nil or var35.session ~= var21 then false else var37 == nil or var37 == "" or (if var35.sessionId ~= var37 then var35.sessionId == nil and var35.session.getCasSessionId() == var37 else true) then var35 else nil
	var78, var76 = reactModule.useState(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useRef(0)
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var39 (ref), var40 (ref), var37 (ref)
		assert(if p5 ~= nil then p6 ~= nil else true, "Active turns require an owning session")
		var39.current = p5
		var40.current = if p5 ~= nil then nil else { session = p6, sessionId = p6.getCasSessionId() }
		var37(p5)
	end, { var37 })
	local current = var40.current
	local var44 = sessionId
	local var45 = if if current == nil or current.session ~= var21 then false else var44 == nil or var44 == "" or (if current.sessionId ~= var44 then current.sessionId == nil and current.session.getCasSessionId() == var44 else true) then var78 else nil
	local var46 = if var45 ~= nil then var3 else var45.getOptimisticLocalTools
	current = if var45 ~= nil then var4 else var45.getLocalToolActions
	var44 = if var45 ~= nil then var5 else var45.getSetupErrorText
	local var47 = signalsReactModule.useSignalState(var46)
	local var48 = signalsReactModule.useSignalState(current)
	local var49 = signalsReactModule.useSignalState(var44)
	local _ = nil
	local var50 = if fFlagBuildLocalization and var49 ~= nil then var8:Format(var49) else var49
	local var51 = reactModule.useMemo(function()
		-- upvalues: var45 (ref), p4 (ref), var21 (ref), var33 (ref), var50 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var45 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p4.createUniverseOnFirstPrompt == true and (var21 == nil and var33 ~= nil))) then nil else { setupErrorText = var50 }
	end, {
		var45,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p4.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var33 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var21 else nil,
		var50
	})
	local var52 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var23 (ref), var21 (ref), sessionId (write), universeId (write), placeId (write), var47 (ref), var33 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var51 (ref), var38 (ref)
		return parseSessionStreamModule(var23, {
			sessionId = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId,
			universeId = if var21 ~= nil then universeId else var21.universeId,
			placeId = if var21 ~= nil then placeId else var21.placeId,
			optimisticLocalTools = var47,
			pendingUserMessage = if var33 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var33.text) then nil else var33.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var33 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var33.text)) then var33.images else nil,
			pendingUserMessageAfterSequenceId = if var33 ~= nil then nil else var33.afterSequenceId,
			liveAssistantMessage = var51,
			optimisticCancelledStartSequenceId = if var38 ~= nil then nil else var38.startSequenceId
		})
	end, {
		var23, var21, sessionId, universeId, placeId, var47, var33, var51, var38
	})
	local var53 = if var19 then reactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = universeId,
		sessionId = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId,
		historyWatermarkSequenceId = var52.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local var54 = if var53 ~= nil then reactModule.useCallback(function(p5)
		-- upvalues: var53 (write)
		if p5 ~= nil then
			var53.current.liveTurnIds[p5] = true
		end
	end, { var53 }) else nil
	local messages = var52.messages
	local var55 = var21 ~= nil and var21.getNextHistoryPageToken() ~= nil
	local var56 = if var21 ~= nil then not var25 or var21.hasLoadedHistory() else true
	local var57 = var31 and (var56 and (if var21 ~= nil then if #messages <= 0 then not var55 else true else true))
	local var58 = var57 and not var55
	local subagentTaskState = var52.subagentTaskState
	local includesPublishTool = var52.includesPublishTool
	local var59 = messages[#messages]
	local var60 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var20 (ref), var2 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var20.getIsPendingForPlaceId(placeId) else var2
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var20 else nil
	}))
	local var61 = if var45 == nil and var59 ~= nil then var59.kind == "assistant_turn" and (not var59.isDone or fFlagBuildAgentRollbackModule and var60) else true
	local var62 = var61 and (not (fFlagBuildAgentRollbackModule and var60) and hasPendingLocalToolResponse(var47))
	local activeTurnState = var52.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var45 (ref), activeTurnState (ref)
		if var45 == nil or activeTurnState == nil then
			return
		end
		var45.syncFromTurnState(activeTurnState)
	end, { var45, activeTurnState })
	
	if var19 then
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), var53 (write), var21 (ref), universeId (write), sessionId (write), var52 (ref), var57 (ref), noteLiveAdUpsellTurns (copy), messages (ref)
			local onAssistantTurnCompleted = p4.onAssistantTurnCompleted
			local var63 = if var21 ~= nil then universeId else var21.universeId or universeId
			local var64 = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId
			local current = var53.current
			local var65 = current
			
			if (if var65.universeId ~= nil then if var63 ~= nil then var65.universeId == var63 else true else true) and (if var65.sessionId ~= nil then if var64 ~= nil then var65.sessionId == var64 else true else true) then
				current.universeId = var63 or current.universeId
				current.sessionId = var64 or current.sessionId
			else
				current = {
					isInitialized = false,
					lastProcessedSequenceId = nil,
					universeId = var63,
					sessionId = var64,
					historyWatermarkSequenceId = var52.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				var53.current = current
			end
			local var66
			if not var57 then
				current.historyWatermarkSequenceId = current.historyWatermarkSequenceId or var52.latestSequenceId
				noteLiveAdUpsellTurns(current, messages)
				
				return
			elseif not current.isInitialized then
				current.isInitialized = true
				noteLiveAdUpsellTurns(current, messages)
				var66 = nil
				
				for i in current.liveTurnStartSequenceIds do
					if var66 == nil or i < var66 then
						var66 = i
					end
				end
				if var66 == nil then
					current.lastProcessedSequenceId = current.historyWatermarkSequenceId or var52.latestSequenceId
				else
					current.lastProcessedSequenceId = var66 - 1
				end
				current.liveTurnIds = {}
				current.liveTurnStartSequenceIds = {}
			end
			if var63 == nil or var63 == 0 then return end
			var66 = current.lastProcessedSequenceId or -1
			
			for i, v in messages do
				local var67 = if v.kind == "assistant_turn" and v.isDone and (v.isOptimisticallyCancelled ~= true and v.turnState ~= nil) then v.endSequenceId or v.startSequenceId else nil
				
				if var67 ~= nil and var67 > var66 then
					if onAssistantTurnCompleted ~= nil then
						onAssistantTurnCompleted({
							universeId = var63,
							sessionId = v.sessionId or var64,
							turnState = v.turnState,
							latestSequenceId = var67
						})
					end
					current.lastProcessedSequenceId = var67
					var66 = var67
				end
			end
		end, {
			p4.onAssistantTurnCompleted, var21, universeId, sessionId, var57, messages,
			var52.latestSequenceId
		})
	end
	reactModule.useEffect(function()
		-- upvalues: var52 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var52.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var52.includesPublishTool, placeId })
	local var68, var69 = reactModule.useBinding("")
	local var70, var71 = reactModule.useState(nil)
	local var72 = reactModule.useRef("")
	local t = {}
	local var73 = nil
	local t_1 = { current = {} }
	local var74 = reactModule.useRef({})
	local var75 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var76, var77 = reactModule.useState({})
		t = var76
		var73 = var77
		t_1 = reactModule.useRef({})
	end
	local v
	local var78 = reactModule.useRef(nil)
	local var79 = reactUtilsModule.useClock()
	local var80 = useChatScrollModule()
	local var81 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var82 = reactModule.useCallback(function(p5)
		-- upvalues: var80 (ref), var21 (ref)
		local var83 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var80.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var21 (copy), var83 (ref), var80 (copy), p5 (ref)
			if var21 == nil then return end
			if var21.loadOlderHistory(var83) and var21.getNextHistoryPageToken() ~= nil and var80.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var80 (copy), var21 (copy), var83 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var80.isViewportUnderfilled() then
						var21.loadOlderHistory(var83)
					end
				end)
			end
		end)
	end, { var21, var80 })
	local var83 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref), var80 (ref), var82 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var21 (copy), var80 (copy), var82 (copy)
			if p5() then return end
			if var21 == nil then return end
			if var21.getNextHistoryPageToken() == nil then return end
			if var80.isViewportUnderfilled() then
				var82(p5)
				
				return
			end
		end)
	end, { var82, var80, var21 })
	local var84 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref), var83 (ref)
		if var21 == nil then return end
		if var21.getNextHistoryPageToken() == nil then
			return
		end
		var83(p5)
	end, { var83, var21 })
	local var85 = reactModule.useRef(var84)
	var85.current = var84
	reactModule.useEffect(function()
		-- upvalues: var80 (ref), var82 (ref)
		var80.setOnScrolledToTop(function()
			-- upvalues: var82 (copy)
			var82(nil)
		end)
		
		return function()
			-- upvalues: var80 (copy)
			var80.setOnScrolledToTop(nil)
		end
	end, { var80.setOnScrolledToTop, var82 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var21 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var28 (write), sessionId (write), universeId (write), var85 (ref), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var14 (ref), placeId (write)
		if var18 and var21 ~= nil then
			local var86 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var28 (copy), var86 (write), var21 (copy), sessionId (copy), universeId (copy), var18 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil and not var86 then
					var28({
						session = var21,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var18,
						isLoading = value
					})
					
					return
				end
			end
			
			local var87 = not (var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
				var28({
					session = var21,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var18,
					isLoading = var87
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var86 (write), sessionId (ref), var21 (copy)
				return if var86 then true elseif sessionId == nil or sessionId == "" then false else var21.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var86 (write), sessionId (ref), var21 (copy), var85 (copy), isHydrateCancelled (ref)
				local var88
				if var86 then
					var88 = true
				elseif sessionId == nil or sessionId == "" then
					var88 = false
				else
					var88 = var21.getCasSessionId() ~= sessionId
					var88 = nil
				end
				if var88 then
					return
				end
				var85.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var21 (copy), var86 (write), sessionId (ref), var85 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var28 (copy), sessionId (copy), universeId (copy), var18 (copy)
				var21.setCasSessionId(p5)
				
				if var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0 then
					local var88
					if var86 then
						var88 = true
					elseif sessionId == nil or sessionId == "" then
						var88 = false
					else
						var88 = var21.getCasSessionId() ~= sessionId
						var88 = nil
					end
					if not var88 then
						var85.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
						if var86 then return end
						var28({
							isLoading = false,
							session = var21,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var18
						})
					end
					return
				elseif var21.refreshSession(isHydrateCancelled) then
					local var89
					if var86 then
						var89 = true
					elseif sessionId == nil or sessionId == "" then
						var89 = false
					else
						var89 = var21.getCasSessionId() ~= sessionId
						var89 = nil
					end
					if not var89 then
						if var86 then
							var89 = true
						elseif sessionId == nil or sessionId == "" then
							var89 = false
						else
							var89 = var21.getCasSessionId() ~= sessionId
							var89 = nil
						end
						if not var89 then
							var85.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
					if var86 then return end
					var28({
						isLoading = false,
						session = var21,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var18
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var21 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var28 (copy), var86 (write), var18 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var14 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
						if var86 then return end
						var28({
							isLoading = false,
							session = var21,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var18
						})
					end
					return
				else
					local var88 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var88.state(false).status == "pending" do
						local var89
						if var86 then
							var89 = true
						elseif sessionId == nil or sessionId == "" then
							var89 = false
						else
							var89 = var21.getCasSessionId() ~= sessionId
							var89 = nil
						end
						if var89 then break end
						task.wait()
					end
					local result
					if var86 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var21.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var88.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
							if var86 then return end
							var28({
								isLoading = false,
								session = var21,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var18
							})
						end
						return
					else
						result = var88.state(false).result
						local var90 = if result ~= nil then nil else result.sessions
						local var91 = if typeof(var90) == "table" then var90[1] else nil
						local var92 = if typeof(var91) == "table" then var91.sessionId else nil
						
						if typeof(var92) == "string" and var92 ~= "" then
							var14({
								universeId = universeId,
								placeId = placeId,
								sessionId = var92
							})
							
							return
						end
						var21.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
							if var86 then return end
							var28({
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
				-- upvalues: var86 (write)
				var86 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var28 ~= nil then
			var28({
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
		-- upvalues: var21 (ref), sessionId (write), var85 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var15 (write), appLifecycleObserverService (copy)
		if var21 == nil then
			return
		end
		local var88 = false
		
		local function refreshKnownSession()
			-- upvalues: var21 (copy), sessionId (copy), var88 (write), var85 (copy)
			local casSessionId = var21.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var21 (copy), var88 (copy), var85 (copy)
				if var21.refreshSession(function()
					-- upvalues: var88 (copy)
					return var88
				end) and not var88 then
					var85.current(function()
						-- upvalues: var88 (copy)
						return var88
					end)
				end
			end)
		end
		
		local var89 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var15 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var15 ~= nil then
				var15.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var88 (write), var89 (ref), onUnhideConnection (ref)
			var88 = true
			var89:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var21, sessionId, var15 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var18 (ref), var80 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var18 then
			var80.lockToBottom()
			
			return
		end
	end, { var18, var21, sessionId, var80 })
	local var88 = reactModule.useCallback(function(p5)
		-- upvalues: var72 (ref), var69 (ref), var71 (ref)
		var72.current = p5
		var69(p5)
		var71(nil)
	end, { var69, var71 })
	
	local function _(p5)
		-- upvalues: t_1 (write), var73 (write)
		t_1.current = p5
		
		if var73 ~= nil then
			var73(p5)
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
		-- upvalues: t_1 (write), var73 (write)
		local current = t_1.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p6 then
				cloned[i] = p7(v)
				t_1.current = cloned
				
				if var73 ~= nil then
					var73(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p8)
		-- upvalues: var75 (ref), var74 (ref), updateComposerImage (ref), var71 (ref), var1 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var10 (ref)
		local var89
		var75.current += 1
		local current = var75.current
		var74.current[p8] = current
		
		for i, v in updateComposerImage(p8, function(p9)
			local cloned = table.clone(p9)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var89 = true
				if not var89 then
					var71(nil)
				end
				var1(p8):andThen(function(p9)
					-- upvalues: var74 (copy), p8 (ref), current (ref), updateComposerImage (copy), var71 (copy)
					if var74.current[p8] ~= current then return end
					local var90
					var74.current[p8] = nil
					
					for i, v in updateComposerImage(p8, function(p10)
						-- upvalues: p9 (ref)
						local cloned = table.clone(p10)
						cloned.uri = `rbxassetid://{p9.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var90 = true
							if not var90 then
								var71(nil)
							end
							return
						end
					end
					var90 = false
				end):catch(function(p10)
					-- upvalues: var74 (copy), p8 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var71 (copy), var10 (copy)
					if var74.current[p8] ~= current then return end
					var74.current[p8] = nil
					updateComposerImage(p8, function(p11)
						-- upvalues: p10 (ref)
						local cloned = table.clone(p11)
						cloned.uri = nil
						cloned.uploadStatus = "failed"
						cloned.uploadError = p10
						
						return cloned
					end)
					
					if fFlagBuildExperienceChatImageAttachmentsModule then
						var71(var10)
					end
				end)
				
				return
			end
		end
		var89 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t_1 (write), var74 (ref), var73 (write), var71 (ref), beginComposerImageUpload (ref)
		local var90
		local current = t_1.current
		local t = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var91 = value[i]
			var90 = var91
			
			if var91.capture ~= nil and var91.uri == nil and var91.uploadStatus == nil then
				for i, v in current do
					if v.capture == var91.capture then
						var90 = v
						break
					end
				end
			end
			if var90.uri ~= nil and var90.uploadStatus == nil then
				var90 = table.clone(var90)
				var90.uploadStatus = "uploaded"
			elseif var90.capture ~= nil and var90.uri == nil and var90.uploadStatus == nil then
				var90 = table.clone(var90)
				var90.uploadStatus = "uploading"
				table.insert(t_2, var90.capture)
			end
			table.insert(t, var90)
		end
		local var92
		for i_1, var90 in current do
			var92 = false
			
			for i_3, v_1 in t do
				if v_1.capture == var90.capture then
					var92 = true
					break
				end
			end
			if not var92 and var90.capture ~= nil then
				var74.current[var90.capture] = nil
			end
		end
		t_1.current = t
		
		if var73 ~= nil then
			var73(t)
		end
		local var93
		for var90, v_1 in t do
			if v_1.uploadStatus == "failed" then
				var93 = true
				if not var93 then
					var71(nil)
				end
				for i_3, var90 in t_2 do
					beginComposerImageUpload(var90)
				end
				return
			end
		end
		var93 = false
	end
	
	local var94 = reactModule.useRef(setComposerImages)
	var94.current = setComposerImages
	
	local function retryComposerImage(p9)
		-- upvalues: t_1 (write), beginComposerImageUpload (ref)
		local var95 = t_1.current[p9]
		
		if var95 == nil or var95.capture == nil or var95.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var95.capture)
	end
	
	local var95 = false
	
	for i, v in t do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var95 = true
			break
		end
	end
	local var96 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p9)
		-- upvalues: var41 (ref), var40 (ref), var21 (ref), sessionId (write), var72 (ref), var88 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var8 (ref), var71 (ref)
		return function(p10, p11)
			-- upvalues: var41 (copy), p9 (ref), var40 (copy), var21 (copy), sessionId (copy), var72 (copy), var88 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var8 (copy), var71 (copy)
			if var41.current == p9 then
				local current = var40.current
				local var97 = sessionId
				
				if not (if current == nil or current.session ~= var21 then false else var97 == nil or var97 == "" or (if current.sessionId ~= var97 then current.sessionId == nil and current.session.getCasSessionId() == var97 else true)) then return end
				if p10 ~= nil and var72.current == "" then
					var88(p10)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p11)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var8:Format(toolResultFailureComposerError)
				end
				var71(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var21,
		sessionId,
		var88,
		var71,
		var8
	}) else nil
	local var97 = reactModule.useCallback(function(p9, p10, p11, p12, p13)
		-- upvalues: var41 (ref), var43 (ref), var42 (ref), var34 (ref), p4 (ref), var81 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var94 (ref), var88 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var8 (ref), var71 (ref), var80 (ref), sessionId (write), var12 (ref)
		if var41.current ~= p9 then return end
		var43(nil)
		var42.current = nil
		var34(nil)
		
		if p10 == nil then
			if p13.placeId ~= nil then
				var81(p13.placeId, "Completed")
			end
			var80.scrollToBottomAfterSend()
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
					-- upvalues: p13 (ref), var41 (copy), p9 (ref)
					p13.refreshSession(function()
						-- upvalues: var41 (copy), p9 (copy)
						return var41.current ~= p9
					end)
				end)
			end
			return
		elseif p4.onPromptFailure ~= nil then
			p4.onPromptFailure(p10.errorCode, p10.outOfCreditsReason)
		end
		if p13.placeId ~= nil then
			var81(p13.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p12 ~= nil then
			var94.current(p12)
		end
		if p11 ~= nil then
			var88(p11)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p10)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var8:Format(promptFailureComposerError)
			end
			var71(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p13 (ref), var41 (copy), p9 (ref)
			p13.refreshSession(function()
				-- upvalues: var41 (copy), p9 (copy)
				return var41.current ~= p9
			end)
		end)
	end, {
		p4.createUniverseOnFirstPrompt, p4.onPromptFailure, p4.onProjectResolved,
		sessionId, var81, var12, var80, var88, var71, var43, var34, var8
	})
	local var98 = reactModule.useRef(var18)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var98 (ref), var61 (ref), var45 (ref), var80 (ref)
		local var99 = var18 and not var98.current
		var98.current = var18
		
		if not var18 then return end
		if var99 or var61 or var45 ~= nil then
			var80.scrollToBottomUnconditionally()
			task.defer(var80.scrollToBottomUnconditionally)
			task.delay(0.15, var80.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var18,
		var61,
		var45,
		#messages,
		var80
	})
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), var40 (ref), var21 (ref), sessionId (write), var38 (ref), var41 (ref), var42 (ref), placeId (write), var81 (ref), creatorAgentChatModule_1 (copy), var97 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var96 (write), var16 (write), var43 (ref), var80 (ref), var52 (ref), var45 (ref), creatorAgentChatStore (ref), var61 (ref)
		local var99
		if var39.current ~= nil then
			local current = var40.current
			var99 = sessionId
			
			if if current == nil or current.session ~= var21 then false else var99 == nil or var99 == "" or (if current.sessionId ~= var99 then current.sessionId == nil and current.session.getCasSessionId() == var99 else true) then return end
		end
		if var38 ~= nil then return end
		if var21 == nil then return end
		local var100
		local casSessionId = var21.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var100 = casSessionId
		else
			var99 = var21.universeId
			local placeId_1 = var21.placeId
			var100 = if var99 == nil or placeId_1 == nil then nil else `{var99}:{placeId_1}`
		end
		if var100 == nil then return end
		local function current(p9, p10)
			-- upvalues: var41 (copy), var42 (copy), placeId (copy), var81 (copy), creatorAgentChatModule_1 (copy), var21 (copy), var97 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var96 (copy), var16 (copy), var43 (copy), var80 (copy)
			var41.current += 1
			local current = var41.current
			var42.current = p10
			
			if placeId ~= nil then
				var81(placeId, "Loading")
			end
			local var101 = creatorAgentChatModule_1.createResumedAssistantTurn(var21, p9, function(p11)
				-- upvalues: var97 (copy), current (ref), var21 (copy)
				var97(current, p11, nil, nil, var21)
			end, if p10 ~= nil then nil else p10 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var96(current) else nil, var16)
			var43(var101, var21)
			var101.start()
			var80.scrollToBottomUnconditionally()
		end
		
		if var52.activeTurnState == nil or var52.activeTurnItemIndex == nil or var52.activeTurnState.isDone then
			var42.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var100)
			var99 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var101 = casSessionId ~= nil and (var99 ~= nil and not var99.isDone)
			
			if not var61 and not var101 then return end
			if var101 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var52.activeTurnStartSequenceId
			
			if var42.current == casSessionId and var45 ~= nil then return end
			var99 = creatorAgentChatStore.resumeTurnFromHistory(var100, var52.activeTurnState, var52.activeTurnSequenceIds)
			
			if var99 ~= nil then
				current(var99, casSessionId)
			end
		end
	end, {
		var52, var21, sessionId, creatorAgentChatStore, var61, var45, placeId, var81,
		var97, var80, var43, var38, var96, var16
	})
	local var99 = reactModule.useCallback(function(p9, p10, p11, p12, p13, p14, p15, p16, p17)
		-- upvalues: var34 (ref), var54 (write), fFlagBuildAgentRollbackModule (copy), creatorAgentChatModule_1 (copy), var97 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var96 (write), var16 (write), var81 (ref), var43 (ref), var80 (ref)
		var34({ text = p10, images = p12, afterSequenceId = p14 })
		local var100 = var54
		
		if fFlagBuildAgentRollbackModule and p16 ~= nil then
			local var101 = var100
			
			var100 = function(p18)
				-- upvalues: var101 (ref), p16 (ref)
				if var101 ~= nil then
					var101(p18)
				end
				p16()
			end
		end
		local _ = nil
		local var102 = creatorAgentChatModule_1.createLiveAssistantTurn(p9, p11, function(p18)
			-- upvalues: var97 (copy), p13 (ref), p15 (ref), p12 (ref), p9 (ref), p17 (ref)
			var97(p13, p18, p15, p12, p9)
			
			if p17 ~= nil then
				p17()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var96(p13) else nil, var16, var100)
		
		if p9.placeId ~= nil then
			var81(p9.placeId, "Loading")
		end
		var43(var102, p9)
		var80.scrollToBottomAfterSend()
		var102.start()
	end, {
		var97, var81, var80, var43, var34, var96, var16, var54
	})
	v = nil
	
	if fFlagBuildAgentRollbackModule then
		local var100 = reactModule.useRef(var52.latestSequenceId)
		var100.current = var52.latestSequenceId
		v = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var21,
			activeTurnHandleRef = var39,
			startRollbackTurn = reactModule.useCallback(function(p9, p10, p11)
				-- upvalues: var21 (ref), var80 (ref), var41 (ref), var36 (ref), buildAgentRollbackPromptModule (copy), var99 (ref), var100 (ref)
				if var21 == nil then
					p11()
					
					return
				end
				var80.captureStickToBottomForSend()
				var41.current += 1
				local current = var41.current
				var36(nil)
				local var101 = buildAgentRollbackPromptModule(p9.versionNumber, p9.noteTitle, p9.noteDescription)
				var99(var21, var101, var101, nil, current, var100.current, nil, function()
					-- upvalues: var80 (copy), p10 (ref)
					var80.scrollToBottomUnconditionally()
					p10()
				end, p11)
			end, { var21, var80, var36, var99 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var78 (ref), var40 (ref), var21 (ref), sessionId (write), var41 (ref), var42 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var81 (ref), var43 (ref), var34 (ref), var36 (ref)
		if var78 ~= nil then
			local current = var40.current
			local var101 = sessionId
			
			if if current == nil or current.session ~= var21 then false else var101 == nil or var101 == "" or (if current.sessionId ~= var101 then current.sessionId == nil and current.session.getCasSessionId() == var101 else true) then return end
			local current = var40.current
			var41.current += 1
			var42.current = nil
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var78) then
				var78.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var81(current.session.placeId, "Idle")
			end
			var43(nil, nil)
			var34(nil)
			var36(nil)
			
			return
		end
	end, {
		var21, sessionId, var78, var43,
		if fFlagBuildAgentRollbackModule then v else nil,
		if fFlagBuildAgentRollbackModule then var81 else nil
	})
	local var101 = reactModule.useCallback(function(p9, p10, p11, p12, p13)
		-- upvalues: var34 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var41 (ref), universeConfigurationModule (copy), var12 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var99 (ref), var43 (ref), var88 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var94 (ref), var71 (ref), var9 (write)
		var34({ text = p9, images = p11, afterSequenceId = p13 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p14)
			-- upvalues: debug (copy), processTime (ref), var41 (copy), p12 (ref), universeConfigurationModule (copy), var12 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var99 (copy), p9 (ref), p10 (ref), p11 (ref), p13 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p14.universeId,
				rootPlaceId = p14.rootPlaceId
			})
			
			if var41.current == p12 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p14.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p14 (ref)
					return universeConfigurationStore.setTeamCreate(p14.universeId, true)
				end):andThen(function()
					-- upvalues: var41 (copy), p12 (copy), p14 (ref), var12 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var99 (copy), p9 (copy), p10 (copy), p11 (copy), p13 (copy)
					if var41.current ~= p12 then
						return nil
					end
					local t = { universeId = p14.universeId, placeId = p14.rootPlaceId }
					var12(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
					var99(creatorAgentChatStore.getSessionForProject(p14.universeId, p14.rootPlaceId, sessionId), p9, p10, p11, p12, p13, p9)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p14)
			-- upvalues: debug (copy), processTime (ref), var41 (copy), p12 (ref), var43 (copy), var34 (copy), var88 (copy), p9 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p11 (ref), var94 (copy), var71 (copy), var9 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p14
			})
			
			if var41.current ~= p12 then return end
			var43(nil)
			var34(nil)
			var88(p9)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p11 ~= nil then
				var94.current(p11)
			end
			var71(var9)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var43, var88, var71,
		var12, var34, var99, var9
	})
	local var102 = reactModule.useCallback(function()
		-- upvalues: var72 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t_1 (write), var88 (ref), var61 (ref), var40 (ref), var21 (ref), sessionId (write), var39 (ref), var78 (ref), var80 (ref), p4 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var20 (ref), var41 (ref), var36 (ref), var94 (ref), var101 (ref), var52 (ref), var99 (ref)
		local v
		local replaced = string.gsub(var72.current, "^%s*(.-)%s*$", "%1")
		local var103 = if fFlagBuildExperienceChatImageAttachmentsModule then t_1.current else {}
		
		if replaced == "" and #var103 == 0 then
			var88("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var103 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var61 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var103 > 0 then
				return false
			end
			local current = var40.current
			v = sessionId
			local var104 = if if current == nil or current.session ~= var21 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var39.current else nil
			
			if var104 == nil or not var104.trySubmitComposerText(replaced) then
				return false
			end
			var88("")
			
			if var78.current then
				var78.current.releaseFocus()
			end
			var80.scrollToBottomAfterSend()
			
			return true
		else
			local var105 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var105 and var21 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var20.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var80.captureStickToBottomForSend()
			var41.current += 1
			local current = var41.current
			var36(nil)
			var88("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var94.current({})
			end
			if var78.current then
				var78.current.releaseFocus()
			end
			local function current(p9, p10)
				-- upvalues: var105 (ref), var101 (copy), replaced (ref), current (ref), var52 (copy), var99 (copy), var21 (copy)
				if var105 then
					var101(replaced, p9, p10, current, var52.latestSequenceId)
					
					return
				end
				var99(var21, replaced, p9, p10, current, var52.latestSequenceId, replaced)
			end
			
			if fFlagBuildExperienceChatImageAttachmentsModule and #var103 ~= 0 then
				local t = {}
				
				if replaced ~= "" then
					table.insert(t, { type = "text", text = replaced })
				end
				v = {}
				
				for i, v_1 in var103 do
					local uri = v_1.uri
					table.insert(t, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_1.capture,
						uri = uri
					})
				end
				if var105 then
					var101(replaced, t, v, current, var52.latestSequenceId)
				else
					var99(var21, replaced, t, v, current, var52.latestSequenceId, replaced)
				end
				return true
			elseif var105 then
				var101(replaced, replaced, nil, current, var52.latestSequenceId)
			else
				var99(var21, replaced, replaced, nil, current, var52.latestSequenceId, replaced)
			end
			return true
		end
	end, {
		var21, sessionId, universeId, placeId, var61, var80, var88, var101, var99,
		p4.createUniverseOnFirstPrompt, var36, var52,
		if fFlagBuildAgentRollbackModule then var20 else nil
	})
	local var106 = reactModule.useCallback(function()
		-- upvalues: var40 (ref), var21 (ref), sessionId (write), var39 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var41 (ref), var43 (ref), var42 (ref), var34 (ref), var36 (ref), var52 (ref), placeId (write), var81 (ref)
		local current = var40.current
		local var107 = if if current == nil or current.session ~= var21 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var39.current else nil
		
		if var107 == nil then
			if fFlagBuildAgentRollbackModule then
				v.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var41.current += 1
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var107) then
				var107.stop()
			end
			var43(nil)
			var42.current = nil
			var34(nil)
			var36({
				session = var21,
				sessionId = var21.getCasSessionId(),
				startSequenceId = var52.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var81(placeId, "Idle")
			end
		end
	end, {
		var21, sessionId, placeId, var81, var43, var34, var36, var52,
		if fFlagBuildAgentRollbackModule then v else nil
	})
	local var107 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var108 = if p4.focusComposerWhen == nil then var107 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var107 (ref), var108 (ref), var78 (ref)
		if var107 and var108 then
			local var109 = false
			
			local var110 = function()
				-- upvalues: var109 (write)
				return var109
			end
			
			local var111 = 8
			
			local function tryFocus()
				-- upvalues: var110 (ref), var78 (ref), var111 (write), tryFocus (ref)
				if var110() then return end
				local current = var78.current
				
				if current then
					current.focus()
					
					return
				end
				var111 -= 1
				
				if var111 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var109 (write)
				var109 = true
			end
		end
		return function() end
	end, { var107, var108 })
	local t_2 = {
		messages = messages,
		localToolActions = var48,
		composerText = var68,
		composerErrorText = var70,
		setComposerText = var88,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then t else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var95,
		isAssistantResponding = var61,
		canStopAssistantResponse = u1681,
		canSendWhileResponding = var62,
		sendMessage = var102,
		stopAssistantResponse = var106,
		setScrollingFrame = var80.setScrollingFrame,
		textBoxRef = var78,
		clockBinding = var79,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p9)
			-- upvalues: placeId (write), var15 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var109 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var15 ~= nil) then function()
				-- upvalues: var15 (ref)
				var15.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p9, true, var109) and var109 ~= nil and var15 ~= nil then
				var15.current = false
			end
		end, { placeId, var15 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var32,
		isHistoryExhausted = var58
	}
	local _ = true
	local _ = var45 ~= nil and ((if var45 ~= nil then fFlagBuildAgentRollbackModule else nil) and var60)
	
	return t_2
end