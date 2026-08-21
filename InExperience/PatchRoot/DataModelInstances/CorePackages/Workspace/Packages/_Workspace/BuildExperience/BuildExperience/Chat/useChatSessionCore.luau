local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
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
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local _ = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)
local useChatScrollModule = require(script.Parent.useChatScroll)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local debug = creatorAgentChatModule.debug
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var25 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var26 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var27 = signalsModule.createSignal(nil)
local var28 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p0, p1, p2) --[[ line: 149 | named "sessionOwnerMatches" ]]
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3) --[[ line: 159 ]]
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
	return false
end

local _ = function(p4) --[[ line: 173 | named "trimMessage" ]]
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5) --[[ line: 177 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7) --[[ line: 184 | named "scheduleComposerAutoFocus" ]]
	local var31 = 8
	
	local function tryFocus() --[[ line: 186 ]]
		-- upvalues: p7 (ref), p6 (ref), var31 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var31 -= 1
		
		if var31 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p8) --[[ line: 203 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

local _ = function(p9, p10, p11, p12, p13) --[[ line: 216 | named "getLiveAssistantMessage" ]]
	-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref)
	return if p9 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p10 == true and (p11 == nil and p12 ~= nil))) then nil else { setupErrorText = p13 }
end

local _ = function(p14, p15) --[[ line: 233 | named "localizeText" ]]
	return p14:Format(p15)
end

local function useRuntimeClientToolsHandler() --[[ line: 237 ]]
	-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), reactModule (ref)
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var34 = reactModule.useRef(true)
		
		return var34, reactModule.useCallback(function() --[[ line: 240 ]]
			-- upvalues: var34 (ref)
			return var34.current
		end, { var34 })
	end
	return nil, nil
end

