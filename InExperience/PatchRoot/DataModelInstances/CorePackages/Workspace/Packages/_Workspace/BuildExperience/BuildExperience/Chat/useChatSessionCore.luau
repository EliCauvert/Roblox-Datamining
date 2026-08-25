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

local _ = function(p1)
	return string.gsub(p1, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1)
	-- upvalues: placeVersionHistoryModule (ref)
	if p1 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p1)
end

local _ = function(p1, p2)
	local var1 = 8
	
	local function tryFocus()
		-- upvalues: p2 (ref), p1 (ref), var1 (write), tryFocus (ref)
		if p2() then return end
		local current = p1.current
		
		if current then
			current.focus()
			
			return
		end
		var1 -= 1
		
		if var1 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p1)
	local casSessionId = p1.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p1.universeId
	local placeId = p1.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

local _ = function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref)
	return if p1 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p2 == true and (p3 == nil and p4 ~= nil))) then nil else { setupErrorText = p5 }
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), creatorAgentChatModule (ref), getAgentRollbackRequestStoreModule (ref), var5 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var2 (ref), var3 (ref), var4 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), fFlagBuildAgentRollbackModule (ref), sessionPromptMessageFilterModule (ref), var1 (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildExperiencePinForBuild (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), buildAgentRollbackPromptModule (ref), useAgentRollbackRequestModule (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var1 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var2 = if fFlagBuildLocalization then var1:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(nil)
	local var7 = nil
	local var8 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var9 = reactModule.useRef(true)
		var7 = var9
		var8 = reactModule.useCallback(function()
			-- upvalues: var9 (ref)
			return var9.current
		end, { var9 })
	end
	local placeId = p1.placeId
	local universeId = p1.universeId
	local sessionId = p1.sessionId
	
	if var3 ~= nil then
		placeId = var3.placeId
		universeId = var3.universeId
		sessionId = var3.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var5 ~= nil and var5.universeId == universeId) and var5.placeId == placeId then
		sessionId = var5.sessionId
	end
	local var10 = p1.hydrateHistoryWhen == nil or p1.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var11 = getAgentRollbackRequestStoreModule()
	local var12 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var12 (ref), sessionId (write)
		if var12 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var12.setCasSessionId(sessionId)
	end, { var12, sessionId })
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var12 (ref), var5 (copy), signalsModule (copy)
		return if var12 == nil then var5 else signalsModule.createComputed(function(p1)
			-- upvalues: var12 (copy)
			return {
				session = var12,
				sessionId = var12.getCasSessionId(),
				events = var12.getMergedHistory(p1)
			}
		end)
	end, { var12 }))
	local var1 = if var1.session == var12 and var1.sessionId == (if var12 ~= nil then nil else var12.getCasSessionId()) then var1.events else {}
	local var2 = sessionId ~= nil and sessionId ~= ""
	local var3 = var2 or (universeId ~= nil and universeId ~= 0)
	local var4 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var4 then
		var4 = var10
		
		if var4 then
			var4 = false
			
			if var12 ~= nil then
				var4 = var3
				
				if var4 then
					var4 = not (var12.hasLoadedHistory() and #var1 > 0)
				end
			end
		end
	end
	local var5 = nil
	local var6 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var7, var8 = reactModule.useState(function()
			-- upvalues: var12 (ref), sessionId (write), universeId (write), var10 (ref), var4 (ref)
			return {
				session = var12,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var10,
				isLoading = var4
			}
		end)
		var5 = var7
		var6 = var8
	end
	local var9 = var5 ~= nil and (var5.session == var12 and (var5.sessionId == sessionId and (var5.universeId == universeId and var5.hydrateHistoryWhen == var10)))
	local var10 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var9 then var5.isLoading else var4) or (var12 ~= nil and var12.getNextHistoryPageToken() ~= nil))
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref)
		var14(nil)
	end, { var12, sessionId })
	local var15 = sessionId
	local var16 = if if var13 == nil or var13.session ~= var12 then false else var15 == nil or var15 == "" or (if var13.sessionId ~= var15 then var13.sessionId == nil and var13.session.getCasSessionId() == var15 else true) then var13 else nil
	var69, var67 = reactModule.useState(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(0)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var17 (ref), var18 (ref), var15 (ref)
		assert(if p1 ~= nil then p2 ~= nil else true, "Active turns require an owning session")
		var17.current = p1
		var18.current = if p1 ~= nil then nil else { session = p2, sessionId = p2.getCasSessionId() }
		var15(p1)
	end, { var15 })
	local current = var18.current
	local var1 = sessionId
	local var2 = if if current == nil or current.session ~= var12 then false else var1 == nil or var1 == "" or (if current.sessionId ~= var1 then current.sessionId == nil and current.session.getCasSessionId() == var1 else true) then var69 else nil
	local var3 = if var2 ~= nil then var2 else var2.getOptimisticLocalTools
	current = if var2 ~= nil then var3 else var2.getLocalToolActions
	var1 = if var2 ~= nil then var4 else var2.getSetupErrorText
	local var4 = signalsReactModule.useSignalState(var3)
	local var5 = signalsReactModule.useSignalState(current)
	local var6 = signalsReactModule.useSignalState(var1)
	local _ = nil
	local var7 = if fFlagBuildLocalization and var6 ~= nil then var1:Format(var6) else var6
	local var8 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), var12 (ref), var11 (ref), var7 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var2 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p1.createUniverseOnFirstPrompt == true and (var12 == nil and var11 ~= nil))) then nil else { setupErrorText = var7 }
	end, {
		var2,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p1.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var11 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var12 else nil,
		var7
	})
	local var1 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var1 (ref), var12 (ref), sessionId (write), universeId (write), placeId (write), var4 (ref), var11 (ref), fFlagBuildAgentRollbackModule (copy), sessionPromptMessageFilterModule (copy), var8 (ref), var16 (ref)
		return parseSessionStreamModule(var1, {
			sessionId = if var12 ~= nil then sessionId else var12.getCasSessionId() or sessionId,
			universeId = if var12 ~= nil then universeId else var12.universeId,
			placeId = if var12 ~= nil then placeId else var12.placeId,
			optimisticLocalTools = var4,
			pendingUserMessage = if var11 == nil or fFlagBuildAgentRollbackModule and not sessionPromptMessageFilterModule.shouldOptimisticallyDisplay(var11.text) then nil else var11.text,
			pendingUserMessageAfterSequenceId = if var11 ~= nil then nil else var11.afterSequenceId,
			liveAssistantMessage = var8,
			optimisticCancelledStartSequenceId = if var16 ~= nil then nil else var16.startSequenceId
		})
	end, {
		var1, var12, sessionId, universeId, placeId, var4, var11, var8, var16
	})
	local messages = var1.messages
	local subagentTaskState = var1.subagentTaskState
	local includesPublishTool = var1.includesPublishTool
	local var1 = messages[#messages]
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildAgentRollbackModule (copy), placeId (write), var11 (ref), var1 (copy)
		return if fFlagBuildAgentRollbackModule and placeId ~= nil then var11.getIsPendingForPlaceId(placeId) else var1
	end, {
		placeId,
		if fFlagBuildAgentRollbackModule then var11 else nil
	}))
	local var1 = if var2 == nil and var1 ~= nil then var1.kind == "assistant_turn" and (not var1.isDone or fFlagBuildAgentRollbackModule and var2) else true
	local var2 = var1 and (not (fFlagBuildAgentRollbackModule and var2) and hasPendingLocalToolResponse(var4))
	local activeTurnState = var1.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), activeTurnState (ref)
		if var2 == nil or activeTurnState == nil then
			return
		end
		var2.syncFromTurnState(activeTurnState)
	end, { var2, activeTurnState })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var1.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var1.includesPublishTool, placeId })
	local var3, var4 = reactModule.useBinding("")
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useRef("")
	local var8 = reactModule.useRef(nil)
	local var9 = reactUtilsModule.useClock()
	local var10 = useChatScrollModule()
	local var11 = reactModule.useCallback(function(p1, p2)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p1, p2)
	end, {})
	local var12 = reactModule.useCallback(function(p1)
		-- upvalues: var10 (ref), var12 (ref)
		local var1 = function()
			-- upvalues: p1 (ref)
			return if p1 == nil then false else p1()
		end
		
		var10.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var12 (copy), var1 (ref), var10 (copy), p1 (ref)
			if var12 == nil then return end
			if var12.loadOlderHistory(var1) and var12.getNextHistoryPageToken() ~= nil and var10.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p1 (copy), var10 (copy), var12 (copy), var1 (copy)
					if if p1 ~= nil then false else p1() then return end
					if var10.isViewportUnderfilled() then
						var12.loadOlderHistory(var1)
					end
				end)
			end
		end)
	end, { var12, var10 })
	local var1 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref), var10 (ref), var12 (ref)
		task.delay(0.1, function()
			-- upvalues: p1 (ref), var12 (copy), var10 (copy), var12 (copy)
			if p1() then return end
			if var12 == nil then return end
			if var12.getNextHistoryPageToken() == nil then return end
			if var10.isViewportUnderfilled() then
				var12(p1)
				
				return
			end
		end)
	end, { var12, var10, var12 })
	local var2 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref), var1 (ref)
		if var12 == nil then return end
		if var12.getNextHistoryPageToken() == nil then
			return
		end
		var1(p1)
	end, { var1, var12 })
	local var3 = reactModule.useRef(var2)
	var3.current = var2
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var12 (ref)
		var10.setOnScrolledToTop(function()
			-- upvalues: var12 (copy)
			var12(nil)
		end)
		
		return function()
			-- upvalues: var10 (copy)
			var10.setOnScrolledToTop(nil)
		end
	end, { var10.setOnScrolledToTop, var12 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var12 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var6 (write), sessionId (write), universeId (write), var3 (ref), creatorAgentChatStore (ref), fFlagBuildExperiencePinForBuild (copy), var6 (ref), placeId (write)
		if var10 and var12 ~= nil then
			local var1 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var6 (copy), var1 (write), var12 (copy), sessionId (copy), universeId (copy), var10 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil and not var1 then
					var6({
						session = var12,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var10,
						isLoading = value
					})
					
					return
				end
			end
			
			local var2 = not (var12.hasLoadedHistory() and #var12.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
				var6({
					session = var12,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var10,
					isLoading = var2
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var1 (write), sessionId (ref), var12 (copy)
				return if var1 then true elseif sessionId == nil or sessionId == "" then false else var12.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var1 (write), sessionId (ref), var12 (copy), var3 (copy), isHydrateCancelled (ref)
				local var1
				if var1 then
					var1 = true
				elseif sessionId == nil or sessionId == "" then
					var1 = false
				else
					var1 = var12.getCasSessionId() ~= sessionId
					var1 = nil
				end
				if var1 then
					return
				end
				var3.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p1)
				-- upvalues: var12 (copy), var1 (write), sessionId (ref), var3 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var6 (copy), sessionId (copy), universeId (copy), var10 (copy)
				var12.setCasSessionId(p1)
				
				if var12.hasLoadedHistory() and #var12.getMergedHistory(false) > 0 then
					local var1
					if var1 then
						var1 = true
					elseif sessionId == nil or sessionId == "" then
						var1 = false
					else
						var1 = var12.getCasSessionId() ~= sessionId
						var1 = nil
					end
					if not var1 then
						var3.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
						if var1 then return end
						var6({
							isLoading = false,
							session = var12,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var10
						})
					end
					return
				elseif var12.refreshSession(isHydrateCancelled) then
					local var2
					if var1 then
						var2 = true
					elseif sessionId == nil or sessionId == "" then
						var2 = false
					else
						var2 = var12.getCasSessionId() ~= sessionId
						var2 = nil
					end
					if not var2 then
						if var1 then
							var2 = true
						elseif sessionId == nil or sessionId == "" then
							var2 = false
						else
							var2 = var12.getCasSessionId() ~= sessionId
							var2 = nil
						end
						if not var2 then
							var3.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
					if var1 then return end
					var6({
						isLoading = false,
						session = var12,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var10
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var12 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var6 (copy), var1 (write), var10 (copy), creatorAgentChatStore (copy), fFlagBuildExperiencePinForBuild (copy), sessionId (ref), var6 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var12.hasLoadedHistory() and #var12.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
						if var1 then return end
						var6({
							isLoading = false,
							session = var12,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var10
						})
					end
					return
				else
					local var1 = creatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = universeId,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					while var1.state(false).status == "pending" do
						local var2
						if var1 then
							var2 = true
						elseif sessionId == nil or sessionId == "" then
							var2 = false
						else
							var2 = var12.getCasSessionId() ~= sessionId
							var2 = nil
						end
						if var2 then break end
						task.wait()
					end
					local result
					if var1 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var12.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var1.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
							if var1 then return end
							var6({
								isLoading = false,
								session = var12,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var10
							})
						end
						return
					else
						result = var1.state(false).result
						local var3 = if result ~= nil then nil else result.sessions
						local var4 = if typeof(var3) == "table" then var3[1] else nil
						local var5 = if typeof(var4) == "table" then var4.sessionId else nil
						
						if typeof(var5) == "string" and var5 ~= "" then
							var6({
								universeId = universeId,
								placeId = placeId,
								sessionId = var5
							})
							
							return
						end
						var12.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
							if var1 then return end
							var6({
								isLoading = false,
								session = var12,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var10
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var1 (write)
				var1 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var6 ~= nil then
			var6({
				isLoading = false,
				session = var12,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var10
			})
		end
	end, {
		var12, sessionId, universeId, placeId, creatorAgentChatStore, var10
	})
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), sessionId (write), var3 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var7 (write), appLifecycleObserverService (copy)
		if var12 == nil then
			return
		end
		local var1 = false
		
		local function refreshKnownSession()
			-- upvalues: var12 (copy), sessionId (copy), var1 (write), var3 (copy)
			local casSessionId = var12.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var12 (copy), var1 (copy), var3 (copy)
				if var12.refreshSession(function()
					-- upvalues: var1 (copy)
					return var1
				end) and not var1 then
					var3.current(function()
						-- upvalues: var1 (copy)
						return var1
					end)
				end
			end)
		end
		
		local var2 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var7 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var7 ~= nil then
				var7.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var1 (write), var2 (ref), onUnhideConnection (ref)
			var1 = true
			var2:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var12, sessionId, var7 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var10 (ref), var10 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var10 then
			var10.lockToBottom()
			
			return
		end
	end, { var10, var12, sessionId, var10 })
	local var6 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), var4 (ref), var6 (ref)
		var7.current = p1
		var4(p1)
		var6(nil)
	end, { var4, var6 })
	local var7 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p1)
		-- upvalues: var19 (ref), var18 (ref), var12 (ref), sessionId (write), var7 (ref), var6 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var1 (ref), var6 (ref)
		return function(p1, p2)
			-- upvalues: var19 (copy), p1 (ref), var18 (copy), var12 (copy), sessionId (copy), var7 (copy), var6 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var1 (copy), var6 (copy)
			if var19.current == p1 then
				local current = var18.current
				local var1 = sessionId
				
				if not (if current == nil or current.session ~= var12 then false else var1 == nil or var1 == "" or (if current.sessionId ~= var1 then current.sessionId == nil and current.session.getCasSessionId() == var1 else true)) then return end
				if p1 ~= nil and var7.current == "" then
					var6(p1)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p2)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var1:Format(toolResultFailureComposerError)
				end
				var6(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var12,
		sessionId,
		var6,
		var6,
		var1
	}) else nil
	local var2 = reactModule.useCallback(function(p1, p2, p3, p4)
		-- upvalues: var19 (ref), var21 (ref), var20 (ref), var12 (ref), p1 (ref), var11 (ref), var6 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var1 (ref), var6 (ref), var10 (ref), sessionId (write), var4 (ref)
		if var19.current ~= p1 then return end
		var21(nil)
		var20.current = nil
		var12(nil)
		
		if p2 == nil then
			if p4.placeId ~= nil then
				var11(p4.placeId, "Completed")
			end
			var10.scrollToBottomAfterSend()
			local casSessionId = p4.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p1.createUniverseOnFirstPrompt and sessionId == nil and p4.universeId ~= nil then
					local t = {
						universeId = p4.universeId,
						placeId = p4.placeId,
						sessionId = casSessionId
					}
					var4(t)
					
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p4 (ref), var19 (copy), p1 (ref)
					p4.refreshSession(function()
						-- upvalues: var19 (copy), p1 (copy)
						return var19.current ~= p1
					end)
				end)
			end
			return
		elseif p1.onPromptFailure ~= nil then
			p1.onPromptFailure(p2.errorCode, p2.outOfCreditsReason)
		end
		if p4.placeId ~= nil then
			var11(p4.placeId, "Idle")
		end
		if p3 ~= nil then
			var6(p3)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p2)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var1:Format(promptFailureComposerError)
			end
			var6(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p4 (ref), var19 (copy), p1 (ref)
			p4.refreshSession(function()
				-- upvalues: var19 (copy), p1 (copy)
				return var19.current ~= p1
			end)
		end)
	end, {
		p1.createUniverseOnFirstPrompt, p1.onPromptFailure, p1.onProjectResolved,
		sessionId, var11, var4, var10, var6, var6, var21, var12, var1
	})
	local var3 = reactModule.useRef(var10)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var3 (ref), var1 (ref), var2 (ref), var10 (ref)
		local var1 = var10 and not var3.current
		var3.current = var10
		
		if not var10 then return end
		if var1 or var1 or var2 ~= nil then
			var10.scrollToBottomUnconditionally()
			task.defer(var10.scrollToBottomUnconditionally)
			task.delay(0.15, var10.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var10,
		var1,
		var2,
		#messages,
		var10
	})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var18 (ref), var12 (ref), sessionId (write), var16 (ref), var19 (ref), var20 (ref), placeId (write), var11 (ref), creatorAgentChatModule_1 (copy), var2 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var7 (write), var8 (write), var21 (ref), var10 (ref), var1 (ref), var2 (ref), creatorAgentChatStore (ref), var1 (ref)
		local var1
		if var17.current ~= nil then
			local current = var18.current
			var1 = sessionId
			
			if if current == nil or current.session ~= var12 then false else var1 == nil or var1 == "" or (if current.sessionId ~= var1 then current.sessionId == nil and current.session.getCasSessionId() == var1 else true) then return end
		end
		if var16 ~= nil then return end
		if var12 == nil then return end
		local var2
		local casSessionId = var12.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var2 = casSessionId
		else
			var1 = var12.universeId
			local placeId_1 = var12.placeId
			var2 = if var1 == nil or placeId_1 == nil then nil else `{var1}:{placeId_1}`
		end
		if var2 == nil then return end
		local function current(p1, p2)
			-- upvalues: var19 (copy), var20 (copy), placeId (copy), var11 (copy), creatorAgentChatModule_1 (copy), var12 (copy), var2 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var7 (copy), var8 (copy), var21 (copy), var10 (copy)
			var19.current += 1
			local current = var19.current
			var20.current = p2
			
			if placeId ~= nil then
				var11(placeId, "Loading")
			end
			local var1 = creatorAgentChatModule_1.createResumedAssistantTurn(var12, p1, function(p1)
				-- upvalues: var2 (copy), current (ref), var12 (copy)
				var2(current, p1, nil, var12)
			end, if p2 ~= nil then nil else p2 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var7(current) else nil, var8)
			var21(var1, var12)
			var1.start()
			var10.scrollToBottomUnconditionally()
		end
		
		if var1.activeTurnState == nil or var1.activeTurnItemIndex == nil or var1.activeTurnState.isDone then
			var20.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var2)
			var1 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var2 = casSessionId ~= nil and (var1 ~= nil and not var1.isDone)
			
			if not var1 and not var2 then return end
			if var2 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var1.activeTurnStartSequenceId
			
			if var20.current == casSessionId and var2 ~= nil then return end
			var1 = creatorAgentChatStore.resumeTurnFromHistory(var2, var1.activeTurnState, var1.activeTurnSequenceIds)
			
			if var1 ~= nil then
				current(var1, casSessionId)
			end
		end
	end, {
		var1, var12, sessionId, creatorAgentChatStore, var1, var2, placeId, var11,
		var2, var10, var21, var16, var7, var8
	})
	local var3 = reactModule.useCallback(function(p1, p2, p3, p4, p5, p6, p7)
		-- upvalues: var12 (ref), creatorAgentChatModule_1 (copy), var2 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var7 (write), var8 (write), fFlagBuildAgentRollbackModule (copy), var11 (ref), var21 (ref), var10 (ref)
		var12({ text = p2, afterSequenceId = p4 })
		local _ = nil
		local var1 = creatorAgentChatModule_1.createLiveAssistantTurn(p1, p2, function(p1)
			-- upvalues: var2 (copy), p3 (ref), p5 (ref), p1 (ref), p7 (ref)
			var2(p3, p1, p5, p1)
			
			if p7 ~= nil then
				p7()
			end
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var7(p3) else nil, var8, if fFlagBuildAgentRollbackModule then p6 else nil)
		
		if p1.placeId ~= nil then
			var11(p1.placeId, "Loading")
		end
		var21(var1, p1)
		var10.scrollToBottomAfterSend()
		var1.start()
	end, {
		var2, var11, var10, var21, var12, var7, var8
	})
	local var2 = nil
	
	if fFlagBuildAgentRollbackModule then
		local var3 = reactModule.useRef(var1.latestSequenceId)
		var3.current = var1.latestSequenceId
		var2 = useAgentRollbackRequestModule({
			universeId = universeId,
			placeId = placeId,
			session = var12,
			activeTurnHandleRef = var17,
			startRollbackTurn = reactModule.useCallback(function(p1, p2, p3)
				-- upvalues: var12 (ref), var10 (ref), var19 (ref), var14 (ref), var3 (ref), buildAgentRollbackPromptModule (copy), var3 (ref)
				if var12 == nil then
					p3()
					
					return
				end
				var10.captureStickToBottomForSend()
				var19.current += 1
				local current = var19.current
				var14(nil)
				var3(var12, buildAgentRollbackPromptModule(p1.versionNumber, p1.noteTitle, p1.noteDescription), current, var3.current, nil, function()
					-- upvalues: var10 (copy), p2 (ref)
					var10.scrollToBottomUnconditionally()
					p2()
				end, p3)
			end, { var12, var10, var14, var3 })
		})
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var69 (ref), var18 (ref), var12 (ref), sessionId (write), var19 (ref), var20 (ref), fFlagBuildAgentRollbackModule (copy), var2 (write), var11 (ref), var21 (ref), var12 (ref), var14 (ref)
		if var69 ~= nil then
			local current = var18.current
			local var1 = sessionId
			
			if if current == nil or current.session ~= var12 then false else var1 == nil or var1 == "" or (if current.sessionId ~= var1 then current.sessionId == nil and current.session.getCasSessionId() == var1 else true) then return end
			local current = var18.current
			var19.current += 1
			var20.current = nil
			
			if not fFlagBuildAgentRollbackModule or not var2.stopRequestBeforeReceipt(var69) then
				var69.detach()
			elseif current ~= nil and current.session.placeId ~= nil then
				var11(current.session.placeId, "Idle")
			end
			var21(nil, nil)
			var12(nil)
			var14(nil)
			
			return
		end
	end, {
		var12, sessionId, var69, var21,
		if fFlagBuildAgentRollbackModule then var2 else nil,
		if fFlagBuildAgentRollbackModule then var11 else nil
	})
	local var2 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var12 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var19 (ref), universeConfigurationModule (copy), var4 (ref), p1 (ref), creatorAgentChatStore (ref), sessionId (write), var3 (ref), var21 (ref), var6 (ref), var6 (ref), var2 (write)
		var12({ text = p1, afterSequenceId = p3 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p1)
			-- upvalues: debug (copy), processTime (ref), var19 (copy), p2 (ref), universeConfigurationModule (copy), var4 (copy), p1 (copy), creatorAgentChatStore (copy), sessionId (copy), var3 (copy), p1 (ref), p3 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p1.universeId,
				rootPlaceId = p1.rootPlaceId
			})
			
			if var19.current == p2 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p1.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p1 (ref)
					return universeConfigurationStore.setTeamCreate(p1.universeId, true)
				end):andThen(function()
					-- upvalues: var19 (copy), p2 (copy), p1 (ref), var4 (copy), p1 (copy), creatorAgentChatStore (copy), sessionId (copy), var3 (copy), p1 (copy), p3 (copy)
					if var19.current ~= p2 then
						return nil
					end
					local t = { universeId = p1.universeId, placeId = p1.rootPlaceId }
					var4(t)
					
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(t)
					end
					var3(creatorAgentChatStore.getSessionForProject(p1.universeId, p1.rootPlaceId, sessionId), p1, p2, p3, p1)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p1)
			-- upvalues: debug (copy), processTime (ref), var19 (copy), p2 (ref), var21 (copy), var12 (copy), var6 (copy), p1 (ref), var6 (copy), var2 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p1
			})
			
			if var19.current == p2 then
				var21(nil)
				var12(nil)
				var6(p1)
				var6(var2)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p1.onProjectResolved, var21, var6, var6,
		var4, var12, var3, var2
	})
	local var3 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var6 (ref), var1 (ref), var18 (ref), var12 (ref), sessionId (write), var17 (ref), var8 (ref), var10 (ref), p1 (ref), universeId (write), fFlagBuildAgentRollbackModule (copy), placeId (write), var11 (ref), var19 (ref), var14 (ref), var2 (ref), var1 (ref), var3 (ref)
		local replaced = string.gsub(var7.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var6("")
			
			return false
		elseif var1 then
			local current = var18.current
			local var1 = sessionId
			local var2 = if if current == nil or current.session ~= var12 then false else var1 == nil or var1 == "" or (if current.sessionId ~= var1 then current.sessionId == nil and current.session.getCasSessionId() == var1 else true) then var17.current else nil
			
			if var2 == nil or not var2.trySubmitComposerText(replaced) then
				return false
			end
			var6("")
			
			if var8.current then
				var8.current.releaseFocus()
			end
			var10.scrollToBottomAfterSend()
			
			return true
		else
			local var3 = p1.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var3 and var12 == nil then
				return false
			elseif fFlagBuildAgentRollbackModule and placeId ~= nil and var11.getIsPendingForPlaceId(placeId)(false) then
				return false
			end
			var10.captureStickToBottomForSend()
			var19.current += 1
			local current = var19.current
			var14(nil)
			var6("")
			
			if var8.current then
				var8.current.releaseFocus()
			end
			if var3 then
				var2(replaced, current, var1.latestSequenceId)
			else
				var3(var12, replaced, current, var1.latestSequenceId, replaced)
			end
			return true
		end
	end, {
		var12, sessionId, universeId, placeId, var1, var10, var6, var2, var3,
		p1.createUniverseOnFirstPrompt, var14, var1,
		if fFlagBuildAgentRollbackModule then var11 else nil
	})
	local var4 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var12 (ref), sessionId (write), var17 (ref), fFlagBuildAgentRollbackModule (copy), var2 (write), var19 (ref), var21 (ref), var20 (ref), var12 (ref), var14 (ref), var1 (ref), placeId (write), var11 (ref)
		local current = var18.current
		local var1 = if if current == nil or current.session ~= var12 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var17.current else nil
		
		if var1 == nil then
			if fFlagBuildAgentRollbackModule then
				var2.cancelRequestBeforeTurnStarts()
			end
			return
		else
			var19.current += 1
			
			if not fFlagBuildAgentRollbackModule or not var2.stopRequestBeforeReceipt(var1) then
				var1.stop()
			end
			var21(nil)
			var20.current = nil
			var12(nil)
			var14({
				session = var12,
				sessionId = var12.getCasSessionId(),
				startSequenceId = var1.activeTurnStartSequenceId
			})
			
			if placeId ~= nil then
				var11(placeId, "Idle")
			end
		end
	end, {
		var12, sessionId, placeId, var11, var21, var12, var14, var1,
		if fFlagBuildAgentRollbackModule then var2 else nil
	})
	local var2 = p1.autoFocusComposer == nil or p1.autoFocusComposer
	local var3 = if p1.focusComposerWhen == nil then var2 else p1.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), var8 (ref)
		if var2 and var3 then
			local var1 = false
			
			local var2 = function()
				-- upvalues: var1 (write)
				return var1
			end
			
			local var3 = 8
			
			local function tryFocus()
				-- upvalues: var2 (ref), var8 (ref), var3 (write), tryFocus (ref)
				if var2() then return end
				local current = var8.current
				
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
				-- upvalues: var1 (write)
				var1 = true
			end
		end
		return function() end
	end, { var2, var3 })
	local t = {
		messages = messages,
		localToolActions = var5,
		composerText = var3,
		composerErrorText = var5,
		setComposerText = var6,
		isAssistantResponding = var1,
		canStopAssistantResponse = u1245,
		canSendWhileResponding = var2,
		sendMessage = var3,
		stopAssistantResponse = var4,
		setScrollingFrame = var10.setScrollingFrame,
		textBoxRef = var8,
		clockBinding = var9,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p1)
			-- upvalues: placeId (write), var7 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var1 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var7 ~= nil) then function()
				-- upvalues: var7 (ref)
				var7.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p1, true, var1) and var1 ~= nil and var7 ~= nil then
				var7.current = false
			end
		end, { placeId, var7 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var10
	}
	local _ = true
	local _ = var2 ~= nil and ((if var2 ~= nil then fFlagBuildAgentRollbackModule else nil) and var2)
	
	return t
end