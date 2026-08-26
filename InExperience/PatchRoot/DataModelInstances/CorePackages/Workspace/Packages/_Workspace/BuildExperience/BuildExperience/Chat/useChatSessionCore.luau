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
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
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
	planByToolCallId = {}
})
local var4 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var5 = signalsModule.createSignal(nil)
local var6 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p1, p2, p3)
	return if p1 == nil or p1.session ~= p2 then false else p3 == nil or p3 == "" or (if p1.sessionId ~= p3 then p1.sessionId == nil and p1.session.getCasSessionId() == p3 else true)
end

local function hasPendingLocalToolResponse(p1)
	for i in p1.askUserByToolCallId do
		if not p1.submittedToolCallIds[i] then
			return true
		end
	end
	for i in p1.planByToolCallId do
		if not p1.submittedToolCallIds[i] then
			return true
		end
	end
	return false
end

local _ = function(p2)
	return string.gsub(p2, "^%s*(.-)%s*$", "%1")
end

local _ = function(p2)
	-- upvalues: placeVersionHistoryModule (ref)
	if p2 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p2)
end

local _ = function(p2, p3)
	local var7 = 8
	
	local function tryFocus()
		-- upvalues: p3 (ref), p2 (ref), var7 (write), tryFocus (ref)
		if p3() then return end
		local current = p2.current
		
		if current then
			current.focus()
			
			return
		end
		var7 -= 1
		
		if var7 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p2)
	local casSessionId = p2.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p2.universeId
	local placeId = p2.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

local _ = function(p2, p3, p4, p5, p6)
	-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref)
	return if p2 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p3 == true and (p4 == nil and p5 ~= nil))) then nil else { setupErrorText = p6 }
end

