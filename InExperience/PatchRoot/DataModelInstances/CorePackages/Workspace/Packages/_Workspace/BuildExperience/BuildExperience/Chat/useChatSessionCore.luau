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
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local _ = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)
local sessionPromptMessageFilterModule = require(script.Parent.sessionPromptMessageFilter)
local useChatScrollModule = require(script.Parent.useChatScroll)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local debug = creatorAgentChatModule.debug
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var27 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var28 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var29 = signalsModule.createSignal(nil)
local var30 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p0, p1, p2)
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3)
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

local _ = function(p4)
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5)
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7)
	local var32 = 8
	
	local function tryFocus()
		-- upvalues: p7 (ref), p6 (ref), var32 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var32 -= 1
		
		if var32 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p8)
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

local _ = function(p9, p10, p11, p12, p13)
	-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref)
	return if p9 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p10 == true and (p11 == nil and p12 ~= nil))) then nil else { setupErrorText = p13 }
end

return function(p14)
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), creatorAgentChatModule (ref), var30 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var27 (ref), var28 (ref), var29 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var35 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var36 = if fFlagBuildLocalization then var35:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var37, var38 = reactModule.useState(nil)
	local var39, var40 = reactModule.useState(nil)
	local var41 = nil
	local var42 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var43 = reactModule.useRef(true)
		var41 = var43
		var42 = reactModule.useCallback(function()
			-- upvalues: var43 (ref)
			return var43.current
		end, { var43 })
	end
	local placeId = p14.placeId
	local universeId = p14.universeId
	local sessionId = p14.sessionId
	
	if var37 ~= nil then
		placeId = var37.placeId
		universeId = var37.universeId
		sessionId = var37.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var39 ~= nil and var39.universeId == universeId) and var39.placeId == placeId then
		sessionId = var39.sessionId
	end
	local var44 = p14.hydrateHistoryWhen == nil or p14.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var46 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var46 (ref), sessionId (write)
		if var46 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var46.setCasSessionId(sessionId)
	end, { var46, sessionId })
	local var47 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var46 (ref), var30 (copy), signalsModule (copy)
		return if var46 == nil then var30 else signalsModule.createComputed(function(p15)
			-- upvalues: var46 (copy)
			return {
				session = var46,
				sessionId = var46.getCasSessionId(),
				events = var46.getMergedHistory(p15)
			}
		end)
	end, { var46 }))
	local var48 = if var47.session == var46 and var47.sessionId == (if var46 ~= nil then nil else var46.getCasSessionId()) then var47.events else {}
	local var49 = sessionId ~= nil and sessionId ~= ""
	local var50 = var49 or (universeId ~= nil and universeId ~= 0)
	local var51 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var51 then
		var51 = var44
		
		if var51 then
			var51 = false
			
			if var46 ~= nil then
				var51 = var50
				
				if var51 then
					var51 = not (var46.hasLoadedHistory() and #var48 > 0)
				end
			end
		end
	end
	local var52 = nil
	local var53 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var54, var55 = reactModule.useState(function()
			-- upvalues: var46 (ref), sessionId (write), universeId (write), var44 (ref), var51 (ref)
			return {
				session = var46,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var44,
				isLoading = var51
			}
		end)
		var52 = var54
		var53 = var55
	end
	local var56 = var52 ~= nil and (var52.session == var46 and (var52.sessionId == sessionId and (var52.universeId == universeId and var52.hydrateHistoryWhen == var44)))
	local var57 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var56 then var52.isLoading else var51) or (var46 ~= nil and var46.getNextHistoryPageToken() ~= nil))
	local var58, var59 = reactModule.useState(nil)
	local var60, var61 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var61 (ref)
		var61(nil)
	end, { var46, sessionId })
	local var62 = sessionId
	local var63 = if if var60 == nil or var60.session ~= var46 then false else var62 == nil or var62 == "" or (if var60.sessionId ~= var62 then var60.sessionId == nil and var60.session.getCasSessionId() == var62 else true) then var60 else nil
	var64, var62 = reactModule.useState(nil)
	local var65 = reactModule.useRef(nil)
	local var66 = reactModule.useRef(nil)
	local var67 = reactModule.useRef(0)
	local var68 = reactModule.useRef(nil)
	local var69 = reactModule.useCallback(function(p16, p17)
		-- upvalues: var65 (ref), var66 (ref), var62 (ref)
		assert(if p16 ~= nil then p17 ~= nil else true, "Active turns require an owning session")
		var65.current = p16
		var66.current = if p16 ~= nil then nil else { session = p17, sessionId = p17.getCasSessionId() }
		var62(p16)
	end, { var62 })
	local current = var66.current
	local var70 = sessionId
	local var71 = if if current == nil or current.session ~= var46 then false else var70 == nil or var70 == "" or (if current.sessionId ~= var70 then current.sessionId == nil and current.session.getCasSessionId() == var70 else true) then var64 else nil
	reactModule.useLayoutEffect(function()
		-- upvalues: var64 (ref), var66 (ref), var46 (ref), sessionId (write), var67 (ref), var68 (ref), var69 (ref), var59 (ref), var61 (ref)
		if var64 ~= nil then
			local current = var66.current
			local var105 = sessionId
			
			if if current == nil or current.session ~= var46 then false else var105 == nil or var105 == "" or (if current.sessionId ~= var105 then current.sessionId == nil and current.session.getCasSessionId() == var105 else true) then
				return
			else
				var67.current += 1
				var68.current = nil
				var64.detach()
				var69(nil, nil)
				var59(nil)
				var61(nil)
			end
		end
	end, { var46, sessionId, var64, var69 })
	local var72 = if var71 ~= nil then var27 else var71.getOptimisticLocalTools
	current = if var71 ~= nil then var28 else var71.getLocalToolActions
	var70 = if var71 ~= nil then var29 else var71.getSetupErrorText
	local var73 = signalsReactModule.useSignalState(var72)
	local var74 = signalsReactModule.useSignalState(current)
	local var75 = signalsReactModule.useSignalState(var70)
	local _ = nil
	local var76 = if fFlagBuildLocalization and var75 ~= nil then var35:Format(var75) else var75
	local var77 = reactModule.useMemo(function()
		-- upvalues: var71 (ref), p14 (ref), var46 (ref), var58 (ref), var76 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var71 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p14.createUniverseOnFirstPrompt == true and (var46 == nil and var58 ~= nil))) then nil else { setupErrorText = var76 }
	end, {
		var71,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p14.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var58 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var46 else nil,
		var76
	})
	local var78 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var48 (ref), var46 (ref), sessionId (write), universeId (write), placeId (write), var73 (ref), var58 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), var77 (ref), var63 (ref)
		return parseSessionStreamModule(var48, {
			sessionId = if var46 ~= nil then sessionId else var46.getCasSessionId() or sessionId,
			universeId = if var46 ~= nil then universeId else var46.universeId,
			placeId = if var46 ~= nil then placeId else var46.placeId,
			optimisticLocalTools = var73,
			pendingUserMessage = if var58 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var58.text) then nil else var58.text,
			pendingUserMessageAfterSequenceId = if var58 ~= nil then nil else var58.afterSequenceId,
			liveAssistantMessage = var77,
			optimisticCancelledStartSequenceId = if var63 ~= nil then nil else var63.startSequenceId
		})
	end, {
		var48, var46, sessionId, universeId, placeId, var73, var58, var77, var63
	})
	local messages = var78.messages
	local subagentTaskState = var78.subagentTaskState
	local includesPublishTool = var78.includesPublishTool
	local var79 = messages[#messages]
	local var80 = if var71 == nil then var79 ~= nil and (var79.kind == "assistant_turn" and not var79.isDone) else true
	local var81 = var80 and hasPendingLocalToolResponse(var73)
	local activeTurnState = var78.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var71 (ref), activeTurnState (ref)
		if var71 == nil or activeTurnState == nil then
			return
		end
		var71.syncFromTurnState(activeTurnState)
	end, { var71, activeTurnState })
	reactModule.useEffect(function()
		-- upvalues: var78 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var78.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var78.includesPublishTool, placeId })
	local var82, var83 = reactModule.useBinding("")
	local var84, var85 = reactModule.useState(nil)
	local var86 = reactModule.useRef("")
	local var87 = reactModule.useRef(nil)
	local var88 = reactUtilsModule.useClock()
	local var89 = useChatScrollModule()
	local var90 = reactModule.useCallback(function(p18, p19)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p18, p19)
	end, {})
	local var91 = reactModule.useCallback(function(p20)
		-- upvalues: var89 (ref), var46 (ref)
		local var106 = function()
			-- upvalues: p20 (ref)
			return if p20 == nil then false else p20()
		end
		
		var89.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var46 (copy), var106 (ref), var89 (copy), p20 (ref)
			if var46 == nil then return end
			if var46.loadOlderHistory(var106) and var46.getNextHistoryPageToken() ~= nil and var89.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p20 (copy), var89 (copy), var46 (copy), var106 (copy)
					if if p20 ~= nil then false else p20() then return end
					if var89.isViewportUnderfilled() then
						var46.loadOlderHistory(var106)
					end
				end)
			end
		end)
	end, { var46, var89 })
	local var92 = reactModule.useCallback(function(p21)
		-- upvalues: var46 (ref), var89 (ref), var91 (ref)
		task.delay(0.1, function()
			-- upvalues: p21 (ref), var46 (copy), var89 (copy), var91 (copy)
			if p21() then return end
			if var46 == nil then return end
			if var46.getNextHistoryPageToken() == nil then return end
			if var89.isViewportUnderfilled() then
				var91(p21)
				
				return
			end
		end)
	end, { var91, var89, var46 })
	local var93 = reactModule.useCallback(function(p22)
		-- upvalues: var46 (ref), var92 (ref)
		if var46 == nil then return end
		if var46.getNextHistoryPageToken() == nil then
			return
		end
		var92(p22)
	end, { var92, var46 })
	local var94 = reactModule.useRef(var93)
	var94.current = var93
	reactModule.useEffect(function()
		-- upvalues: var89 (ref), var91 (ref)
		var89.setOnScrolledToTop(function()
			-- upvalues: var91 (copy)
			var91(nil)
		end)
		
		return function()
			-- upvalues: var89 (copy)
			var89.setOnScrolledToTop(nil)
		end
	end, { var89.setOnScrolledToTop, var91 })
	reactModule.useEffect(function()
		-- upvalues: var44 (ref), var46 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var53 (write), sessionId (write), universeId (write), var94 (ref), creatorAgentChatStore (ref), var40 (ref), placeId (write)
		if var44 and var46 ~= nil then
			local var107 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var53 (copy), var107 (write), var46 (copy), sessionId (copy), universeId (copy), var44 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil and not var107 then
					var53({
						session = var46,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var44,
						isLoading = value
					})
					
					return
				end
			end
			
			local var108 = not (var46.hasLoadedHistory() and #var46.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
				var53({
					session = var46,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var44,
					isLoading = var108
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var107 (write), sessionId (ref), var46 (copy)
				return if var107 then true elseif sessionId == nil or sessionId == "" then false else var46.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var107 (write), sessionId (ref), var46 (copy), var94 (copy), isHydrateCancelled (ref)
				local var111
				if var107 then
					var111 = true
				elseif sessionId == nil or sessionId == "" then
					var111 = false
				else
					var111 = var46.getCasSessionId() ~= sessionId
					var111 = nil
				end
				if var111 then
					return
				end
				var94.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p23)
				-- upvalues: var46 (copy), var107 (write), sessionId (ref), var94 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var53 (copy), sessionId (copy), universeId (copy), var44 (copy)
				var46.setCasSessionId(p23)
				
				if var46.hasLoadedHistory() and #var46.getMergedHistory(false) > 0 then
					local var112
					if var107 then
						var112 = true
					elseif sessionId == nil or sessionId == "" then
						var112 = false
					else
						var112 = var46.getCasSessionId() ~= sessionId
						var112 = nil
					end
					if not var112 then
						var94.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
						if var107 then return end
						var53({
							isLoading = false,
							session = var46,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var44
						})
					end
					return
				elseif var46.refreshSession(isHydrateCancelled) then
					local var113
					if var107 then
						var113 = true
					elseif sessionId == nil or sessionId == "" then
						var113 = false
					else
						var113 = var46.getCasSessionId() ~= sessionId
						var113 = nil
					end
					if not var113 then
						if var107 then
							var113 = true
						elseif sessionId == nil or sessionId == "" then
							var113 = false
						else
							var113 = var46.getCasSessionId() ~= sessionId
							var113 = nil
						end
						if not var113 then
							var94.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
					if var107 then return end
					var53({
						isLoading = false,
						session = var46,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var44
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var46 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var53 (copy), var107 (write), var44 (copy), creatorAgentChatStore (copy), sessionId (ref), var40 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var46.hasLoadedHistory() and #var46.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
						if var107 then return end
						var53({
							isLoading = false,
							session = var46,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var44
						})
					end
					return
				else
					local var114 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var114.state(false).status == "pending" do
						local var115
						if var107 then
							var115 = true
						elseif sessionId == nil or sessionId == "" then
							var115 = false
						else
							var115 = var46.getCasSessionId() ~= sessionId
							var115 = nil
						end
						if var115 then break end
						task.wait()
					end
					local result
					if var107 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var46.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var114.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
							if var107 then return end
							var53({
								isLoading = false,
								session = var46,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var44
							})
						end
						return
					else
						result = var114.state(false).result
						local var116 = if result ~= nil then nil else result.sessions
						local var117 = if typeof(var116) == "table" then var116[1] else nil
						local var118 = if typeof(var117) == "table" then var117.sessionId else nil
						
						if typeof(var118) == "string" and var118 ~= "" then
							var40({
								universeId = universeId,
								placeId = placeId,
								sessionId = var118
							})
							
							return
						end
						var46.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
							if var107 then return end
							var53({
								isLoading = false,
								session = var46,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var44
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var107 (write)
				var107 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var53 ~= nil then
			var53({
				isLoading = false,
				session = var46,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var44
			})
		end
	end, {
		var46, sessionId, universeId, placeId, creatorAgentChatStore, var44
	})
	reactModule.useEffect(function()
		-- upvalues: var46 (ref), sessionId (write), var94 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var41 (write), appLifecycleObserverService (copy)
		if var46 == nil then
			return
		end
		local var119 = false
		
		local function refreshKnownSession()
			-- upvalues: var46 (copy), sessionId (copy), var119 (write), var94 (copy)
			local casSessionId = var46.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var46 (copy), var119 (copy), var94 (copy)
				if var46.refreshSession(function()
					-- upvalues: var119 (copy)
					return var119
				end) and not var119 then
					var94.current(function()
						-- upvalues: var119 (copy)
						return var119
					end)
				end
			end)
		end
		
		local var121 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var41 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var41 ~= nil then
				var41.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var119 (write), var121 (ref), onUnhideConnection (ref)
			var119 = true
			var121:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var46, sessionId, var41 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var44 (ref), var89 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var44 then
			var89.lockToBottom()
			
			return
		end
	end, { var44, var46, sessionId, var89 })
	local var95 = reactModule.useCallback(function(p24)
		-- upvalues: var86 (ref), var83 (ref), var85 (ref)
		var86.current = p24
		var83(p24)
		var85(nil)
	end, { var83, var85 })
	local var96 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p25)
		-- upvalues: var67 (ref), var66 (ref), var46 (ref), sessionId (write), var86 (ref), var95 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var35 (ref), var85 (ref)
		return function(p26, p27)
			-- upvalues: var67 (copy), p25 (ref), var66 (copy), var46 (copy), sessionId (copy), var86 (copy), var95 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var35 (copy), var85 (copy)
			if var67.current == p25 then
				local current = var66.current
				local var124 = sessionId
				
				if not (if current == nil or current.session ~= var46 then false else var124 == nil or var124 == "" or (if current.sessionId ~= var124 then current.sessionId == nil and current.session.getCasSessionId() == var124 else true)) then return end
				if p26 ~= nil and var86.current == "" then
					var95(p26)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p27)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var35:Format(toolResultFailureComposerError)
				end
				var85(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var46,
		sessionId,
		var95,
		var85,
		var35
	}) else nil
	local var97 = reactModule.useCallback(function(p28, p29, p30, p31)
		-- upvalues: var67 (ref), var69 (ref), var68 (ref), var59 (ref), p14 (ref), var90 (ref), var95 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var35 (ref), var85 (ref), var89 (ref), sessionId (write), var38 (ref)
		if var67.current ~= p28 then return end
		var69(nil)
		var68.current = nil
		var59(nil)
		
		if p29 == nil then
			if p31.placeId ~= nil then
				var90(p31.placeId, "Completed")
			end
			var89.scrollToBottomAfterSend()
			local casSessionId = p31.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p14.createUniverseOnFirstPrompt and sessionId == nil and p31.universeId ~= nil then
					local t = {
						universeId = p31.universeId,
						placeId = p31.placeId,
						sessionId = casSessionId
					}
					var38(t)
					
					if p14.onProjectResolved ~= nil then
						p14.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p31 (ref), var67 (copy), p28 (ref)
					p31.refreshSession(function()
						-- upvalues: var67 (copy), p28 (copy)
						return var67.current ~= p28
					end)
				end)
			end
			return
		elseif p14.onPromptFailure ~= nil then
			p14.onPromptFailure(p29.errorCode, p29.outOfCreditsReason)
		end
		if p31.placeId ~= nil then
			var90(p31.placeId, "Idle")
		end
		if p30 ~= nil then
			var95(p30)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p29)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var35:Format(promptFailureComposerError)
			end
			var85(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p31 (ref), var67 (copy), p28 (ref)
			p31.refreshSession(function()
				-- upvalues: var67 (copy), p28 (copy)
				return var67.current ~= p28
			end)
		end)
	end, {
		p14.createUniverseOnFirstPrompt, p14.onPromptFailure, p14.onProjectResolved,
		sessionId, var90, var38, var89, var95, var85, var69, var59, var35
	})
	local var98 = reactModule.useRef(var44)
	reactModule.useEffect(function()
		-- upvalues: var44 (ref), var98 (ref), var80 (ref), var71 (ref), var89 (ref)
		local var129 = var44 and not var98.current
		var98.current = var44
		
		if not var44 then return end
		if var129 or var80 or var71 ~= nil then
			var89.scrollToBottomUnconditionally()
			task.defer(var89.scrollToBottomUnconditionally)
			task.delay(0.15, var89.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var44,
		var80,
		var71,
		#messages,
		var89
	})
	reactModule.useEffect(function()
		-- upvalues: var65 (ref), var66 (ref), var46 (ref), sessionId (write), var63 (ref), var67 (ref), var68 (ref), placeId (write), var90 (ref), creatorAgentChatModule_1 (copy), var97 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var96 (write), var42 (write), var69 (ref), var89 (ref), var78 (ref), var71 (ref), creatorAgentChatStore (ref), var80 (ref)
		local var130
		if var65.current ~= nil then
			local current = var66.current
			var130 = sessionId
			
			if if current == nil or current.session ~= var46 then false else var130 == nil or var130 == "" or (if current.sessionId ~= var130 then current.sessionId == nil and current.session.getCasSessionId() == var130 else true) then return end
		end
		if var63 ~= nil then return end
		if var46 == nil then return end
		local var132
		local casSessionId = var46.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var132 = casSessionId
		else
			var130 = var46.universeId
			local placeId_1 = var46.placeId
			var132 = if var130 == nil or placeId_1 == nil then nil else `{var130}:{placeId_1}`
		end
		if var132 == nil then return end
		local function current(p32, p33)
			-- upvalues: var67 (copy), var68 (copy), placeId (copy), var90 (copy), creatorAgentChatModule_1 (copy), var46 (copy), var97 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var96 (copy), var42 (copy), var69 (copy), var89 (copy)
			var67.current += 1
			local current = var67.current
			var68.current = p33
			
			if placeId ~= nil then
				var90(placeId, "Loading")
			end
			local var134 = creatorAgentChatModule_1.createResumedAssistantTurn(var46, p32, function(p34)
				-- upvalues: var97 (copy), current (ref), var46 (copy)
				var97(current, p34, nil, var46)
			end, if p33 ~= nil then nil else p33 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var96(current) else nil, var42)
			var69(var134, var46)
			var134.start()
			var89.scrollToBottomUnconditionally()
		end
		
		if var78.activeTurnState == nil or var78.activeTurnItemIndex == nil or var78.activeTurnState.isDone then
			var68.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var132)
			var130 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var133 = casSessionId ~= nil and (var130 ~= nil and not var130.isDone)
			
			if not var80 and not var133 then return end
			if var133 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var78.activeTurnStartSequenceId
			
			if var68.current == casSessionId and var71 ~= nil then return end
			var130 = creatorAgentChatStore.resumeTurnFromHistory(var132, var78.activeTurnState, var78.activeTurnSequenceIds)
			
			if var130 ~= nil then
				current(var130, casSessionId)
			end
		end
	end, {
		var78, var46, sessionId, creatorAgentChatStore, var80, var71, placeId, var90,
		var97, var89, var69, var63, var96, var42
	})
	local var99 = reactModule.useCallback(function(p35, p36, p37, p38)
		-- upvalues: var59 (ref), creatorAgentChatModule_1 (copy), var97 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var96 (write), var42 (write), var90 (ref), var69 (ref), var89 (ref)
		var59({ text = p36, afterSequenceId = p38 })
		local _ = nil
		local var135 = creatorAgentChatModule_1.createLiveAssistantTurn(p35, p36, function(p39)
			-- upvalues: var97 (copy), p37 (ref), p36 (ref), p35 (ref)
			var97(p37, p39, p36, p35)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var96(p37) else nil, var42)
		
		if p35.placeId ~= nil then
			var90(p35.placeId, "Loading")
		end
		var69(var135, p35)
		var89.scrollToBottomAfterSend()
		var135.start()
	end, {
		var97, var90, var89, var69, var59, var96, var42
	})
	local var100 = reactModule.useCallback(function(p40, p41, p42)
		-- upvalues: var59 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var67 (ref), universeConfigurationModule (copy), var38 (ref), p14 (ref), creatorAgentChatStore (ref), sessionId (write), var99 (ref), var69 (ref), var95 (ref), var85 (ref), var36 (write)
		var59({ text = p40, afterSequenceId = p42 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p44)
			-- upvalues: debug (copy), processTime (ref), var67 (copy), p41 (ref), universeConfigurationModule (copy), var38 (copy), p14 (copy), creatorAgentChatStore (copy), sessionId (copy), var99 (copy), p40 (ref), p42 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p44.universeId,
				rootPlaceId = p44.rootPlaceId
			})
			
			if var67.current == p41 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p44.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p44 (ref)
					return universeConfigurationStore.setTeamCreate(p44.universeId, true)
				end):andThen(function()
					-- upvalues: var67 (copy), p41 (copy), p44 (ref), var38 (copy), p14 (copy), creatorAgentChatStore (copy), sessionId (copy), var99 (copy), p40 (copy), p42 (copy)
					if var67.current ~= p41 then
						return nil
					end
					local t = { universeId = p44.universeId, placeId = p44.rootPlaceId }
					var38(t)
					
					if p14.onProjectResolved ~= nil then
						p14.onProjectResolved(t)
					end
					var99(creatorAgentChatStore.getSessionForProject(p44.universeId, p44.rootPlaceId, sessionId), p40, p41, p42)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p43)
			-- upvalues: debug (copy), processTime (ref), var67 (copy), p41 (ref), var69 (copy), var59 (copy), var95 (copy), p40 (ref), var85 (copy), var36 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p43
			})
			
			if var67.current == p41 then
				var69(nil)
				var59(nil)
				var95(p40)
				var85(var36)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p14.onProjectResolved, var69, var95, var85,
		var38, var59, var99, var36
	})
	local var101 = reactModule.useCallback(function()
		-- upvalues: var86 (ref), var95 (ref), var80 (ref), var66 (ref), var46 (ref), sessionId (write), var65 (ref), var87 (ref), var89 (ref), p14 (ref), universeId (write), var67 (ref), var61 (ref), var100 (ref), var78 (ref), var99 (ref)
		local replaced = string.gsub(var86.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var95("")
			
			return false
		elseif var80 then
			local current = var66.current
			local var140 = sessionId
			local var141 = if if current == nil or current.session ~= var46 then false else var140 == nil or var140 == "" or (if current.sessionId ~= var140 then current.sessionId == nil and current.session.getCasSessionId() == var140 else true) then var65.current else nil
			
			if var141 == nil or not var141.trySubmitComposerText(replaced) then
				return false
			end
			var95("")
			
			if var87.current then
				var87.current.releaseFocus()
			end
			var89.scrollToBottomAfterSend()
			
			return true
		else
			local var142 = p14.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var142 and var46 == nil then
				return false
			end
			var89.captureStickToBottomForSend()
			var67.current += 1
			local current = var67.current
			var61(nil)
			var95("")
			
			if var87.current then
				var87.current.releaseFocus()
			end
			if var142 then
				var100(replaced, current, var78.latestSequenceId)
			else
				var99(var46, replaced, current, var78.latestSequenceId)
			end
			return true
		end
	end, {
		var46, sessionId, universeId, var80, var89, var95, var100, var99,
		p14.createUniverseOnFirstPrompt, var61, var78
	})
	local var102 = reactModule.useCallback(function()
		-- upvalues: var66 (ref), var46 (ref), sessionId (write), var65 (ref), var67 (ref), var69 (ref), var68 (ref), var59 (ref), var61 (ref), var78 (ref), placeId (write), var90 (ref)
		local current = var66.current
		local var143 = if if current == nil or current.session ~= var46 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var65.current else nil
		
		if var143 == nil then return end
		var67.current += 1
		var143.stop()
		var69(nil)
		var68.current = nil
		var59(nil)
		var61({
			session = var46,
			sessionId = var46.getCasSessionId(),
			startSequenceId = var78.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var90(placeId, "Idle")
		end
	end, {
		var46, sessionId, placeId, var90, var69, var59, var61, var78
	})
	local var103 = p14.autoFocusComposer == nil or p14.autoFocusComposer
	local var104 = if p14.focusComposerWhen == nil then var103 else p14.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var103 (ref), var104 (ref), var87 (ref)
		if var103 and var104 then
			local var144 = false
			
			local var145 = function()
				-- upvalues: var144 (write)
				return var144
			end
			
			local var146 = 8
			
			local function tryFocus()
				-- upvalues: var145 (ref), var87 (ref), var146 (write), tryFocus (ref)
				if var145() then return end
				local current = var87.current
				
				if current then
					current.focus()
					
					return
				end
				var32 -= 1
				
				if var32 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var144 (write)
				var144 = true
			end
		end
		return function() end
	end, { var103, var104 })
	
	return {
		messages = messages,
		localToolActions = var74,
		composerText = var82,
		composerErrorText = var84,
		setComposerText = var95,
		isAssistantResponding = var80,
		canStopAssistantResponse = var71 ~= nil,
		canSendWhileResponding = var81,
		sendMessage = var101,
		stopAssistantResponse = var102,
		setScrollingFrame = var89.setScrollingFrame,
		textBoxRef = var87,
		clockBinding = var88,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p45)
			-- upvalues: placeId (write), var41 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var148 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var41 ~= nil) then function()
				-- upvalues: var41 (ref)
				var41.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p45, true, var148) and var148 ~= nil and var41 ~= nil then
				var41.current = false
			end
		end, { placeId, var41 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var57
	}
end