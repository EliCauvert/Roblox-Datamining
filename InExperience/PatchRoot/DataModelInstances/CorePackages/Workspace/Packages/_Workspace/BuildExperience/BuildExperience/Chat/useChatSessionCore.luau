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
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceFixChatBottomLockModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatBottomLock)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
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
local CHAT_CREATE_UNIVERSE_ERROR = localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var24 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var25 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var26 = signalsModule.createSignal(nil)
local var27 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p0, p1, p2) --[[ line: 146 | named "sessionOwnerMatches" ]]
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3) --[[ line: 156 ]]
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

local _ = function(p4) --[[ line: 170 | named "trimMessage" ]]
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5) --[[ line: 174 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7) --[[ line: 181 | named "scheduleComposerAutoFocus" ]]
	local var29 = 8
	
	local function tryFocus() --[[ line: 183 ]]
		-- upvalues: p7 (ref), p6 (ref), var29 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var29 -= 1
		
		if var29 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p8) --[[ line: 200 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

return function(p9) --[[ line: 213 | named "useChatSessionCore" ]]
	-- upvalues: reactModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), creatorAgentChatModule (ref), var27 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var24 (ref), var25 (ref), var26 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), CHAT_CREATE_UNIVERSE_ERROR (ref), launchPlaytestWithLoadingStateModule (ref)
	local var32, var33 = reactModule.useState(nil)
	local var34, var35 = reactModule.useState(nil)
	local var36 = nil
	local var37 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule then
		local var38 = reactModule.useRef(true)
		var36 = var38
		var37 = reactModule.useCallback(function() --[[ line: 223 ]]
			-- upvalues: var38 (ref)
			return var38.current
		end, { var38 })
	end
	local placeId = p9.placeId
	local universeId = p9.universeId
	local sessionId = p9.sessionId
	
	if var32 ~= nil then
		placeId = var32.placeId
		universeId = var32.universeId
		sessionId = var32.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var34 ~= nil and var34.universeId == universeId) and var34.placeId == placeId then
		sessionId = var34.sessionId
	end
	local var39 = p9.hydrateHistoryWhen == nil or p9.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var41 = reactModule.useMemo(function() --[[ line: 246 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 253 ]]
		-- upvalues: var41 (ref), sessionId (write)
		if var41 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var41.setCasSessionId(sessionId)
	end, { var41, sessionId })
	local var42 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 260 ]]
		-- upvalues: var41 (ref), var27 (copy), signalsModule (copy)
		return if var41 == nil then var27 else signalsModule.createComputed(function(p10) --[[ line: 265 ]]
			-- upvalues: var41 (copy)
			return {
				session = var41,
				sessionId = var41.getCasSessionId(),
				events = var41.getMergedHistory(p10)
			}
		end)
	end, { var41 }))
	local var43 = if var42.session == var41 and var42.sessionId == (if var41 ~= nil then nil else var41.getCasSessionId()) then var42.events else {}
	local var44 = sessionId ~= nil and sessionId ~= ""
	local var45 = var44 or (universeId ~= nil and universeId ~= 0)
	local var46 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var46 then
		var46 = var39
		
		if var46 then
			var46 = false
			
			if var41 ~= nil then
				var46 = var45
				
				if var46 then
					var46 = not (var41.hasLoadedHistory() and #var43 > 0)
				end
			end
		end
	end
	local var47 = nil
	local var48 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var49, var50 = reactModule.useState(function() --[[ line: 290 ]]
			-- upvalues: var41 (ref), sessionId (write), universeId (write), var39 (ref), var46 (ref)
			return {
				session = var41,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var39,
				isLoading = var46
			}
		end)
		var47 = var49
		var48 = var50
	end
	local var51 = var47 ~= nil and (var47.session == var41 and (var47.sessionId == sessionId and (var47.universeId == universeId and var47.hydrateHistoryWhen == var39)))
	local var52 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var51 then var47.isLoading else var46) or (var41 ~= nil and var41.getNextHistoryPageToken() ~= nil))
	local var53, var54 = reactModule.useState(nil)
	local var55, var56 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 329 ]]
		-- upvalues: var56 (ref)
		var56(nil)
	end, { var41, sessionId })
	local var57 = sessionId
	local var58 = if if var55 == nil or var55.session ~= var41 then false else var57 == nil or var57 == "" or (if var55.sessionId ~= var57 then var55.sessionId == nil and var55.session.getCasSessionId() == var57 else true) then var55 else nil
	var59, var57 = reactModule.useState(nil)
	local var60 = reactModule.useRef(nil)
	local var61 = reactModule.useRef(nil)
	local var62 = reactModule.useRef(0)
	local var63 = reactModule.useRef(nil)
	local var64 = reactModule.useCallback(function(p11, p12) --[[ line: 344 ]]
		-- upvalues: var60 (ref), var61 (ref), var57 (ref)
		assert(if p11 ~= nil then p12 ~= nil else true, "Active turns require an owning session")
		var60.current = p11
		var61.current = if p11 ~= nil then nil else { session = p12, sessionId = p12.getCasSessionId() }
		var57(p11)
	end, { var57 })
	local current = var61.current
	local var65 = sessionId
	local var66 = if if current == nil or current.session ~= var41 then false else var65 == nil or var65 == "" or (if current.sessionId ~= var65 then current.sessionId == nil and current.session.getCasSessionId() == var65 else true) then var59 else nil
	reactModule.useLayoutEffect(function() --[[ line: 361 ]]
		-- upvalues: var59 (ref), var61 (ref), var41 (ref), sessionId (write), var62 (ref), var63 (ref), var64 (ref), var54 (ref), var56 (ref)
		if var59 ~= nil then
			local current = var61.current
			local var99 = sessionId
			
			if if current == nil or current.session ~= var41 then false else var99 == nil or var99 == "" or (if current.sessionId ~= var99 then current.sessionId == nil and current.session.getCasSessionId() == var99 else true) then
				return
			else
				var62.current += 1
				var63.current = nil
				var59.detach()
				var64(nil, nil)
				var54(nil)
				var56(nil)
			end
		end
	end, { var41, sessionId, var59, var64 })
	local var67 = if var66 ~= nil then var24 else var66.getOptimisticLocalTools
	current = if var66 ~= nil then var25 else var66.getLocalToolActions
	var65 = if var66 ~= nil then var26 else var66.getSetupErrorText
	local var68 = signalsReactModule.useSignalState(var67)
	local var69 = signalsReactModule.useSignalState(current)
	local var70 = signalsReactModule.useSignalState(var65)
	local var71 = reactModule.useMemo(function() --[[ line: 389 ]]
		-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy), p9 (ref), var41 (ref), var53 (ref), var66 (ref), var70 (ref)
		return if var66 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p9.createUniverseOnFirstPrompt == true and (var41 == nil and var53 ~= nil))) then nil else { setupErrorText = var70 }
	end, {
		var66,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p9.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var53 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var41 else nil,
		var70
	})
	local var72 = reactModule.useMemo(function() --[[ line: 409 ]]
		-- upvalues: parseSessionStreamModule (copy), var43 (ref), var41 (ref), sessionId (write), universeId (write), placeId (write), var68 (ref), var53 (ref), var71 (ref), var58 (ref)
		return parseSessionStreamModule(var43, {
			sessionId = if var41 ~= nil then sessionId else var41.getCasSessionId() or sessionId,
			universeId = if var41 ~= nil then universeId else var41.universeId,
			placeId = if var41 ~= nil then placeId else var41.placeId,
			optimisticLocalTools = var68,
			pendingUserMessage = if var53 ~= nil then nil else var53.text,
			pendingUserMessageAfterSequenceId = if var53 ~= nil then nil else var53.afterSequenceId,
			liveAssistantMessage = var71,
			optimisticCancelledStartSequenceId = if var58 ~= nil then nil else var58.startSequenceId
		})
	end, {
		var43, var41, sessionId, universeId, placeId, var68, var53, var71, var58
	})
	local messages = var72.messages
	local subagentTaskState = var72.subagentTaskState
	local includesPublishTool = var72.includesPublishTool
	local var73 = messages[#messages]
	local var74 = if var66 == nil then var73 ~= nil and (var73.kind == "assistant_turn" and not var73.isDone) else true
	local var75 = var74 and hasPendingLocalToolResponse(var68)
	local activeTurnState = var72.activeTurnState
	reactModule.useEffect(function() --[[ line: 452 ]]
		-- upvalues: var66 (ref), activeTurnState (ref)
		if var66 == nil or activeTurnState == nil then
			return
		end
		var66.syncFromTurnState(activeTurnState)
	end, { var66, activeTurnState })
	reactModule.useEffect(function() --[[ line: 459 ]]
		-- upvalues: var72 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var72.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var72.includesPublishTool, placeId })
	local var76, var77 = reactModule.useBinding("")
	local var78, var79 = reactModule.useState(nil)
	local var80 = reactModule.useRef("")
	local var81 = reactModule.useRef(nil)
	local var82 = reactUtilsModule.useClock()
	local var83 = useChatScrollModule()
	local var84 = reactModule.useCallback(function(p13, p14) --[[ line: 474 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p13, p14)
	end, {})
	local var85 = reactModule.useCallback(function(p15) --[[ line: 478 ]]
		-- upvalues: var83 (ref), var41 (ref)
		local var100 = function() --[[ line: 479 ]]
			-- upvalues: p15 (ref)
			return if p15 == nil then false else p15()
		end
		
		var83.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 486 ]]
			-- upvalues: var41 (copy), var100 (ref), var83 (copy), p15 (ref)
			if var41 == nil then return end
			if var41.loadOlderHistory(var100) and var41.getNextHistoryPageToken() ~= nil and var83.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 492 ]]
					-- upvalues: p15 (copy), var83 (copy), var41 (copy), var100 (copy)
					if if p15 ~= nil then false else p15() then return end
					if var83.isViewportUnderfilled() then
						var41.loadOlderHistory(var100)
					end
				end)
			end
		end)
	end, { var41, var83 })
	local var86 = reactModule.useCallback(function(p16) --[[ line: 504 ]]
		-- upvalues: var41 (ref), var83 (ref), var85 (ref)
		task.delay(0.1, function() --[[ line: 505 ]]
			-- upvalues: p16 (ref), var41 (copy), var83 (copy), var85 (copy)
			if p16() then return end
			if var41 == nil then return end
			if var41.getNextHistoryPageToken() == nil then return end
			if var83.isViewportUnderfilled() then
				var85(p16)
				
				return
			end
		end)
	end, { var85, var83, var41 })
	local var87 = reactModule.useCallback(function(p17) --[[ line: 523 ]]
		-- upvalues: var41 (ref), var86 (ref)
		if var41 == nil then return end
		if var41.getNextHistoryPageToken() == nil then
			return
		end
		var86(p17)
	end, { var86, var41 })
	local var88 = reactModule.useRef(var87)
	var88.current = var87
	reactModule.useEffect(function() --[[ line: 535 ]]
		-- upvalues: var83 (ref), var85 (ref)
		var83.setOnScrolledToTop(function() --[[ line: 536 ]]
			-- upvalues: var85 (copy)
			var85(nil)
		end)
		
		return function() --[[ line: 539 ]]
			-- upvalues: var83 (copy)
			var83.setOnScrolledToTop(nil)
		end
	end, { var83.setOnScrolledToTop, var85 })
	reactModule.useEffect(function() --[[ line: 544 ]]
		-- upvalues: var39 (ref), var41 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var48 (write), sessionId (write), universeId (write), var88 (ref), creatorAgentChatStore (ref), var35 (ref), placeId (write)
		if var39 and var41 ~= nil then
			local var101 = false
			
			local function _(value) --[[ line: 559 | named "setHistoryLoading" ]]
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var48 (copy), var101 (write), var41 (copy), sessionId (copy), universeId (copy), var39 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil and not var101 then
					var48({
						session = var41,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var39,
						isLoading = value
					})
					
					return
				end
			end
			
			local var102 = not (var41.hasLoadedHistory() and #var41.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
				var48({
					session = var41,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var39,
					isLoading = var102
				})
			end
			local function isHydrateCancelled() --[[ line: 574 ]]
				-- upvalues: var101 (write), sessionId (ref), var41 (copy)
				return if var101 then true elseif sessionId == nil or sessionId == "" then false else var41.getCasSessionId() ~= sessionId
			end
			
			local _ = function() --[[ line: 583 | named "continueAfterSessionReady" ]]
				-- upvalues: var101 (write), sessionId (ref), var41 (copy), var88 (copy), isHydrateCancelled (ref)
				local var105
				if var101 then
					var105 = true
				elseif sessionId == nil or sessionId == "" then
					var105 = false
				else
					var105 = var41.getCasSessionId() ~= sessionId
					var105 = nil
				end
				if var105 then
					return
				end
				var88.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p18) --[[ line: 590 ]]
				-- upvalues: var41 (copy), var101 (write), sessionId (ref), var88 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var48 (copy), sessionId (copy), universeId (copy), var39 (copy)
				var41.setCasSessionId(p18)
				
				if var41.hasLoadedHistory() and #var41.getMergedHistory(false) > 0 then
					local var106
					if var101 then
						var106 = true
					elseif sessionId == nil or sessionId == "" then
						var106 = false
					else
						var106 = var41.getCasSessionId() ~= sessionId
						var106 = nil
					end
					if not var106 then
						var88.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
						if var101 then return end
						var48({
							isLoading = false,
							session = var41,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var39
						})
					end
					return
				elseif var41.refreshSession(isHydrateCancelled) then
					local var107
					if var101 then
						var107 = true
					elseif sessionId == nil or sessionId == "" then
						var107 = false
					else
						var107 = var41.getCasSessionId() ~= sessionId
						var107 = nil
					end
					if not var107 then
						if var101 then
							var107 = true
						elseif sessionId == nil or sessionId == "" then
							var107 = false
						else
							var107 = var41.getCasSessionId() ~= sessionId
							var107 = nil
						end
						if not var107 then
							var88.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
					if var101 then return end
					var48({
						isLoading = false,
						session = var41,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var39
					})
				end
			end
			
			task.spawn(function() --[[ line: 603 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var41 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var48 (copy), var101 (write), var39 (copy), creatorAgentChatStore (copy), sessionId (ref), var35 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var41.hasLoadedHistory() and #var41.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
						if var101 then return end
						var48({
							isLoading = false,
							session = var41,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var39
						})
					end
					return
				else
					local var108 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var108.state(false).status == "pending" do
						local var109
						if var101 then
							var109 = true
						elseif sessionId == nil or sessionId == "" then
							var109 = false
						else
							var109 = var41.getCasSessionId() ~= sessionId
							var109 = nil
						end
						if var109 then break end
						task.wait()
					end
					local result
					if var101 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var41.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var108.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
							if var101 then return end
							var48({
								isLoading = false,
								session = var41,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var39
							})
						end
						return
					else
						result = var108.state(false).result
						local var110 = if result ~= nil then nil else result.sessions
						local var111 = if typeof(var110) == "table" then var110[1] else nil
						local var112 = if typeof(var111) == "table" then var111.sessionId else nil
						
						if typeof(var112) == "string" and var112 ~= "" then
							var35({
								universeId = universeId,
								placeId = placeId,
								sessionId = var112
							})
							
							return
						end
						var41.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
							if var101 then return end
							var48({
								isLoading = false,
								session = var41,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var39
							})
						end
					end
				end
			end)
			
			return function() --[[ line: 647 ]]
				-- upvalues: var101 (write)
				var101 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var48 ~= nil then
			var48({
				isLoading = false,
				session = var41,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var39
			})
		end
	end, {
		var41, sessionId, universeId, placeId, creatorAgentChatStore, var39
	})
	reactModule.useEffect(function() --[[ line: 652 ]]
		-- upvalues: var41 (ref), sessionId (write), var88 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), var36 (write), appLifecycleObserverService (copy)
		if var41 == nil then
			return
		end
		local var113 = false
		
		local function refreshKnownSession() --[[ line: 657 ]]
			-- upvalues: var41 (copy), sessionId (copy), var113 (write), var88 (copy)
			local casSessionId = var41.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 665 ]]
				-- upvalues: var41 (copy), var113 (copy), var88 (copy)
				if var41.refreshSession(function() --[[ line: 666 ]]
					-- upvalues: var113 (copy)
					return var113
				end) and not var113 then
					var88.current(function() --[[ line: 669 ]]
						-- upvalues: var113 (copy)
						return var113
					end)
				end
			end)
		end
		
		local var115 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 676 ]]
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), var36 (copy), refreshKnownSession (ref)
			if fFlagBuildExperiencePersistPlaytestLogsModule and var36 ~= nil then
				var36.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 684 ]]
			-- upvalues: var113 (write), var115 (ref), onUnhideConnection (ref)
			var113 = true
			var115:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var41, sessionId, var36 })
	reactModule.useEffect(function() --[[ line: 691 ]]
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var39 (ref), var83 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var39 then
			var83.lockToBottom()
			
			return
		end
	end, { var39, var41, sessionId, var83 })
	local var89 = reactModule.useCallback(function(p19) --[[ line: 698 ]]
		-- upvalues: var80 (ref), var77 (ref), var79 (ref)
		var80.current = p19
		var77(p19)
		var79(nil)
	end, { var77, var79 })
	local var90 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p20) --[[ line: 706 ]]
		-- upvalues: var62 (ref), var61 (ref), var41 (ref), sessionId (write), var80 (ref), var89 (ref), var79 (ref), creatorAgentChatModule_1 (copy)
		return function(p21, p22) --[[ line: 707 ]]
			-- upvalues: var62 (copy), p20 (ref), var61 (copy), var41 (copy), sessionId (copy), var80 (copy), var89 (copy), var79 (copy), creatorAgentChatModule_1 (copy)
			if var62.current == p20 then
				local current = var61.current
				local var118 = sessionId
				
				if not (if current == nil or current.session ~= var41 then false else var118 == nil or var118 == "" or (if current.sessionId ~= var118 then current.sessionId == nil and current.session.getCasSessionId() == var118 else true)) then return end
				if p21 ~= nil and var80.current == "" then
					var89(p21)
				end
				var79(creatorAgentChatModule_1.getToolResultFailureComposerError(p22))
				
				return
			end
		end
	end, { var41, sessionId, var89, var79 }) else nil
	local var91 = reactModule.useCallback(function(p23, p24, p25, p26) --[[ line: 723 ]]
		-- upvalues: var62 (ref), var64 (ref), var63 (ref), var54 (ref), p9 (ref), var84 (ref), var89 (ref), var79 (ref), creatorAgentChatModule_1 (copy), var83 (ref), sessionId (write), var33 (ref)
		if var62.current ~= p23 then return end
		var64(nil)
		var63.current = nil
		var54(nil)
		
		if p24 == nil then
			if p26.placeId ~= nil then
				var84(p26.placeId, "Completed")
			end
			var83.scrollToBottomAfterSend()
			local casSessionId = p26.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p9.createUniverseOnFirstPrompt and sessionId == nil and p26.universeId ~= nil then
					local t = {
						universeId = p26.universeId,
						placeId = p26.placeId,
						sessionId = casSessionId
					}
					var33(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 779 ]]
					-- upvalues: p26 (ref), var62 (copy), p23 (ref)
					p26.refreshSession(function() --[[ line: 780 ]]
						-- upvalues: var62 (copy), p23 (copy)
						return var62.current ~= p23
					end)
				end)
			end
			return
		elseif p9.onPromptFailure ~= nil then
			p9.onPromptFailure(p24.errorCode, p24.outOfCreditsReason)
		end
		if p26.placeId ~= nil then
			var84(p26.placeId, "Idle")
		end
		if p25 ~= nil then
			var89(p25)
			var79(creatorAgentChatModule_1.getPromptFailureComposerError(p24))
		end
		task.spawn(function() --[[ line: 750 ]]
			-- upvalues: p26 (ref), var62 (copy), p23 (ref)
			p26.refreshSession(function() --[[ line: 751 ]]
				-- upvalues: var62 (copy), p23 (copy)
				return var62.current ~= p23
			end)
		end)
	end, {
		p9.createUniverseOnFirstPrompt, p9.onPromptFailure, p9.onProjectResolved,
		sessionId, var84, var33, var83, var89, var79, var64, var54
	})
	local var92 = reactModule.useRef(var39)
	reactModule.useEffect(function() --[[ line: 803 ]]
		-- upvalues: var39 (ref), var92 (ref), var74 (ref), var66 (ref), var83 (ref)
		local var121 = var39 and not var92.current
		var92.current = var39
		
		if not var39 then return end
		if var121 or var74 or var66 ~= nil then
			var83.scrollToBottomUnconditionally()
			task.defer(var83.scrollToBottomUnconditionally)
			task.delay(0.15, var83.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var39,
		var74,
		var66,
		#messages,
		var83
	})
	reactModule.useEffect(function() --[[ line: 829 ]]
		-- upvalues: var60 (ref), var61 (ref), var41 (ref), sessionId (write), var58 (ref), var62 (ref), var63 (ref), placeId (write), var84 (ref), creatorAgentChatModule_1 (copy), var91 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var90 (write), var37 (write), var64 (ref), var83 (ref), var72 (ref), var66 (ref), creatorAgentChatStore (ref), var74 (ref)
		local var122
		if var60.current ~= nil then
			local current = var61.current
			var122 = sessionId
			
			if if current == nil or current.session ~= var41 then false else var122 == nil or var122 == "" or (if current.sessionId ~= var122 then current.sessionId == nil and current.session.getCasSessionId() == var122 else true) then return end
		end
		if var58 ~= nil then return end
		if var41 == nil then return end
		local var124
		local casSessionId = var41.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var124 = casSessionId
		else
			var122 = var41.universeId
			local placeId_1 = var41.placeId
			var124 = if var122 == nil or placeId_1 == nil then nil else `{var122}:{placeId_1}`
		end
		if var124 == nil then return end
		local function current(p27, p28) --[[ line: 851 | named "attachResumedTurn" ]]
			-- upvalues: var62 (copy), var63 (copy), placeId (copy), var84 (copy), creatorAgentChatModule_1 (copy), var41 (copy), var91 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var90 (copy), var37 (copy), var64 (copy), var83 (copy)
			var62.current += 1
			local current = var62.current
			var63.current = p28
			
			if placeId ~= nil then
				var84(placeId, "Loading")
			end
			local var126 = creatorAgentChatModule_1.createResumedAssistantTurn(var41, p27, function(p29) --[[ line: 861 ]]
				-- upvalues: var91 (copy), current (ref), var41 (copy)
				var91(current, p29, nil, var41)
			end, if p28 ~= nil then nil else p28 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var90(current) else nil, var37)
			var64(var126, var41)
			var126.start()
			var83.scrollToBottomUnconditionally()
		end
		
		if var72.activeTurnState == nil or var72.activeTurnItemIndex == nil or var72.activeTurnState.isDone then
			var63.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var124)
			var122 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var125 = casSessionId ~= nil and (var122 ~= nil and not var122.isDone)
			
			if not var74 and not var125 then return end
			if var125 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var72.activeTurnStartSequenceId
			
			if var63.current == casSessionId and var66 ~= nil then return end
			var122 = creatorAgentChatStore.resumeTurnFromHistory(var124, var72.activeTurnState, var72.activeTurnSequenceIds)
			
			if var122 ~= nil then
				current(var122, casSessionId)
			end
		end
	end, {
		var72, var41, sessionId, creatorAgentChatStore, var74, var66, placeId, var84,
		var91, var83, var64, var58, var90, var37
	})
	local var93 = reactModule.useCallback(function(p30, p31, p32, p33) --[[ line: 929 ]]
		-- upvalues: var54 (ref), creatorAgentChatModule_1 (copy), var91 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var90 (write), var37 (write), var84 (ref), var64 (ref), var83 (ref)
		var54({ text = p31, afterSequenceId = p33 })
		local _ = nil
		local var127 = creatorAgentChatModule_1.createLiveAssistantTurn(p30, p31, function(p34) --[[ line: 936 ]]
			-- upvalues: var91 (copy), p32 (ref), p31 (ref), p30 (ref)
			var91(p32, p34, p31, p30)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var90(p32) else nil, var37)
		
		if p30.placeId ~= nil then
			var84(p30.placeId, "Loading")
		end
		var64(var127, p30)
		var83.scrollToBottomAfterSend()
		var127.start()
	end, {
		var91, var84, var83, var64, var54, var90, var37
	})
	local var94 = reactModule.useCallback(function(p35, p36, p37) --[[ line: 964 ]]
		-- upvalues: var54 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var62 (ref), universeConfigurationModule (copy), var33 (ref), p9 (ref), creatorAgentChatStore (ref), sessionId (write), var93 (ref), var64 (ref), var89 (ref), var79 (ref), CHAT_CREATE_UNIVERSE_ERROR (copy)
		var54({ text = p35, afterSequenceId = p37 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p39) --[[ line: 972 ]]
			-- upvalues: debug (copy), processTime (ref), var62 (copy), p36 (ref), universeConfigurationModule (copy), var33 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var93 (copy), p35 (ref), p37 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p39.universeId,
				rootPlaceId = p39.rootPlaceId
			})
			
			if var62.current == p36 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p39.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 987 ]]
					-- upvalues: universeConfigurationStore (ref), p39 (ref)
					return universeConfigurationStore.setTeamCreate(p39.universeId, true)
				end):andThen(function() --[[ line: 990 ]]
					-- upvalues: var62 (copy), p36 (copy), p39 (ref), var33 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var93 (copy), p35 (copy), p37 (copy)
					if var62.current ~= p36 then
						return nil
					end
					local t = { universeId = p39.universeId, placeId = p39.rootPlaceId }
					var33(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
					var93(creatorAgentChatStore.getSessionForProject(p39.universeId, p39.rootPlaceId, sessionId), p35, p36, p37)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p38) --[[ line: 1013 ]]
			-- upvalues: debug (copy), processTime (ref), var62 (copy), p36 (ref), var64 (copy), var54 (copy), var89 (copy), p35 (ref), var79 (copy), CHAT_CREATE_UNIVERSE_ERROR (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p38
			})
			
			if var62.current == p36 then
				var64(nil)
				var54(nil)
				var89(p35)
				var79(CHAT_CREATE_UNIVERSE_ERROR)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p9.onProjectResolved, var64, var89, var79,
		var33, var54, var93
	})
	local var95 = reactModule.useCallback(function() --[[ line: 1041 ]]
		-- upvalues: var80 (ref), var89 (ref), var74 (ref), var61 (ref), var41 (ref), sessionId (write), var60 (ref), var81 (ref), var83 (ref), p9 (ref), universeId (write), var62 (ref), var56 (ref), var94 (ref), var72 (ref), var93 (ref)
		local replaced = string.gsub(var80.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var89("")
			
			return false
		elseif var74 then
			local current = var61.current
			local var132 = sessionId
			local var133 = if if current == nil or current.session ~= var41 then false else var132 == nil or var132 == "" or (if current.sessionId ~= var132 then current.sessionId == nil and current.session.getCasSessionId() == var132 else true) then var60.current else nil
			
			if var133 == nil or not var133.trySubmitComposerText(replaced) then
				return false
			end
			var89("")
			
			if var81.current then
				var81.current.releaseFocus()
			end
			var83.scrollToBottomAfterSend()
			
			return true
		else
			local var134 = p9.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var134 and var41 == nil then
				return false
			end
			var83.captureStickToBottomForSend()
			var62.current += 1
			local current = var62.current
			var56(nil)
			var89("")
			
			if var81.current then
				var81.current.releaseFocus()
			end
			if var134 then
				var94(replaced, current, var72.latestSequenceId)
			else
				var93(var41, replaced, current, var72.latestSequenceId)
			end
			return true
		end
	end, {
		var41, sessionId, universeId, var74, var83, var89, var94, var93,
		p9.createUniverseOnFirstPrompt, var56, var72
	})
	local var96 = reactModule.useCallback(function() --[[ line: 1098 ]]
		-- upvalues: var61 (ref), var41 (ref), sessionId (write), var60 (ref), var62 (ref), var64 (ref), var63 (ref), var54 (ref), var56 (ref), var72 (ref), placeId (write), var84 (ref)
		local current = var61.current
		local var135 = if if current == nil or current.session ~= var41 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var60.current else nil
		
		if var135 == nil then return end
		var62.current += 1
		var135.stop()
		var64(nil)
		var63.current = nil
		var54(nil)
		var56({
			session = var41,
			sessionId = var41.getCasSessionId(),
			startSequenceId = var72.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var84(placeId, "Idle")
		end
	end, {
		var41, sessionId, placeId, var84, var64, var54, var56, var72
	})
	local var97 = p9.autoFocusComposer == nil or p9.autoFocusComposer
	local var98 = if p9.focusComposerWhen == nil then var97 else p9.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1133 ]]
		-- upvalues: var97 (ref), var98 (ref), var81 (ref)
		if var97 and var98 then
			local var136 = false
			
			local var137 = function() --[[ line: 1138 ]]
				-- upvalues: var136 (write)
				return var136
			end
			
			local var138 = 8
			
			local function tryFocus() --[[ line: 183 ]]
				-- upvalues: var137 (ref), var81 (ref), var138 (write), tryFocus (ref)
				if var137() then return end
				local current = var81.current
				
				if current then
					current.focus()
					
					return
				end
				var29 -= 1
				
				if var29 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 1141 ]]
				-- upvalues: var136 (write)
				var136 = true
			end
		end
		return function() --[[ line: 1135 ]] end
	end, { var97, var98 })
	
	return {
		messages = messages,
		localToolActions = var69,
		composerText = var76,
		composerErrorText = var78,
		setComposerText = var89,
		isAssistantResponding = var74,
		canStopAssistantResponse = var66 ~= nil,
		canSendWhileResponding = var75,
		sendMessage = var95,
		stopAssistantResponse = var96,
		setScrollingFrame = var83.setScrollingFrame,
		textBoxRef = var81,
		clockBinding = var82,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p40) --[[ line: 1146 ]]
			-- upvalues: placeId (write), var36 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var140 = if fFlagBuildExperiencePersistPlaytestLogsModule and game.GameId == 0 and var36 ~= nil then function() --[[ line: 1153 ]]
				-- upvalues: var36 (ref)
				var36.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p40, true, var140) and var140 ~= nil and var36 ~= nil then
				var36.current = false
			end
		end, { placeId, var36 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var52
	}
end