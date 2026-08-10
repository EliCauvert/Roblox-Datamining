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
local var23 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var24 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var25 = signalsModule.createSignal(nil)
local var26 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p0, p1, p2) --[[ line: 145 | named "sessionOwnerMatches" ]]
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3) --[[ line: 155 ]]
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

local _ = function(p4) --[[ line: 169 | named "trimMessage" ]]
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5) --[[ line: 173 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7) --[[ line: 180 | named "scheduleComposerAutoFocus" ]]
	local var28 = 8
	
	local function tryFocus() --[[ line: 182 ]]
		-- upvalues: p7 (ref), p6 (ref), var28 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var28 -= 1
		
		if var28 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p8) --[[ line: 199 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

return function(p9) --[[ line: 212 | named "useChatSessionCore" ]]
	-- upvalues: reactModule (ref), creatorAgentChatModule (ref), var26 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var23 (ref), var24 (ref), var25 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), CHAT_CREATE_UNIVERSE_ERROR (ref), launchPlaytestWithLoadingStateModule (ref)
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(nil)
	local placeId = p9.placeId
	local universeId = p9.universeId
	local sessionId = p9.sessionId
	
	if var31 ~= nil then
		placeId = var31.placeId
		universeId = var31.universeId
		sessionId = var31.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var33 ~= nil and var33.universeId == universeId) and var33.placeId == placeId then
		sessionId = var33.sessionId
	end
	local var35 = p9.hydrateHistoryWhen == nil or p9.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var37 = reactModule.useMemo(function() --[[ line: 234 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 241 ]]
		-- upvalues: var37 (ref), sessionId (write)
		if var37 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var37.setCasSessionId(sessionId)
	end, { var37, sessionId })
	local var38 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 248 ]]
		-- upvalues: var37 (ref), var26 (copy), signalsModule (copy)
		return if var37 == nil then var26 else signalsModule.createComputed(function(p10) --[[ line: 253 ]]
			-- upvalues: var37 (copy)
			return {
				session = var37,
				sessionId = var37.getCasSessionId(),
				events = var37.getMergedHistory(p10)
			}
		end)
	end, { var37 }))
	local var39 = if var38.session == var37 and var38.sessionId == (if var37 ~= nil then nil else var37.getCasSessionId()) then var38.events else {}
	local var40 = sessionId ~= nil and sessionId ~= ""
	local var41 = var40 or (universeId ~= nil and universeId ~= 0)
	local var42 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var42 then
		var42 = var35
		
		if var42 then
			var42 = false
			
			if var37 ~= nil then
				var42 = var41
				
				if var42 then
					var42 = not (var37.hasLoadedHistory() and #var39 > 0)
				end
			end
		end
	end
	local var43 = nil
	local var44 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var45, var46 = reactModule.useState(function() --[[ line: 278 ]]
			-- upvalues: var37 (ref), sessionId (write), universeId (write), var35 (ref), var42 (ref)
			return {
				session = var37,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var35,
				isLoading = var42
			}
		end)
		var43 = var45
		var44 = var46
	end
	local var47 = var43 ~= nil and (var43.session == var37 and (var43.sessionId == sessionId and (var43.universeId == universeId and var43.hydrateHistoryWhen == var35)))
	local var48 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var47 then var43.isLoading else var42) or (var37 ~= nil and var37.getNextHistoryPageToken() ~= nil))
	local var49, var50 = reactModule.useState(nil)
	local var51, var52 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 317 ]]
		-- upvalues: var52 (ref)
		var52(nil)
	end, { var37, sessionId })
	local var53 = sessionId
	local var54 = if if var51 == nil or var51.session ~= var37 then false else var53 == nil or var53 == "" or (if var51.sessionId ~= var53 then var51.sessionId == nil and var51.session.getCasSessionId() == var53 else true) then var51 else nil
	var55, var53 = reactModule.useState(nil)
	local var56 = reactModule.useRef(nil)
	local var57 = reactModule.useRef(nil)
	local var58 = reactModule.useRef(0)
	local var59 = reactModule.useRef(nil)
	local var60 = reactModule.useCallback(function(p11, p12) --[[ line: 332 ]]
		-- upvalues: var56 (ref), var57 (ref), var53 (ref)
		assert(if p11 ~= nil then p12 ~= nil else true, "Active turns require an owning session")
		var56.current = p11
		var57.current = if p11 ~= nil then nil else { session = p12, sessionId = p12.getCasSessionId() }
		var53(p11)
	end, { var53 })
	local current = var57.current
	local var61 = sessionId
	local var62 = if if current == nil or current.session ~= var37 then false else var61 == nil or var61 == "" or (if current.sessionId ~= var61 then current.sessionId == nil and current.session.getCasSessionId() == var61 else true) then var55 else nil
	reactModule.useLayoutEffect(function() --[[ line: 349 ]]
		-- upvalues: var55 (ref), var57 (ref), var37 (ref), sessionId (write), var58 (ref), var59 (ref), var60 (ref), var50 (ref), var52 (ref)
		if var55 ~= nil then
			local current = var57.current
			local var95 = sessionId
			
			if if current == nil or current.session ~= var37 then false else var95 == nil or var95 == "" or (if current.sessionId ~= var95 then current.sessionId == nil and current.session.getCasSessionId() == var95 else true) then
				return
			else
				var58.current += 1
				var59.current = nil
				var55.detach()
				var60(nil, nil)
				var50(nil)
				var52(nil)
			end
		end
	end, { var37, sessionId, var55, var60 })
	local var63 = if var62 ~= nil then var23 else var62.getOptimisticLocalTools
	current = if var62 ~= nil then var24 else var62.getLocalToolActions
	var61 = if var62 ~= nil then var25 else var62.getSetupErrorText
	local var64 = signalsReactModule.useSignalState(var63)
	local var65 = signalsReactModule.useSignalState(current)
	local var66 = signalsReactModule.useSignalState(var61)
	local var67 = reactModule.useMemo(function() --[[ line: 377 ]]
		-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy), p9 (ref), var37 (ref), var49 (ref), var62 (ref), var66 (ref)
		return if var62 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p9.createUniverseOnFirstPrompt == true and (var37 == nil and var49 ~= nil))) then nil else { setupErrorText = var66 }
	end, {
		var62,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p9.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var49 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var37 else nil,
		var66
	})
	local var68 = reactModule.useMemo(function() --[[ line: 397 ]]
		-- upvalues: parseSessionStreamModule (copy), var39 (ref), var37 (ref), sessionId (write), universeId (write), placeId (write), var64 (ref), var49 (ref), var67 (ref), var54 (ref)
		return parseSessionStreamModule(var39, {
			sessionId = if var37 ~= nil then sessionId else var37.getCasSessionId() or sessionId,
			universeId = if var37 ~= nil then universeId else var37.universeId,
			placeId = if var37 ~= nil then placeId else var37.placeId,
			optimisticLocalTools = var64,
			pendingUserMessage = if var49 ~= nil then nil else var49.text,
			pendingUserMessageAfterSequenceId = if var49 ~= nil then nil else var49.afterSequenceId,
			liveAssistantMessage = var67,
			optimisticCancelledStartSequenceId = if var54 ~= nil then nil else var54.startSequenceId
		})
	end, {
		var39, var37, sessionId, universeId, placeId, var64, var49, var67, var54
	})
	local messages = var68.messages
	local subagentTaskState = var68.subagentTaskState
	local includesPublishTool = var68.includesPublishTool
	local var69 = messages[#messages]
	local var70 = if var62 == nil then var69 ~= nil and (var69.kind == "assistant_turn" and not var69.isDone) else true
	local var71 = var70 and hasPendingLocalToolResponse(var64)
	local activeTurnState = var68.activeTurnState
	reactModule.useEffect(function() --[[ line: 440 ]]
		-- upvalues: var62 (ref), activeTurnState (ref)
		if var62 == nil or activeTurnState == nil then
			return
		end
		var62.syncFromTurnState(activeTurnState)
	end, { var62, activeTurnState })
	reactModule.useEffect(function() --[[ line: 447 ]]
		-- upvalues: var68 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var68.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var68.includesPublishTool, placeId })
	local var72, var73 = reactModule.useBinding("")
	local var74, var75 = reactModule.useState(nil)
	local var76 = reactModule.useRef("")
	local var77 = reactModule.useRef(nil)
	local var78 = reactUtilsModule.useClock()
	local var79 = useChatScrollModule()
	local var80 = reactModule.useCallback(function(p13, p14) --[[ line: 462 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p13, p14)
	end, {})
	local var81 = reactModule.useCallback(function(p15) --[[ line: 466 ]]
		-- upvalues: var79 (ref), var37 (ref)
		local var96 = function() --[[ line: 467 ]]
			-- upvalues: p15 (ref)
			return if p15 == nil then false else p15()
		end
		
		var79.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 474 ]]
			-- upvalues: var37 (copy), var96 (ref), var79 (copy), p15 (ref)
			if var37 == nil then return end
			if var37.loadOlderHistory(var96) and var37.getNextHistoryPageToken() ~= nil and var79.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 480 ]]
					-- upvalues: p15 (copy), var79 (copy), var37 (copy), var96 (copy)
					if if p15 ~= nil then false else p15() then return end
					if var79.isViewportUnderfilled() then
						var37.loadOlderHistory(var96)
					end
				end)
			end
		end)
	end, { var37, var79 })
	local var82 = reactModule.useCallback(function(p16) --[[ line: 492 ]]
		-- upvalues: var37 (ref), var79 (ref), var81 (ref)
		task.delay(0.1, function() --[[ line: 493 ]]
			-- upvalues: p16 (ref), var37 (copy), var79 (copy), var81 (copy)
			if p16() then return end
			if var37 == nil then return end
			if var37.getNextHistoryPageToken() == nil then return end
			if var79.isViewportUnderfilled() then
				var81(p16)
				
				return
			end
		end)
	end, { var81, var79, var37 })
	local var83 = reactModule.useCallback(function(p17) --[[ line: 511 ]]
		-- upvalues: var37 (ref), var82 (ref)
		if var37 == nil then return end
		if var37.getNextHistoryPageToken() == nil then
			return
		end
		var82(p17)
	end, { var82, var37 })
	local var84 = reactModule.useRef(var83)
	var84.current = var83
	reactModule.useEffect(function() --[[ line: 523 ]]
		-- upvalues: var79 (ref), var81 (ref)
		var79.setOnScrolledToTop(function() --[[ line: 524 ]]
			-- upvalues: var81 (copy)
			var81(nil)
		end)
		
		return function() --[[ line: 527 ]]
			-- upvalues: var79 (copy)
			var79.setOnScrolledToTop(nil)
		end
	end, { var79.setOnScrolledToTop, var81 })
	reactModule.useEffect(function() --[[ line: 532 ]]
		-- upvalues: var35 (ref), var37 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var44 (write), sessionId (write), universeId (write), var84 (ref), creatorAgentChatStore (ref), var34 (ref), placeId (write)
		if var35 and var37 ~= nil then
			local var97 = false
			
			local function _(value) --[[ line: 547 | named "setHistoryLoading" ]]
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var44 (copy), var97 (write), var37 (copy), sessionId (copy), universeId (copy), var35 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil and not var97 then
					var44({
						session = var37,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var35,
						isLoading = value
					})
					
					return
				end
			end
			
			local var98 = not (var37.hasLoadedHistory() and #var37.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
				var44({
					session = var37,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var35,
					isLoading = var98
				})
			end
			local function isHydrateCancelled() --[[ line: 562 ]]
				-- upvalues: var97 (write), sessionId (ref), var37 (copy)
				return if var97 then true elseif sessionId == nil or sessionId == "" then false else var37.getCasSessionId() ~= sessionId
			end
			
			local _ = function() --[[ line: 571 | named "continueAfterSessionReady" ]]
				-- upvalues: var97 (write), sessionId (ref), var37 (copy), var84 (copy), isHydrateCancelled (ref)
				local var101
				if var97 then
					var101 = true
				elseif sessionId == nil or sessionId == "" then
					var101 = false
				else
					var101 = var37.getCasSessionId() ~= sessionId
					var101 = nil
				end
				if var101 then
					return
				end
				var84.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p18) --[[ line: 578 ]]
				-- upvalues: var37 (copy), var97 (write), sessionId (ref), var84 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var44 (copy), sessionId (copy), universeId (copy), var35 (copy)
				var37.setCasSessionId(p18)
				
				if var37.hasLoadedHistory() and #var37.getMergedHistory(false) > 0 then
					local var102
					if var97 then
						var102 = true
					elseif sessionId == nil or sessionId == "" then
						var102 = false
					else
						var102 = var37.getCasSessionId() ~= sessionId
						var102 = nil
					end
					if not var102 then
						var84.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
						if var97 then return end
						var44({
							isLoading = false,
							session = var37,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var35
						})
					end
					return
				elseif var37.refreshSession(isHydrateCancelled) then
					local var103
					if var97 then
						var103 = true
					elseif sessionId == nil or sessionId == "" then
						var103 = false
					else
						var103 = var37.getCasSessionId() ~= sessionId
						var103 = nil
					end
					if not var103 then
						if var97 then
							var103 = true
						elseif sessionId == nil or sessionId == "" then
							var103 = false
						else
							var103 = var37.getCasSessionId() ~= sessionId
							var103 = nil
						end
						if not var103 then
							var84.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
					if var97 then return end
					var44({
						isLoading = false,
						session = var37,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var35
					})
				end
			end
			
			task.spawn(function() --[[ line: 591 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var37 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var44 (copy), var97 (write), var35 (copy), creatorAgentChatStore (copy), sessionId (ref), var34 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var37.hasLoadedHistory() and #var37.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
						if var97 then return end
						var44({
							isLoading = false,
							session = var37,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var35
						})
					end
					return
				else
					local var104 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var104.state(false).status == "pending" do
						local var105
						if var97 then
							var105 = true
						elseif sessionId == nil or sessionId == "" then
							var105 = false
						else
							var105 = var37.getCasSessionId() ~= sessionId
							var105 = nil
						end
						if var105 then break end
						task.wait()
					end
					local result
					if var97 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var37.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var104.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
							if var97 then return end
							var44({
								isLoading = false,
								session = var37,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var35
							})
						end
						return
					else
						result = var104.state(false).result
						local var106 = if result ~= nil then nil else result.sessions
						local var107 = if typeof(var106) == "table" then var106[1] else nil
						local var108 = if typeof(var107) == "table" then var107.sessionId else nil
						
						if typeof(var108) == "string" and var108 ~= "" then
							var34({
								universeId = universeId,
								placeId = placeId,
								sessionId = var108
							})
							
							return
						end
						var37.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
							if var97 then return end
							var44({
								isLoading = false,
								session = var37,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var35
							})
						end
					end
				end
			end)
			
			return function() --[[ line: 635 ]]
				-- upvalues: var97 (write)
				var97 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var44 ~= nil then
			var44({
				isLoading = false,
				session = var37,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var35
			})
		end
	end, {
		var37, sessionId, universeId, placeId, creatorAgentChatStore, var35
	})
	reactModule.useEffect(function() --[[ line: 640 ]]
		-- upvalues: var37 (ref), sessionId (write), var84 (ref), messageBusService (copy), gameMessageId (copy), appLifecycleObserverService (copy)
		if var37 == nil then
			return
		end
		local var109 = false
		
		local function refreshKnownSession() --[[ line: 645 ]]
			-- upvalues: var37 (copy), sessionId (copy), var109 (write), var84 (copy)
			local casSessionId = var37.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 653 ]]
				-- upvalues: var37 (copy), var109 (copy), var84 (copy)
				if var37.refreshSession(function() --[[ line: 654 ]]
					-- upvalues: var109 (copy)
					return var109
				end) and not var109 then
					var84.current(function() --[[ line: 657 ]]
						-- upvalues: var109 (copy)
						return var109
					end)
				end
			end)
		end
		
		local var111 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 664 ]]
			-- upvalues: refreshKnownSession (ref)
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 669 ]]
			-- upvalues: var109 (write), var111 (ref), onUnhideConnection (ref)
			var109 = true
			var111:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var37, sessionId })
	reactModule.useEffect(function() --[[ line: 676 ]]
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var35 (ref), var79 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var35 then
			var79.lockToBottom()
			
			return
		end
	end, { var35, var37, sessionId, var79 })
	local var85 = reactModule.useCallback(function(p19) --[[ line: 683 ]]
		-- upvalues: var76 (ref), var73 (ref), var75 (ref)
		var76.current = p19
		var73(p19)
		var75(nil)
	end, { var73, var75 })
	local var86 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p20) --[[ line: 691 ]]
		-- upvalues: var58 (ref), var57 (ref), var37 (ref), sessionId (write), var76 (ref), var85 (ref), var75 (ref), creatorAgentChatModule_1 (copy)
		return function(p21, p22) --[[ line: 692 ]]
			-- upvalues: var58 (copy), p20 (ref), var57 (copy), var37 (copy), sessionId (copy), var76 (copy), var85 (copy), var75 (copy), creatorAgentChatModule_1 (copy)
			if var58.current == p20 then
				local current = var57.current
				local var114 = sessionId
				
				if not (if current == nil or current.session ~= var37 then false else var114 == nil or var114 == "" or (if current.sessionId ~= var114 then current.sessionId == nil and current.session.getCasSessionId() == var114 else true)) then return end
				if p21 ~= nil and var76.current == "" then
					var85(p21)
				end
				var75(creatorAgentChatModule_1.getToolResultFailureComposerError(p22))
				
				return
			end
		end
	end, { var37, sessionId, var85, var75 }) else nil
	local var87 = reactModule.useCallback(function(p23, p24, p25, p26) --[[ line: 708 ]]
		-- upvalues: var58 (ref), var60 (ref), var59 (ref), var50 (ref), p9 (ref), var80 (ref), var85 (ref), var75 (ref), creatorAgentChatModule_1 (copy), var79 (ref), sessionId (write), var32 (ref)
		if var58.current ~= p23 then return end
		var60(nil)
		var59.current = nil
		var50(nil)
		
		if p24 == nil then
			if p26.placeId ~= nil then
				var80(p26.placeId, "Completed")
			end
			var79.scrollToBottomAfterSend()
			local casSessionId = p26.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p9.createUniverseOnFirstPrompt and sessionId == nil and p26.universeId ~= nil then
					local t = {
						universeId = p26.universeId,
						placeId = p26.placeId,
						sessionId = casSessionId
					}
					var32(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 764 ]]
					-- upvalues: p26 (ref), var58 (copy), p23 (ref)
					p26.refreshSession(function() --[[ line: 765 ]]
						-- upvalues: var58 (copy), p23 (copy)
						return var58.current ~= p23
					end)
				end)
			end
			return
		elseif p9.onPromptFailure ~= nil then
			p9.onPromptFailure(p24.errorCode, p24.outOfCreditsReason)
		end
		if p26.placeId ~= nil then
			var80(p26.placeId, "Idle")
		end
		if p25 ~= nil then
			var85(p25)
			var75(creatorAgentChatModule_1.getPromptFailureComposerError(p24))
		end
		task.spawn(function() --[[ line: 735 ]]
			-- upvalues: p26 (ref), var58 (copy), p23 (ref)
			p26.refreshSession(function() --[[ line: 736 ]]
				-- upvalues: var58 (copy), p23 (copy)
				return var58.current ~= p23
			end)
		end)
	end, {
		p9.createUniverseOnFirstPrompt, p9.onPromptFailure, p9.onProjectResolved,
		sessionId, var80, var32, var79, var85, var75, var60, var50
	})
	local var88 = reactModule.useRef(var35)
	reactModule.useEffect(function() --[[ line: 788 ]]
		-- upvalues: var35 (ref), var88 (ref), var70 (ref), var62 (ref), var79 (ref)
		local var117 = var35 and not var88.current
		var88.current = var35
		
		if not var35 then return end
		if var117 or var70 or var62 ~= nil then
			var79.scrollToBottomUnconditionally()
			task.defer(var79.scrollToBottomUnconditionally)
			task.delay(0.15, var79.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var35,
		var70,
		var62,
		#messages,
		var79
	})
	reactModule.useEffect(function() --[[ line: 814 ]]
		-- upvalues: var56 (ref), var57 (ref), var37 (ref), sessionId (write), var54 (ref), var58 (ref), var59 (ref), placeId (write), var80 (ref), creatorAgentChatModule_1 (copy), var87 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var86 (write), var60 (ref), var79 (ref), var68 (ref), var62 (ref), creatorAgentChatStore (ref), var70 (ref)
		local var118
		if var56.current ~= nil then
			local current = var57.current
			var118 = sessionId
			
			if if current == nil or current.session ~= var37 then false else var118 == nil or var118 == "" or (if current.sessionId ~= var118 then current.sessionId == nil and current.session.getCasSessionId() == var118 else true) then return end
		end
		if var54 ~= nil then return end
		if var37 == nil then return end
		local var120
		local casSessionId = var37.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var120 = casSessionId
		else
			var118 = var37.universeId
			local placeId_1 = var37.placeId
			var120 = if var118 == nil or placeId_1 == nil then nil else `{var118}:{placeId_1}`
		end
		if var120 == nil then return end
		local function current(p27, p28) --[[ line: 836 | named "attachResumedTurn" ]]
			-- upvalues: var58 (copy), var59 (copy), placeId (copy), var80 (copy), creatorAgentChatModule_1 (copy), var37 (copy), var87 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var86 (copy), var60 (copy), var79 (copy)
			var58.current += 1
			local current = var58.current
			var59.current = p28
			
			if placeId ~= nil then
				var80(placeId, "Loading")
			end
			local var122 = creatorAgentChatModule_1.createResumedAssistantTurn(var37, p27, function(p29) --[[ line: 846 ]]
				-- upvalues: var87 (copy), current (ref), var37 (copy)
				var87(current, p29, nil, var37)
			end, if p28 ~= nil then nil else p28 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var86(current) else nil)
			var60(var122, var37)
			var122.start()
			var79.scrollToBottomUnconditionally()
		end
		
		if var68.activeTurnState == nil or var68.activeTurnItemIndex == nil or var68.activeTurnState.isDone then
			var59.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var120)
			var118 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var121 = casSessionId ~= nil and (var118 ~= nil and not var118.isDone)
			
			if not var70 and not var121 then return end
			if var121 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var68.activeTurnStartSequenceId
			
			if var59.current == casSessionId and var62 ~= nil then return end
			var118 = creatorAgentChatStore.resumeTurnFromHistory(var120, var68.activeTurnState, var68.activeTurnSequenceIds)
			
			if var118 ~= nil then
				current(var118, casSessionId)
			end
		end
	end, {
		var68, var37, sessionId, creatorAgentChatStore, var70, var62, placeId, var80,
		var87, var79, var60, var54, var86
	})
	local var89 = reactModule.useCallback(function(p30, p31, p32, p33) --[[ line: 912 ]]
		-- upvalues: var50 (ref), creatorAgentChatModule_1 (copy), var87 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var86 (write), var80 (ref), var60 (ref), var79 (ref)
		var50({ text = p31, afterSequenceId = p33 })
		local _ = nil
		local var123 = creatorAgentChatModule_1.createLiveAssistantTurn(p30, p31, function(p34) --[[ line: 919 ]]
			-- upvalues: var87 (copy), p32 (ref), p31 (ref), p30 (ref)
			var87(p32, p34, p31, p30)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var86(p32) else nil)
		
		if p30.placeId ~= nil then
			var80(p30.placeId, "Loading")
		end
		var60(var123, p30)
		var79.scrollToBottomAfterSend()
		var123.start()
	end, {
		var87, var80, var79, var60, var50, var86
	})
	local var90 = reactModule.useCallback(function(p35, p36, p37) --[[ line: 945 ]]
		-- upvalues: var50 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var58 (ref), universeConfigurationModule (copy), var32 (ref), p9 (ref), creatorAgentChatStore (ref), sessionId (write), var89 (ref), var60 (ref), var85 (ref), var75 (ref), CHAT_CREATE_UNIVERSE_ERROR (copy)
		var50({ text = p35, afterSequenceId = p37 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p39) --[[ line: 953 ]]
			-- upvalues: debug (copy), processTime (ref), var58 (copy), p36 (ref), universeConfigurationModule (copy), var32 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var89 (copy), p35 (ref), p37 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p39.universeId,
				rootPlaceId = p39.rootPlaceId
			})
			
			if var58.current == p36 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p39.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 968 ]]
					-- upvalues: universeConfigurationStore (ref), p39 (ref)
					return universeConfigurationStore.setTeamCreate(p39.universeId, true)
				end):andThen(function() --[[ line: 971 ]]
					-- upvalues: var58 (copy), p36 (copy), p39 (ref), var32 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var89 (copy), p35 (copy), p37 (copy)
					if var58.current ~= p36 then
						return nil
					end
					local t = { universeId = p39.universeId, placeId = p39.rootPlaceId }
					var32(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
					var89(creatorAgentChatStore.getSessionForProject(p39.universeId, p39.rootPlaceId, sessionId), p35, p36, p37)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p38) --[[ line: 994 ]]
			-- upvalues: debug (copy), processTime (ref), var58 (copy), p36 (ref), var60 (copy), var50 (copy), var85 (copy), p35 (ref), var75 (copy), CHAT_CREATE_UNIVERSE_ERROR (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p38
			})
			
			if var58.current == p36 then
				var60(nil)
				var50(nil)
				var85(p35)
				var75(CHAT_CREATE_UNIVERSE_ERROR)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p9.onProjectResolved, var60, var85, var75,
		var32, var50, var89
	})
	local var91 = reactModule.useCallback(function() --[[ line: 1022 ]]
		-- upvalues: var76 (ref), var85 (ref), var70 (ref), var57 (ref), var37 (ref), sessionId (write), var56 (ref), var77 (ref), var79 (ref), p9 (ref), universeId (write), var58 (ref), var52 (ref), var90 (ref), var68 (ref), var89 (ref)
		local replaced = string.gsub(var76.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var85("")
			
			return false
		elseif var70 then
			local current = var57.current
			local var128 = sessionId
			local var129 = if if current == nil or current.session ~= var37 then false else var128 == nil or var128 == "" or (if current.sessionId ~= var128 then current.sessionId == nil and current.session.getCasSessionId() == var128 else true) then var56.current else nil
			
			if var129 == nil or not var129.trySubmitComposerText(replaced) then
				return false
			end
			var85("")
			
			if var77.current then
				var77.current.releaseFocus()
			end
			var79.scrollToBottomAfterSend()
			
			return true
		else
			local var130 = p9.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var130 and var37 == nil then
				return false
			end
			var79.captureStickToBottomForSend()
			var58.current += 1
			local current = var58.current
			var52(nil)
			var85("")
			
			if var77.current then
				var77.current.releaseFocus()
			end
			if var130 then
				var90(replaced, current, var68.latestSequenceId)
			else
				var89(var37, replaced, current, var68.latestSequenceId)
			end
			return true
		end
	end, {
		var37, sessionId, universeId, var70, var79, var85, var90, var89,
		p9.createUniverseOnFirstPrompt, var52, var68
	})
	local var92 = reactModule.useCallback(function() --[[ line: 1079 ]]
		-- upvalues: var57 (ref), var37 (ref), sessionId (write), var56 (ref), var58 (ref), var60 (ref), var59 (ref), var50 (ref), var52 (ref), var68 (ref), placeId (write), var80 (ref)
		local current = var57.current
		local var131 = if if current == nil or current.session ~= var37 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var56.current else nil
		
		if var131 == nil then return end
		var58.current += 1
		var131.stop()
		var60(nil)
		var59.current = nil
		var50(nil)
		var52({
			session = var37,
			sessionId = var37.getCasSessionId(),
			startSequenceId = var68.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var80(placeId, "Idle")
		end
	end, {
		var37, sessionId, placeId, var80, var60, var50, var52, var68
	})
	local var93 = p9.autoFocusComposer == nil or p9.autoFocusComposer
	local var94 = if p9.focusComposerWhen == nil then var93 else p9.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1114 ]]
		-- upvalues: var93 (ref), var94 (ref), var77 (ref)
		if var93 and var94 then
			local var132 = false
			
			local var133 = function() --[[ line: 1119 ]]
				-- upvalues: var132 (write)
				return var132
			end
			
			local var134 = 8
			
			local function tryFocus() --[[ line: 182 ]]
				-- upvalues: var133 (ref), var77 (ref), var134 (write), tryFocus (ref)
				if var133() then return end
				local current = var77.current
				
				if current then
					current.focus()
					
					return
				end
				var134 -= 1
				
				if var134 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 1122 ]]
				-- upvalues: var132 (write)
				var132 = true
			end
		end
		return function() --[[ line: 1116 ]] end
	end, { var93, var94 })
	
	return {
		messages = messages,
		localToolActions = var65,
		composerText = var72,
		composerErrorText = var74,
		setComposerText = var85,
		isAssistantResponding = var70,
		canStopAssistantResponse = var62 ~= nil,
		canSendWhileResponding = var71,
		sendMessage = var91,
		stopAssistantResponse = var92,
		setScrollingFrame = var79.setScrollingFrame,
		textBoxRef = var77,
		clockBinding = var78,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p40) --[[ line: 1127 ]]
			-- upvalues: placeId (write), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then
				return
			end
			launchPlaytestWithLoadingStateModule(placeId, p40, true)
		end, { placeId }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var48
	}
end