return function(p2)
	-- upvalues: fFlagBuildLocalization (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var6 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var3 (ref), var4 (ref), var5 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), var2 (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), var1 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var7 = if fFlagBuildLocalization or fFlagBuildExperienceChatImageAttachmentsModule then reactModule.useContext(localizationRoactContext) else nil
	local var8 = if fFlagBuildLocalization then var7:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var9 = if fFlagBuildExperienceChatImageAttachmentsModule then var7:Format(localizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(nil)
	local var14 = nil
	local var15 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var16 = reactModule.useRef(true)
		var14 = var16
		var15 = reactModule.useCallback(function()
			-- upvalues: var16 (ref)
			return var16.current
		end, { var16 })
	end
	local placeId = p2.placeId
	local universeId = p2.universeId
	local sessionId = p2.sessionId
	
	if var10 ~= nil then
		placeId = var10.placeId
		universeId = var10.universeId
		sessionId = var10.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var12 ~= nil and var12.universeId == universeId) and var12.placeId == placeId then
		sessionId = var12.sessionId
	end
	local var17 = p2.hydrateHistoryWhen == nil or p2.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var18 = getAgentRollbackRequestStoreModule()
	local var19 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var19 (ref), sessionId (write)
		if var19 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var19.setCasSessionId(sessionId)
	end, { var19, sessionId })
	local var20 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var19 (ref), var6 (copy), signalsModule (copy)
		return if var19 == nil then var6 else signalsModule.createComputed(function(p3)
			-- upvalues: var19 (copy)
			return {
				session = var19,
				sessionId = var19.getCasSessionId(),
				events = var19.getMergedHistory(p3)
			}
		end)
	end, { var19 }))
	local var21 = if var20.session == var19 and var20.sessionId == (if var19 ~= nil then nil else var19.getCasSessionId()) then var20.events else {}
	local var22 = sessionId ~= nil and sessionId ~= ""
	local var23 = var22 or (universeId ~= nil and universeId ~= 0)
	local var24 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var24 then
		var24 = var17
		
		if var24 then
			var24 = false
			
			if var19 ~= nil then
				var24 = var23
				
				if var24 then
					var24 = not (var19.hasLoadedHistory() and #var21 > 0)
				end
			end
		end
	end
	local var25 = nil
	local var26 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var27, var28 = reactModule.useState(function()
			-- upvalues: var19 (ref), sessionId (write), universeId (write), var17 (ref), var24 (ref)
			return {
				session = var19,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var17,
				isLoading = var24
			}
		end)
		var25 = var27
		var26 = var28
	end
	local var29 = var25 ~= nil and (var25.session == var19 and (var25.sessionId == sessionId and (var25.universeId == universeId and var25.hydrateHistoryWhen == var17)))
	local var30 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var29 then var25.isLoading else var24) or (var19 ~= nil and var19.getNextHistoryPageToken() ~= nil))
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var34 (ref)
		var34(nil)
	end, { var19, sessionId })
	local var35 = sessionId
	local var36 = if if var33 == nil or var33.session ~= var19 then false else var35 == nil or var35 == "" or (if var33.sessionId ~= var35 then var33.sessionId == nil and var33.session.getCasSessionId() == var35 else true) then var33 else nil
	var72, var70 = reactModule.useState(nil)
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(0)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var37 (ref), var38 (ref), var35 (ref)
		assert(if p3 ~= nil then p4 ~= nil else true, "Active turns require an owning session")
		var37.current = p3
		var38.current = if p3 ~= nil then nil else { session = p4, sessionId = p4.getCasSessionId() }
		var35(p3)
	end, { var35 })
	local current = var38.current
	local var42 = sessionId
	local var43 = if if current == nil or current.session ~= var19 then false else var42 == nil or var42 == "" or (if current.sessionId ~= var42 then current.sessionId == nil and current.session.getCasSessionId() == var42 else true) then var72 else nil
	local var44 = if var43 ~= nil then var3 else var43.getOptimisticLocalTools
	current = if var43 ~= nil then var4 else var43.getLocalToolActions
	var42 = if var43 ~= nil then var5 else var43.getSetupErrorText
	local var45 = signalsReactModule.useSignalState(var44)
	local var46 = signalsReactModule.useSignalState(current)
	local var47 = signalsReactModule.useSignalState(var42)
	local _ = nil
	local var48 = if fFlagBuildLocalization and var47 ~= nil then var7:Format(var47) else var47
	local var49 = reactModule.useMemo(function()
		-- upvalues: var43 (ref), p2 (ref), var19 (ref), var31 (ref), var48 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var43 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p2.createUniverseOnFirstPrompt == true and (var19 == nil and var31 ~= nil))) then nil else { setupErrorText = var48 }
	end, {
		var43,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p2.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var31 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var19 else nil,
		var48
	})
	local var50 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var21 (ref), var19 (ref), sessionId (write), universeId (write), placeId (write), var45 (ref), var31 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var49 (ref), var36 (ref)
		return parseSessionStreamModule(var21, {
			sessionId = if var19 ~= nil then sessionId else var19.getCasSessionId() or sessionId,
			universeId = if var19 ~= nil then universeId else var19.universeId,
			placeId = if var19 ~= nil then placeId else var19.placeId,
			optimisticLocalTools = var45,
			pendingUserMessage = if var31 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var31.text) then nil else var31.text,
			pendingUserImages = if fFlagBuildExperienceChatImageAttachmentsModule and var31 ~= nil and (not fFlagBuildAgentRollbackModule or sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var31.text)) then var31.images else nil,
			pendingUserMessageAfterSequenceId = if var31 ~= nil then nil else var31.afterSequenceId,
			liveAssistantMessage = var49,
			optimisticCancelledStartSequenceId = if var36 ~= nil then nil else var36.startSequenceId
		})
	end, {
		var21, var19, sessionId, universeId, placeId, var45, var31, var49, var36
	})
	local messages = var50.messages
	local subagentTaskState = var50.subagentTaskState
	local includesPublishTool = var50.includesPublishTool
	local var51 = messages[#messages]
	local var52 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var18 (ref), var2 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var18.getIsPendingForPlaceId(placeId) else var2
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var18 else nil
	}))
	local var53 = if var43 == nil and var51 ~= nil then var51.kind == "assistant_turn" and (not var51.isDone or fFlagBuildAgentRollbackModule and var52) else true
	local var54 = var53 and (not (fFlagBuildAgentRollbackModule and var52) and hasPendingLocalToolResponse(var45))
	local activeTurnState = var50.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), activeTurnState (ref)
		if var43 == nil or activeTurnState == nil then
			return
		end
		var43.syncFromTurnState(activeTurnState)
	end, { var43, activeTurnState })
	reactModule.useEffect(function()
		-- upvalues: var50 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var50.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var50.includesPublishTool, placeId })
	local var55, var56 = reactModule.useBinding("")
	local var57, var58 = reactModule.useState(nil)
	local var59 = reactModule.useRef("")
	local t = {}
	local var60 = nil
	local t_1 = { current = {} }
	local var61 = reactModule.useRef({})
	local var62 = reactModule.useRef(0)
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var63, var64 = reactModule.useState({})
		t = var63
		var60 = var64
		t_1 = reactModule.useRef({})
	end
	local v
	local var65 = reactModule.useRef(nil)
	local var66 = reactUtilsModule.useClock()
	local var67 = useChatScrollModule()
	local var68 = reactModule.useCallback(function(p3, p4)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p3, p4)
	end, {})
	local var69 = reactModule.useCallback(function(p3)
		-- upvalues: var67 (ref), var19 (ref)
		local var70 = function()
			-- upvalues: p3 (ref)
			return if p3 == nil then false else p3()
		end
		
		var67.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var19 (copy), var70 (ref), var67 (copy), p3 (ref)
			if var19 == nil then return end
			if var19.loadOlderHistory(var70) and var19.getNextHistoryPageToken() ~= nil and var67.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p3 (copy), var67 (copy), var19 (copy), var70 (copy)
					if if p3 ~= nil then false else p3() then return end
					if var67.isViewportUnderfilled() then
						var19.loadOlderHistory(var70)
					end
				end)
			end
		end)
	end, { var19, var67 })
	local var70 = reactModule.useCallback(function(p3)
		-- upvalues: var19 (ref), var67 (ref), var69 (ref)
		task.delay(0.1, function()
			-- upvalues: p3 (ref), var19 (copy), var67 (copy), var69 (copy)
			if p3() then return end
			if var19 == nil then return end
			if var19.getNextHistoryPageToken() == nil then return end
			if var67.isViewportUnderfilled() then
				var69(p3)
				
				return
			end
		end)
	end, { var69, var67, var19 })
	local var71 = reactModule.useCallback(function(p3)
		-- upvalues: var19 (ref), var70 (ref)
		if var19 == nil then return end
		if var19.getNextHistoryPageToken() == nil then
			return
		end
		var70(p3)
	end, { var70, var19 })
	local var72 = reactModule.useRef(var71)
	var72.current = var71
	reactModule.useEffect(function()
		-- upvalues: var67 (ref), var69 (ref)
		var67.setOnScrolledToTop(function()
			-- upvalues: var69 (copy)
			var69(nil)
		end)
		
		return function()
			-- upvalues: var67 (copy)
			var67.setOnScrolledToTop(nil)
		end
	end, { var67.setOnScrolledToTop, var69 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var19 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var26 (write), sessionId (write), universeId (write), var72 (ref), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var13 (ref), placeId (write)
		if var17 and var19 ~= nil then
			local var73 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var26 (copy), var73 (write), var19 (copy), sessionId (copy), universeId (copy), var17 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil and not var73 then
					var26({
						session = var19,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var17,
						isLoading = value
					})
					
					return
				end
			end
			
			local var74 = not (var19.hasLoadedHistory() and #var19.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
				var26({
					session = var19,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var17,
					isLoading = var74
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var73 (write), sessionId (ref), var19 (copy)
				return if var73 then true elseif sessionId == nil or sessionId == "" then false else var19.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var73 (write), sessionId (ref), var19 (copy), var72 (copy), isHydrateCancelled (ref)
				local var75
				if var73 then
					var75 = true
				elseif sessionId == nil or sessionId == "" then
					var75 = false
				else
					var75 = var19.getCasSessionId() ~= sessionId
					var75 = nil
				end
				if var75 then
					return
				end
				var72.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p3)
				-- upvalues: var19 (copy), var73 (write), sessionId (ref), var72 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var26 (copy), sessionId (copy), universeId (copy), var17 (copy)
				var19.setCasSessionId(p3)
				
				if var19.hasLoadedHistory() and #var19.getMergedHistory(false) > 0 then
					local var75
					if var73 then
						var75 = true
					elseif sessionId == nil or sessionId == "" then
						var75 = false
					else
						var75 = var19.getCasSessionId() ~= sessionId
						var75 = nil
					end
					if not var75 then
						var72.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
						if var73 then return end
						var26({
							isLoading = false,
							session = var19,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var17
						})
					end
					return
				elseif var19.refreshSession(isHydrateCancelled) then
					local var76
					if var73 then
						var76 = true
					elseif sessionId == nil or sessionId == "" then
						var76 = false
					else
						var76 = var19.getCasSessionId() ~= sessionId
						var76 = nil
					end
					if not var76 then
						if var73 then
							var76 = true
						elseif sessionId == nil or sessionId == "" then
							var76 = false
						else
							var76 = var19.getCasSessionId() ~= sessionId
							var76 = nil
						end
						if not var76 then
							var72.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
					if var73 then return end
					var26({
						isLoading = false,
						session = var19,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var17
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var19 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var26 (copy), var73 (write), var17 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var13 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var19.hasLoadedHistory() and #var19.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
						if var73 then return end
						var26({
							isLoading = false,
							session = var19,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var17
						})
					end
					return
				else
					local var75 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var75.state(false).status == "pending" do
						local var76
						if var73 then
							var76 = true
						elseif sessionId == nil or sessionId == "" then
							var76 = false
						else
							var76 = var19.getCasSessionId() ~= sessionId
							var76 = nil
						end
						if var76 then break end
						task.wait()
					end
					local result
					if var73 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var19.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var75.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
							if var73 then return end
							var26({
								isLoading = false,
								session = var19,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var17
							})
						end
						return
					else
						result = var75.state(false).result
						local var77 = if result ~= nil then nil else result.sessions
						local var78 = if typeof(var77) == "table" then var77[1] else nil
						local var79 = if typeof(var78) == "table" then var78.sessionId else nil
						
						if typeof(var79) == "string" and var79 ~= "" then
							var13({
								universeId = universeId,
								placeId = placeId,
								sessionId = var79
							})
							
							return
						end
						var19.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
							if var73 then return end
							var26({
								isLoading = false,
								session = var19,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var17
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var73 (write)
				var73 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var26 ~= nil then
			var26({
				isLoading = false,
				session = var19,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var17
			})
		end
	end, {
		var19, sessionId, universeId, placeId, creatorAgentChatStore, var17
	})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), sessionId (write), var72 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var14 (write), appLifecycleObserverService (copy)
		if var19 == nil then
			return
		end
		local var75 = false
		
		local function refreshKnownSession()
			-- upvalues: var19 (copy), sessionId (copy), var75 (write), var72 (copy)
			local casSessionId = var19.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var19 (copy), var75 (copy), var72 (copy)
				if var19.refreshSession(function()
					-- upvalues: var75 (copy)
					return var75
				end) and not var75 then
					var72.current(function()
						-- upvalues: var75 (copy)
						return var75
					end)
				end
			end)
		end
		
		local var76 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var14 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var14 ~= nil then
				var14.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var75 (write), var76 (ref), onUnhideConnection (ref)
			var75 = true
			var76:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var19, sessionId, var14 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var17 (ref), var67 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var17 then
			var67.lockToBottom()
			
			return
		end
	end, { var17, var19, sessionId, var67 })
	local var75 = reactModule.useCallback(function(p3)
		-- upvalues: var59 (ref), var56 (ref), var58 (ref)
		var59.current = p3
		var56(p3)
		var58(nil)
	end, { var56, var58 })
	
	local function _(p3)
		-- upvalues: t_1 (write), var60 (write)
		t_1.current = p3
		
		if var60 ~= nil then
			var60(p3)
		end
	end
	
	local _ = function(p3)
		for i, v in p3 do
			if v.uploadStatus == "failed" then
				return true
			end
		end
		return false
	end
	
	local function updateComposerImage(p4, p5)
		-- upvalues: t_1 (write), var60 (write)
		local current = t_1.current
		local cloned = table.clone(current)
		
		for i, v in current do
			if v.capture == p4 then
				cloned[i] = p5(v)
				t_1.current = cloned
				
				if var60 ~= nil then
					var60(cloned)
				end
				return cloned
			end
		end
		return current
	end
	
	local function beginComposerImageUpload(p6)
		-- upvalues: var62 (ref), var61 (ref), updateComposerImage (ref), var58 (ref), var1 (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var9 (ref)
		local var76
		var62.current += 1
		local current = var62.current
		var61.current[p6] = current
		
		for i, v in updateComposerImage(p6, function(p7)
			local cloned = table.clone(p7)
			cloned.uri = nil
			cloned.uploadStatus = "uploading"
			cloned.uploadError = nil
			
			return cloned
		end) do
			if v.uploadStatus == "failed" then
				var76 = true
				if not var76 then
					var58(nil)
				end
				var1(p6):andThen(function(p7)
					-- upvalues: var61 (copy), p6 (ref), current (ref), updateComposerImage (copy), var58 (copy)
					if var61.current[p6] ~= current then return end
					local var77
					var61.current[p6] = nil
					
					for i, v in updateComposerImage(p6, function(p8)
						-- upvalues: p7 (ref)
						local cloned = table.clone(p8)
						cloned.uri = `rbxassetid://{p7.assetId}`
						cloned.uploadStatus = "uploaded"
						cloned.uploadError = nil
						
						return cloned
					end) do
						if v.uploadStatus == "failed" then
							var77 = true
							if not var77 then
								var58(nil)
							end
							return
						end
					end
					var77 = false
				end):catch(function(p8)
					-- upvalues: var61 (copy), p6 (ref), current (ref), updateComposerImage (copy), fFlagBuildExperienceChatImageAttachmentsModule (copy), var58 (copy), var9 (copy)
					if var61.current[p6] ~= current then return end
					var61.current[p6] = nil
					updateComposerImage(p6, function(p9)
						-- upvalues: p8 (ref)
						local cloned = table.clone(p9)
						cloned.uri = nil
						cloned.uploadStatus = "failed"
						cloned.uploadError = p8
						
						return cloned
					end)
					
					if fFlagBuildExperienceChatImageAttachmentsModule then
						var58(var9)
					end
				end)
				
				return
			end
		end
		var76 = false
	end
	
	local function setComposerImages(value)
		-- upvalues: t_1 (write), var61 (ref), var60 (write), var58 (ref), beginComposerImageUpload (ref)
		local var77
		local current = t_1.current
		local t = {}
		local t_2 = {}
		
		for i = 1, math.min(#value, 2) do
			local var78 = value[i]
			var77 = var78
			
			if var78.capture ~= nil and var78.uri == nil and var78.uploadStatus == nil then
				for i, v in current do
					if v.capture == var78.capture then
						var77 = v
						break
					end
				end
			end
			if var77.uri ~= nil and var77.uploadStatus == nil then
				var77 = table.clone(var77)
				var77.uploadStatus = "uploaded"
			elseif var77.capture ~= nil and var77.uri == nil and var77.uploadStatus == nil then
				var77 = table.clone(var77)
				var77.uploadStatus = "uploading"
				table.insert(t_2, var77.capture)
			end
			table.insert(t, var77)
		end
		local var79
		for i_1, var77 in current do
			var79 = false
			
			for i_3, v_1 in t do
				if v_1.capture == var77.capture then
					var79 = true
					break
				end
			end
			if not var79 and var77.capture ~= nil then
				var61.current[var77.capture] = nil
			end
		end
		t_1.current = t
		
		if var60 ~= nil then
			var60(t)
		end
		local var80
		for var77, v_1 in t do
			if v_1.uploadStatus == "failed" then
				var80 = true
				if not var80 then
					var58(nil)
				end
				for i_3, var77 in t_2 do
					beginComposerImageUpload(var77)
				end
				return
			end
		end
		var80 = false
	end
	
	local var81 = reactModule.useRef(setComposerImages)
	var81.current = setComposerImages
	
	local function retryComposerImage(p7)
		-- upvalues: t_1 (write), beginComposerImageUpload (ref)
		local var82 = t_1.current[p7]
		
		if var82 == nil or var82.capture == nil or var82.uploadStatus ~= "failed" then
			return
		end
		beginComposerImageUpload(var82.capture)
	end
	
	local var82 = false
	
	for i, v in t do
		if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
			var82 = true
			break
		end
	end
	local var83 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p7)
		-- upvalues: var39 (ref), var38 (ref), var19 (ref), sessionId (write), var59 (ref), var75 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var7 (ref), var58 (ref)
		return function(p8, p9)
			-- upvalues: var39 (copy), p7 (ref), var38 (copy), var19 (copy), sessionId (copy), var59 (copy), var75 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var7 (copy), var58 (copy)
			if var39.current == p7 then
				local current = var38.current
				local var84 = sessionId
				
				if not (if current == nil or current.session ~= var19 then false else var84 == nil or var84 == "" or (if current.sessionId ~= var84 then current.sessionId == nil and current.session.getCasSessionId() == var84 else true)) then return end
				if p8 ~= nil and var59.current == "" then
					var75(p8)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p9)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var7:Format(toolResultFailureComposerError)
				end
				var58(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var19,
		sessionId,
		var75,
		var58,
		var7
	}) else nil
	local var84 = reactModule.useCallback(function(p7, p8, p9, p10, p11)
		-- upvalues: var39 (ref), var41 (ref), var40 (ref), var32 (ref), p2 (ref), var68 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var81 (ref), var75 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var7 (ref), var58 (ref), var67 (ref), sessionId (write), var11 (ref)
		if var39.current ~= p7 then return end
		var41(nil)
		var40.current = nil
		var32(nil)
		
		if p8 == nil then
			if p11.placeId ~= nil then
				var68(p11.placeId, "Completed")
			end
			var67.scrollToBottomAfterSend()
			local casSessionId = p11.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p2.createUniverseOnFirstPrompt and sessionId == nil and p11.universeId ~= nil then
					local t = {
						universeId = p11.universeId,
						placeId = p11.placeId,
						sessionId = casSessionId
					}
					var11(t)
					
					if p2.onProjectResolved ~= nil then
						p2.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p11 (ref), var39 (copy), p7 (ref)
					p11.refreshSession(function()
						-- upvalues: var39 (copy), p7 (copy)
						return var39.current ~= p7
					end)
				end)
			end
			return
		elseif p2.onPromptFailure ~= nil then
			p2.onPromptFailure(p8.errorCode, p8.outOfCreditsReason)
		end
		if p11.placeId ~= nil then
			var68(p11.placeId, "Idle")
		end
		if fFlagBuildExperienceChatImageAttachmentsModule and p10 ~= nil then
			var81.current(p10)
		end
		if p9 ~= nil then
			var75(p9)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p8)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var7:Format(promptFailureComposerError)
			end
			var58(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p11 (ref), var39 (copy), p7 (ref)
			p11.refreshSession(function()
				-- upvalues: var39 (copy), p7 (copy)
				return var39.current ~= p7
			end)
		end)
	end, {
		p2.createUniverseOnFirstPrompt, p2.onPromptFailure, p2.onProjectResolved,
		sessionId, var68, var11, var67, var75, var58, var41, var32, var7
	})
	local var85 = reactModule.useRef(var17)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var85 (ref), var53 (ref), var43 (ref), var67 (ref)
		local var86 = var17 and not var85.current
		var85.current = var17
		
		if not var17 then return end
		if var86 or var53 or var43 ~= nil then
			var67.scrollToBottomUnconditionally()
			task.defer(var67.scrollToBottomUnconditionally)
			task.delay(0.15, var67.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var17,
		var53,
		var43,
		#messages,
		var67
	})
	reactModule.useEffect(function()
		-- upvalues: var37 (ref), var38 (ref), var19 (ref), sessionId (write), var36 (ref), var39 (ref), var40 (ref), placeId (write), var68 (ref), creatorAgentChatModule_1 (copy), var84 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var83 (write), var15 (write), var41 (ref), var67 (ref), var50 (ref), var43 (ref), creatorAgentChatStore (ref), var53 (ref)
		local var86
		if var37.current ~= nil then
			local current = var38.current
			var86 = sessionId
			
			if if current == nil or current.session ~= var19 then false else var86 == nil or var86 == "" or (if current.sessionId ~= var86 then current.sessionId == nil and current.session.getCasSessionId() == var86 else true) then return end
		end
		if var36 ~= nil then return end
		if var19 == nil then return end
		local var87
		local casSessionId = var19.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var87 = casSessionId
		else
			var86 = var19.universeId
			local placeId_1 = var19.placeId
			var87 = if var86 == nil or placeId_1 == nil then nil else `{var86}:{placeId_1}`
		end
		if var87 == nil then return end
		local function current(p7, p8)
			-- upvalues: var39 (copy), var40 (copy), placeId (copy), var68 (copy), creatorAgentChatModule_1 (copy), var19 (copy), var84 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var83 (copy), var15 (copy), var41 (copy), var67 (copy)
			var39.current += 1
			local current = var39.current
			var40.current = p8
			
			if placeId ~= nil then
				var68(placeId, "Loading")
			end
			local var88 = creatorAgentChatModule_1.createResumedAssistantTurn(var19, p7, function(p9)
				-- upvalues: var84 (copy), current (ref), var19 (copy)
				var84(current, p9, nil, nil, var19)
			end, if p8 ~= nil then nil else p8 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var83(current) else nil, var15)
			var41(var88, var19)
			var88.start()
			var67.scrollToBottomUnconditionally()
		end
		
		if var50.activeTurnState == nil or var50.activeTurnItemIndex == nil or var50.activeTurnState.isDone then
			var40.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var87)
			var86 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var88 = casSessionId ~= nil and (var86 ~= nil and not var86.isDone)
			
			if not var53 and not var88 then return end
			if var88 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var50.activeTurnStartSequenceId
			
			if var40.current == casSessionId and var43 ~= nil then return end
			var86 = creatorAgentChatStore.resumeTurnFromHistory(var87, var50.activeTurnState, var50.activeTurnSequenceIds)
			
			if var86 ~= nil then
				current(var86, casSessionId)
			end
		end
	end, {
		var50, var19, sessionId, creatorAgentChatStore, var53, var43, placeId, var68,
		var84, var67, var41, var36, var83, var15
	})
	local var86 = reactModule.useCallback(function(p7, p8, p9, p10, p11, p12, p13, p14, p15)
		-- upvalues: var32 (ref), creatorAgentChatModule_1 (copy), var84 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var83 (write), var15 (write), fFlagBuildAgentRollbackModule (copy), var68 (ref), var41 (ref), var67 (ref)
		var32({ text = p8, images = p10, afterSequenceId = p12 })
		local _ = nil
		local var87 = creatorAgentChatModule_1.createLiveAssistantTurn(p7, p9, function(p16)
			-- upvalues: var84 (copy), p11 (ref), p13 (ref), p10 (ref), p7 (ref), p15 (ref)
			var84(p11, p16, p13, p10, p7)
			
			if p15 ~= nil then
				p15()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var83(p11) else nil, var15, if fFlagBuildAgentRollbackModule then p14 else nil)
		
		if p7.placeId ~= nil then
			var68(p7.placeId, "Loading")
		end
		var41(var87, p7)
		var67.scrollToBottomAfterSend()
		var87.start()
	end, {
		var84, var68, var67, var41, var32, var83, var15
	})
	v = nil
	
	if fFlagBuildAgentRollbackModule then
		local var87 = reactModule.useRef(var50.latestSequenceId)
		var87.current = var50.latestSequenceId
		v = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var19,
			activeTurnHandleRef = var37,
			startRollbackTurn = reactModule.useCallback(function(p7, p8, p9)
				-- upvalues: var19 (ref), var67 (ref), var39 (ref), var34 (ref), buildAgentRollbackPromptModule (copy), var86 (ref), var87 (ref)
				if var19 == nil then
					p9()
					
					return
				end
				var67.captureStickToBottomForSend()
				var39.current += 1
				local current = var39.current
				var34(nil)
				local var88 = buildAgentRollbackPromptModule(p7.versionNumber, p7.noteTitle, p7.noteDescription)
				var86(var19, var88, var88, nil, current, var87.current, nil, function()
					-- upvalues: var67 (copy), p8 (ref)
					var67.scrollToBottomUnconditionally()
					p8()
				end, p9)
			end, { var19, var67, var34, var86 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var72 (ref), var38 (ref), var19 (ref), sessionId (write), var39 (ref), var40 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var68 (ref), var41 (ref), var32 (ref), var34 (ref)
		if var72 ~= nil then
			local current = var38.current
			local var88 = sessionId
			
			if if current == nil or current.session ~= var19 then false else var88 == nil or var88 == "" or (if current.sessionId ~= var88 then current.sessionId == nil and current.session.getCasSessionId() == var88 else true) then return end
			local current = var38.current
			var39.current += 1
			var40.current = nil
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var72) then
				var72.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var68(current.session.placeId, "Idle")
			end
			var41(nil, nil)
			var32(nil)
			var34(nil)
			
			return
		end
	end, {
		var19, sessionId, var72, var41,
		if fFlagBuildAgentRollbackModule then v else nil,
		if fFlagBuildAgentRollbackModule then var68 else nil
	})
	local var88 = reactModule.useCallback(function(p7, p8, p9, p10, p11)
		-- upvalues: var32 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var39 (ref), universeConfigurationModule (copy), var11 (ref), p2 (ref), creatorAgentChatStore (ref), sessionId (write), var86 (ref), var41 (ref), var75 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), var81 (ref), var58 (ref), var8 (write)
		var32({ text = p7, images = p9, afterSequenceId = p11 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p12)
			-- upvalues: debug (copy), processTime (ref), var39 (copy), p10 (ref), universeConfigurationModule (copy), var11 (copy), p2 (copy), creatorAgentChatStore (copy), sessionId (copy), var86 (copy), p7 (ref), p8 (ref), p9 (ref), p11 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p12.universeId,
				rootPlaceId = p12.rootPlaceId
			})
			
			if var39.current == p10 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p12.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p12 (ref)
					return universeConfigurationStore.setTeamCreate(p12.universeId, true)
				end):andThen(function()
					-- upvalues: var39 (copy), p10 (copy), p12 (ref), var11 (copy), p2 (copy), creatorAgentChatStore (copy), sessionId (copy), var86 (copy), p7 (copy), p8 (copy), p9 (copy), p11 (copy)
					if var39.current ~= p10 then
						return nil
					end
					local t = { universeId = p12.universeId, placeId = p12.rootPlaceId }
					var11(t)
					
					if p2.onProjectResolved ~= nil then
						p2.onProjectResolved(t)
					end
					var86(creatorAgentChatStore.getSessionForProject(p12.universeId, p12.rootPlaceId, sessionId), p7, p8, p9, p10, p11, p7)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p12)
			-- upvalues: debug (copy), processTime (ref), var39 (copy), p10 (ref), var41 (copy), var32 (copy), var75 (copy), p7 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), p9 (ref), var81 (copy), var58 (copy), var8 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p12
			})
			
			if var39.current ~= p10 then return end
			var41(nil)
			var32(nil)
			var75(p7)
			
			if fFlagBuildExperienceChatImageAttachmentsModule and p9 ~= nil then
				var81.current(p9)
			end
			var58(var8)
		end)
	end, {
		sessionId, creatorAgentChatStore, p2.onProjectResolved, var41, var75, var58,
		var11, var32, var86, var8
	})
	local var89 = reactModule.useCallback(function()
		-- upvalues: var59 (ref), fFlagBuildExperienceChatImageAttachmentsModule (copy), t_1 (write), var75 (ref), var53 (ref), var38 (ref), var19 (ref), sessionId (write), var37 (ref), var65 (ref), var67 (ref), p2 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var18 (ref), var39 (ref), var34 (ref), var81 (ref), var88 (ref), var50 (ref), var86 (ref)
		local v
		local replaced = string.gsub(var59.current, "^%s*(.-)%s*$", "%1")
		local var90 = if fFlagBuildExperienceChatImageAttachmentsModule then t_1.current else {}
		
		if replaced == "" and #var90 == 0 then
			var75("")
			
			return false
		elseif fFlagBuildExperienceChatImageAttachmentsModule then
			for i, v in var90 do
				if v.uri == nil or v.uploadStatus == "uploading" or v.uploadStatus == "failed" then
					return false
				end
			end
		end
		if var53 then
			if fFlagBuildExperienceChatImageAttachmentsModule and #var90 > 0 then
				return false
			end
			local current = var38.current
			v = sessionId
			local var91 = if if current == nil or current.session ~= var19 then false else v == nil or v == "" or (if current.sessionId ~= v then current.sessionId == nil and current.session.getCasSessionId() == v else true) then var37.current else nil
			
			if var91 == nil or not var91.trySubmitComposerText(replaced) then
				return false
			end
			var75("")
			
			if var65.current then
				var65.current.releaseFocus()
			end
			var67.scrollToBottomAfterSend()
			
			return true
		else
			local var92 = p2.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var92 and var19 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var18.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var67.captureStickToBottomForSend()
			var39.current += 1
			local current = var39.current
			var34(nil)
			var75("")
			
			if fFlagBuildExperienceChatImageAttachmentsModule then
				var81.current({})
			end
			if var65.current then
				var65.current.releaseFocus()
			end
			local function current(p7, p8)
				-- upvalues: var92 (ref), var88 (copy), replaced (ref), current (ref), var50 (copy), var86 (copy), var19 (copy)
				if var92 then
					var88(replaced, p7, p8, current, var50.latestSequenceId)
					
					return
				end
				var86(var19, replaced, p7, p8, current, var50.latestSequenceId, replaced)
			end
			
			if fFlagBuildExperienceChatImageAttachmentsModule and #var90 ~= 0 then
				local t = {}
				
				if replaced ~= "" then
					table.insert(t, { type = "text", text = replaced })
				end
				v = {}
				
				for i, v_1 in var90 do
					local uri = v_1.uri
					table.insert(t, { type = "image", uri = uri })
					table.insert(v, {
						uploadStatus = "uploaded",
						capture = v_1.capture,
						uri = uri
					})
				end
				if var92 then
					var88(replaced, t, v, current, var50.latestSequenceId)
				else
					var86(var19, replaced, t, v, current, var50.latestSequenceId, replaced)
				end
				return true
			elseif var92 then
				var88(replaced, replaced, nil, current, var50.latestSequenceId)
			else
				var86(var19, replaced, replaced, nil, current, var50.latestSequenceId, replaced)
			end
			return true
		end
	end, {
		var19, sessionId, universeId, placeId, var53, var67, var75, var88, var86,
		p2.createUniverseOnFirstPrompt, var34, var50,
		if fFlagBuildAgentRollbackModule then var18 else nil
	})
	local var93 = reactModule.useCallback(function()
		-- upvalues: var38 (ref), var19 (ref), sessionId (write), var37 (ref), fFlagBuildAgentRollbackModule (copy), v (write), var39 (ref), var41 (ref), var40 (ref), var32 (ref), var34 (ref), var50 (ref), placeId (write), var68 (ref)
		local current = var38.current
		local var94 = if if current == nil or current.session ~= var19 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var37.current else nil
		
		if var94 == nil then
			if fFlagBuildAgentRollbackModule then
				v.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var39.current += 1
			
			if not fFlagBuildAgentRollbackModule or not v.stopRequestBeforeReceipt(var94) then
				var94.stop()
			end
			var41(nil)
			var40.current = nil
			var32(nil)
			var34({
				session = var19,
				sessionId = var19.getCasSessionId(),
				startSequenceId = var50.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var68(placeId, "Idle")
			end
		end
	end, {
		var19, sessionId, placeId, var68, var41, var32, var34, var50,
		if fFlagBuildAgentRollbackModule then v else nil
	})
	local var94 = p2.autoFocusComposer == nil or p2.autoFocusComposer
	local var95 = if p2.focusComposerWhen == nil then var94 else p2.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var94 (ref), var95 (ref), var65 (ref)
		if var94 and var95 then
			local var96 = false
			
			local var97 = function()
				-- upvalues: var96 (write)
				return var96
			end
			
			local var98 = 8
			
			local function tryFocus()
				-- upvalues: var97 (ref), var65 (ref), var98 (write), tryFocus (ref)
				if var97() then return end
				local current = var65.current
				
				if current then
					current.focus()
					
					return
				end
				var98 -= 1
				
				if var98 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var96 (write)
				var96 = true
			end
		end
		return function() end
	end, { var94, var95 })
	local t_2 = {
		messages = messages,
		localToolActions = var46,
		composerText = var55,
		composerErrorText = var57,
		setComposerText = var75,
		composerImages = if fFlagBuildExperienceChatImageAttachmentsModule then t else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		isComposerSendBlocked = fFlagBuildExperienceChatImageAttachmentsModule and var82,
		isAssistantResponding = var53,
		canStopAssistantResponse = u1451,
		canSendWhileResponding = var54,
		sendMessage = var89,
		stopAssistantResponse = var93,
		setScrollingFrame = var67.setScrollingFrame,
		textBoxRef = var65,
		clockBinding = var66,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p7)
			-- upvalues: placeId (write), var14 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var96 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var14 ~= nil) then function()
				-- upvalues: var14 (ref)
				var14.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p7, true, var96) and var96 ~= nil and var14 ~= nil then
				var14.current = false
			end
		end, { placeId, var14 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var30
	}
	local _ = true
	local _ = var43 ~= nil and ((if var43 ~= nil then fFlagBuildAgentRollbackModule else nil) and var52)
	
	return t_2
end