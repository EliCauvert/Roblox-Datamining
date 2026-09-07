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
local var1 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var2 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var3 = signalsModule.createSignal(nil)
local var4 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

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
	local var5 = 8
	
	local function tryFocus()
		-- upvalues: p3 (ref), p2 (ref), var5 (write), tryFocus (ref)
		if p3() then return end
		local current = p2.current
		
		if current then
			current.focus()
			
			return
		end
		var5 -= 1
		
		if var5 > 0 then
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
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationRoactContext (ref), localizationStringsModule (ref), fFlagBuildExperiencePersistPlaytestLogsModule (ref), fFlagBuildExperienceClientDataModelTools (ref), creatorAgentChatModule (ref), var4 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var1 (ref), var2 (ref), var3 (ref), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), launchPlaytestWithLoadingStateModule (ref)
	local var5 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var6 = if fFlagBuildLocalization then var5:Format(localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR) else localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState(nil)
	local var11 = nil
	local var12 = nil
	
	if fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools then
		local var13 = reactModule.useRef(true)
		var11 = var13
		var12 = reactModule.useCallback(function()
			-- upvalues: var13 (ref)
			return var13.current
		end, { var13 })
	end
	local placeId = p2.placeId
	local universeId = p2.universeId
	local sessionId = p2.sessionId
	
	if var7 ~= nil then
		placeId = var7.placeId
		universeId = var7.universeId
		sessionId = var7.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var9 ~= nil and var9.universeId == universeId) and var9.placeId == placeId then
		sessionId = var9.sessionId
	end
	local var14 = p2.hydrateHistoryWhen == nil or p2.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var15 = reactModule.useMemo(function()
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function()
		-- upvalues: var15 (ref), sessionId (write)
		if var15 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var15.setCasSessionId(sessionId)
	end, { var15, sessionId })
	local var16 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var15 (ref), var4 (copy), signalsModule (copy)
		return if var15 == nil then var4 else signalsModule.createComputed(function(p3)
			-- upvalues: var15 (copy)
			return {
				session = var15,
				sessionId = var15.getCasSessionId(),
				events = var15.getMergedHistory(p3)
			}
		end)
	end, { var15 }))
	local var17 = if var16.session == var15 and var16.sessionId == (if var15 ~= nil then nil else var15.getCasSessionId()) then var16.events else {}
	local var18 = sessionId ~= nil and sessionId ~= ""
	local var19 = var18 or (universeId ~= nil and universeId ~= 0)
	local var20 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var20 then
		var20 = var14
		
		if var20 then
			var20 = false
			
			if var15 ~= nil then
				var20 = var19
				
				if var20 then
					var20 = not (var15.hasLoadedHistory() and #var17 > 0)
				end
			end
		end
	end
	local var21 = nil
	local var22 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var23, var24 = reactModule.useState(function()
			-- upvalues: var15 (ref), sessionId (write), universeId (write), var14 (ref), var20 (ref)
			return {
				session = var15,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var14,
				isLoading = var20
			}
		end)
		var21 = var23
		var22 = var24
	end
	local var25 = var21 ~= nil and (var21.session == var15 and (var21.sessionId == sessionId and (var21.universeId == universeId and var21.hydrateHistoryWhen == var14)))
	local var26 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var25 then var21.isLoading else var20) or (var15 ~= nil and var15.getNextHistoryPageToken() ~= nil))
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref)
		var30(nil)
	end, { var15, sessionId })
	local var31 = sessionId
	local var32 = if if var29 == nil or var29.session ~= var15 then false else var31 == nil or var31 == "" or (if var29.sessionId ~= var31 then var29.sessionId == nil and var29.session.getCasSessionId() == var31 else true) then var29 else nil
	var62, var60 = reactModule.useState(nil)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef(nil)
	local var35 = reactModule.useRef(0)
	local var36 = reactModule.useRef(nil)
	local var37 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var33 (ref), var34 (ref), var31 (ref)
		assert(if p3 ~= nil then p4 ~= nil else true, "Active turns require an owning session")
		var33.current = p3
		var34.current = if p3 ~= nil then nil else { session = p4, sessionId = p4.getCasSessionId() }
		var31(p3)
	end, { var31 })
	local current = var34.current
	local var38 = sessionId
	local var39 = if if current == nil or current.session ~= var15 then false else var38 == nil or var38 == "" or (if current.sessionId ~= var38 then current.sessionId == nil and current.session.getCasSessionId() == var38 else true) then var62 else nil
	reactModule.useLayoutEffect(function()
		-- upvalues: var62 (ref), var34 (ref), var15 (ref), sessionId (write), var35 (ref), var36 (ref), var37 (ref), var28 (ref), var30 (ref)
		if var62 ~= nil then
			local current = var34.current
			local var40 = sessionId
			
			if if current == nil or current.session ~= var15 then false else var40 == nil or var40 == "" or (if current.sessionId ~= var40 then current.sessionId == nil and current.session.getCasSessionId() == var40 else true) then
				return
			else
				var35.current += 1
				var36.current = nil
				var62.detach()
				var37(nil, nil)
				var28(nil)
				var30(nil)
			end
		end
	end, { var15, sessionId, var62, var37 })
	local var40 = if var39 ~= nil then var1 else var39.getOptimisticLocalTools
	current = if var39 ~= nil then var2 else var39.getLocalToolActions
	var38 = if var39 ~= nil then var3 else var39.getSetupErrorText
	local var41 = signalsReactModule.useSignalState(var40)
	local var42 = signalsReactModule.useSignalState(current)
	local var43 = signalsReactModule.useSignalState(var38)
	local _ = nil
	local var44 = if fFlagBuildLocalization and var43 ~= nil then var5:Format(var43) else var43
	local var45 = reactModule.useMemo(function()
		-- upvalues: var39 (ref), p2 (ref), var15 (ref), var27 (ref), var44 (write), fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
		return if var39 == nil and not (fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (p2.createUniverseOnFirstPrompt == true and (var15 == nil and var27 ~= nil))) then nil else { setupErrorText = var44 }
	end, {
		var39,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p2.createUniverseOnFirstPrompt else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var27 else nil,
		if fFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then var15 else nil,
		var44
	})
	local var46 = reactModule.useMemo(function()
		-- upvalues: parseSessionStreamModule (copy), var17 (ref), var15 (ref), sessionId (write), universeId (write), placeId (write), var41 (ref), var27 (ref), var45 (ref), var32 (ref)
		return parseSessionStreamModule(var17, {
			sessionId = if var15 ~= nil then sessionId else var15.getCasSessionId() or sessionId,
			universeId = if var15 ~= nil then universeId else var15.universeId,
			placeId = if var15 ~= nil then placeId else var15.placeId,
			optimisticLocalTools = var41,
			pendingUserMessage = if var27 ~= nil then nil else var27.text,
			pendingUserMessageAfterSequenceId = if var27 ~= nil then nil else var27.afterSequenceId,
			liveAssistantMessage = var45,
			optimisticCancelledStartSequenceId = if var32 ~= nil then nil else var32.startSequenceId
		})
	end, {
		var17, var15, sessionId, universeId, placeId, var41, var27, var45, var32
	})
	local messages = var46.messages
	local subagentTaskState = var46.subagentTaskState
	local includesPublishTool = var46.includesPublishTool
	local var47 = messages[#messages]
	local var48 = if var39 == nil then var47 ~= nil and (var47.kind == "assistant_turn" and not var47.isDone) else true
	local var49 = var48 and hasPendingLocalToolResponse(var41)
	local activeTurnState = var46.activeTurnState
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), activeTurnState (ref)
		if var39 == nil or activeTurnState == nil then
			return
		end
		var39.syncFromTurnState(activeTurnState)
	end, { var39, activeTurnState })
	reactModule.useEffect(function()
		-- upvalues: var46 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var46.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var46.includesPublishTool, placeId })
	local var50, var51 = reactModule.useBinding("")
	local var52, var53 = reactModule.useState(nil)
	local var54 = reactModule.useRef("")
	local var55 = reactModule.useRef(nil)
	local var56 = reactUtilsModule.useClock()
	local var57 = useChatScrollModule()
	local var58 = reactModule.useCallback(function(p3, p4)
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p3, p4)
	end, {})
	local var59 = reactModule.useCallback(function(p3)
		-- upvalues: var57 (ref), var15 (ref)
		local var60 = function()
			-- upvalues: p3 (ref)
			return if p3 == nil then false else p3()
		end
		
		var57.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: var15 (copy), var60 (ref), var57 (copy), p3 (ref)
			if var15 == nil then return end
			if var15.loadOlderHistory(var60) and var15.getNextHistoryPageToken() ~= nil and var57.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: p3 (copy), var57 (copy), var15 (copy), var60 (copy)
					if if p3 ~= nil then false else p3() then return end
					if var57.isViewportUnderfilled() then
						var15.loadOlderHistory(var60)
					end
				end)
			end
		end)
	end, { var15, var57 })
	local var60 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), var57 (ref), var59 (ref)
		task.delay(0.1, function()
			-- upvalues: p3 (ref), var15 (copy), var57 (copy), var59 (copy)
			if p3() then return end
			if var15 == nil then return end
			if var15.getNextHistoryPageToken() == nil then return end
			if var57.isViewportUnderfilled() then
				var59(p3)
				
				return
			end
		end)
	end, { var59, var57, var15 })
	local var61 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), var60 (ref)
		if var15 == nil then return end
		if var15.getNextHistoryPageToken() == nil then
			return
		end
		var60(p3)
	end, { var60, var15 })
	local var62 = reactModule.useRef(var61)
	var62.current = var61
	reactModule.useEffect(function()
		-- upvalues: var57 (ref), var59 (ref)
		var57.setOnScrolledToTop(function()
			-- upvalues: var59 (copy)
			var59(nil)
		end)
		
		return function()
			-- upvalues: var57 (copy)
			var57.setOnScrolledToTop(nil)
		end
	end, { var57.setOnScrolledToTop, var59 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var15 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var22 (write), sessionId (write), universeId (write), var62 (ref), creatorAgentChatStore (ref), var10 (ref), placeId (write)
		if var14 and var15 ~= nil then
			local var63 = false
			
			local function _(value)
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var22 (copy), var63 (write), var15 (copy), sessionId (copy), universeId (copy), var14 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil and not var63 then
					var22({
						session = var15,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var14,
						isLoading = value
					})
					
					return
				end
			end
			
			local var64 = not (var15.hasLoadedHistory() and #var15.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
				var22({
					session = var15,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var14,
					isLoading = var64
				})
			end
			local function isHydrateCancelled()
				-- upvalues: var63 (write), sessionId (ref), var15 (copy)
				return if var63 then true elseif sessionId == nil or sessionId == "" then false else var15.getCasSessionId() ~= sessionId
			end
			
			local _ = function()
				-- upvalues: var63 (write), sessionId (ref), var15 (copy), var62 (copy), isHydrateCancelled (ref)
				local var65
				if var63 then
					var65 = true
				elseif sessionId == nil or sessionId == "" then
					var65 = false
				else
					var65 = var15.getCasSessionId() ~= sessionId
					var65 = nil
				end
				if var65 then
					return
				end
				var62.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p3)
				-- upvalues: var15 (copy), var63 (write), sessionId (ref), var62 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var22 (copy), sessionId (copy), universeId (copy), var14 (copy)
				var15.setCasSessionId(p3)
				
				if var15.hasLoadedHistory() and #var15.getMergedHistory(false) > 0 then
					local var65
					if var63 then
						var65 = true
					elseif sessionId == nil or sessionId == "" then
						var65 = false
					else
						var65 = var15.getCasSessionId() ~= sessionId
						var65 = nil
					end
					if not var65 then
						var62.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
						if var63 then return end
						var22({
							isLoading = false,
							session = var15,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var14
						})
					end
					return
				elseif var15.refreshSession(isHydrateCancelled) then
					local var66
					if var63 then
						var66 = true
					elseif sessionId == nil or sessionId == "" then
						var66 = false
					else
						var66 = var15.getCasSessionId() ~= sessionId
						var66 = nil
					end
					if not var66 then
						if var63 then
							var66 = true
						elseif sessionId == nil or sessionId == "" then
							var66 = false
						else
							var66 = var15.getCasSessionId() ~= sessionId
							var66 = nil
						end
						if not var66 then
							var62.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
					if var63 then return end
					var22({
						isLoading = false,
						session = var15,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var14
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var15 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var22 (copy), var63 (write), var14 (copy), creatorAgentChatStore (copy), sessionId (ref), var10 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var15.hasLoadedHistory() and #var15.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
						if var63 then return end
						var22({
							isLoading = false,
							session = var15,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var14
						})
					end
					return
				else
					local var65 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var65.state(false).status == "pending" do
						local var66
						if var63 then
							var66 = true
						elseif sessionId == nil or sessionId == "" then
							var66 = false
						else
							var66 = var15.getCasSessionId() ~= sessionId
							var66 = nil
						end
						if var66 then break end
						task.wait()
					end
					local result
					if var63 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var15.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var65.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
							if var63 then return end
							var22({
								isLoading = false,
								session = var15,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var14
							})
						end
						return
					else
						result = var65.state(false).result
						local var67 = if result ~= nil then nil else result.sessions
						local var68 = if typeof(var67) == "table" then var67[1] else nil
						local var69 = if typeof(var68) == "table" then var68.sessionId else nil
						
						if typeof(var69) == "string" and var69 ~= "" then
							var10({
								universeId = universeId,
								placeId = placeId,
								sessionId = var69
							})
							
							return
						end
						var15.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
							if var63 then return end
							var22({
								isLoading = false,
								session = var15,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var14
							})
						end
					end
				end
			end)
			
			return function()
				-- upvalues: var63 (write)
				var63 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var22 ~= nil then
			var22({
				isLoading = false,
				session = var15,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var14
			})
		end
	end, {
		var15, sessionId, universeId, placeId, creatorAgentChatStore, var14
	})
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), sessionId (write), var62 (ref), messageBusService (copy), gameMessageId (copy), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var11 (write), appLifecycleObserverService (copy)
		if var15 == nil then
			return
		end
		local var65 = false
		
		local function refreshKnownSession()
			-- upvalues: var15 (copy), sessionId (copy), var65 (write), var62 (copy)
			local casSessionId = var15.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function()
				-- upvalues: var15 (copy), var65 (copy), var62 (copy)
				if var15.refreshSession(function()
					-- upvalues: var65 (copy)
					return var65
				end) and not var65 then
					var62.current(function()
						-- upvalues: var65 (copy)
						return var65
					end)
				end
			end)
		end
		
		local var66 = messageBusService:Subscribe(gameMessageId, function(_)
			-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), var11 (copy), refreshKnownSession (ref)
			if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and var11 ~= nil then
				var11.current = true
			end
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: var65 (write), var66 (ref), onUnhideConnection (ref)
			var65 = true
			var66:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var15, sessionId, var11 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var14 (ref), var57 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var14 then
			var57.lockToBottom()
			
			return
		end
	end, { var14, var15, sessionId, var57 })
	local var65 = reactModule.useCallback(function(p3)
		-- upvalues: var54 (ref), var51 (ref), var53 (ref)
		var54.current = p3
		var51(p3)
		var53(nil)
	end, { var51, var53 })
	local var66 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p3)
		-- upvalues: var35 (ref), var34 (ref), var15 (ref), sessionId (write), var54 (ref), var65 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var5 (ref), var53 (ref)
		return function(p4, p5)
			-- upvalues: var35 (copy), p3 (ref), var34 (copy), var15 (copy), sessionId (copy), var54 (copy), var65 (copy), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var5 (copy), var53 (copy)
			if var35.current == p3 then
				local current = var34.current
				local var67 = sessionId
				
				if not (if current == nil or current.session ~= var15 then false else var67 == nil or var67 == "" or (if current.sessionId ~= var67 then current.sessionId == nil and current.session.getCasSessionId() == var67 else true)) then return end
				if p4 ~= nil and var54.current == "" then
					var65(p4)
				end
				local toolResultFailureComposerError = creatorAgentChatModule_1.getToolResultFailureComposerError(p5)
				
				if fFlagBuildLocalization then
					toolResultFailureComposerError = var5:Format(toolResultFailureComposerError)
				end
				var53(toolResultFailureComposerError)
				
				return
			end
		end
	end, {
		var15,
		sessionId,
		var65,
		var53,
		var5
	}) else nil
	local var67 = reactModule.useCallback(function(p3, p4, p5, p6)
		-- upvalues: var35 (ref), var37 (ref), var36 (ref), var28 (ref), p2 (ref), var58 (ref), var65 (ref), creatorAgentChatModule_1 (copy), fFlagBuildLocalization (copy), var5 (ref), var53 (ref), var57 (ref), sessionId (write), var8 (ref)
		if var35.current ~= p3 then return end
		var37(nil)
		var36.current = nil
		var28(nil)
		
		if p4 == nil then
			if p6.placeId ~= nil then
				var58(p6.placeId, "Completed")
			end
			var57.scrollToBottomAfterSend()
			local casSessionId = p6.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p2.createUniverseOnFirstPrompt and sessionId == nil and p6.universeId ~= nil then
					local t = {
						universeId = p6.universeId,
						placeId = p6.placeId,
						sessionId = casSessionId
					}
					var8(t)
					
					if p2.onProjectResolved ~= nil then
						p2.onProjectResolved(t)
					end
				end
				task.spawn(function()
					-- upvalues: p6 (ref), var35 (copy), p3 (ref)
					p6.refreshSession(function()
						-- upvalues: var35 (copy), p3 (copy)
						return var35.current ~= p3
					end)
				end)
			end
			return
		elseif p2.onPromptFailure ~= nil then
			p2.onPromptFailure(p4.errorCode, p4.outOfCreditsReason)
		end
		if p6.placeId ~= nil then
			var58(p6.placeId, "Idle")
		end
		if p5 ~= nil then
			var65(p5)
			local promptFailureComposerError = creatorAgentChatModule_1.getPromptFailureComposerError(p4)
			
			if fFlagBuildLocalization then
				promptFailureComposerError = var5:Format(promptFailureComposerError)
			end
			var53(promptFailureComposerError)
		end
		task.spawn(function()
			-- upvalues: p6 (ref), var35 (copy), p3 (ref)
			p6.refreshSession(function()
				-- upvalues: var35 (copy), p3 (copy)
				return var35.current ~= p3
			end)
		end)
	end, {
		p2.createUniverseOnFirstPrompt, p2.onPromptFailure, p2.onProjectResolved,
		sessionId, var58, var8, var57, var65, var53, var37, var28, var5
	})
	local var68 = reactModule.useRef(var14)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var68 (ref), var48 (ref), var39 (ref), var57 (ref)
		local var69 = var14 and not var68.current
		var68.current = var14
		
		if not var14 then return end
		if var69 or var48 or var39 ~= nil then
			var57.scrollToBottomUnconditionally()
			task.defer(var57.scrollToBottomUnconditionally)
			task.delay(0.15, var57.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var14,
		var48,
		var39,
		#messages,
		var57
	})
	reactModule.useEffect(function()
		-- upvalues: var33 (ref), var34 (ref), var15 (ref), sessionId (write), var32 (ref), var35 (ref), var36 (ref), placeId (write), var58 (ref), creatorAgentChatModule_1 (copy), var67 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var66 (write), var12 (write), var37 (ref), var57 (ref), var46 (ref), var39 (ref), creatorAgentChatStore (ref), var48 (ref)
		local var69
		if var33.current ~= nil then
			local current = var34.current
			var69 = sessionId
			
			if if current == nil or current.session ~= var15 then false else var69 == nil or var69 == "" or (if current.sessionId ~= var69 then current.sessionId == nil and current.session.getCasSessionId() == var69 else true) then return end
		end
		if var32 ~= nil then return end
		if var15 == nil then return end
		local var70
		local casSessionId = var15.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var70 = casSessionId
		else
			var69 = var15.universeId
			local placeId_1 = var15.placeId
			var70 = if var69 == nil or placeId_1 == nil then nil else `{var69}:{placeId_1}`
		end
		if var70 == nil then return end
		local function current(p3, p4)
			-- upvalues: var35 (copy), var36 (copy), placeId (copy), var58 (copy), creatorAgentChatModule_1 (copy), var15 (copy), var67 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var66 (copy), var12 (copy), var37 (copy), var57 (copy)
			var35.current += 1
			local current = var35.current
			var36.current = p4
			
			if placeId ~= nil then
				var58(placeId, "Loading")
			end
			local var71 = creatorAgentChatModule_1.createResumedAssistantTurn(var15, p3, function(p5)
				-- upvalues: var67 (copy), current (ref), var15 (copy)
				var67(current, p5, nil, var15)
			end, if p4 ~= nil then nil else p4 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var66(current) else nil, var12)
			var37(var71, var15)
			var71.start()
			var57.scrollToBottomUnconditionally()
		end
		
		if var46.activeTurnState == nil or var46.activeTurnItemIndex == nil or var46.activeTurnState.isDone then
			var36.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var70)
			var69 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var71 = casSessionId ~= nil and (var69 ~= nil and not var69.isDone)
			
			if not var48 and not var71 then return end
			if var71 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var46.activeTurnStartSequenceId
			
			if var36.current == casSessionId and var39 ~= nil then return end
			var69 = creatorAgentChatStore.resumeTurnFromHistory(var70, var46.activeTurnState, var46.activeTurnSequenceIds)
			
			if var69 ~= nil then
				current(var69, casSessionId)
			end
		end
	end, {
		var46, var15, sessionId, creatorAgentChatStore, var48, var39, placeId, var58,
		var67, var57, var37, var32, var66, var12
	})
	local var69 = reactModule.useCallback(function(p3, p4, p5, p6)
		-- upvalues: var28 (ref), creatorAgentChatModule_1 (copy), var67 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var66 (write), var12 (write), var58 (ref), var37 (ref), var57 (ref)
		var28({ text = p4, afterSequenceId = p6 })
		local _ = nil
		local var70 = creatorAgentChatModule_1.createLiveAssistantTurn(p3, p4, function(p7)
			-- upvalues: var67 (copy), p5 (ref), p4 (ref), p3 (ref)
			var67(p5, p7, p4, p3)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var66(p5) else nil, var12)
		
		if p3.placeId ~= nil then
			var58(p3.placeId, "Loading")
		end
		var37(var70, p3)
		var57.scrollToBottomAfterSend()
		var70.start()
	end, {
		var67, var58, var57, var37, var28, var66, var12
	})
	local var70 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var28 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var35 (ref), universeConfigurationModule (copy), var8 (ref), p2 (ref), creatorAgentChatStore (ref), sessionId (write), var69 (ref), var37 (ref), var65 (ref), var53 (ref), var6 (write)
		var28({ text = p3, afterSequenceId = p5 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p6)
			-- upvalues: debug (copy), processTime (ref), var35 (copy), p4 (ref), universeConfigurationModule (copy), var8 (copy), p2 (copy), creatorAgentChatStore (copy), sessionId (copy), var69 (copy), p3 (ref), p5 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p6.universeId,
				rootPlaceId = p6.rootPlaceId
			})
			
			if var35.current == p4 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p6.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: universeConfigurationStore (ref), p6 (ref)
					return universeConfigurationStore.setTeamCreate(p6.universeId, true)
				end):andThen(function()
					-- upvalues: var35 (copy), p4 (copy), p6 (ref), var8 (copy), p2 (copy), creatorAgentChatStore (copy), sessionId (copy), var69 (copy), p3 (copy), p5 (copy)
					if var35.current ~= p4 then
						return nil
					end
					local t = { universeId = p6.universeId, placeId = p6.rootPlaceId }
					var8(t)
					
					if p2.onProjectResolved ~= nil then
						p2.onProjectResolved(t)
					end
					var69(creatorAgentChatStore.getSessionForProject(p6.universeId, p6.rootPlaceId, sessionId), p3, p4, p5)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p6)
			-- upvalues: debug (copy), processTime (ref), var35 (copy), p4 (ref), var37 (copy), var28 (copy), var65 (copy), p3 (ref), var53 (copy), var6 (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p6
			})
			
			if var35.current == p4 then
				var37(nil)
				var28(nil)
				var65(p3)
				var53(var6)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p2.onProjectResolved, var37, var65, var53,
		var8, var28, var69, var6
	})
	local var71 = reactModule.useCallback(function()
		-- upvalues: var54 (ref), var65 (ref), var48 (ref), var34 (ref), var15 (ref), sessionId (write), var33 (ref), var55 (ref), var57 (ref), p2 (ref), universeId (write), var35 (ref), var30 (ref), var70 (ref), var46 (ref), var69 (ref)
		local replaced = string.gsub(var54.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var65("")
			
			return false
		elseif var48 then
			local current = var34.current
			local var72 = sessionId
			local var73 = if if current == nil or current.session ~= var15 then false else var72 == nil or var72 == "" or (if current.sessionId ~= var72 then current.sessionId == nil and current.session.getCasSessionId() == var72 else true) then var33.current else nil
			
			if var73 == nil or not var73.trySubmitComposerText(replaced) then
				return false
			end
			var65("")
			
			if var55.current then
				var55.current.releaseFocus()
			end
			var57.scrollToBottomAfterSend()
			
			return true
		else
			local var74 = p2.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var74 and var15 == nil then
				return false
			end
			var57.captureStickToBottomForSend()
			var35.current += 1
			local current = var35.current
			var30(nil)
			var65("")
			
			if var55.current then
				var55.current.releaseFocus()
			end
			if var74 then
				var70(replaced, current, var46.latestSequenceId)
			else
				var69(var15, replaced, current, var46.latestSequenceId)
			end
			return true
		end
	end, {
		var15, sessionId, universeId, var48, var57, var65, var70, var69,
		p2.createUniverseOnFirstPrompt, var30, var46
	})
	local var72 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), var15 (ref), sessionId (write), var33 (ref), var35 (ref), var37 (ref), var36 (ref), var28 (ref), var30 (ref), var46 (ref), placeId (write), var58 (ref)
		local current = var34.current
		local var73 = if if current == nil or current.session ~= var15 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var33.current else nil
		
		if var73 == nil then return end
		var35.current += 1
		var73.stop()
		var37(nil)
		var36.current = nil
		var28(nil)
		var30({
			session = var15,
			sessionId = var15.getCasSessionId(),
			startSequenceId = var46.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var58(placeId, "Idle")
		end
	end, {
		var15, sessionId, placeId, var58, var37, var28, var30, var46
	})
	local var73 = p2.autoFocusComposer == nil or p2.autoFocusComposer
	local var74 = if p2.focusComposerWhen == nil then var73 else p2.focusComposerWhen
	reactModule.useEffect(function()
		-- upvalues: var73 (ref), var74 (ref), var55 (ref)
		if var73 and var74 then
			local var75 = false
			
			local var76 = function()
				-- upvalues: var75 (write)
				return var75
			end
			
			local var77 = 8
			
			local function tryFocus()
				-- upvalues: var76 (ref), var55 (ref), var77 (write), tryFocus (ref)
				if var76() then return end
				local current = var55.current
				
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
			
			return function()
				-- upvalues: var75 (write)
				var75 = true
			end
		end
		return function() end
	end, { var73, var74 })
	
	return {
		messages = messages,
		localToolActions = var42,
		composerText = var50,
		composerErrorText = var52,
		setComposerText = var65,
		isAssistantResponding = var48,
		canStopAssistantResponse = var39 ~= nil,
		canSendWhileResponding = var49,
		sendMessage = var71,
		stopAssistantResponse = var72,
		setScrollingFrame = var57.setScrollingFrame,
		textBoxRef = var55,
		clockBinding = var56,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p3)
			-- upvalues: placeId (write), var11 (write), fFlagBuildExperiencePersistPlaytestLogsModule (copy), fFlagBuildExperienceClientDataModelTools (copy), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then return end
			local var75 = if (fFlagBuildExperiencePersistPlaytestLogsModule or fFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and var11 ~= nil) then function()
				-- upvalues: var11 (ref)
				var11.current = true
			end else nil
			
			if launchPlaytestWithLoadingStateModule(placeId, p3, true, var75) and var75 ~= nil and var11 ~= nil then
				var11.current = false
			end
		end, { placeId, var11 }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var26
	}
end