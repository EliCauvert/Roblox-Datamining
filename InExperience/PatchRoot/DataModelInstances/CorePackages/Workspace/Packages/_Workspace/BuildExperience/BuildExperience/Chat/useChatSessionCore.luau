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
local fFlagBuildExperienceClientDataModelToolsModule = require(buildExperience.Flags.FFlagBuildExperienceClientDataModelTools)
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

local function _(p0, p1, p2) --[[ line: 147 | named "sessionOwnerMatches" ]]
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3) --[[ line: 157 ]]
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

local _ = function(p4) --[[ line: 171 | named "trimMessage" ]]
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5) --[[ line: 175 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7) --[[ line: 182 | named "scheduleComposerAutoFocus" ]]
	local var30 = 8
	
	local function tryFocus() --[[ line: 184 ]]
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

local _ = function(p8) --[[ line: 201 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

return function(p9) --[[ line: 214 | named "useChatSessionCore" ]]
	-- upvalues: reactModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelToolsModule (ref), creatorAgentChatModule (ref), var28 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var25 (ref), var26 (ref), var27 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), CHAT_CREATE_UNIVERSE_ERROR (ref), launchPlaytestWithLoadingStateModule (ref)
	local var33, var34 = reactModule.useState(nil)
	local var35, var36 = reactModule.useState(nil)
	local var37 = nil
	local var38 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelToolsModule then
		local var39 = reactModule.useRef(true)
		var37 = var39
		var38 = reactModule.useCallback(function() --[[ line: 224 ]]
			-- upvalues: var39 (ref)
			return var39.current
		end, { var39 })
	end
	local placeId = p9.placeId
	local universeId = p9.universeId
	local sessionId = p9.sessionId
	
	if var33 ~= nil then
		placeId = var33.placeId
		universeId = var33.universeId
		sessionId = var33.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var35 ~= nil and var35.universeId == universeId) and var35.placeId == placeId then
		sessionId = var35.sessionId
	end
	local var40 = p9.hydrateHistoryWhen == nil or p9.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var42 = reactModule.useMemo(function() --[[ line: 247 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 254 ]]
		-- upvalues: var42 (ref), sessionId (write)
		if var42 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var42.setCasSessionId(sessionId)
	end, { var42, sessionId })
	local var43 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 261 ]]
		-- upvalues: var42 (ref), var28 (copy), signalsModule (copy)
		return if var42 == nil then var28 else signalsModule.createComputed(function(p10) --[[ line: 266 ]]
			-- upvalues: var42 (copy)
			return {
				session = var42,
				sessionId = var42.getCasSessionId(),
				events = var42.getMergedHistory(p10)
			}
		end)
	end, { var42 }))
	local var44 = if var43.session == var42 and var43.sessionId == (if var42 ~= nil then nil else var42.getCasSessionId()) then var43.events else {}
	local var45 = sessionId ~= nil and sessionId ~= ""
	local var46 = var45 or (universeId ~= nil and universeId ~= 0)
	local var47 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var47 then
		var47 = var40
		
		if var47 then
			var47 = false
			
			if var42 ~= nil then
				var47 = var46
				
				if var47 then
					var47 = not (var42.hasLoadedHistory() and #var44 > 0)
				end
			end
		end
	end
	local var48 = nil
	local var49 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var50, var51 = reactModule.useState(function() --[[ line: 291 ]]
			-- upvalues: var42 (ref), sessionId (write), universeId (write), var40 (ref), var47 (ref)
			return {
				session = var42,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var40,
				isLoading = var47
			}
		end)
		var48 = var50
		var49 = var51
	end
	local var52 = var48 ~= nil and (var48.session == var42 and (var48.sessionId == sessionId and (var48.universeId == universeId and var48.hydrateHistoryWhen == var40)))
	local var53 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var52 then var48.isLoading else var47) or (var42 ~= nil and var42.getNextHistoryPageToken() ~= nil))
	local var54, var55 = reactModule.useState(nil)
	local var56, var57 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 330 ]]
		-- upvalues: var57 (ref)
		var57(nil)
	end, { var42, sessionId })
	local var58 = sessionId
	local var59 = if if var56 == nil or var56.session ~= var42 then false else var58 == nil or var58 == "" or (if var56.sessionId ~= var58 then var56.sessionId == nil and var56.session.getCasSessionId() == var58 else true) then var56 else nil
	var60, var58 = reactModule.useState(nil)
	local var61 = reactModule.useRef(nil)
	local var62 = reactModule.useRef(nil)
	local var63 = reactModule.useRef(0)
	local var64 = reactModule.useRef(nil)
	local var65 = reactModule.useCallback(function(p11, p12) --[[ line: 345 ]]
		-- upvalues: var61 (ref), var62 (ref), var58 (ref)
		assert(if p11 ~= nil then p12 ~= nil else true, "Active turns require an owning session")
		var61.current = p11
		var62.current = if p11 ~= nil then nil else { session = p12, sessionId = p12.getCasSessionId() }
		var58(p11)
	end, { var58 })
	local current = var62.current
	local var66 = sessionId
	local var67 = if if current == nil or current.session ~= var42 then false else var66 == nil or var66 == "" or (if current.sessionId ~= var66 then current.sessionId == nil and current.session.getCasSessionId() == var66 else true) then var60 else nil
	reactModule.useLayoutEffect(function() --[[ line: 362 ]]
		-- upvalues: var60 (ref), var62 (ref), var42 (ref), sessionId (write), var63 (ref), var64 (ref), var65 (ref), var55 (ref), var57 (ref)
		if var60 ~= nil then
			local current = var62.current
			local var100 = sessionId
			
			if if current == nil or current.session ~= var42 then false else var100 == nil or var100 == "" or (if current.sessionId ~= var100 then current.sessionId == nil and current.session.getCasSessionId() == var100 else true) then
				return
			else
				var63.current += 1
				var64.current = nil
				var60.detach()
				var65(nil, nil)
				var55(nil)
				var57(nil)
			end
		end
	end, { var42, sessionId, var60, var65 })
	local var68 = if var67 ~= nil then var25 else var67.getOptimisticLocalTools
	current = if var67 ~= nil then var26 else var67.getLocalToolActions
	var66 = if var67 ~= nil then var27 else var67.getSetupErrorText
	local var69 = signalsReactModule.useSignalState(var68)
	local var70 = signalsReactModule.useSignalState(current)
	local var71 = signalsReactModule.useSignalState(var66)
	local var72 = reactModule.useMemo(function() --[[ line: 390 ]]
		-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy), p9 (ref), var42 (ref), var54 (ref), var67 (ref), var71 (ref)
		return if var67 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p9.createUniverseOnFirstPrompt == true and (var42 == nil and var54 ~= nil))) then nil else { setupErrorText = var71 }
	end, {
		var67,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p9.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var54 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var42 else nil,
		var71
	})
	local var73 = reactModule.useMemo(function() --[[ line: 410 ]]
		-- upvalues: parseSessionStreamModule (copy), var44 (ref), var42 (ref), sessionId (write), universeId (write), placeId (write), var69 (ref), var54 (ref), var72 (ref), var59 (ref)
		return parseSessionStreamModule(var44, {
			sessionId = if var42 ~= nil then sessionId else var42.getCasSessionId() or sessionId,
			universeId = if var42 ~= nil then universeId else var42.universeId,
			placeId = if var42 ~= nil then placeId else var42.placeId,
			optimisticLocalTools = var69,
			pendingUserMessage = if var54 ~= nil then nil else var54.text,
			pendingUserMessageAfterSequenceId = if var54 ~= nil then nil else var54.afterSequenceId,
			liveAssistantMessage = var72,
			optimisticCancelledStartSequenceId = if var59 ~= nil then nil else var59.startSequenceId
		})
	end, {
		var44, var42, sessionId, universeId, placeId, var69, var54, var72, var59
	})
	local messages = var73.messages
	local subagentTaskState = var73.subagentTaskState
	local includesPublishTool = var73.includesPublishTool
	local var74 = messages[#messages]
	local var75 = if var67 == nil then var74 ~= nil and (var74.kind == "assistant_turn" and not var74.isDone) else true
	local var76 = var75 and hasPendingLocalToolResponse(var69)
	local activeTurnState = var73.activeTurnState
	reactModule.useEffect(function() --[[ line: 453 ]]
		-- upvalues: var67 (ref), activeTurnState (ref)
		if var67 == nil or activeTurnState == nil then
			return
		end
		var67.syncFromTurnState(activeTurnState)
	end, { var67, activeTurnState })
	reactModule.useEffect(function() --[[ line: 460 ]]
		-- upvalues: var73 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var73.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var73.includesPublishTool, placeId })
	local var77, var78 = reactModule.useBinding("")
	local var79, var80 = reactModule.useState(nil)
	local var81 = reactModule.useRef("")
	local var82 = reactModule.useRef(nil)
	local var83 = reactUtilsModule.useClock()
	local var84 = useChatScrollModule()
	local var85 = reactModule.useCallback(function(p13, p14) --[[ line: 475 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p13, p14)
	end, {})
	local var86 = reactModule.useCallback(function(p15) --[[ line: 479 ]]
		-- upvalues: var84 (ref), var42 (ref)
		local var101 = function() --[[ line: 480 ]]
			-- upvalues: p15 (ref)
			return if p15 == nil then false else p15()
		end
		
		var84.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 487 ]]
			-- upvalues: var42 (copy), var101 (ref), var84 (copy), p15 (ref)
			if var42 == nil then return end
			if var42.loadOlderHistory(var101) and var42.getNextHistoryPageToken() ~= nil and var84.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 493 ]]
					-- upvalues: p15 (copy), var84 (copy), var42 (copy), var101 (copy)
					if if p15 ~= nil then false else p15() then return end
					if var84.isViewportUnderfilled() then
						var42.loadOlderHistory(var101)
					end
				end)
			end
		end)
	end, { var42, var84 })
	local var87 = reactModule.useCallback(function(p16) --[[ line: 505 ]]
		-- upvalues: var42 (ref), var84 (ref), var86 (ref)
		task.delay(0.1, function() --[[ line: 506 ]]
			-- upvalues: p16 (ref), var42 (copy), var84 (copy), var86 (copy)
			if p16() then return end
			if var42 == nil then return end
			if var42.getNextHistoryPageToken() == nil then return end
			if var84.isViewportUnderfilled() then
				var86(p16)
				
				return
			end
		end)
	end, { var86, var84, var42 })
	local var88 = reactModule.useCallback(function(p17) --[[ line: 524 ]]
		-- upvalues: var42 (ref), var87 (ref)
		if var42 == nil then return end
		if var42.getNextHistoryPageToken() == nil then
			return
		end
		var87(p17)
	end, { var87, var42 })
	local var89 = reactModule.useRef(var88)
	var89.current = var88
	reactModule.useEffect(function() --[[ line: 536 ]]
		-- upvalues: var84 (ref), var86 (ref)
		var84.setOnScrolledToTop(function() --[[ line: 537 ]]
			-- upvalues: var86 (copy)
			var86(nil)
		end)
		
		return function() --[[ line: 540 ]]
			-- upvalues: var84 (copy)
			var84.setOnScrolledToTop(nil)
		end
	end, { var84.setOnScrolledToTop, var86 })
	reactModule.useEffect(function() --[[ line: 545 ]]
		-- upvalues: var40 (ref), var42 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var49 (write), sessionId (write), universeId (write), var89 (ref), creatorAgentChatStore (ref), var36 (ref), placeId (write)
		if var40 and var42 ~= nil then
			local var102 = false
			
			local function _(value) --[[ line: 560 | named "setHistoryLoading" ]]
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var49 (copy), var102 (write), var42 (copy), sessionId (copy), universeId (copy), var40 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil and not var102 then
					var49({
						session = var42,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var40,
						isLoading = value
					})
					
					return
				end
			end
			
			local var103 = not (var42.hasLoadedHistory() and #var42.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
				var49({
					session = var42,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var40,
					isLoading = var103
				})
			end
			local function isHydrateCancelled() --[[ line: 575 ]]
				-- upvalues: var102 (write), sessionId (ref), var42 (copy)
				return if var102 then true elseif sessionId == nil or sessionId == "" then false else var42.getCasSessionId() ~= sessionId
			end
			
			local _ = function() --[[ line: 584 | named "continueAfterSessionReady" ]]
				-- upvalues: var102 (write), sessionId (ref), var42 (copy), var89 (copy), isHydrateCancelled (ref)
				local var106
				if var102 then
					var106 = true
				elseif sessionId == nil or sessionId == "" then
					var106 = false
				else
					var106 = var42.getCasSessionId() ~= sessionId
					var106 = nil
				end
				if var106 then
					return
				end
				var89.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p18) --[[ line: 591 ]]
				-- upvalues: var42 (copy), var102 (write), sessionId (ref), var89 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var49 (copy), sessionId (copy), universeId (copy), var40 (copy)
				var42.setCasSessionId(p18)
				
				if var42.hasLoadedHistory() and #var42.getMergedHistory(false) > 0 then
					local var107
					if var102 then
						var107 = true
					elseif sessionId == nil or sessionId == "" then
						var107 = false
					else
						var107 = var42.getCasSessionId() ~= sessionId
						var107 = nil
					end
					if not var107 then
						var89.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
						if var102 then return end
						var49({
							isLoading = false,
							session = var42,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var40
						})
					end
					return
				elseif var42.refreshSession(isHydrateCancelled) then
					local var108
					if var102 then
						var108 = true
					elseif sessionId == nil or sessionId == "" then
						var108 = false
					else
						var108 = var42.getCasSessionId() ~= sessionId
						var108 = nil
					end
					if not var108 then
						if var102 then
							var108 = true
						elseif sessionId == nil or sessionId == "" then
							var108 = false
						else
							var108 = var42.getCasSessionId() ~= sessionId
							var108 = nil
						end
						if not var108 then
							var89.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
					if var102 then return end
					var49({
						isLoading = false,
						session = var42,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var40
					})
				end
			end
			
			task.spawn(function() --[[ line: 604 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var42 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var49 (copy), var102 (write), var40 (copy), creatorAgentChatStore (copy), sessionId (ref), var36 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var42.hasLoadedHistory() and #var42.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
						if var102 then return end
						var49({
							isLoading = false,
							session = var42,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var40
						})
					end
					return
				else
					local var109 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var109.state(false).status == "pending" do
						local var110
						if var102 then
							var110 = true
						elseif sessionId == nil or sessionId == "" then
							var110 = false
						else
							var110 = var42.getCasSessionId() ~= sessionId
							var110 = nil
						end
						if var110 then break end
						task.wait()
					end
					local result
					if var102 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var42.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var109.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
							if var102 then return end
							var49({
								isLoading = false,
								session = var42,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var40
							})
						end
						return
					else
						result = var109.state(false).result
						local var111 = if result ~= nil then nil else result.sessions
						local var112 = if typeof(var111) == "table" then var111[1] else nil
						local var113 = if typeof(var112) == "table" then var112.sessionId else nil
						
						if typeof(var113) == "string" and var113 ~= "" then
							var36({
								universeId = universeId,
								placeId = placeId,
								sessionId = var113
							})
							
							return
						end
						var42.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
							if var102 then return end
							var49({
								isLoading = false,
								session = var42,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var40
							})
						end
					end
				end
			end)
			
			return function() --[[ line: 648 ]]
				-- upvalues: var102 (write)
				var102 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var49 ~= nil then
			var49({
				isLoading = false,
				session = var42,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var40
			})
		end
	end, {
		var42, sessionId, universeId, placeId, creatorAgentChatStore, var40
	})
	reactModule.useEffect(function() --[[ line: 653 ]]
		-- upvalues: var42 (ref), sessionId (write), var89 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelToolsModule (copy), var37 (write), appLifecycleObserverService (copy)
		if var42 == nil then
			return
		end
		local var114 = false
		
		local function refreshKnownSession() --[[ line: 658 ]]
			-- upvalues: var42 (copy), sessionId (copy), var114 (write), var89 (copy)
			local casSessionId = var42.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 666 ]]
				-- upvalues: var42 (copy), var114 (copy), var89 (copy)
				if var42.refreshSession(function() --[[ line: 667 ]]
					-- upvalues: var114 (copy)
					return var114
				end) and not var114 then
					var89.current(function() --[[ line: 670 ]]
						-- upvalues: var114 (copy)
						return var114
					end)
				end
			end)
		end
		
		local var116 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 677 ]]
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelToolsModule (copy), var37 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelToolsModule) and var37 ~= nil then
				var37.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 688 ]]
			-- upvalues: var114 (write), var116 (ref), onUnhideConnection (ref)
			var114 = true
			var116:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var42, sessionId, var37 })
	reactModule.useEffect(function() --[[ line: 695 ]]
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var40 (ref), var84 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var40 then
			var84.lockToBottom()
			
			return
		end
	end, { var40, var42, sessionId, var84 })
	local var90 = reactModule.useCallback(function(p19) --[[ line: 702 ]]
		-- upvalues: var81 (ref), var78 (ref), var80 (ref)
		var81.current = p19
		var78(p19)
		var80(nil)
	end, { var78, var80 })
	local var91 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p20) --[[ line: 710 ]]
		-- upvalues: var63 (ref), var62 (ref), var42 (ref), sessionId (write), var81 (ref), var90 (ref), var80 (ref), creatorAgentChatModule_1 (copy)
		return function(p21, p22) --[[ line: 711 ]]
			-- upvalues: var63 (copy), p20 (ref), var62 (copy), var42 (copy), sessionId (copy), var81 (copy), var90 (copy), var80 (copy), creatorAgentChatModule_1 (copy)
			if var63.current == p20 then
				local current = var62.current
				local var119 = sessionId
				
				if not (if current == nil or current.session ~= var42 then false else var119 == nil or var119 == "" or (if current.sessionId ~= var119 then current.sessionId == nil and current.session.getCasSessionId() == var119 else true)) then return end
				if p21 ~= nil and var81.current == "" then
					var90(p21)
				end
				var80(creatorAgentChatModule_1.getToolResultFailureComposerError(p22))
				
				return
			end
		end
	end, { var42, sessionId, var90, var80 }) else nil
	local var92 = reactModule.useCallback(function(p23, p24, p25, p26) --[[ line: 727 ]]
		-- upvalues: var63 (ref), var65 (ref), var64 (ref), var55 (ref), p9 (ref), var85 (ref), var90 (ref), var80 (ref), creatorAgentChatModule_1 (copy), var84 (ref), sessionId (write), var34 (ref)
		if var63.current ~= p23 then return end
		var65(nil)
		var64.current = nil
		var55(nil)
		
		if p24 == nil then
			if p26.placeId ~= nil then
				var85(p26.placeId, "Completed")
			end
			var84.scrollToBottomAfterSend()
			local casSessionId = p26.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p9.createUniverseOnFirstPrompt and sessionId == nil and p26.universeId ~= nil then
					local t = {
						universeId = p26.universeId,
						placeId = p26.placeId,
						sessionId = casSessionId
					}
					var34(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 783 ]]
					-- upvalues: p26 (ref), var63 (copy), p23 (ref)
					p26.refreshSession(function() --[[ line: 784 ]]
						-- upvalues: var63 (copy), p23 (copy)
						return var63.current ~= p23
					end)
				end)
			end
			return
		elseif p9.onPromptFailure ~= nil then
			p9.onPromptFailure(p24.errorCode, p24.outOfCreditsReason)
		end
		if p26.placeId ~= nil then
			var85(p26.placeId, "Idle")
		end
		if p25 ~= nil then
			var90(p25)
			var80(creatorAgentChatModule_1.getPromptFailureComposerError(p24))
		end
		task.spawn(function() --[[ line: 754 ]]
			-- upvalues: p26 (ref), var63 (copy), p23 (ref)
			p26.refreshSession(function() --[[ line: 755 ]]
				-- upvalues: var63 (copy), p23 (copy)
				return var63.current ~= p23
			end)
		end)
	end, {
		p9.createUniverseOnFirstPrompt, p9.onPromptFailure, p9.onProjectResolved,
		sessionId, var85, var34, var84, var90, var80, var65, var55
	})
	local var93 = reactModule.useRef(var40)
	reactModule.useEffect(function() --[[ line: 807 ]]
		-- upvalues: var40 (ref), var93 (ref), var75 (ref), var67 (ref), var84 (ref)
		local var122 = var40 and not var93.current
		var93.current = var40
		
		if not var40 then return end
		if var122 or var75 or var67 ~= nil then
			var84.scrollToBottomUnconditionally()
			task.defer(var84.scrollToBottomUnconditionally)
			task.delay(0.15, var84.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var40,
		var75,
		var67,
		#messages,
		var84
	})
	reactModule.useEffect(function() --[[ line: 833 ]]
		-- upvalues: var61 (ref), var62 (ref), var42 (ref), sessionId (write), var59 (ref), var63 (ref), var64 (ref), placeId (write), var85 (ref), creatorAgentChatModule_1 (copy), var92 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var91 (write), var38 (write), var65 (ref), var84 (ref), var73 (ref), var67 (ref), creatorAgentChatStore (ref), var75 (ref)
		local var123
		if var61.current ~= nil then
			local current = var62.current
			var123 = sessionId
			
			if if current == nil or current.session ~= var42 then false else var123 == nil or var123 == "" or (if current.sessionId ~= var123 then current.sessionId == nil and current.session.getCasSessionId() == var123 else true) then return end
		end
		if var59 ~= nil then return end
		if var42 == nil then return end
		local var125
		local casSessionId = var42.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var125 = casSessionId
		else
			var123 = var42.universeId
			local placeId_1 = var42.placeId
			var125 = if var123 == nil or placeId_1 == nil then nil else `{var123}:{placeId_1}`
		end
		if var125 == nil then return end
		local function current(p27, p28) --[[ line: 855 | named "attachResumedTurn" ]]
			-- upvalues: var63 (copy), var64 (copy), placeId (copy), var85 (copy), creatorAgentChatModule_1 (copy), var42 (copy), var92 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var91 (copy), var38 (copy), var65 (copy), var84 (copy)
			var63.current += 1
			local current = var63.current
			var64.current = p28
			
			if placeId ~= nil then
				var85(placeId, "Loading")
			end
			local var127 = creatorAgentChatModule_1.createResumedAssistantTurn(var42, p27, function(p29) --[[ line: 865 ]]
				-- upvalues: var92 (copy), current (ref), var42 (copy)
				var92(current, p29, nil, var42)
			end, if p28 ~= nil then nil else p28 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var91(current) else nil, var38)
			var65(var127, var42)
			var127.start()
			var84.scrollToBottomUnconditionally()
		end
		
		if var73.activeTurnState == nil or var73.activeTurnItemIndex == nil or var73.activeTurnState.isDone then
			var64.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var125)
			var123 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var126 = casSessionId ~= nil and (var123 ~= nil and not var123.isDone)
			
			if not var75 and not var126 then return end
			if var126 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var73.activeTurnStartSequenceId
			
			if var64.current == casSessionId and var67 ~= nil then return end
			var123 = creatorAgentChatStore.resumeTurnFromHistory(var125, var73.activeTurnState, var73.activeTurnSequenceIds)
			
			if var123 ~= nil then
				current(var123, casSessionId)
			end
		end
	end, {
		var73, var42, sessionId, creatorAgentChatStore, var75, var67, placeId, var85,
		var92, var84, var65, var59, var91, var38
	})
	local var94 = reactModule.useCallback(function(p30, p31, p32, p33) --[[ line: 933 ]]
		-- upvalues: var55 (ref), creatorAgentChatModule_1 (copy), var92 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var91 (write), var38 (write), var85 (ref), var65 (ref), var84 (ref)
		var55({ text = p31, afterSequenceId = p33 })
		local _ = nil
		local var128 = creatorAgentChatModule_1.createLiveAssistantTurn(p30, p31, function(p34) --[[ line: 940 ]]
			-- upvalues: var92 (copy), p32 (ref), p31 (ref), p30 (ref)
			var92(p32, p34, p31, p30)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var91(p32) else nil, var38)
		
		if p30.placeId ~= nil then
			var85(p30.placeId, "Loading")
		end
		var65(var128, p30)
		var84.scrollToBottomAfterSend()
		var128.start()
	end, {
		var92, var85, var84, var65, var55, var91, var38
	})
	local var95 = reactModule.useCallback(function(p35, p36, p37) --[[ line: 968 ]]
		-- upvalues: var55 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var63 (ref), universeConfigurationModule (copy), var34 (ref), p9 (ref), creatorAgentChatStore (ref), sessionId (write), var94 (ref), var65 (ref), var90 (ref), var80 (ref), CHAT_CREATE_UNIVERSE_ERROR (copy)
		var55({ text = p35, afterSequenceId = p37 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p39) --[[ line: 976 ]]
			-- upvalues: debug (copy), processTime (ref), var63 (copy), p36 (ref), universeConfigurationModule (copy), var34 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var94 (copy), p35 (ref), p37 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p39.universeId,
				rootPlaceId = p39.rootPlaceId
			})
			
			if var63.current == p36 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p39.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 991 ]]
					-- upvalues: universeConfigurationStore (ref), p39 (ref)
					return universeConfigurationStore.setTeamCreate(p39.universeId, true)
				end):andThen(function() --[[ line: 994 ]]
					-- upvalues: var63 (copy), p36 (copy), p39 (ref), var34 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var94 (copy), p35 (copy), p37 (copy)
					if var63.current ~= p36 then
						return nil
					end
					local t = { universeId = p39.universeId, placeId = p39.rootPlaceId }
					var34(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
					var94(creatorAgentChatStore.getSessionForProject(p39.universeId, p39.rootPlaceId, sessionId), p35, p36, p37)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p38) --[[ line: 1017 ]]
			-- upvalues: debug (copy), processTime (ref), var63 (copy), p36 (ref), var65 (copy), var55 (copy), var90 (copy), p35 (ref), var80 (copy), CHAT_CREATE_UNIVERSE_ERROR (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p38
			})
			
			if var63.current == p36 then
				var65(nil)
				var55(nil)
				var90(p35)
				var80(CHAT_CREATE_UNIVERSE_ERROR)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p9.onProjectResolved, var65, var90, var80,
		var34, var55, var94
	})
	local var96 = reactModule.useCallback(function() --[[ line: 1045 ]]
		-- upvalues: var81 (ref), var90 (ref), var75 (ref), var62 (ref), var42 (ref), sessionId (write), var61 (ref), var82 (ref), var84 (ref), p9 (ref), universeId (write), var63 (ref), var57 (ref), var95 (ref), var73 (ref), var94 (ref)
		local replaced = string.gsub(var81.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var90("")
			
			return false
		elseif var75 then
			local current = var62.current
			local var133 = sessionId
			local var134 = if if current == nil or current.session ~= var42 then false else var133 == nil or var133 == "" or (if current.sessionId ~= var133 then current.sessionId == nil and current.session.getCasSessionId() == var133 else true) then var61.current else nil
			
			if var134 == nil or not var134.trySubmitComposerText(replaced) then
				return false
			end
			var90("")
			
			if var82.current then
				var82.current.releaseFocus()
			end
			var84.scrollToBottomAfterSend()
			
			return true
		else
			local var135 = p9.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var135 and var42 == nil then
				return false
			end
			var84.captureStickToBottomForSend()
			var63.current += 1
			local current = var63.current
			var57(nil)
			var90("")
			
			if var82.current then
				var82.current.releaseFocus()
			end
			if var135 then
				var95(replaced, current, var73.latestSequenceId)
			else
				var94(var42, replaced, current, var73.latestSequenceId)
			end
			return true
		end
	end, {
		var42, sessionId, universeId, var75, var84, var90, var95, var94,
		p9.createUniverseOnFirstPrompt, var57, var73
	})
	local var97 = reactModule.useCallback(function() --[[ line: 1102 ]]
		-- upvalues: var62 (ref), var42 (ref), sessionId (write), var61 (ref), var63 (ref), var65 (ref), var64 (ref), var55 (ref), var57 (ref), var73 (ref), placeId (write), var85 (ref)
		local current = var62.current
		local var136 = if if current == nil or current.session ~= var42 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var61.current else nil
		
		if var136 == nil then return end
		var63.current += 1
		var136.stop()
		var65(nil)
		var64.current = nil
		var55(nil)
		var57({
			session = var42,
			sessionId = var42.getCasSessionId(),
			startSequenceId = var73.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var85(placeId, "Idle")
		end
	end, {
		var42, sessionId, placeId, var85, var65, var55, var57, var73
	})
	local var98 = p9.autoFocusComposer == nil or p9.autoFocusComposer
	local var99 = if p9.focusComposerWhen == nil then var98 else p9.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1137 ]]
		-- upvalues: var98 (ref), var99 (ref), var82 (ref)
		if var98 and var99 then
			local var137 = false
			
			local var138 = function() --[[ line: 1142 ]]
				-- upvalues: var137 (write)
				return var137
			end
			
			local var139 = 8
			
			local function tryFocus() --[[ line: 184 ]]
				-- upvalues: var138 (ref), var82 (ref), var139 (write), tryFocus (ref)
				if var138() then return end
				local current = var82.current
				
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
			
			return function() --[[ line: 1145 ]]
				-- upvalues: var137 (write)
				var137 = true
			end
		end
		return function() --[[ line: 1139 ]] end
	end, { var98, var99 })
	
	return {
		messages = messages,
		localToolActions = var70,
		composerText = var77,
		composerErrorText = var79,
		setComposerText = var90,
		isAssistantResponding = var75,
		canStopAssistantResponse = var67 ~= nil,
		canSendWhileResponding = var76,
		sendMessage = var96,
		stopAssistantResponse = var97,
		setScrollingFrame = var84.setScrollingFrame,
		textBoxRef = var82,
		clockBinding = var83,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p40) --[[ line: 1150 ]]
			-- upvalues: placeId (write), var37 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelToolsModule (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var141 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelToolsModule) and (game.GameId == 0 and var37 ~= nil) then function() --[[ line: 1161 ]]
				-- upvalues: var37 (ref)
				var37.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p40, true, var141) and var141 ~= nil and var37 ~= nil then
				var37.current = false
			end
		end, { placeId, var37 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var53
	}
end