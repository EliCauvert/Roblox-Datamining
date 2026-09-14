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
local fFlagBuildExperienceChatHistoryPrefetchModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)
local fFlagBuildExperienceFixChatBottomLockModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatBottomLock)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local fFlagBuildExperienceAssetLibrary = sharedFlagsModule.FFlagBuildExperienceAssetLibrary
local _ = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)
local selectedInstanceReminderModule = require(script.Parent.selectedInstanceReminder)
local sessionPromptMessageFilterModule = require(script.Parent.sessionPromptMessageFilter)
local useAgentRollbackRequestModule = require(script.Parent.useAgentRollbackRequest)
local useChatScrollModule = require(script.Parent.useChatScroll)
local buildAgentRollbackPromptModule = require(buildExperience.utils.buildAgentRollbackPrompt)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local _ = require(parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
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

local function appendReferenceReminder(a, b)
	-- upvalues: selectedInstanceReminderModule (ref)
	if #b == 0 then
		return a
	end
	local var9 = if typeof(a) == "string" then if a == "" then {} else { { type = "text", text = a } } else table.clone(a)
	table.insert(var9, {
		type = "text",
		text = selectedInstanceReminderModule.encodeReferences(b)
	})
	
	return var9
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
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), fFlagBuildAdUpsellModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var7 (ref), signalsModule (ref), signalsReactModule (ref), var4 (ref), var5 (ref), var6 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), fFlagBuildExperienceAssetLibrary (ref), var3 (ref), hasPendingLocalToolResponse (ref), noteLiveAdUpsellTurns (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperiencePersistChatDraftModule (ref), var1 (ref), var2 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), appendReferenceReminder (ref), launchPlaytestWithLoadingStateModule (ref)
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
	var85, var83 = reactModule.useState(nil)
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
	local var46 = if if current == nil or current.session ~= var21 then false else var45 == nil or var45 == "" or (if current.sessionId ~= var45 then current.sessionId == nil and current.session.getCasSessionId() == var45 else true) then var85 else nil
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
		-- upvalues: parseSessionStreamModule (copy), var24 (ref), var21 (ref), sessionId (write), universeId (write), placeId (write), var48 (ref), var34 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), fFlagBuildExperienceAssetLibrary (copy), var52 (ref), var39 (ref)
		return parseSessionStreamModule(var24, {
			sessionId = if var21 ~= nil then sessionId else var21.getCasSessionId() or sessionId,
			universeId = if var21 ~= nil then universeId else var21.universeId,
			placeId = if var21 ~= nil then placeId else var21.placeId,
			optimisticLocalTools = var48,
			pendingUserMessage = if var34 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var34.text) then nil else var34.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var34 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var34.text)) then var34.images else nil,
			pendingUserReferences = if fFlagBuildExperienceAssetLibrary and var34 ~= nil then var34.references else nil,
			includeSelectedInstanceReferences = fFlagBuildExperienceAssetLibrary,
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
	local var83, var84 = reactModule.useState({})
	local var85 = reactModule.useRef({})
	local var86 = reactModule.useRef(nil)
	local var87 = reactUtilsModule.useClock()
	local var88 = useChatScrollModule()
	local var89 = reactModule.useCallback(function(p5, p6)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p5, p6)
	end, {})
	local var90 = reactModule.useCallback(function(p5)
		-- upvalues: var88 (ref), var21 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
		local var91 = function()
			-- upvalues: p5 (ref)
			return if p5 == nil then false else p5()
		end
		
		var88.captureDistanceFromBottom()
		
		if var21 == nil then return end
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var21.requestOlderHistoryWhile(var91, function()
				-- upvalues: var88 (copy)
				return var88.isNearTopRef.current
			end)
			
			return
		end
		task.spawn(function()
			-- upvalues: var21 (copy), var91 (ref), var88 (copy), p5 (ref)
			if var21.loadOlderHistory(var91) and var21.getNextHistoryPageToken() ~= nil and var88.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p5 (copy), var88 (copy), var21 (copy), var91 (copy)
					if if p5 ~= nil then false else p5() then return end
					if var88.isViewportUnderfilled() then
						var21.loadOlderHistory(var91)
					end
				end)
			end
		end)
	end, { var21, var88 })
	local var91 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var88 (ref), var90 (ref)
		task.delay(0.1, function()
			-- upvalues: p5 (ref), var21 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var88 (copy), var90 (copy)
			if p5() then return end
			if var21 == nil then return end
			if var21.getNextHistoryPageToken() == nil then return end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				if var88.isNearTopRef.current then
					var90(p5)
					
					return
				else
					return
				end
			elseif var88.isViewportUnderfilled() then
			else
			end
		end)
	end, { var90, var88, var21 })
	local var92 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref), var91 (ref)
		if var21 == nil then return end
		if var21.getNextHistoryPageToken() == nil then
			return
		end
		var91(p5)
	end, { var91, var21 })
	local var93 = reactModule.useRef(var92)
	var93.current = var92
	reactModule.useEffect(function()
		-- upvalues: var88 (ref), var90 (ref)
		var88.setOnScrolledToTop(function()
			-- upvalues: var90 (copy)
			var90(nil)
		end)
		
		return function()
			-- upvalues: var88 (copy)
			var88.setOnScrolledToTop(nil)
		end
	end, { var88.setOnScrolledToTop, var90 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var21 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (ref), var29 (write), sessionId (write), universeId (write), var93 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var14 (ref), placeId (write)
		if var18 and var21 ~= nil then
			local var94 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var29 (copy), var94 (write), var21 (copy), sessionId (copy), universeId (copy), var18 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil and not var94 then
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
			
			local var95 = not (var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
				var29({
					session = var21,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var18,
					isLoading = var95
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var94 (write), sessionId (ref), var21 (copy)
				return if var94 then true elseif sessionId == nil or sessionId == "" then false else var21.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var94 (write), sessionId (ref), var21 (copy), var93 (copy), isHydrateCancelled (ref)
				local var96
				if var94 then
					var96 = true
				elseif sessionId == nil or sessionId == "" then
					var96 = false
				else
					var96 = var21.getCasSessionId() ~= sessionId
					var96 = nil
				end
				if var96 then
					return
				end
				var93.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p5)
				-- upvalues: var21 (copy), var94 (write), sessionId (ref), var93 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var29 (copy), sessionId (copy), universeId (copy), var18 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy)
				var21.setCasSessionId(p5)
				
				if var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0 then
					local var96
					if var94 then
						var96 = true
					elseif sessionId == nil or sessionId == "" then
						var96 = false
					else
						var96 = var21.getCasSessionId() ~= sessionId
						var96 = nil
					end
					if not var96 then
						var93.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
						if var94 then return end
						var29({
							isLoading = false,
							session = var21,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var18
						})
					end
					return
				elseif if fFlagBuildExperienceChatHistoryPrefetchModule then var21.refreshSession(isHydrateCancelled, true) else var21.refreshSession(isHydrateCancelled) then
					local var97
					if var94 then
						var97 = true
					elseif sessionId == nil or sessionId == "" then
						var97 = false
					else
						var97 = var21.getCasSessionId() ~= sessionId
						var97 = nil
					end
					if not var97 then
						if var94 then
							var97 = true
						elseif sessionId == nil or sessionId == "" then
							var97 = false
						else
							var97 = var21.getCasSessionId() ~= sessionId
							var97 = nil
						end
						if not var97 then
							var93.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
					if var94 then return end
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
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var21 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 (copy), var29 (copy), var94 (write), var18 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var14 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var21.hasLoadedHistory() and #var21.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
						if var94 then return end
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
					local var96 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var96.state(false).status == "pending" do
						local var97
						if var94 then
							var97 = true
						elseif sessionId == nil or sessionId == "" then
							var97 = false
						else
							var97 = var21.getCasSessionId() ~= sessionId
							var97 = nil
						end
						if var97 then break end
						task.wait()
					end
					local result
					if var94 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var21.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var96.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
							if var94 then return end
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
						result = var96.state(false).result
						local var98 = if result ~= nil then nil else result.sessions
						local var99 = if typeof(var98) == "table" then var98[1] else nil
						local var100 = if typeof(var99) == "table" then var99.sessionId else nil
						
						if typeof(var100) == "string" and var100 ~= "" then
							var14({
								universeId = universeId,
								placeId = placeId,
								sessionId = var100
							})
							
							return
						end
						var21.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule_1 and var29 ~= nil then
							if var94 then return end
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
				-- upvalues: var94 (write)
				var94 = true
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
		-- upvalues: var21 (ref), sessionId (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var93 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var15 (write), appLifecycleObserverService (copy)
		if var21 == nil then
			return
		end
		local var96 = false
		
		local function refreshKnownSession()
			-- upvalues: var21 (copy), sessionId (copy), var96 (write), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var93 (copy)
			local casSessionId = var21.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var96 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var21 (copy), var93 (copy)
				local function isRefreshCancelled()
					-- upvalues: var96 (copy)
					return var96
				end
				
				if (if fFlagBuildExperienceChatHistoryPrefetchModule then var21.refreshSession(isRefreshCancelled, true) else var21.refreshSession(isRefreshCancelled)) and not var96 then
					var93.current(function()
						-- upvalues: var96 (copy)
						return var96
					end)
				end
			end)
		end
		
		local var97 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var15 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var15 ~= nil then
				var15.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var96 (write), var97 (ref), onUnhideConnection (ref)
			var96 = true
			var97:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var21, sessionId, var15 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var18 (ref), var88 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var18 then
			var88.lockToBottom()
			
			return
		end
	end, { var18, var21, sessionId, var88 })
	local var96 = reactModule.useCallback(function(p5)
		-- upvalues: var73 (ref), var70 (ref), var72 (ref)
		var73.current = p5
		var70(p5)
		var72(nil)
	end, { var70, var72 })
	local var97 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function()
		-- upvalues: var75 (ref)
		if var75.current ~= nil then
			task.cancel(var75.current)
			var75.current = nil
		end
	end, {}) else nil
	local var98 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var74 (ref), var97 (ref), var76 (ref), var75 (ref), var1 (copy)
		var74.current = p5
		var97()
		local current = var76.current
		
		if current == nil or current == "" then
			return
		end
		var75.current = task.delay(0.5, function()
			-- upvalues: var75 (copy), var1 (copy), current (ref), p5 (ref)
			var75.current = nil
			var1.setChatDraft(current, p5)
		end)
	end, { var97 }) else nil
	local var99 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5)
		-- upvalues: var76 (ref), var74 (ref), var97 (ref), var1 (copy)
		local current = var76.current
		
		if current == nil or current == "" then
			return
		end
		var74.current = p5
		var97()
		var1.setChatDraft(current, p5)
	end, { var97 }) else nil
	local var100 = if fFlagBuildExperiencePersistChatDraftModule then reactModule.useCallback(function(p5, p6)
		-- upvalues: var74 (ref), var97 (ref), var1 (copy)
		if p6 == nil or p6 == "" or var74.current ~= p5 then
			return
		end
		var74.current = ""
		var97()
		var1.setChatDraft(p6, "")
	end, { var97 }) else nil
	local var101 = reactModule.useCallback(function(p5)
		-- upvalues: var96 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var98 (ref)
		var96(p5)
		
		if fFlagBuildExperiencePersistChatDraftModule then
			var98(p5)
		end
	end, { var96, var98 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperiencePersistChatDraftModule (copy), var23 (ref), var77 (ref), var97 (ref), var73 (ref), var74 (ref), var1 (copy), var96 (ref), var75 (ref)
		if not fFlagBuildExperiencePersistChatDraftModule then return end
		if var23 == nil or var23 == "" then return end
		local current = var77.current
		var77.current = var23
		var97()
		
		if current == nil and var73.current ~= "" then
			var74.current = var73.current
			var1.setChatDraft(var23, var73.current)
		else
			local var102 = var1.getChatDraft(var23) or ""
			var74.current = var102
			var96(var102)
		end
		return function()
			-- upvalues: var75 (copy), var97 (copy), var1 (copy), var23 (copy), var74 (copy)
			local var103 = var75.current ~= nil
			var97()
			
			if var103 then
				var1.setChatDraft(var23, var74.current)
			end
		end
	end, { var23, var97, var96 })
	
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
		local var102
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
				var102 = true
				if not var102 then
					var72(nil)
				end
				var2(p8):andThen(function(p9)
					-- upvalues: var79 (copy), p8 (ref), current (ref), updateComposerImage (copy), var72 (copy)
					if var79.current[p8] ~= current then return end
					local var103
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
							var103 = true
							if not var103 then
								var72(nil)
							end
							return
						end
					end
					var103 = false
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
		var102 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t_1 (write), var79 (ref), var78 (write), var72 (ref), beginComposerImageUpload (ref)
		local var103
		local current = t_1.current
		local t = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var104 = value[i]
			var103 = var104
			
			if var104.capture ~= nil and var104.uri == nil and var104.uploadStatus == nil then
				for i, v in current do
					if v.capture == var104.capture then
						var103 = v
						break
					end
				end
			end
			if var103.uri ~= nil and var103.uploadStatus == nil then
				var103 = table.clone(var103)
				var103.uploadStatus = "uploaded"
			elseif var103.capture ~= nil and var103.uri == nil and var103.uploadStatus == nil then
				var103 = table.clone(var103)
				var103.uploadStatus = "uploading"
				table.insert(t_2, var103.capture)
			end
			table.insert(t, var103)
		end
		local var105
		for i_1, var103 in current do
			var105 = false
			
			for i_3, v_1 in t do
				if v_1.capture == var103.capture then
					var105 = true
					break
				end
			end
			if not var105 and var103.capture ~= nil then
				var79.current[var103.capture] = nil
			end
		end
		t_1.current = t
		
		if var78 ~= nil then
			var78(t)
		end
		local var106
		for var103, v_1 in t do
			if v_1.uploadStatus == "failed" then
				var106 = true
				if not var106 then
					var72(nil)
				end
				for i_3, var103 in t_2 do
					beginComposerImageUpload(var103)
				end
				return
			end
		end
		var106 = false
	end
	
	local var107 = reactModule.useRef(setComposerImages)
	var107.current = setComposerImages
	
	local function retryComposerImage(p9)
		-- upvalues: t_1 (write), beginComposerImageUpload (ref)
		local var108 = t_1.current[p9]
		
		if var108 == nil or var108.capture == nil or var108.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var108.capture)
	end
	
	local var108 = reactModule.useCallback(function(p9)
		-- upvalues: var85 (ref), var84 (ref), var72 (ref)
		var85.current = p9
		var84(p9)
		var72(nil)
	end, { var72 })
	local var109 = reactModule.useCallback(function(p9)
		-- upvalues: var85 (ref), var108 (ref)
		for i, v in var85.current do
			if v.path == p9.path then
				return false
			end
		end
		local cloned = table.clone(var85.current)
		table.insert(cloned, p9)
		var108(cloned)
		
		return true
	end, { var108 })
	local var110 = reactModule.useCallback(function(p10)
		-- upvalues: var85 (ref), var108 (ref)
		local cloned = table.clone(var85.current)
		table.remove(cloned, p10)
		var108(cloned)
	end, { var108 })
	local var111 = reactModule.useCallback(function(p10)
		-- upvalues: var85 (ref), var108 (ref)
		for i, v in var85.current do
			if v.path == p10 then
				local cloned = table.clone(var85.current)
				table.remove(cloned, i)
				var108(cloned)
				
				return true
			end
		end
		return false
	end, { var108 })
	local var112 = false
	
	for i, v in t do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var112 = true
			break
		end
	end
	local var113 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p11)
		-- upvalues: var42 (ref), var41 (ref), var21 (ref), sessionId (write), var73 (ref), var101 (ref), creatorAgentChatModule_1 (copy), var9 (ref), var72 (ref)
		return function(p12, p13)
			-- upvalues: var42 (copy), p11 (ref), var41 (copy), var21 (copy), sessionId (copy), var73 (copy), var101 (copy), creatorAgentChatModule_1 (copy), var9 (copy), var72 (copy)
			if var42.current == p11 then
				local current = var41.current
				local var114 = sessionId
				
				if not (if current == nil or current.session ~= var21 then false else var114 == nil or var114 == "" or (if current.sessionId ~= var114 then current.sessionId == nil and current.session.getCasSessionId() == var114 else true)) then return end
				if p12 ~= nil and var73.current == "" then
					var101(p12)
				end
				var72(var9:Format(creatorAgentChatModule_1.getToolResultFailureComposerError(p13)))
				
				return
			end
		end
	end, {
		var21,
		sessionId,
		var101,
		var72,
		var9
	}) else nil
	local var114 = reactModule.useCallback(function(p11, p12, p13, p14, p15, p16)
		-- upvalues: var42 (ref), var44 (ref), var43 (ref), var35 (ref), p4 (ref), var89 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var107 (ref), fFlagBuildExperienceAssetLibrary (copy), var108 (ref), var101 (ref), creatorAgentChatModule_1 (copy), var9 (ref), var72 (ref), var88 (ref), sessionId (write), var12 (ref)
		if var42.current ~= p11 then return end
		var44(nil)
		var43.current = nil
		var35(nil)
		
		if p12 == nil then
			if p16.placeId ~= nil then
				var89(p16.placeId, "Completed")
			end
			var88.scrollToBottomAfterSend()
			local casSessionId = p16.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p4.createUniverseOnFirstPrompt and sessionId == nil and p16.universeId ~= nil then
					local t = {
						universeId = p16.universeId,
						placeId = p16.placeId,
						sessionId = casSessionId
					}
					var12(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p16 (ref), var42 (copy), p11 (ref)
					p16.refreshSession(function()
						-- upvalues: var42 (copy), p11 (copy)
						return var42.current ~= p11
					end)
				end)
			end
			return
		elseif p4.onPromptFailure ~= nil then
			p4.onPromptFailure(p12.errorCode, p12.outOfCreditsReason)
		end
		if p16.placeId ~= nil then
			var89(p16.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p14 ~= nil then
			var107.current(p14)
		end
		if fFlagBuildExperienceAssetLibrary and p15 ~= nil then
			var108(p15)
		end
		if p13 ~= nil then
			var101(p13)
			var72(var9:Format(creatorAgentChatModule_1.getPromptFailureComposerError(p12)))
		end
		task.spawn(function()
			-- upvalues: p16 (ref), var42 (copy), p11 (ref)
			p16.refreshSession(function()
				-- upvalues: var42 (copy), p11 (copy)
				return var42.current ~= p11
			end)
		end)
	end, {
		p4.createUniverseOnFirstPrompt, p4.onPromptFailure, p4.onProjectResolved,
		sessionId, var89, var12, var88, var101, var108, var72, var44, var35, var9
	})
	local var115 = reactModule.useRef(var18)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var115 (ref), var62 (ref), var46 (ref), var88 (ref)
		local var116 = var18 and not var115.current
		var115.current = var18
		
		if not var18 then return end
		if var116 or var62 or var46 ~= nil then
			var88.scrollToBottomUnconditionally()
			task.defer(var88.scrollToBottomUnconditionally)
			task.delay(0.15, var88.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var18,
		var62,
		var46,
		#messages,
		var88
	})
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var41 (ref), var21 (ref), sessionId (write), var39 (ref), var42 (ref), var43 (ref), placeId (write), var89 (ref), creatorAgentChatModule_1 (copy), var114 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var113 (write), var16 (write), var44 (ref), var88 (ref), var53 (ref), var46 (ref), creatorAgentChatStore (ref), var62 (ref)
		local var116
		if var40.current ~= nil then
			local current = var41.current
			var116 = sessionId
			
			if if current == nil or current.session ~= var21 then false else var116 == nil or var116 == "" or (if current.sessionId ~= var116 then current.sessionId == nil and current.session.getCasSessionId() == var116 else true) then return end
		end
		if var39 ~= nil then return end
		if var21 == nil then return end
		local var117
		local casSessionId = var21.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var117 = casSessionId
		else
			var116 = var21.universeId
			local placeId_1 = var21.placeId
			var117 = if var116 == nil or placeId_1 == nil then nil else `{var116}:{placeId_1}`
		end
		if var117 == nil then return end
		local function current(p11, p12)
			-- upvalues: var42 (copy), var43 (copy), placeId (copy), var89 (copy), creatorAgentChatModule_1 (copy), var21 (copy), var114 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var113 (copy), var16 (copy), var44 (copy), var88 (copy)
			var42.current += 1
			local current = var42.current
			var43.current = p12
			
			if placeId ~= nil then
				var89(placeId, "Loading")
			end
			local var118 = creatorAgentChatModule_1.createResumedAssistantTurn(var21, p11, function(p13)
				-- upvalues: var114 (copy), current (ref), var21 (copy)
				var114(current, p13, nil, nil, nil, var21)
			end, if p12 ~= nil then nil else p12 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var113(current) else nil, var16)
			var44(var118, var21)
			var118.start()
			var88.scrollToBottomUnconditionally()
		end
		
		if var53.activeTurnState == nil or var53.activeTurnItemIndex == nil or var53.activeTurnState.isDone then
			var43.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var117)
			var116 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var118 = casSessionId ~= nil and (var116 ~= nil and not var116.isDone)
			
			if not var62 and not var118 then return end
			if var118 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var53.activeTurnStartSequenceId
			
			if var43.current == casSessionId and var46 ~= nil then return end
			var116 = creatorAgentChatStore.resumeTurnFromHistory(var117, var53.activeTurnState, var53.activeTurnSequenceIds)
			
			if var116 ~= nil then
				current(var116, casSessionId)
			end
		end
	end, {
		var53, var21, sessionId, creatorAgentChatStore, var62, var46, placeId, var89,
		var114, var88, var44, var39, var113, var16
	})
	local var116 = reactModule.useCallback(function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20)
		-- upvalues: var35 (ref), var55 (write), fFlagBuildExperiencePersistChatDraftModule (copy), var100 (ref), sessionId (write), fFlagBuildAgentRollbackModule (copy), creatorAgentChatModule_1 (copy), var114 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var113 (write), var16 (write), var89 (ref), var44 (ref), var88 (ref)
		var35({
			text = p12,
			images = p14,
			references = p15,
			afterSequenceId = p17
		})
		local var117 = var55
		
		if fFlagBuildExperiencePersistChatDraftModule and p18 ~= nil then
			local var118 = var117
			
			var117 = function(p21)
				-- upvalues: var118 (ref), var100 (copy), p18 (ref), p11 (ref), sessionId (copy)
				if var118 ~= nil then
					var118(p21)
				end
				var100(p18, p11.getCasSessionId() or sessionId)
			end
		end
		if fFlagBuildAgentRollbackModule and p19 ~= nil then
			local var119 = var117
			
			var117 = function(p21)
				-- upvalues: var119 (ref), p19 (ref)
				if var119 ~= nil then
					var119(p21)
				end
				p19()
			end
		end
		local _ = nil
		local var120 = creatorAgentChatModule_1.createLiveAssistantTurn(p11, p13, function(p21)
			-- upvalues: var114 (copy), p16 (ref), p18 (ref), p14 (ref), p15 (ref), p11 (ref), p20 (ref)
			var114(p16, p21, p18, p14, p15, p11)
			
			if p20 ~= nil then
				p20()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var113(p16) else nil, var16, var117)
		
		if p11.placeId ~= nil then
			var89(p11.placeId, "Loading")
		end
		var44(var120, p11)
		var88.scrollToBottomAfterSend()
		var120.start()
	end, {
		var114, var89, var88, var44, var35, var113, var16, var55, var100, sessionId
	})
	v = nil
	
	if fFlagBuildAgentRollbackModule then
		local var117 = reactModule.useRef(var53.latestSequenceId)
		var117.current = var53.latestSequenceId
		v = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var21,
			activeTurnHandleRef = var40,
			startRollbackTurn = reactModule.useCallback(function(p11, p12, p13)
				-- upvalues: var21 (ref), var88 (ref), var42 (ref), var37 (ref), buildAgentRollbackPromptModule (copy), var116 (ref), var117 (ref)
				if var21 == nil then
					p13()
					
					return
				end
				var88.captureStickToBottomForSend()
				var42.current += 1
				local current = var42.current
				var37(nil)
				local var118 = buildAgentRollbackPromptModule(p11.versionNumber, p11.noteTitle, p11.noteDescription)
				var116(var21, var118, var118, nil, {}, current, var117.current, nil, function()
					-- upvalues: var88 (copy), p12 (ref)
					var88.scrollToBottomUnconditionally()
					p12()
				end, p13)
			end, { var21, var88, var37, var116 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var85 (ref), var41 (ref), var21 (ref), sessionId (write), var42 (ref), var43 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var89 (ref), var44 (ref), var35 (ref), var37 (ref)
		if var85 ~= nil then
			local current = var41.current
			local var118 = sessionId
			
			if if current == nil or current.session ~= var21 then false else var118 == nil or var118 == "" or (if current.sessionId ~= var118 then current.sessionId == nil and current.session.getCasSessionId() == var118 else true) then return end
			local current = var41.current
			var42.current += 1
			var43.current = nil
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var85) then
				var85.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var89(current.session.placeId, "Idle")
			end
			var44(nil, nil)
			var35(nil)
			var37(nil)
			
			return
		end
	end, {
		var21, sessionId, var85, var44,
		if fFlagBuildAgentRollbackModule then v else nil,
		if fFlagBuildAgentRollbackModule then var89 else nil
	})
	local var118 = reactModule.useCallback(function(p11, p12, p13, p14, p15, p16)
		-- upvalues: var35 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var42 (ref), universeConfigurationModule (copy), var12 (ref), p4 (ref), creatorAgentChatStore (ref), sessionId (write), var116 (ref), var44 (ref), var101 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var107 (ref), fFlagBuildExperienceAssetLibrary (copy), var108 (ref), var72 (ref), chat_create_universe_error (ref)
		var35({
			text = p11,
			images = p13,
			references = p14,
			afterSequenceId = p16
		})
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p17)
			-- upvalues: debug (copy), processTime (ref), var42 (copy), p15 (ref), universeConfigurationModule (copy), var12 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var116 (copy), p11 (ref), p12 (ref), p13 (ref), p14 (ref), p16 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p17.universeId,
				rootPlaceId = p17.rootPlaceId
			})
			
			if var42.current == p15 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p17.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p17 (ref)
					return universeConfigurationStore.setTeamCreate(p17.universeId, true)
				end):andThen(function()
					-- upvalues: var42 (copy), p15 (copy), p17 (ref), var12 (copy), p4 (copy), creatorAgentChatStore (copy), sessionId (copy), var116 (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p16 (copy)
					if var42.current ~= p15 then
						return nil
					end
					local t = { universeId = p17.universeId, placeId = p17.rootPlaceId }
					var12(t)
					
					if p4.onProjectResolved ~= nil then
						p4.onProjectResolved(t)
					end
					var116(creatorAgentChatStore.getSessionForProject(p17.universeId, p17.rootPlaceId, sessionId), p11, p12, p13, p14, p15, p16, p11)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p17)
			-- upvalues: debug (copy), processTime (ref), var42 (copy), p15 (ref), var44 (copy), var35 (copy), var101 (copy), p11 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p13 (ref), var107 (copy), fFlagBuildExperienceAssetLibrary (copy), var108 (copy), p14 (ref), var72 (copy), chat_create_universe_error (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p17
			})
			
			if var42.current ~= p15 then return end
			var44(nil)
			var35(nil)
			var101(p11)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p13 ~= nil then
				var107.current(p13)
			end
			if fFlagBuildExperienceAssetLibrary then
				var108(p14)
			end
			var72(chat_create_universe_error)
		end)
	end, {
		sessionId, creatorAgentChatStore, p4.onProjectResolved, var44, var101, var108,
		var72, var12, var35, var116, chat_create_universe_error
	})
	local var119 = reactModule.useCallback(function()
		-- upvalues: var73 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t_1 (write), fFlagBuildExperienceAssetLibrary (copy), var85 (ref), var101 (ref), var62 (ref), var41 (ref), var21 (ref), sessionId (write), var40 (ref), var86 (ref), var88 (ref), p4 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var20 (ref), var42 (ref), var37 (ref), fFlagBuildExperiencePersistChatDraftModule (copy), var99 (ref), var96 (ref), var107 (ref), var108 (ref), appendReferenceReminder (copy), var118 (ref), var53 (ref), var116 (ref)
		local v
		local replaced = string.gsub(var73.current, "^%s*(.-)%s*$", "%1")
		local var120 = if fFlagBuildExperienceChatImageAttachmentsModule then t_1.current else {}
		local var121 = if fFlagBuildExperienceAssetLibrary then var85.current else {}
		
		if replaced == "" and #var120 == 0 and #var121 == 0 then
			var101("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var120 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var62 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var120 > 0 or #var121 > 0 then
				return false
			end
			local current = var41.current
			v = sessionId
			local var122 = if if current == nil or current.session ~= var21 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var40.current else nil
			
			if var122 == nil or not var122.trySubmitComposerText(replaced) then
				return false
			end
			var101("")
			
			if var86.current then
				var86.current.releaseFocus()
			end
			var88.scrollToBottomAfterSend()
			
			return true
		else
			local var123 = p4.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var123 and var21 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var20.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var88.captureStickToBottomForSend()
			var42.current += 1
			local current = var42.current
			var37(nil)
			
			if fFlagBuildExperiencePersistChatDraftModule then
				var99(replaced)
			end
			var96("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var107.current({})
			end
			if fFlagBuildExperienceAssetLibrary then
				var108({})
			end
			if var86.current then
				var86.current.releaseFocus()
			end
			local function current(p11, p12)
				-- upvalues: appendReferenceReminder (copy), var121 (ref), var123 (ref), var118 (copy), replaced (ref), current (ref), var53 (copy), var116 (copy), var21 (copy)
				local var124 = appendReferenceReminder(p11, var121)
				
				if var123 then
					var118(replaced, var124, p12, var121, current, var53.latestSequenceId)
					
					return
				end
				var116(var21, replaced, var124, p12, var121, current, var53.latestSequenceId, replaced)
			end
			
			if fFlagBuildExperienceChatImageAttachmentsModule and #var120 ~= 0 then
				local t = {}
				
				if replaced ~= "" then
					table.insert(t, { type = "text", text = replaced })
				end
				v = {}
				
				for i, v_1 in var120 do
					local uri = v_1.uri
					table.insert(t, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_1.capture,
						uri = uri
					})
				end
				local var124 = appendReferenceReminder(t, var121)
				
				if var123 then
					var118(replaced, var124, v, var121, current, var53.latestSequenceId)
				else
					var116(var21, replaced, var124, v, var121, current, var53.latestSequenceId, replaced)
				end
				return true
			else
				local var125 = appendReferenceReminder(replaced, var121)
				
				if var123 then
					var118(replaced, var125, nil, var121, current, var53.latestSequenceId)
				else
					var116(var21, replaced, var125, nil, var121, current, var53.latestSequenceId, replaced)
				end
				return true
			end
		end
	end, {
		var21, sessionId, universeId, placeId, var62, var88, var101, var108, var96,
		var99, var118, var116, p4.createUniverseOnFirstPrompt, var37, var53,
		if fFlagBuildAgentRollbackModule then var20 else nil
	})
	local var126 = reactModule.useCallback(function()
		-- upvalues: var41 (ref), var21 (ref), sessionId (write), var40 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var42 (ref), var44 (ref), var43 (ref), var35 (ref), var37 (ref), var53 (ref), placeId (write), var89 (ref)
		local current = var41.current
		local var127 = if if current == nil or current.session ~= var21 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var40.current else nil
		
		if var127 == nil then
			if fFlagBuildAgentRollbackModule then
				v.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var42.current += 1
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var127) then
				var127.stop()
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
				var89(placeId, "Idle")
			end
		end
	end, {
		var21, sessionId, placeId, var89, var44, var35, var37, var53,
		if fFlagBuildAgentRollbackModule then v else nil
	})
	local var127 = p4.autoFocusComposer == nil or p4.autoFocusComposer
	local var128 = if p4.focusComposerWhen == nil then var127 else p4.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var127 (ref), var128 (ref), var86 (ref)
		if var127 and var128 then
			local var129 = false
			
			local var130 = function()
				-- upvalues: var129 (write)
				return var129
			end
			
			local var131 = 8
			
			local function tryFocus()
				-- upvalues: var130 (ref), var86 (ref), var131 (write), tryFocus (ref)
				if var130() then return end
				local current = var86.current
				
				if current then
					current.focus()
					
					return
				end
				var48 -= 1
				
				if var48 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var129 (write)
				var129 = true
			end
		end
		return function() end
	end, { var127, var128 })
	local t_2 = {
		messages = messages,
		localToolActions = var49,
		composerText = var69,
		composerErrorText = var71,
		setComposerText = var101,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then t else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerReferences = var83,
		addComposerReference = var109,
		removeComposerReference = var110,
		removeComposerReferenceByPath = var111,
		isComposerSendBlocked = if fFlagBuildExperienceChatImageAttachmentsModule then var112 else var62 and #var83 > 0,
		isAssistantResponding = var62,
		canStopAssistantResponse = u1922,
		canSendWhileResponding = var63,
		sendMessage = var119,
		stopAssistantResponse = var126,
		setScrollingFrame = var88.setScrollingFrame,
		textBoxRef = var86,
		clockBinding = var87,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p11)
			-- upvalues: placeId (write), var15 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var129 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var15 ~= nil) then function()
				-- upvalues: var15 (ref)
				var15.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p11, true, var129) and var129 ~= nil and var15 ~= nil then
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