return function(p16) --[[ line: 248 | named "useChatSessionCore" ]]
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), useRuntimeClientToolsHandler (ref), creatorAgentChatModule (ref), var28 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var25 (ref), var26 (ref), var27 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var35 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var36 = if fFlagBuildLocalization then var35:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var37, var38 = reactModule.useState(nil)
	local var39, var40 = reactModule.useState(nil)
	local var41, var42 = useRuntimeClientToolsHandler()
	local placeId = p16.placeId
	local universeId = p16.universeId
	local sessionId = p16.sessionId
	
	if var37 ~= nil then
		placeId = var37.placeId
		universeId = var37.universeId
		sessionId = var37.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var39 ~= nil and var39.universeId == universeId) and var39.placeId == placeId then
		sessionId = var39.sessionId
	end
	local var43 = p16.hydrateHistoryWhen == nil or p16.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var45 = reactModule.useMemo(function() --[[ line: 278 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 285 ]]
		-- upvalues: var45 (ref), sessionId (write)
		if var45 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var45.setCasSessionId(sessionId)
	end, { var45, sessionId })
	local var46 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 292 ]]
		-- upvalues: var45 (ref), var28 (copy), signalsModule (copy)
		return if var45 == nil then var28 else signalsModule.createComputed(function(p17) --[[ line: 297 ]]
			-- upvalues: var45 (copy)
			return {
				session = var45,
				sessionId = var45.getCasSessionId(),
				events = var45.getMergedHistory(p17)
			}
		end)
	end, { var45 }))
	local var47 = if var46.session == var45 and var46.sessionId == (if var45 ~= nil then nil else var45.getCasSessionId()) then var46.events else {}
	local var48 = sessionId ~= nil and sessionId ~= ""
	local var49 = var48 or (universeId ~= nil and universeId ~= 0)
	local var50 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var50 then
		var50 = var43
		
		if var50 then
			var50 = false
			
			if var45 ~= nil then
				var50 = var49
				
				if var50 then
					var50 = not (var45.hasLoadedHistory() and #var47 > 0)
				end
			end
		end
	end
	local var51 = nil
	local var52 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var53, var54 = reactModule.useState(function() --[[ line: 322 ]]
			-- upvalues: var45 (ref), sessionId (write), universeId (write), var43 (ref), var50 (ref)
			return {
				session = var45,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var43,
				isLoading = var50
			}
		end)
		var51 = var53
		var52 = var54
	end
	local var55 = var51 ~= nil and (var51.session == var45 and (var51.sessionId == sessionId and (var51.universeId == universeId and var51.hydrateHistoryWhen == var43)))
	local var56 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var55 then var51.isLoading else var50) or (var45 ~= nil and var45.getNextHistoryPageToken() ~= nil))
	local var57, var58 = reactModule.useState(nil)
	local var59, var60 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 361 ]]
		-- upvalues: var60 (ref)
		var60(nil)
	end, { var45, sessionId })
	local var61 = sessionId
	local var62 = if if var59 == nil or var59.session ~= var45 then false else var61 == nil or var61 == "" or (if var59.sessionId ~= var61 then var59.sessionId == nil and var59.session.getCasSessionId() == var61 else true) then var59 else nil
	var63, var61 = reactModule.useState(nil)
	local var64 = reactModule.useRef(nil)
	local var65 = reactModule.useRef(nil)
	local var66 = reactModule.useRef(0)
	local var67 = reactModule.useRef(nil)
	local var68 = reactModule.useCallback(function(p18, p19) --[[ line: 376 ]]
		-- upvalues: var64 (ref), var65 (ref), var61 (ref)
		assert(if p18 ~= nil then p19 ~= nil else true, "Active turns require an owning session")
		var64.current = p18
		var65.current = if p18 ~= nil then nil else { session = p19, sessionId = p19.getCasSessionId() }
		var61(p18)
	end, { var61 })
	local current = var65.current
	local var69 = sessionId
	local var70 = if if current == nil or current.session ~= var45 then false else var69 == nil or var69 == "" or (if current.sessionId ~= var69 then current.sessionId == nil and current.session.getCasSessionId() == var69 else true) then var63 else nil
	reactModule.useLayoutEffect(function() --[[ line: 393 ]]
		-- upvalues: var63 (ref), var65 (ref), var45 (ref), sessionId (write), var66 (ref), var67 (ref), var68 (ref), var58 (ref), var60 (ref)
		if var63 ~= nil then
			local current = var65.current
			local var104 = sessionId
			
			if if current == nil or current.session ~= var45 then false else var104 == nil or var104 == "" or (if current.sessionId ~= var104 then current.sessionId == nil and current.session.getCasSessionId() == var104 else true) then
				return
			else
				var66.current += 1
				var67.current = nil
				var63.detach()
				var68(nil, nil)
				var58(nil)
				var60(nil)
			end
		end
	end, { var45, sessionId, var63, var68 })
	local var71 = if var70 ~= nil then var25 else var70.getOptimisticLocalTools
	current = if var70 ~= nil then var26 else var70.getLocalToolActions
	var69 = if var70 ~= nil then var27 else var70.getSetupErrorText
	local var72 = signalsReactModule.useSignalState(var71)
	local var73 = signalsReactModule.useSignalState(current)
	local var74 = signalsReactModule.useSignalState(var69)
	local _ = nil
	local var75 = if fFlagBuildLocalization and var74 ~= nil then var35:Format(var74) else var74
	local var76 = reactModule.useMemo(function() --[[ line: 427 ]]
		-- upvalues: var70 (ref), p16 (ref), var45 (ref), var57 (ref), var75 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var70 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p16.createUniverseOnFirstPrompt == true and (var45 == nil and var57 ~= nil))) then nil else { setupErrorText = var75 }
	end, {
		var70,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p16.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var57 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var45 else nil,
		var75
	})
	local var77 = reactModule.useMemo(function() --[[ line: 446 ]]
		-- upvalues: parseSessionStreamModule (copy), var47 (ref), var45 (ref), sessionId (write), universeId (write), placeId (write), var72 (ref), var57 (ref), var76 (ref), var62 (ref)
		return parseSessionStreamModule(var47, {
			sessionId = if var45 ~= nil then sessionId else var45.getCasSessionId() or sessionId,
			universeId = if var45 ~= nil then universeId else var45.universeId,
			placeId = if var45 ~= nil then placeId else var45.placeId,
			optimisticLocalTools = var72,
			pendingUserMessage = if var57 ~= nil then nil else var57.text,
			pendingUserMessageAfterSequenceId = if var57 ~= nil then nil else var57.afterSequenceId,
			liveAssistantMessage = var76,
			optimisticCancelledStartSequenceId = if var62 ~= nil then nil else var62.startSequenceId
		})
	end, {
		var47, var45, sessionId, universeId, placeId, var72, var57, var76, var62
	})
	local messages = var77.messages
	local subagentTaskState = var77.subagentTaskState
	local includesPublishTool = var77.includesPublishTool
	local var78 = messages[#messages]
	local var79 = if var70 == nil then var78 ~= nil and (var78.kind == "assistant_turn" and not var78.isDone) else true
	local var80 = var79 and hasPendingLocalToolResponse(var72)
	local activeTurnState = var77.activeTurnState
	reactModule.useEffect(function() --[[ line: 489 ]]
		-- upvalues: var70 (ref), activeTurnState (ref)
		if var70 == nil or activeTurnState == nil then
			return
		end
		var70.syncFromTurnState(activeTurnState)
	end, { var70, activeTurnState })
	reactModule.useEffect(function() --[[ line: 496 ]]
		-- upvalues: var77 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var77.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var77.includesPublishTool, placeId })
	local var81, var82 = reactModule.useBinding("")
	local var83, var84 = reactModule.useState(nil)
	local var85 = reactModule.useRef("")
	local var86 = reactModule.useRef(nil)
	local var87 = reactUtilsModule.useClock()
	local var88 = useChatScrollModule()
	local var89 = reactModule.useCallback(function(p20, p21) --[[ line: 511 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p20, p21)
	end, {})
	local var90 = reactModule.useCallback(function(p22) --[[ line: 515 ]]
		-- upvalues: var88 (ref), var45 (ref)
		local var105 = function() --[[ line: 516 ]]
			-- upvalues: p22 (ref)
			return if p22 == nil then false else p22()
		end
		
		var88.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 523 ]]
			-- upvalues: var45 (copy), var105 (ref), var88 (copy), p22 (ref)
			if var45 == nil then return end
			if var45.loadOlderHistory(var105) and var45.getNextHistoryPageToken() ~= nil and var88.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 529 ]]
					-- upvalues: p22 (copy), var88 (copy), var45 (copy), var105 (copy)
					if if p22 ~= nil then false else p22() then return end
					if var88.isViewportUnderfilled() then
						var45.loadOlderHistory(var105)
					end
				end)
			end
		end)
	end, { var45, var88 })
	local var91 = reactModule.useCallback(function(p23) --[[ line: 541 ]]
		-- upvalues: var45 (ref), var88 (ref), var90 (ref)
		task.delay(0.1, function() --[[ line: 542 ]]
			-- upvalues: p23 (ref), var45 (copy), var88 (copy), var90 (copy)
			if p23() then return end
			if var45 == nil then return end
			if var45.getNextHistoryPageToken() == nil then return end
			if var88.isViewportUnderfilled() then
				var90(p23)
				
				return
			end
		end)
	end, { var90, var88, var45 })
	local var92 = reactModule.useCallback(function(p24) --[[ line: 560 ]]
		-- upvalues: var45 (ref), var91 (ref)
		if var45 == nil then return end
		if var45.getNextHistoryPageToken() == nil then
			return
		end
		var91(p24)
	end, { var91, var45 })
	local var93 = reactModule.useRef(var92)
	var93.current = var92
	reactModule.useEffect(function() --[[ line: 572 ]]
		-- upvalues: var88 (ref), var90 (ref)
		var88.setOnScrolledToTop(function() --[[ line: 573 ]]
			-- upvalues: var90 (copy)
			var90(nil)
		end)
		
		return function() --[[ line: 576 ]]
			-- upvalues: var88 (copy)
			var88.setOnScrolledToTop(nil)
		end
	end, { var88.setOnScrolledToTop, var90 })
	reactModule.useEffect(function() --[[ line: 581 ]]
		-- upvalues: var43 (ref), var45 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var52 (write), sessionId (write), universeId (write), var93 (ref), creatorAgentChatStore (ref), var40 (ref), placeId (write)
		if var43 and var45 ~= nil then
			local var106 = false
			
			local function _(value) --[[ line: 596 | named "setHistoryLoading" ]]
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var52 (copy), var106 (write), var45 (copy), sessionId (copy), universeId (copy), var43 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil and not var106 then
					var52({
						session = var45,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var43,
						isLoading = value
					})
					
					return
				end
			end
			
			local var107 = not (var45.hasLoadedHistory() and #var45.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
				var52({
					session = var45,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var43,
					isLoading = var107
				})
			end
			local function isHydrateCancelled() --[[ line: 611 ]]
				-- upvalues: var106 (write), sessionId (ref), var45 (copy)
				return if var106 then true elseif sessionId == nil or sessionId == "" then false else var45.getCasSessionId() ~= sessionId
			end
			
			local _ = function() --[[ line: 620 | named "continueAfterSessionReady" ]]
				-- upvalues: var106 (write), sessionId (ref), var45 (copy), var93 (copy), isHydrateCancelled (ref)
				local var110
				if var106 then
					var110 = true
				elseif sessionId == nil or sessionId == "" then
					var110 = false
				else
					var110 = var45.getCasSessionId() ~= sessionId
					var110 = nil
				end
				if var110 then
					return
				end
				var93.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p25) --[[ line: 627 ]]
				-- upvalues: var45 (copy), var106 (write), sessionId (ref), var93 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var52 (copy), sessionId (copy), universeId (copy), var43 (copy)
				var45.setCasSessionId(p25)
				
				if var45.hasLoadedHistory() and #var45.getMergedHistory(false) > 0 then
					local var111
					if var106 then
						var111 = true
					elseif sessionId == nil or sessionId == "" then
						var111 = false
					else
						var111 = var45.getCasSessionId() ~= sessionId
						var111 = nil
					end
					if not var111 then
						var93.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
						if var106 then return end
						var52({
							isLoading = false,
							session = var45,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var43
						})
					end
					return
				elseif var45.refreshSession(isHydrateCancelled) then
					local var112
					if var106 then
						var112 = true
					elseif sessionId == nil or sessionId == "" then
						var112 = false
					else
						var112 = var45.getCasSessionId() ~= sessionId
						var112 = nil
					end
					if not var112 then
						if var106 then
							var112 = true
						elseif sessionId == nil or sessionId == "" then
							var112 = false
						else
							var112 = var45.getCasSessionId() ~= sessionId
							var112 = nil
						end
						if not var112 then
							var93.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
					if var106 then return end
					var52({
						isLoading = false,
						session = var45,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var43
					})
				end
			end
			
			task.spawn(function() --[[ line: 640 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var45 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var52 (copy), var106 (write), var43 (copy), creatorAgentChatStore (copy), sessionId (ref), var40 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var45.hasLoadedHistory() and #var45.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
						if var106 then return end
						var52({
							isLoading = false,
							session = var45,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var43
						})
					end
					return
				else
					local var113 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var113.state(false).status == "pending" do
						local var114
						if var106 then
							var114 = true
						elseif sessionId == nil or sessionId == "" then
							var114 = false
						else
							var114 = var45.getCasSessionId() ~= sessionId
							var114 = nil
						end
						if var114 then break end
						task.wait()
					end
					local result
					if var106 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var45.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var113.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
							if var106 then return end
							var52({
								isLoading = false,
								session = var45,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var43
							})
						end
						return
					else
						result = var113.state(false).result
						local var115 = if result ~= nil then nil else result.sessions
						local var116 = if typeof(var115) == "table" then var115[1] else nil
						local var117 = if typeof(var116) == "table" then var116.sessionId else nil
						
						if typeof(var117) == "string" and var117 ~= "" then
							var40({
								universeId = universeId,
								placeId = placeId,
								sessionId = var117
							})
							
							return
						end
						var45.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
							if var106 then return end
							var52({
								isLoading = false,
								session = var45,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var43
							})
						end
					end
				end
			end)
			
			return function() --[[ line: 684 ]]
				-- upvalues: var106 (write)
				var106 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var52 ~= nil then
			var52({
				isLoading = false,
				session = var45,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var43
			})
		end
	end, {
		var45, sessionId, universeId, placeId, creatorAgentChatStore, var43
	})
	reactModule.useEffect(function() --[[ line: 689 ]]
		-- upvalues: var45 (ref), sessionId (write), var93 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var41 (ref), appLifecycleObserverService (copy)
		if var45 == nil then
			return
		end
		local var118 = false
		
		local function refreshKnownSession() --[[ line: 694 ]]
			-- upvalues: var45 (copy), sessionId (copy), var118 (write), var93 (copy)
			local casSessionId = var45.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 702 ]]
				-- upvalues: var45 (copy), var118 (copy), var93 (copy)
				if var45.refreshSession(function() --[[ line: 703 ]]
					-- upvalues: var118 (copy)
					return var118
				end) and not var118 then
					var93.current(function() --[[ line: 706 ]]
						-- upvalues: var118 (copy)
						return var118
					end)
				end
			end)
		end
		
		local var120 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 713 ]]
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var41 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var41 ~= nil then
				var41.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 724 ]]
			-- upvalues: var118 (write), var120 (ref), onUnhideConnection (ref)
			var118 = true
			var120:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var45, sessionId, var41 })
	reactModule.useEffect(function() --[[ line: 731 ]]
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var43 (ref), var88 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var43 then
			var88.lockToBottom()
			
			return
		end
	end, { var43, var45, sessionId, var88 })
	local var94 = reactModule.useCallback(function(p26) --[[ line: 738 ]]
		-- upvalues: var85 (ref), var82 (ref), var84 (ref)
		var85.current = p26
		var82(p26)
		var84(nil)
	end, { var82, var84 })
	local var95 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p27) --[[ line: 747 ]]
		-- upvalues: var66 (ref), var65 (ref), var45 (ref), sessionId (write), var85 (ref), var94 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var35 (ref), var84 (ref)
		return function(p28, p29) --[[ line: 748 ]]
			-- upvalues: var66 (copy), p27 (ref), var65 (copy), var45 (copy), sessionId (copy), var85 (copy), var94 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var35 (copy), var84 (copy)
			if var66.current == p27 then
				local current = var65.current
				local var123 = sessionId
				
				if not (if current == nil or current.session ~= var45 then false else var123 == nil or var123 == "" or (if current.sessionId ~= var123 then current.sessionId == nil and current.session.getCasSessionId() == var123 else true)) then return end
				if p28 ~= nil and var85.current == "" then
					var94(p28)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p29)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var35:Format(toolResultFailureComposerError)
				end
				var84(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var45,
		sessionId,
		var94,
		var84,
		var35
	}) else nil
	local var96 = reactModule.useCallback(function(p30, p31, p32, p33) --[[ line: 776 ]]
		-- upvalues: var66 (ref), var68 (ref), var67 (ref), var58 (ref), p16 (ref), var89 (ref), var94 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var35 (ref), var84 (ref), var88 (ref), sessionId (write), var38 (ref)
		if var66.current ~= p30 then return end
		var68(nil)
		var67.current = nil
		var58(nil)
		
		if p31 == nil then
			if p33.placeId ~= nil then
				var89(p33.placeId, "Completed")
			end
			var88.scrollToBottomAfterSend()
			local casSessionId = p33.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p16.createUniverseOnFirstPrompt and sessionId == nil and p33.universeId ~= nil then
					local t = {
						universeId = p33.universeId,
						placeId = p33.placeId,
						sessionId = casSessionId
					}
					var38(t)
					
					if p16.onProjectResolved ~= nil then
						p16.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 836 ]]
					-- upvalues: p33 (ref), var66 (copy), p30 (ref)
					p33.refreshSession(function() --[[ line: 837 ]]
						-- upvalues: var66 (copy), p30 (copy)
						return var66.current ~= p30
					end)
				end)
			end
			return
		elseif p16.onPromptFailure ~= nil then
			p16.onPromptFailure(p31.errorCode, p31.outOfCreditsReason)
		end
		if p33.placeId ~= nil then
			var89(p33.placeId, "Idle")
		end
		if p32 ~= nil then
			var94(p32)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p31)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var35:Format(promptFailureComposerError)
			end
			var84(promptFailureComposerError)
		end
		task.spawn(function() --[[ line: 807 ]]
			-- upvalues: p33 (ref), var66 (copy), p30 (ref)
			p33.refreshSession(function() --[[ line: 808 ]]
				-- upvalues: var66 (copy), p30 (copy)
				return var66.current ~= p30
			end)
		end)
	end, {
		p16.createUniverseOnFirstPrompt, p16.onPromptFailure, p16.onProjectResolved,
		sessionId, var89, var38, var88, var94, var84, var68, var58, var35
	})
	local var97 = reactModule.useRef(var43)
	reactModule.useEffect(function() --[[ line: 861 ]]
		-- upvalues: var43 (ref), var97 (ref), var79 (ref), var70 (ref), var88 (ref)
		local var128 = var43 and not var97.current
		var97.current = var43
		
		if not var43 then return end
		if var128 or var79 or var70 ~= nil then
			var88.scrollToBottomUnconditionally()
			task.defer(var88.scrollToBottomUnconditionally)
			task.delay(0.15, var88.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var43,
		var79,
		var70,
		#messages,
		var88
	})
	reactModule.useEffect(function() --[[ line: 887 ]]
		-- upvalues: var64 (ref), var65 (ref), var45 (ref), sessionId (write), var62 (ref), var66 (ref), var67 (ref), placeId (write), var89 (ref), creatorAgentChatModule_1 (copy), var96 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var95 (write), var42 (ref), var68 (ref), var88 (ref), var77 (ref), var70 (ref), creatorAgentChatStore (ref), var79 (ref)
		local var129
		if var64.current ~= nil then
			local current = var65.current
			var129 = sessionId
			
			if if current == nil or current.session ~= var45 then false else var129 == nil or var129 == "" or (if current.sessionId ~= var129 then current.sessionId == nil and current.session.getCasSessionId() == var129 else true) then return end
		end
		if var62 ~= nil then return end
		if var45 == nil then return end
		local var131
		local casSessionId = var45.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var131 = casSessionId
		else
			var129 = var45.universeId
			local placeId_1 = var45.placeId
			var131 = if var129 == nil or placeId_1 == nil then nil else `{var129}:{placeId_1}`
		end
		if var131 == nil then return end
		local function current(p34, p35) --[[ line: 909 | named "attachResumedTurn" ]]
			-- upvalues: var66 (copy), var67 (copy), placeId (copy), var89 (copy), creatorAgentChatModule_1 (copy), var45 (copy), var96 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var95 (copy), var42 (copy), var68 (copy), var88 (copy)
			var66.current += 1
			local current = var66.current
			var67.current = p35
			
			if placeId ~= nil then
				var89(placeId, "Loading")
			end
			local var133 = creatorAgentChatModule_1.createResumedAssistantTurn(var45, p34, function(p36) --[[ line: 919 ]]
				-- upvalues: var96 (copy), current (ref), var45 (copy)
				var96(current, p36, nil, var45)
			end, if p35 ~= nil then nil else p35 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var95(current) else nil, var42)
			var68(var133, var45)
			var133.start()
			var88.scrollToBottomUnconditionally()
		end
		
		if var77.activeTurnState == nil or var77.activeTurnItemIndex == nil or var77.activeTurnState.isDone then
			var67.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var131)
			var129 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var132 = casSessionId ~= nil and (var129 ~= nil and not var129.isDone)
			
			if not var79 and not var132 then return end
			if var132 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var77.activeTurnStartSequenceId
			
			if var67.current == casSessionId and var70 ~= nil then return end
			var129 = creatorAgentChatStore.resumeTurnFromHistory(var131, var77.activeTurnState, var77.activeTurnSequenceIds)
			
			if var129 ~= nil then
				current(var129, casSessionId)
			end
		end
	end, {
		var77, var45, sessionId, creatorAgentChatStore, var79, var70, placeId, var89,
		var96, var88, var68, var62, var95, var42
	})
	local var98 = reactModule.useCallback(function(p37, p38, p39, p40) --[[ line: 987 ]]
		-- upvalues: var58 (ref), creatorAgentChatModule_1 (copy), var96 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var95 (write), var42 (ref), var89 (ref), var68 (ref), var88 (ref)
		var58({ text = p38, afterSequenceId = p40 })
		local _ = nil
		local var134 = creatorAgentChatModule_1.createLiveAssistantTurn(p37, p38, function(p41) --[[ line: 994 ]]
			-- upvalues: var96 (copy), p39 (ref), p38 (ref), p37 (ref)
			var96(p39, p41, p38, p37)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var95(p39) else nil, var42)
		
		if p37.placeId ~= nil then
			var89(p37.placeId, "Loading")
		end
		var68(var134, p37)
		var88.scrollToBottomAfterSend()
		var134.start()
	end, {
		var96, var89, var88, var68, var58, var95, var42
	})
	local var99 = reactModule.useCallback(function(p42, p43, p44) --[[ line: 1022 ]]
		-- upvalues: var58 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var66 (ref), universeConfigurationModule (copy), var38 (ref), p16 (ref), creatorAgentChatStore (ref), sessionId (write), var98 (ref), var68 (ref), var94 (ref), var84 (ref), var36 (write)
		var58({ text = p42, afterSequenceId = p44 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p46) --[[ line: 1030 ]]
			-- upvalues: debug (copy), processTime (ref), var66 (copy), p43 (ref), universeConfigurationModule (copy), var38 (copy), p16 (copy), creatorAgentChatStore (copy), sessionId (copy), var98 (copy), p42 (ref), p44 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p46.universeId,
				rootPlaceId = p46.rootPlaceId
			})
			
			if var66.current == p43 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p46.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 1045 ]]
					-- upvalues: universeConfigurationStore (ref), p46 (ref)
					return universeConfigurationStore.setTeamCreate(p46.universeId, true)
				end):andThen(function() --[[ line: 1048 ]]
					-- upvalues: var66 (copy), p43 (copy), p46 (ref), var38 (copy), p16 (copy), creatorAgentChatStore (copy), sessionId (copy), var98 (copy), p42 (copy), p44 (copy)
					if var66.current ~= p43 then
						return nil
					end
					local t = { universeId = p46.universeId, placeId = p46.rootPlaceId }
					var38(t)
					
					if p16.onProjectResolved ~= nil then
						p16.onProjectResolved(t)
					end
					var98(creatorAgentChatStore.getSessionForProject(p46.universeId, p46.rootPlaceId, sessionId), p42, p43, p44)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p45) --[[ line: 1071 ]]
			-- upvalues: debug (copy), processTime (ref), var66 (copy), p43 (ref), var68 (copy), var58 (copy), var94 (copy), p42 (ref), var84 (copy), var36 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p45
			})
			
			if var66.current == p43 then
				var68(nil)
				var58(nil)
				var94(p42)
				var84(var36)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p16.onProjectResolved, var68, var94, var84,
		var38, var58, var98, var36
	})
	local var100 = reactModule.useCallback(function() --[[ line: 1100 ]]
		-- upvalues: var85 (ref), var94 (ref), var79 (ref), var65 (ref), var45 (ref), sessionId (write), var64 (ref), var86 (ref), var88 (ref), p16 (ref), universeId (write), var66 (ref), var60 (ref), var99 (ref), var77 (ref), var98 (ref)
		local replaced = string.gsub(var85.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var94("")
			
			return false
		elseif var79 then
			local current = var65.current
			local var139 = sessionId
			local var140 = if if current == nil or current.session ~= var45 then false else var139 == nil or var139 == "" or (if current.sessionId ~= var139 then current.sessionId == nil and current.session.getCasSessionId() == var139 else true) then var64.current else nil
			
			if var140 == nil or not var140.trySubmitComposerText(replaced) then
				return false
			end
			var94("")
			
			if var86.current then
				var86.current.releaseFocus()
			end
			var88.scrollToBottomAfterSend()
			
			return true
		else
			local var141 = p16.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var141 and var45 == nil then
				return false
			end
			var88.captureStickToBottomForSend()
			var66.current += 1
			local current = var66.current
			var60(nil)
			var94("")
			
			if var86.current then
				var86.current.releaseFocus()
			end
			if var141 then
				var99(replaced, current, var77.latestSequenceId)
			else
				var98(var45, replaced, current, var77.latestSequenceId)
			end
			return true
		end
	end, {
		var45, sessionId, universeId, var79, var88, var94, var99, var98,
		p16.createUniverseOnFirstPrompt, var60, var77
	})
	local var101 = reactModule.useCallback(function() --[[ line: 1157 ]]
		-- upvalues: var65 (ref), var45 (ref), sessionId (write), var64 (ref), var66 (ref), var68 (ref), var67 (ref), var58 (ref), var60 (ref), var77 (ref), placeId (write), var89 (ref)
		local current = var65.current
		local var142 = if if current == nil or current.session ~= var45 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var64.current else nil
		
		if var142 == nil then return end
		var66.current += 1
		var142.stop()
		var68(nil)
		var67.current = nil
		var58(nil)
		var60({
			session = var45,
			sessionId = var45.getCasSessionId(),
			startSequenceId = var77.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var89(placeId, "Idle")
		end
	end, {
		var45, sessionId, placeId, var89, var68, var58, var60, var77
	})
	local var102 = p16.autoFocusComposer == nil or p16.autoFocusComposer
	local var103 = if p16.focusComposerWhen == nil then var102 else p16.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1192 ]]
		-- upvalues: var102 (ref), var103 (ref), var86 (ref)
		if var102 and var103 then
			local var143 = false
			
			local var144 = function() --[[ line: 1197 ]]
				-- upvalues: var143 (write)
				return var143
			end
			
			local var145 = 8
			
			local function tryFocus() --[[ line: 186 ]]
				-- upvalues: var144 (ref), var86 (ref), var145 (write), tryFocus (ref)
				if var144() then return end
				local current = var86.current
				
				if current then
					current.focus()
					
					return
				end
				var31 -= 1
				
				if var31 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 1200 ]]
				-- upvalues: var143 (write)
				var143 = true
			end
		end
		return function() --[[ line: 1194 ]] end
	end, { var102, var103 })
	
	return {
		messages = messages,
		localToolActions = var73,
		composerText = var81,
		composerErrorText = var83,
		setComposerText = var94,
		isAssistantResponding = var79,
		canStopAssistantResponse = var70 ~= nil,
		canSendWhileResponding = var80,
		sendMessage = var100,
		stopAssistantResponse = var101,
		setScrollingFrame = var88.setScrollingFrame,
		textBoxRef = var86,
		clockBinding = var87,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p47) --[[ line: 1205 ]]
			-- upvalues: placeId (write), var41 (ref), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var147 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var41 ~= nil) then function() --[[ line: 1216 ]]
				-- upvalues: var41 (ref)
				var41.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p47, true, var147) and var147 ~= nil and var41 ~= nil then
				var41.current = false
			end
		end, { placeId, var41 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var56
	}
end