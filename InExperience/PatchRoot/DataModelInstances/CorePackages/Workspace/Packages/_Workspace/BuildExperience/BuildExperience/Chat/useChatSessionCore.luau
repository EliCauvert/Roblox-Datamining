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
	local var30 = 8
	
	local function tryFocus() --[[ line: 186 ]]
		-- upvalues: p7 (ref), p6 (ref), var30 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var30 -= 1
		
		if var30 > 0 then
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

return function(p14) --[[ line: 234 | named "useChatSessionCore" ]]
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), creatorAgentChatModule (ref), var28 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var25 (ref), var26 (ref), var27 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var33 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var34 = if fFlagBuildLocalization then var33:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var35, var36 = reactModule.useState(nil)
	local var37, var38 = reactModule.useState(nil)
	local var39 = nil
	local var40 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var41 = reactModule.useRef(true)
		var39 = var41
		var40 = reactModule.useCallback(function() --[[ line: 251 ]]
			-- upvalues: var41 (ref)
			return var41.current
		end, { var41 })
	end
	local placeId = p14.placeId
	local universeId = p14.universeId
	local sessionId = p14.sessionId
	
	if var35 ~= nil then
		placeId = var35.placeId
		universeId = var35.universeId
		sessionId = var35.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var37 ~= nil and var37.universeId == universeId) and var37.placeId == placeId then
		sessionId = var37.sessionId
	end
	local var42 = p14.hydrateHistoryWhen == nil or p14.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var44 = reactModule.useMemo(function() --[[ line: 274 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 281 ]]
		-- upvalues: var44 (ref), sessionId (write)
		if var44 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var44.setCasSessionId(sessionId)
	end, { var44, sessionId })
	local var45 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 288 ]]
		-- upvalues: var44 (ref), var28 (copy), signalsModule (copy)
		return if var44 == nil then var28 else signalsModule.createComputed(function(p15) --[[ line: 293 ]]
			-- upvalues: var44 (copy)
			return {
				session = var44,
				sessionId = var44.getCasSessionId(),
				events = var44.getMergedHistory(p15)
			}
		end)
	end, { var44 }))
	local var46 = if var45.session == var44 and var45.sessionId == (if var44 ~= nil then nil else var44.getCasSessionId()) then var45.events else {}
	local var47 = sessionId ~= nil and sessionId ~= ""
	local var48 = var47 or (universeId ~= nil and universeId ~= 0)
	local var49 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var49 then
		var49 = var42
		
		if var49 then
			var49 = false
			
			if var44 ~= nil then
				var49 = var48
				
				if var49 then
					var49 = not (var44.hasLoadedHistory() and #var46 > 0)
				end
			end
		end
	end
	local var50 = nil
	local var51 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var52, var53 = reactModule.useState(function() --[[ line: 318 ]]
			-- upvalues: var44 (ref), sessionId (write), universeId (write), var42 (ref), var49 (ref)
			return {
				session = var44,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var42,
				isLoading = var49
			}
		end)
		var50 = var52
		var51 = var53
	end
	local var54 = var50 ~= nil and (var50.session == var44 and (var50.sessionId == sessionId and (var50.universeId == universeId and var50.hydrateHistoryWhen == var42)))
	local var55 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var54 then var50.isLoading else var49) or (var44 ~= nil and var44.getNextHistoryPageToken() ~= nil))
	local var56, var57 = reactModule.useState(nil)
	local var58, var59 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 357 ]]
		-- upvalues: var59 (ref)
		var59(nil)
	end, { var44, sessionId })
	local var60 = sessionId
	local var61 = if if var58 == nil or var58.session ~= var44 then false else var60 == nil or var60 == "" or (if var58.sessionId ~= var60 then var58.sessionId == nil and var58.session.getCasSessionId() == var60 else true) then var58 else nil
	var62, var60 = reactModule.useState(nil)
	local var63 = reactModule.useRef(nil)
	local var64 = reactModule.useRef(nil)
	local var65 = reactModule.useRef(0)
	local var66 = reactModule.useRef(nil)
	local var67 = reactModule.useCallback(function(p16, p17) --[[ line: 372 ]]
		-- upvalues: var63 (ref), var64 (ref), var60 (ref)
		assert(if p16 ~= nil then p17 ~= nil else true, "Active turns require an owning session")
		var63.current = p16
		var64.current = if p16 ~= nil then nil else { session = p17, sessionId = p17.getCasSessionId() }
		var60(p16)
	end, { var60 })
	local current = var64.current
	local var68 = sessionId
	local var69 = if if current == nil or current.session ~= var44 then false else var68 == nil or var68 == "" or (if current.sessionId ~= var68 then current.sessionId == nil and current.session.getCasSessionId() == var68 else true) then var62 else nil
	reactModule.useLayoutEffect(function() --[[ line: 389 ]]
		-- upvalues: var62 (ref), var64 (ref), var44 (ref), sessionId (write), var65 (ref), var66 (ref), var67 (ref), var57 (ref), var59 (ref)
		if var62 ~= nil then
			local current = var64.current
			local var103 = sessionId
			
			if if current == nil or current.session ~= var44 then false else var103 == nil or var103 == "" or (if current.sessionId ~= var103 then current.sessionId == nil and current.session.getCasSessionId() == var103 else true) then
				return
			else
				var65.current += 1
				var66.current = nil
				var62.detach()
				var67(nil, nil)
				var57(nil)
				var59(nil)
			end
		end
	end, { var44, sessionId, var62, var67 })
	local var70 = if var69 ~= nil then var25 else var69.getOptimisticLocalTools
	current = if var69 ~= nil then var26 else var69.getLocalToolActions
	var68 = if var69 ~= nil then var27 else var69.getSetupErrorText
	local var71 = signalsReactModule.useSignalState(var70)
	local var72 = signalsReactModule.useSignalState(current)
	local var73 = signalsReactModule.useSignalState(var68)
	local _ = nil
	local var74 = if fFlagBuildLocalization and var73 ~= nil then var33:Format(var73) else var73
	local var75 = reactModule.useMemo(function() --[[ line: 423 ]]
		-- upvalues: var69 (ref), p14 (ref), var44 (ref), var56 (ref), var74 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var69 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p14.createUniverseOnFirstPrompt == true and (var44 == nil and var56 ~= nil))) then nil else { setupErrorText = var74 }
	end, {
		var69,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p14.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var56 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var44 else nil,
		var74
	})
	local var76 = reactModule.useMemo(function() --[[ line: 442 ]]
		-- upvalues: parseSessionStreamModule (copy), var46 (ref), var44 (ref), sessionId (write), universeId (write), placeId (write), var71 (ref), var56 (ref), var75 (ref), var61 (ref)
		return parseSessionStreamModule(var46, {
			sessionId = if var44 ~= nil then sessionId else var44.getCasSessionId() or sessionId,
			universeId = if var44 ~= nil then universeId else var44.universeId,
			placeId = if var44 ~= nil then placeId else var44.placeId,
			optimisticLocalTools = var71,
			pendingUserMessage = if var56 ~= nil then nil else var56.text,
			pendingUserMessageAfterSequenceId = if var56 ~= nil then nil else var56.afterSequenceId,
			liveAssistantMessage = var75,
			optimisticCancelledStartSequenceId = if var61 ~= nil then nil else var61.startSequenceId
		})
	end, {
		var46, var44, sessionId, universeId, placeId, var71, var56, var75, var61
	})
	local messages = var76.messages
	local subagentTaskState = var76.subagentTaskState
	local includesPublishTool = var76.includesPublishTool
	local var77 = messages[#messages]
	local var78 = if var69 == nil then var77 ~= nil and (var77.kind == "assistant_turn" and not var77.isDone) else true
	local var79 = var78 and hasPendingLocalToolResponse(var71)
	local activeTurnState = var76.activeTurnState
	reactModule.useEffect(function() --[[ line: 485 ]]
		-- upvalues: var69 (ref), activeTurnState (ref)
		if var69 == nil or activeTurnState == nil then
			return
		end
		var69.syncFromTurnState(activeTurnState)
	end, { var69, activeTurnState })
	reactModule.useEffect(function() --[[ line: 492 ]]
		-- upvalues: var76 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var76.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var76.includesPublishTool, placeId })
	local var80, var81 = reactModule.useBinding("")
	local var82, var83 = reactModule.useState(nil)
	local var84 = reactModule.useRef("")
	local var85 = reactModule.useRef(nil)
	local var86 = reactUtilsModule.useClock()
	local var87 = useChatScrollModule()
	local var88 = reactModule.useCallback(function(p18, p19) --[[ line: 507 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p18, p19)
	end, {})
	local var89 = reactModule.useCallback(function(p20) --[[ line: 511 ]]
		-- upvalues: var87 (ref), var44 (ref)
		local var104 = function() --[[ line: 512 ]]
			-- upvalues: p20 (ref)
			return if p20 == nil then false else p20()
		end
		
		var87.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 519 ]]
			-- upvalues: var44 (copy), var104 (ref), var87 (copy), p20 (ref)
			if var44 == nil then return end
			if var44.loadOlderHistory(var104) and var44.getNextHistoryPageToken() ~= nil and var87.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 525 ]]
					-- upvalues: p20 (copy), var87 (copy), var44 (copy), var104 (copy)
					if if p20 ~= nil then false else p20() then return end
					if var87.isViewportUnderfilled() then
						var44.loadOlderHistory(var104)
					end
				end)
			end
		end)
	end, { var44, var87 })
	local var90 = reactModule.useCallback(function(p21) --[[ line: 537 ]]
		-- upvalues: var44 (ref), var87 (ref), var89 (ref)
		task.delay(0.1, function() --[[ line: 538 ]]
			-- upvalues: p21 (ref), var44 (copy), var87 (copy), var89 (copy)
			if p21() then return end
			if var44 == nil then return end
			if var44.getNextHistoryPageToken() == nil then return end
			if var87.isViewportUnderfilled() then
				var89(p21)
				
				return
			end
		end)
	end, { var89, var87, var44 })
	local var91 = reactModule.useCallback(function(p22) --[[ line: 556 ]]
		-- upvalues: var44 (ref), var90 (ref)
		if var44 == nil then return end
		if var44.getNextHistoryPageToken() == nil then
			return
		end
		var90(p22)
	end, { var90, var44 })
	local var92 = reactModule.useRef(var91)
	var92.current = var91
	reactModule.useEffect(function() --[[ line: 568 ]]
		-- upvalues: var87 (ref), var89 (ref)
		var87.setOnScrolledToTop(function() --[[ line: 569 ]]
			-- upvalues: var89 (copy)
			var89(nil)
		end)
		
		return function() --[[ line: 572 ]]
			-- upvalues: var87 (copy)
			var87.setOnScrolledToTop(nil)
		end
	end, { var87.setOnScrolledToTop, var89 })
	reactModule.useEffect(function() --[[ line: 577 ]]
		-- upvalues: var42 (ref), var44 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var51 (write), sessionId (write), universeId (write), var92 (ref), creatorAgentChatStore (ref), var38 (ref), placeId (write)
		if var42 and var44 ~= nil then
			local var105 = false
			
			local function _(value) --[[ line: 592 | named "setHistoryLoading" ]]
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var51 (copy), var105 (write), var44 (copy), sessionId (copy), universeId (copy), var42 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil and not var105 then
					var51({
						session = var44,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var42,
						isLoading = value
					})
					
					return
				end
			end
			
			local var106 = not (var44.hasLoadedHistory() and #var44.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
				var51({
					session = var44,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var42,
					isLoading = var106
				})
			end
			local function isHydrateCancelled() --[[ line: 607 ]]
				-- upvalues: var105 (write), sessionId (ref), var44 (copy)
				return if var105 then true elseif sessionId == nil or sessionId == "" then false else var44.getCasSessionId() ~= sessionId
			end
			
			local _ = function() --[[ line: 616 | named "continueAfterSessionReady" ]]
				-- upvalues: var105 (write), sessionId (ref), var44 (copy), var92 (copy), isHydrateCancelled (ref)
				local var109
				if var105 then
					var109 = true
				elseif sessionId == nil or sessionId == "" then
					var109 = false
				else
					var109 = var44.getCasSessionId() ~= sessionId
					var109 = nil
				end
				if var109 then
					return
				end
				var92.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p23) --[[ line: 623 ]]
				-- upvalues: var44 (copy), var105 (write), sessionId (ref), var92 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var51 (copy), sessionId (copy), universeId (copy), var42 (copy)
				var44.setCasSessionId(p23)
				
				if var44.hasLoadedHistory() and #var44.getMergedHistory(false) > 0 then
					local var110
					if var105 then
						var110 = true
					elseif sessionId == nil or sessionId == "" then
						var110 = false
					else
						var110 = var44.getCasSessionId() ~= sessionId
						var110 = nil
					end
					if not var110 then
						var92.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
						if var105 then return end
						var51({
							isLoading = false,
							session = var44,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var42
						})
					end
					return
				elseif var44.refreshSession(isHydrateCancelled) then
					local var111
					if var105 then
						var111 = true
					elseif sessionId == nil or sessionId == "" then
						var111 = false
					else
						var111 = var44.getCasSessionId() ~= sessionId
						var111 = nil
					end
					if not var111 then
						if var105 then
							var111 = true
						elseif sessionId == nil or sessionId == "" then
							var111 = false
						else
							var111 = var44.getCasSessionId() ~= sessionId
							var111 = nil
						end
						if not var111 then
							var92.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
					if var105 then return end
					var51({
						isLoading = false,
						session = var44,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var42
					})
				end
			end
			
			task.spawn(function() --[[ line: 636 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var44 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var51 (copy), var105 (write), var42 (copy), creatorAgentChatStore (copy), sessionId (ref), var38 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var44.hasLoadedHistory() and #var44.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
						if var105 then return end
						var51({
							isLoading = false,
							session = var44,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var42
						})
					end
					return
				else
					local var112 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var112.state(false).status == "pending" do
						local var113
						if var105 then
							var113 = true
						elseif sessionId == nil or sessionId == "" then
							var113 = false
						else
							var113 = var44.getCasSessionId() ~= sessionId
							var113 = nil
						end
						if var113 then break end
						task.wait()
					end
					local result
					if var105 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var44.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var112.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
							if var105 then return end
							var51({
								isLoading = false,
								session = var44,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var42
							})
						end
						return
					else
						result = var112.state(false).result
						local var114 = if result ~= nil then nil else result.sessions
						local var115 = if typeof(var114) == "table" then var114[1] else nil
						local var116 = if typeof(var115) == "table" then var115.sessionId else nil
						
						if typeof(var116) == "string" and var116 ~= "" then
							var38({
								universeId = universeId,
								placeId = placeId,
								sessionId = var116
							})
							
							return
						end
						var44.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
							if var105 then return end
							var51({
								isLoading = false,
								session = var44,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var42
							})
						end
					end
				end
			end)
			
			return function() --[[ line: 680 ]]
				-- upvalues: var105 (write)
				var105 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var51 ~= nil then
			var51({
				isLoading = false,
				session = var44,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var42
			})
		end
	end, {
		var44, sessionId, universeId, placeId, creatorAgentChatStore, var42
	})
	reactModule.useEffect(function() --[[ line: 685 ]]
		-- upvalues: var44 (ref), sessionId (write), var92 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var39 (write), appLifecycleObserverService (copy)
		if var44 == nil then
			return
		end
		local var117 = false
		
		local function refreshKnownSession() --[[ line: 690 ]]
			-- upvalues: var44 (copy), sessionId (copy), var117 (write), var92 (copy)
			local casSessionId = var44.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 698 ]]
				-- upvalues: var44 (copy), var117 (copy), var92 (copy)
				if var44.refreshSession(function() --[[ line: 699 ]]
					-- upvalues: var117 (copy)
					return var117
				end) and not var117 then
					var92.current(function() --[[ line: 702 ]]
						-- upvalues: var117 (copy)
						return var117
					end)
				end
			end)
		end
		
		local var119 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 709 ]]
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var39 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var39 ~= nil then
				var39.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 720 ]]
			-- upvalues: var117 (write), var119 (ref), onUnhideConnection (ref)
			var117 = true
			var119:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var44, sessionId, var39 })
	reactModule.useEffect(function() --[[ line: 727 ]]
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var42 (ref), var87 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var42 then
			var87.lockToBottom()
			
			return
		end
	end, { var42, var44, sessionId, var87 })
	local var93 = reactModule.useCallback(function(p24) --[[ line: 734 ]]
		-- upvalues: var84 (ref), var81 (ref), var83 (ref)
		var84.current = p24
		var81(p24)
		var83(nil)
	end, { var81, var83 })
	local var94 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p25) --[[ line: 743 ]]
		-- upvalues: var65 (ref), var64 (ref), var44 (ref), sessionId (write), var84 (ref), var93 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var33 (ref), var83 (ref)
		return function(p26, p27) --[[ line: 744 ]]
			-- upvalues: var65 (copy), p25 (ref), var64 (copy), var44 (copy), sessionId (copy), var84 (copy), var93 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var33 (copy), var83 (copy)
			if var65.current == p25 then
				local current = var64.current
				local var122 = sessionId
				
				if not (if current == nil or current.session ~= var44 then false else var122 == nil or var122 == "" or (if current.sessionId ~= var122 then current.sessionId == nil and current.session.getCasSessionId() == var122 else true)) then return end
				if p26 ~= nil and var84.current == "" then
					var93(p26)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p27)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var33:Format(toolResultFailureComposerError)
				end
				var83(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var44,
		sessionId,
		var93,
		var83,
		var33
	}) else nil
	local var95 = reactModule.useCallback(function(p28, p29, p30, p31) --[[ line: 772 ]]
		-- upvalues: var65 (ref), var67 (ref), var66 (ref), var57 (ref), p14 (ref), var88 (ref), var93 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var33 (ref), var83 (ref), var87 (ref), sessionId (write), var36 (ref)
		if var65.current ~= p28 then return end
		var67(nil)
		var66.current = nil
		var57(nil)
		
		if p29 == nil then
			if p31.placeId ~= nil then
				var88(p31.placeId, "Completed")
			end
			var87.scrollToBottomAfterSend()
			local casSessionId = p31.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p14.createUniverseOnFirstPrompt and sessionId == nil and p31.universeId ~= nil then
					local t = {
						universeId = p31.universeId,
						placeId = p31.placeId,
						sessionId = casSessionId
					}
					var36(t)
					
					if p14.onProjectResolved ~= nil then
						p14.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 832 ]]
					-- upvalues: p31 (ref), var65 (copy), p28 (ref)
					p31.refreshSession(function() --[[ line: 833 ]]
						-- upvalues: var65 (copy), p28 (copy)
						return var65.current ~= p28
					end)
				end)
			end
			return
		elseif p14.onPromptFailure ~= nil then
			p14.onPromptFailure(p29.errorCode, p29.outOfCreditsReason)
		end
		if p31.placeId ~= nil then
			var88(p31.placeId, "Idle")
		end
		if p30 ~= nil then
			var93(p30)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p29)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var33:Format(promptFailureComposerError)
			end
			var83(promptFailureComposerError)
		end
		task.spawn(function() --[[ line: 803 ]]
			-- upvalues: p31 (ref), var65 (copy), p28 (ref)
			p31.refreshSession(function() --[[ line: 804 ]]
				-- upvalues: var65 (copy), p28 (copy)
				return var65.current ~= p28
			end)
		end)
	end, {
		p14.createUniverseOnFirstPrompt, p14.onPromptFailure, p14.onProjectResolved,
		sessionId, var88, var36, var87, var93, var83, var67, var57, var33
	})
	local var96 = reactModule.useRef(var42)
	reactModule.useEffect(function() --[[ line: 857 ]]
		-- upvalues: var42 (ref), var96 (ref), var78 (ref), var69 (ref), var87 (ref)
		local var127 = var42 and not var96.current
		var96.current = var42
		
		if not var42 then return end
		if var127 or var78 or var69 ~= nil then
			var87.scrollToBottomUnconditionally()
			task.defer(var87.scrollToBottomUnconditionally)
			task.delay(0.15, var87.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var42,
		var78,
		var69,
		#messages,
		var87
	})
	reactModule.useEffect(function() --[[ line: 883 ]]
		-- upvalues: var63 (ref), var64 (ref), var44 (ref), sessionId (write), var61 (ref), var65 (ref), var66 (ref), placeId (write), var88 (ref), creatorAgentChatModule_1 (copy), var95 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var94 (write), var40 (write), var67 (ref), var87 (ref), var76 (ref), var69 (ref), creatorAgentChatStore (ref), var78 (ref)
		local var128
		if var63.current ~= nil then
			local current = var64.current
			var128 = sessionId
			
			if if current == nil or current.session ~= var44 then false else var128 == nil or var128 == "" or (if current.sessionId ~= var128 then current.sessionId == nil and current.session.getCasSessionId() == var128 else true) then return end
		end
		if var61 ~= nil then return end
		if var44 == nil then return end
		local var130
		local casSessionId = var44.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var130 = casSessionId
		else
			var128 = var44.universeId
			local placeId_1 = var44.placeId
			var130 = if var128 == nil or placeId_1 == nil then nil else `{var128}:{placeId_1}`
		end
		if var130 == nil then return end
		local function current(p32, p33) --[[ line: 905 | named "attachResumedTurn" ]]
			-- upvalues: var65 (copy), var66 (copy), placeId (copy), var88 (copy), creatorAgentChatModule_1 (copy), var44 (copy), var95 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var94 (copy), var40 (copy), var67 (copy), var87 (copy)
			var65.current += 1
			local current = var65.current
			var66.current = p33
			
			if placeId ~= nil then
				var88(placeId, "Loading")
			end
			local var132 = creatorAgentChatModule_1.createResumedAssistantTurn(var44, p32, function(p34) --[[ line: 915 ]]
				-- upvalues: var95 (copy), current (ref), var44 (copy)
				var95(current, p34, nil, var44)
			end, if p33 ~= nil then nil else p33 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var94(current) else nil, var40)
			var67(var132, var44)
			var132.start()
			var87.scrollToBottomUnconditionally()
		end
		
		if var76.activeTurnState == nil or var76.activeTurnItemIndex == nil or var76.activeTurnState.isDone then
			var66.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var130)
			var128 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var131 = casSessionId ~= nil and (var128 ~= nil and not var128.isDone)
			
			if not var78 and not var131 then return end
			if var131 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var76.activeTurnStartSequenceId
			
			if var66.current == casSessionId and var69 ~= nil then return end
			var128 = creatorAgentChatStore.resumeTurnFromHistory(var130, var76.activeTurnState, var76.activeTurnSequenceIds)
			
			if var128 ~= nil then
				current(var128, casSessionId)
			end
		end
	end, {
		var76, var44, sessionId, creatorAgentChatStore, var78, var69, placeId, var88,
		var95, var87, var67, var61, var94, var40
	})
	local var97 = reactModule.useCallback(function(p35, p36, p37, p38) --[[ line: 983 ]]
		-- upvalues: var57 (ref), creatorAgentChatModule_1 (copy), var95 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var94 (write), var40 (write), var88 (ref), var67 (ref), var87 (ref)
		var57({ text = p36, afterSequenceId = p38 })
		local _ = nil
		local var133 = creatorAgentChatModule_1.createLiveAssistantTurn(p35, p36, function(p39) --[[ line: 990 ]]
			-- upvalues: var95 (copy), p37 (ref), p36 (ref), p35 (ref)
			var95(p37, p39, p36, p35)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var94(p37) else nil, var40)
		
		if p35.placeId ~= nil then
			var88(p35.placeId, "Loading")
		end
		var67(var133, p35)
		var87.scrollToBottomAfterSend()
		var133.start()
	end, {
		var95, var88, var87, var67, var57, var94, var40
	})
	local var98 = reactModule.useCallback(function(p40, p41, p42) --[[ line: 1018 ]]
		-- upvalues: var57 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var65 (ref), universeConfigurationModule (copy), var36 (ref), p14 (ref), creatorAgentChatStore (ref), sessionId (write), var97 (ref), var67 (ref), var93 (ref), var83 (ref), var34 (write)
		var57({ text = p40, afterSequenceId = p42 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p44) --[[ line: 1026 ]]
			-- upvalues: debug (copy), processTime (ref), var65 (copy), p41 (ref), universeConfigurationModule (copy), var36 (copy), p14 (copy), creatorAgentChatStore (copy), sessionId (copy), var97 (copy), p40 (ref), p42 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p44.universeId,
				rootPlaceId = p44.rootPlaceId
			})
			
			if var65.current == p41 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p44.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 1041 ]]
					-- upvalues: universeConfigurationStore (ref), p44 (ref)
					return universeConfigurationStore.setTeamCreate(p44.universeId, true)
				end):andThen(function() --[[ line: 1044 ]]
					-- upvalues: var65 (copy), p41 (copy), p44 (ref), var36 (copy), p14 (copy), creatorAgentChatStore (copy), sessionId (copy), var97 (copy), p40 (copy), p42 (copy)
					if var65.current ~= p41 then
						return nil
					end
					local t = { universeId = p44.universeId, placeId = p44.rootPlaceId }
					var36(t)
					
					if p14.onProjectResolved ~= nil then
						p14.onProjectResolved(t)
					end
					var97(creatorAgentChatStore.getSessionForProject(p44.universeId, p44.rootPlaceId, sessionId), p40, p41, p42)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p43) --[[ line: 1067 ]]
			-- upvalues: debug (copy), processTime (ref), var65 (copy), p41 (ref), var67 (copy), var57 (copy), var93 (copy), p40 (ref), var83 (copy), var34 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p43
			})
			
			if var65.current == p41 then
				var67(nil)
				var57(nil)
				var93(p40)
				var83(var34)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p14.onProjectResolved, var67, var93, var83,
		var36, var57, var97, var34
	})
	local var99 = reactModule.useCallback(function() --[[ line: 1096 ]]
		-- upvalues: var84 (ref), var93 (ref), var78 (ref), var64 (ref), var44 (ref), sessionId (write), var63 (ref), var85 (ref), var87 (ref), p14 (ref), universeId (write), var65 (ref), var59 (ref), var98 (ref), var76 (ref), var97 (ref)
		local replaced = string.gsub(var84.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var93("")
			
			return false
		elseif var78 then
			local current = var64.current
			local var138 = sessionId
			local var139 = if if current == nil or current.session ~= var44 then false else var138 == nil or var138 == "" or (if current.sessionId ~= var138 then current.sessionId == nil and current.session.getCasSessionId() == var138 else true) then var63.current else nil
			
			if var139 == nil or not var139.trySubmitComposerText(replaced) then
				return false
			end
			var93("")
			
			if var85.current then
				var85.current.releaseFocus()
			end
			var87.scrollToBottomAfterSend()
			
			return true
		else
			local var140 = p14.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var140 and var44 == nil then
				return false
			end
			var87.captureStickToBottomForSend()
			var65.current += 1
			local current = var65.current
			var59(nil)
			var93("")
			
			if var85.current then
				var85.current.releaseFocus()
			end
			if var140 then
				var98(replaced, current, var76.latestSequenceId)
			else
				var97(var44, replaced, current, var76.latestSequenceId)
			end
			return true
		end
	end, {
		var44, sessionId, universeId, var78, var87, var93, var98, var97,
		p14.createUniverseOnFirstPrompt, var59, var76
	})
	local var100 = reactModule.useCallback(function() --[[ line: 1153 ]]
		-- upvalues: var64 (ref), var44 (ref), sessionId (write), var63 (ref), var65 (ref), var67 (ref), var66 (ref), var57 (ref), var59 (ref), var76 (ref), placeId (write), var88 (ref)
		local current = var64.current
		local var141 = if if current == nil or current.session ~= var44 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var63.current else nil
		
		if var141 == nil then return end
		var65.current += 1
		var141.stop()
		var67(nil)
		var66.current = nil
		var57(nil)
		var59({
			session = var44,
			sessionId = var44.getCasSessionId(),
			startSequenceId = var76.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var88(placeId, "Idle")
		end
	end, {
		var44, sessionId, placeId, var88, var67, var57, var59, var76
	})
	local var101 = p14.autoFocusComposer == nil or p14.autoFocusComposer
	local var102 = if p14.focusComposerWhen == nil then var101 else p14.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1188 ]]
		-- upvalues: var101 (ref), var102 (ref), var85 (ref)
		if var101 and var102 then
			local var142 = false
			
			local var143 = function() --[[ line: 1193 ]]
				-- upvalues: var142 (write)
				return var142
			end
			
			local var144 = 8
			
			local function tryFocus() --[[ line: 186 ]]
				-- upvalues: var143 (ref), var85 (ref), var144 (write), tryFocus (ref)
				if var143() then return end
				local current = var85.current
				
				if current then
					current.focus()
					
					return
				end
				var30 -= 1
				
				if var30 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 1196 ]]
				-- upvalues: var142 (write)
				var142 = true
			end
		end
		return function() --[[ line: 1190 ]] end
	end, { var101, var102 })
	
	return {
		messages = messages,
		localToolActions = var72,
		composerText = var80,
		composerErrorText = var82,
		setComposerText = var93,
		isAssistantResponding = var78,
		canStopAssistantResponse = var69 ~= nil,
		canSendWhileResponding = var79,
		sendMessage = var99,
		stopAssistantResponse = var100,
		setScrollingFrame = var87.setScrollingFrame,
		textBoxRef = var85,
		clockBinding = var86,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p45) --[[ line: 1201 ]]
			-- upvalues: placeId (write), var39 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var146 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var39 ~= nil) then function() --[[ line: 1212 ]]
				-- upvalues: var39 (ref)
				var39.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p45, true, var146) and var146 ~= nil and var39 ~= nil then
				var39.current = false
			end
		end, { placeId, var39 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var55
	}
end