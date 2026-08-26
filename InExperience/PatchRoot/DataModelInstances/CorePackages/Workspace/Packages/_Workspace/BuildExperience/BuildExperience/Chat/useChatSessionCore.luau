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
local debug = creatorAgentChatModule.debug
local var1 = signalsModule.createSignal(false)
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var2 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var3 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var4 = signalsModule.createSignal(nil)
local var5 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

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
	local var6 = 8
	
	local function tryFocus()
		-- upvalues: p3 (ref), p2 (ref), var6 (write), tryFocus (ref)
		if p3() then return end
		local current = p2.current
		
		if current then
			current.focus()
			
			return
		end
		var6 -= 1
		
		if var6 > 0 then
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
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var5 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var2 (ref), var3 (ref), var4 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), var1 (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var6 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var7 = if fFlagBuildLocalization then var6:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var8, var9 = reactModule.useState(nil)
	local var10, var11 = reactModule.useState(nil)
	local var12 = nil
	local var13 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var14 = reactModule.useRef(true)
		var12 = var14
		var13 = reactModule.useCallback(function()
			-- upvalues: var14 (ref)
			return var14.current
		end, { var14 })
	end
	local placeId = p2.placeId
	local universeId = p2.universeId
	local sessionId = p2.sessionId
	
	if var8 ~= nil then
		placeId = var8.placeId
		universeId = var8.universeId
		sessionId = var8.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var10 ~= nil and var10.universeId == universeId) and var10.placeId == placeId then
		sessionId = var10.sessionId
	end
	local var15 = p2.hydrateHistoryWhen == nil or p2.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var16 = getAgentRollbackRequestStoreModule()
	local var17 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var17 (ref), sessionId (write)
		if var17 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var17.setCasSessionId(sessionId)
	end, { var17, sessionId })
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var17 (ref), var10 (copy), signalsModule (copy)
		return if var17 == nil then var10 else signalsModule.createComputed(function(p3)
			-- upvalues: var17 (copy)
			return {
				session = var17,
				sessionId = var17.getCasSessionId(),
				events = var17.getMergedHistory(p3)
			}
		end)
	end, { var17 }))
	local var6 = if var6.session == var17 and var6.sessionId == (if var17 ~= nil then nil else var17.getCasSessionId()) then var6.events else {}
	local var7 = sessionId ~= nil and sessionId ~= ""
	local var8 = var7 or (universeId ~= nil and universeId ~= 0)
	local var9 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var9 then
		var9 = var15
		
		if var9 then
			var9 = false
			
			if var17 ~= nil then
				var9 = var8
				
				if var9 then
					var9 = not (var17.hasLoadedHistory() and #var6 > 0)
				end
			end
		end
	end
	local var10 = nil
	local var11 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var12, var13 = reactModule.useState(function()
			-- upvalues: var17 (ref), sessionId (write), universeId (write), var15 (ref), var9 (ref)
			return {
				session = var17,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var15,
				isLoading = var9
			}
		end)
		var10 = var12
		var11 = var13
	end
	local var14 = var10 ~= nil and (var10.session == var17 and (var10.sessionId == sessionId and (var10.universeId == universeId and var10.hydrateHistoryWhen == var15)))
	local var15 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var14 then var10.isLoading else var9) or (var17 ~= nil and var17.getNextHistoryPageToken() ~= nil))
	local var16, var17 = reactModule.useState(nil)
	local var18, var19 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		var19(nil)
	end, { var17, sessionId })
	local var20 = sessionId
	local var21 = if if var18 == nil or var18.session ~= var17 then false else var20 == nil or var20 == "" or (if var18.sessionId ~= var20 then var18.sessionId == nil and var18.session.getCasSessionId() == var20 else true) then var18 else nil
	var69, var67 = reactModule.useState(nil)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(0)
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var22 (ref), var23 (ref), var20 (ref)
		assert(if p3 ~= nil then p4 ~= nil else true, "Active turns require an owning session")
		var22.current = p3
		var23.current = if p3 ~= nil then nil else { session = p4, sessionId = p4.getCasSessionId() }
		var20(p3)
	end, { var20 })
	local current = var23.current
	local var6 = sessionId
	local var7 = if if current == nil or current.session ~= var17 then false else var6 == nil or var6 == "" or (if current.sessionId ~= var6 then current.sessionId == nil and current.session.getCasSessionId() == var6 else true) then var69 else nil
	local var8 = if var7 ~= nil then var7 else var7.getOptimisticLocalTools
	current = if var7 ~= nil then var8 else var7.getLocalToolActions
	var6 = if var7 ~= nil then var9 else var7.getSetupErrorText
	local var9 = signalsReactModule.useSignalState(var8)
	local var10 = signalsReactModule.useSignalState(current)
	local var11 = signalsReactModule.useSignalState(var6)
	local _ = nil
	local var12 = if fFlagBuildLocalization and var11 ~= nil then var6:Format(var11) else var11
	local var13 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), p2 (ref), var17 (ref), var16 (ref), var12 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var7 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p2.createUniverseOnFirstPrompt == true and (var17 == nil and var16 ~= nil))) then nil else { setupErrorText = var12 }
	end, {
		var7,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p2.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var16 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var17 else nil,
		var12
	})
	local var6 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var6 (ref), var17 (ref), sessionId (write), universeId (write), placeId (write), var9 (ref), var16 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), var13 (ref), var21 (ref)
		return parseSessionStreamModule(var6, {
			sessionId = if var17 ~= nil then sessionId else var17.getCasSessionId() or sessionId,
			universeId = if var17 ~= nil then universeId else var17.universeId,
			placeId = if var17 ~= nil then placeId else var17.placeId,
			optimisticLocalTools = var9,
			pendingUserMessage = if var16 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var16.text) then nil else var16.text,
			pendingUserMessageAfterSequenceId = if var16 ~= nil then nil else var16.afterSequenceId,
			liveAssistantMessage = var13,
			optimisticCancelledStartSequenceId = if var21 ~= nil then nil else var21.startSequenceId
		})
	end, {
		var6, var17, sessionId, universeId, placeId, var9, var16, var13, var21
	})
	local messages = var6.messages
	local subagentTaskState = var6.subagentTaskState
	local includesPublishTool = var6.includesPublishTool
	local var6 = messages[#messages]
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var16 (ref), var6 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var16.getIsPendingForPlaceId(placeId) else var6
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var16 else nil
	}))
	local var6 = if var7 == nil and var6 ~= nil then var6.kind == "assistant_turn" and (not var6.isDone or fFlagBuildAgentRollbackModule and var7) else true
	local var7 = var6 and (not (fFlagBuildAgentRollbackModule and var7) and hasPendingLocalToolResponse(var9))
	local activeTurnState = var6.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), activeTurnState (ref)
		if var7 == nil or activeTurnState == nil then
			return
		end
		var7.syncFromTurnState(activeTurnState)
	end, { var7, activeTurnState })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var6.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var6.includesPublishTool, placeId })
	local var8, var9 = reactModule.useBinding("")
	local var10, var11 = reactModule.useState(nil)
	local var12 = reactModule.useRef("")
	local var13 = reactModule.useRef(nil)
	local var14 = reactUtilsModule.useClock()
	local var15 = useChatScrollModule()
	local var16 = reactModule.useCallback(function(p3, p4)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p3, p4)
	end, {})
	local var17 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), var17 (ref)
		local var27 = function()
			-- upvalues: p3 (ref)
			return if p3 == nil then false else p3()
		end
		
		var15.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var17 (copy), var27 (ref), var15 (copy), p3 (ref)
			if var17 == nil then return end
			if var17.loadOlderHistory(var27) and var17.getNextHistoryPageToken() ~= nil and var15.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p3 (copy), var15 (copy), var17 (copy), var27 (copy)
					if if p3 ~= nil then false else p3() then return end
					if var15.isViewportUnderfilled() then
						var17.loadOlderHistory(var27)
					end
				end)
			end
		end)
	end, { var17, var15 })
	local var6 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref), var15 (ref), var17 (ref)
		task.delay(0.1, function()
			-- upvalues: p3 (ref), var17 (copy), var15 (copy), var17 (copy)
			if p3() then return end
			if var17 == nil then return end
			if var17.getNextHistoryPageToken() == nil then return end
			if var15.isViewportUnderfilled() then
				var17(p3)
				
				return
			end
		end)
	end, { var17, var15, var17 })
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref), var6 (ref)
		if var17 == nil then return end
		if var17.getNextHistoryPageToken() == nil then
			return
		end
		var6(p3)
	end, { var6, var17 })
	local var8 = reactModule.useRef(var7)
	var8.current = var7
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var17 (ref)
		var15.setOnScrolledToTop(function()
			-- upvalues: var17 (copy)
			var17(nil)
		end)
		
		return function()
			-- upvalues: var15 (copy)
			var15.setOnScrolledToTop(nil)
		end
	end, { var15.setOnScrolledToTop, var17 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var17 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var11 (write), sessionId (write), universeId (write), var8 (ref), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var11 (ref), placeId (write)
		if var15 and var17 ~= nil then
			local var27 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var11 (copy), var27 (write), var17 (copy), sessionId (copy), universeId (copy), var15 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil and not var27 then
					var11({
						session = var17,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var15,
						isLoading = value
					})
					
					return
				end
			end
			
			local var28 = not (var17.hasLoadedHistory() and #var17.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
				var11({
					session = var17,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var15,
					isLoading = var28
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var27 (write), sessionId (ref), var17 (copy)
				return if var27 then true elseif sessionId == nil or sessionId == "" then false else var17.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var27 (write), sessionId (ref), var17 (copy), var8 (copy), isHydrateCancelled (ref)
				local var29
				if var29 then
					var29 = true
				elseif sessionId == nil or sessionId == "" then
					var29 = false
				else
					var29 = var17.getCasSessionId() ~= sessionId
					var29 = nil
				end
				if var29 then
					return
				end
				var8.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p3)
				-- upvalues: var17 (copy), var27 (write), sessionId (ref), var8 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var11 (copy), sessionId (copy), universeId (copy), var15 (copy)
				var17.setCasSessionId(p3)
				
				if var17.hasLoadedHistory() and #var17.getMergedHistory(false) > 0 then
					local var29
					if var29 then
						var29 = true
					elseif sessionId == nil or sessionId == "" then
						var29 = false
					else
						var29 = var17.getCasSessionId() ~= sessionId
						var29 = nil
					end
					if not var29 then
						var8.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
						if var29 then return end
						var11({
							isLoading = false,
							session = var17,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var15
						})
					end
					return
				elseif var17.refreshSession(isHydrateCancelled) then
					local var30
					if var29 then
						var30 = true
					elseif sessionId == nil or sessionId == "" then
						var30 = false
					else
						var30 = var17.getCasSessionId() ~= sessionId
						var30 = nil
					end
					if not var30 then
						if var29 then
							var30 = true
						elseif sessionId == nil or sessionId == "" then
							var30 = false
						else
							var30 = var17.getCasSessionId() ~= sessionId
							var30 = nil
						end
						if not var30 then
							var8.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
					if var29 then return end
					var11({
						isLoading = false,
						session = var17,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var15
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var17 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var11 (copy), var27 (write), var15 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var11 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var17.hasLoadedHistory() and #var17.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
						if var27 then return end
						var11({
							isLoading = false,
							session = var17,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var15
						})
					end
					return
				else
					local var29 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var29.state(false).status == "pending" do
						local var30
						if var29 then
							var30 = true
						elseif sessionId == nil or sessionId == "" then
							var30 = false
						else
							var30 = var17.getCasSessionId() ~= sessionId
							var30 = nil
						end
						if var30 then break end
						task.wait()
					end
					local result
					if var29 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var17.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var29.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
							if var29 then return end
							var11({
								isLoading = false,
								session = var17,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var15
							})
						end
						return
					else
						result = var29.state(false).result
						local var31 = if result ~= nil then nil else result.sessions
						local var32 = if typeof(var31) == "table" then var31[1] else nil
						local var33 = if typeof(var32) == "table" then var32.sessionId else nil
						
						if typeof(var33) == "string" and var33 ~= "" then
							var11({
								universeId = universeId,
								placeId = placeId,
								sessionId = var33
							})
							
							return
						end
						var17.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
							if var29 then return end
							var11({
								isLoading = false,
								session = var17,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var15
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var29 (write)
				var29 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var11 ~= nil then
			var11({
				isLoading = false,
				session = var17,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var15
			})
		end
	end, {
		var17, sessionId, universeId, placeId, creatorAgentChatStore, var15
	})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), sessionId (write), var8 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var12 (write), appLifecycleObserverService (copy)
		if var17 == nil then
			return
		end
		local var29 = false
		
		local function refreshKnownSession()
			-- upvalues: var17 (copy), sessionId (copy), var29 (write), var8 (copy)
			local casSessionId = var17.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var17 (copy), var29 (copy), var8 (copy)
				if var17.refreshSession(function()
					-- upvalues: var29 (copy)
					return var29
				end) and not var29 then
					var8.current(function()
						-- upvalues: var29 (copy)
						return var29
					end)
				end
			end)
		end
		
		local var30 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var12 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var12 ~= nil then
				var12.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var29 (write), var30 (ref), onUnhideConnection (ref)
			var29 = true
			var30:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var17, sessionId, var12 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var15 (ref), var15 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var15 then
			var15.lockToBottom()
			
			return
		end
	end, { var15, var17, sessionId, var15 })
	local var29 = reactModule.useCallback(function(p3)
		-- upvalues: var12 (ref), var9 (ref), var29 (ref)
		var12.current = p3
		var9(p3)
		var29(nil)
	end, { var9, var29 })
	local var30 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p3)
		-- upvalues: var24 (ref), var23 (ref), var17 (ref), sessionId (write), var30 (ref), var29 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var27 (ref), var29 (ref)
		return function(p4, p5)
			-- upvalues: var24 (copy), p4 (ref), var23 (copy), var17 (copy), sessionId (copy), var30 (copy), var29 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var27 (copy), var29 (copy)
			if var24.current == p4 then
				local current = var23.current
				local var31 = sessionId
				
				if not (if current == nil or current.session ~= var17 then false else var31 == nil or var31 == "" or (if current.sessionId ~= var31 then current.sessionId == nil and current.session.getCasSessionId() == var31 else true)) then return end
				if p4 ~= nil and var30.current == "" then
					var29(p4)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p5)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var31:Format(toolResultFailureComposerError)
				end
				var29(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var17,
		sessionId,
		var29,
		var29,
		var27
	}) else nil
	local var28 = reactModule.useCallback(function(p3, p4, p5, p6)
		-- upvalues: var24 (ref), var26 (ref), var25 (ref), var17 (ref), p3 (ref), var16 (ref), var29 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var27 (ref), var29 (ref), var15 (ref), sessionId (write), var9 (ref)
		if var24.current ~= p3 then return end
		var26(nil)
		var25.current = nil
		var17(nil)
		
		if p4 == nil then
			if p6.placeId ~= nil then
				var16(p6.placeId, "Completed")
			end
			var15.scrollToBottomAfterSend()
			local casSessionId = p6.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p3.createUniverseOnFirstPrompt and sessionId == nil and p6.universeId ~= nil then
					local t = {
						universeId = p6.universeId,
						placeId = p6.placeId,
						sessionId = casSessionId
					}
					var9(t)
					
					if p3.onProjectResolved ~= nil then
						p3.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p6 (ref), var24 (copy), p3 (ref)
					p6.refreshSession(function()
						-- upvalues: var24 (copy), p3 (copy)
						return var24.current ~= p3
					end)
				end)
			end
			return
		elseif p3.onPromptFailure ~= nil then
			p3.onPromptFailure(p4.errorCode, p4.outOfCreditsReason)
		end
		if p6.placeId ~= nil then
			var16(p6.placeId, "Idle")
		end
		if p5 ~= nil then
			var29(p5)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p4)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var27:Format(promptFailureComposerError)
			end
			var29(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p6 (ref), var24 (copy), p3 (ref)
			p6.refreshSession(function()
				-- upvalues: var24 (copy), p3 (copy)
				return var24.current ~= p3
			end)
		end)
	end, {
		p2.createUniverseOnFirstPrompt, p2.onPromptFailure, p2.onProjectResolved,
		sessionId, var16, var9, var15, var29, var29, var26, var17, var27
	})
	local var31 = reactModule.useRef(var15)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var31 (ref), var27 (ref), var28 (ref), var15 (ref)
		local var32 = var15 and not var31.current
		var31.current = var15
		
		if not var15 then return end
		if var32 or var32 or var28 ~= nil then
			var15.scrollToBottomUnconditionally()
			task.defer(var15.scrollToBottomUnconditionally)
			task.delay(0.15, var15.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var15,
		var27,
		var28,
		#messages,
		var15
	})
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var23 (ref), var17 (ref), sessionId (write), var21 (ref), var24 (ref), var25 (ref), placeId (write), var16 (ref), creatorAgentChatModule_1 (copy), var28 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var30 (write), var13 (write), var26 (ref), var15 (ref), var27 (ref), var28 (ref), creatorAgentChatStore (ref), var27 (ref)
		local var32
		if var22.current ~= nil then
			local current = var23.current
			var32 = sessionId
			
			if if current == nil or current.session ~= var17 then false else var32 == nil or var32 == "" or (if current.sessionId ~= var32 then current.sessionId == nil and current.session.getCasSessionId() == var32 else true) then return end
		end
		if var21 ~= nil then return end
		if var17 == nil then return end
		local var33
		local casSessionId = var17.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var33 = casSessionId
		else
			var32 = var17.universeId
			local placeId_1 = var17.placeId
			var33 = if var32 == nil or placeId_1 == nil then nil else `{var32}:{placeId_1}`
		end
		if var33 == nil then return end
		local function current(p3, p4)
			-- upvalues: var24 (copy), var25 (copy), placeId (copy), var16 (copy), creatorAgentChatModule_1 (copy), var17 (copy), var33 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var30 (copy), var13 (copy), var26 (copy), var15 (copy)
			var24.current += 1
			local current = var24.current
			var25.current = p4
			
			if placeId ~= nil then
				var16(placeId, "Loading")
			end
			local var34 = creatorAgentChatModule_1.createResumedAssistantTurn(var17, p3, function(p5)
				-- upvalues: var33 (copy), current (ref), var17 (copy)
				var33(current, p5, nil, var17)
			end, if p4 ~= nil then nil else p4 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var30(current) else nil, var13)
			var26(var34, var17)
			var34.start()
			var15.scrollToBottomUnconditionally()
		end
		
		if var32.activeTurnState == nil or var32.activeTurnItemIndex == nil or var32.activeTurnState.isDone then
			var25.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var33)
			var32 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var33 = casSessionId ~= nil and (var32 ~= nil and not var32.isDone)
			
			if not var32 and not var33 then return end
			if var33 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var32.activeTurnStartSequenceId
			
			if var25.current == casSessionId and var33 ~= nil then return end
			var32 = creatorAgentChatStore.resumeTurnFromHistory(var33, var32.activeTurnState, var32.activeTurnSequenceIds)
			
			if var32 ~= nil then
				current(var32, casSessionId)
			end
		end
	end, {
		var27, var17, sessionId, creatorAgentChatStore, var27, var28, placeId, var16,
		var28, var15, var26, var21, var30, var13
	})
	local var31 = reactModule.useCallback(function(p3, p4, p5, p6, p7, p8, p9)
		-- upvalues: var17 (ref), creatorAgentChatModule_1 (copy), var28 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var30 (write), var13 (write), fFlagBuildAgentRollbackModule (copy), var16 (ref), var26 (ref), var15 (ref)
		var17({ text = p4, afterSequenceId = p6 })
		local _ = nil
		local var32 = creatorAgentChatModule_1.createLiveAssistantTurn(p3, p4, function(p10)
			-- upvalues: var28 (copy), p5 (ref), p7 (ref), p10 (ref), p9 (ref)
			var28(p5, p10, p7, p10)
			
			if p9 ~= nil then
				p9()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var30(p5) else nil, var13, if fFlagBuildAgentRollbackModule then p8 else nil)
		
		if p3.placeId ~= nil then
			var16(p3.placeId, "Loading")
		end
		var26(var32, p3)
		var15.scrollToBottomAfterSend()
		var32.start()
	end, {
		var28, var16, var15, var26, var17, var30, var13
	})
	local var28 = nil
	
	if fFlagBuildAgentRollbackModule then
		local var31 = reactModule.useRef(var27.latestSequenceId)
		var31.current = var27.latestSequenceId
		var28 = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var17,
			activeTurnHandleRef = var22,
			startRollbackTurn = reactModule.useCallback(function(p3, p4, p5)
				-- upvalues: var17 (ref), var15 (ref), var24 (ref), var19 (ref), var31 (ref), buildAgentRollbackPromptModule (copy), var31 (ref)
				if var17 == nil then
					p5()
					
					return
				end
				var15.captureStickToBottomForSend()
				var24.current += 1
				local current = var24.current
				var19(nil)
				var31(var17, buildAgentRollbackPromptModule(p3.versionNumber, p3.noteTitle, p3.noteDescription), current, var31.current, nil, function()
					-- upvalues: var15 (copy), p4 (ref)
					var15.scrollToBottomUnconditionally()
					p4()
				end, p5)
			end, { var17, var15, var19, var31 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var69 (ref), var23 (ref), var17 (ref), sessionId (write), var24 (ref), var25 (ref), fFlagBuildAgentRollbackModule (copy), var28 (write), var16 (ref), var26 (ref), var17 (ref), var19 (ref)
		if var69 ~= nil then
			local current = var23.current
			local var32 = sessionId
			
			if if current == nil or current.session ~= var17 then false else var32 == nil or var32 == "" or (if current.sessionId ~= var32 then current.sessionId == nil and current.session.getCasSessionId() == var32 else true) then return end
			local current = var23.current
			var24.current += 1
			var25.current = nil
			
			if not fFlagBuildAgentRollbackModule or not var28.stopRequestBeforeReceipt(var69) then
				var69.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var16(current.session.placeId, "Idle")
			end
			var26(nil, nil)
			var17(nil)
			var19(nil)
			
			return
		end
	end, {
		var17, sessionId, var69, var26,
		if fFlagBuildAgentRollbackModule then var28 else nil,
		if fFlagBuildAgentRollbackModule then var16 else nil
	})
	local var28 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var17 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var24 (ref), universeConfigurationModule (copy), var9 (ref), p3 (ref), creatorAgentChatStore (ref), sessionId (write), var31 (ref), var26 (ref), var29 (ref), var29 (ref), var28 (write)
		var17({ text = p3, afterSequenceId = p5 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p6)
			-- upvalues: debug (copy), processTime (ref), var24 (copy), p4 (ref), universeConfigurationModule (copy), var9 (copy), p6 (copy), creatorAgentChatStore (copy), sessionId (copy), var31 (copy), p6 (ref), p5 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p6.universeId,
				rootPlaceId = p6.rootPlaceId
			})
			
			if var24.current == p4 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p6.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p6 (ref)
					return universeConfigurationStore.setTeamCreate(p6.universeId, true)
				end):andThen(function()
					-- upvalues: var24 (copy), p4 (copy), p6 (ref), var9 (copy), p6 (copy), creatorAgentChatStore (copy), sessionId (copy), var31 (copy), p6 (copy), p5 (copy)
					if var24.current ~= p4 then
						return nil
					end
					local t = { universeId = p6.universeId, placeId = p6.rootPlaceId }
					var9(t)
					
					if p6.onProjectResolved ~= nil then
						p6.onProjectResolved(t)
					end
					var31(creatorAgentChatStore.getSessionForProject(p6.universeId, p6.rootPlaceId, sessionId), p6, p4, p5, p6)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p6)
			-- upvalues: debug (copy), processTime (ref), var24 (copy), p4 (ref), var26 (copy), var17 (copy), var29 (copy), p6 (ref), var29 (copy), var28 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p6
			})
			
			if var24.current == p4 then
				var26(nil)
				var17(nil)
				var29(p6)
				var29(var28)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p2.onProjectResolved, var26, var29, var29,
		var9, var17, var31, var28
	})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), var29 (ref), var27 (ref), var23 (ref), var17 (ref), sessionId (write), var22 (ref), var13 (ref), var15 (ref), p2 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var16 (ref), var24 (ref), var19 (ref), var28 (ref), var27 (ref), var31 (ref)
		local replaced = string.gsub(var30.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var29("")
			
			return false
		elseif var27 then
			local current = var23.current
			local var32 = sessionId
			local var33 = if if current == nil or current.session ~= var17 then false else var32 == nil or var32 == "" or (if current.sessionId ~= var32 then current.sessionId == nil and current.session.getCasSessionId() == var32 else true) then var22.current else nil
			
			if var33 == nil or not var33.trySubmitComposerText(replaced) then
				return false
			end
			var29("")
			
			if var13.current then
				var13.current.releaseFocus()
			end
			var15.scrollToBottomAfterSend()
			
			return true
		else
			local var34 = p2.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var34 and var17 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var16.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var15.captureStickToBottomForSend()
			var24.current += 1
			local current = var24.current
			var19(nil)
			var29("")
			
			if var13.current then
				var13.current.releaseFocus()
			end
			if var34 then
				var33(replaced, current, var32.latestSequenceId)
			else
				var34(var17, replaced, current, var32.latestSequenceId, replaced)
			end
			return true
		end
	end, {
		var17, sessionId, universeId, placeId, var27, var15, var29, var28, var31,
		p2.createUniverseOnFirstPrompt, var19, var27,
		if fFlagBuildAgentRollbackModule then var16 else nil
	})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), var17 (ref), sessionId (write), var22 (ref), fFlagBuildAgentRollbackModule (copy), var28 (write), var24 (ref), var26 (ref), var25 (ref), var17 (ref), var19 (ref), var27 (ref), placeId (write), var16 (ref)
		local current = var23.current
		local var33 = if if current == nil or current.session ~= var17 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var22.current else nil
		
		if var33 == nil then
			if fFlagBuildAgentRollbackModule then
				var28.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var24.current += 1
			
			if not fFlagBuildAgentRollbackModule or not var28.stopRequestBeforeReceipt(var33) then
				var33.stop()
			end
			var26(nil)
			var25.current = nil
			var17(nil)
			var19({
				session = var17,
				sessionId = var17.getCasSessionId(),
				startSequenceId = var33.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var16(placeId, "Idle")
			end
		end
	end, {
		var17, sessionId, placeId, var16, var26, var17, var19, var27,
		if fFlagBuildAgentRollbackModule then var28 else nil
	})
	local var28 = p2.autoFocusComposer == nil or p2.autoFocusComposer
	local var31 = if p2.focusComposerWhen == nil then var28 else p2.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var31 (ref), var13 (ref)
		if var28 and var31 then
			local var33 = false
			
			local var34 = function()
				-- upvalues: var33 (write)
				return var33
			end
			
			local var35 = 8
			
			local function tryFocus()
				-- upvalues: var34 (ref), var13 (ref), var35 (write), tryFocus (ref)
				if var34() then return end
				local current = var13.current
				
				if current then
					current.focus()
					
					return
				end
				var36 -= 1
				
				if var36 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: var33 (write)
				var33 = true
			end
		end
		return function() end
	end, { var28, var31 })
	local t = {
		messages = messages,
		localToolActions = var10,
		composerText = var31,
		composerErrorText = var10,
		setComposerText = var29,
		isAssistantResponding = var27,
		canStopAssistantResponse = u1245,
		canSendWhileResponding = var28,
		sendMessage = var31,
		stopAssistantResponse = var32,
		setScrollingFrame = var15.setScrollingFrame,
		textBoxRef = var13,
		clockBinding = var14,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p3)
			-- upvalues: placeId (write), var30 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var33 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var30 ~= nil) then function()
				-- upvalues: var30 (ref)
				var30.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p3, true, var33) and var33 ~= nil and var30 ~= nil then
				var30.current = false
			end
		end, { placeId, var30 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var15
	}
	local _ = true
	local _ = var28 ~= nil and ((if var28 ~= nil then fFlagBuildAgentRollbackModule else nil) and var28)
	
	return t
end