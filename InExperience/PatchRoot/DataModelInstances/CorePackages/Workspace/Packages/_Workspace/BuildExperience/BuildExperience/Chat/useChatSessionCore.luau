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
local var22 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var23 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var24 = signalsModule.createSignal(nil)
local var25 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p0, p1, p2) --[[ line: 143 | named "sessionOwnerMatches" ]]
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3) --[[ line: 153 ]]
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

local _ = function(p4) --[[ line: 167 | named "trimMessage" ]]
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5) --[[ line: 171 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7) --[[ line: 178 | named "scheduleComposerAutoFocus" ]]
	local var27 = 8
	
	local function tryFocus() --[[ line: 180 ]]
		-- upvalues: p7 (ref), p6 (ref), var27 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var27 -= 1
		
		if var27 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p8) --[[ line: 197 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

return function(p9) --[[ line: 210 | named "useChatSessionCore" ]]
	-- upvalues: reactModule (ref), creatorAgentChatModule (ref), var25 (ref), signalsModule (ref), signalsReactModule (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), var22 (ref), var23 (ref), var24 (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceFixChatBottomLockModule (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), CHAT_CREATE_UNIVERSE_ERROR (ref), launchPlaytestWithLoadingStateModule (ref)
	local var30, var31 = reactModule.useState(nil)
	local var32, var33 = reactModule.useState(nil)
	local placeId = p9.placeId
	local universeId = p9.universeId
	local sessionId = p9.sessionId
	
	if var30 ~= nil then
		placeId = var30.placeId
		universeId = var30.universeId
		sessionId = var30.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var32 ~= nil and var32.universeId == universeId) and var32.placeId == placeId then
		sessionId = var32.sessionId
	end
	local var34 = p9.hydrateHistoryWhen == nil or p9.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var36 = reactModule.useMemo(function() --[[ line: 232 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 239 ]]
		-- upvalues: var36 (ref), sessionId (write)
		if var36 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var36.setCasSessionId(sessionId)
	end, { var36, sessionId })
	local var37 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 246 ]]
		-- upvalues: var36 (ref), var25 (copy), signalsModule (copy)
		return if var36 == nil then var25 else signalsModule.createComputed(function(p10) --[[ line: 251 ]]
			-- upvalues: var36 (copy)
			return {
				session = var36,
				sessionId = var36.getCasSessionId(),
				events = var36.getMergedHistory(p10)
			}
		end)
	end, { var36 }))
	local var38 = if var37.session == var36 and var37.sessionId == (if var36 ~= nil then nil else var36.getCasSessionId()) then var37.events else {}
	local var39 = sessionId ~= nil and sessionId ~= ""
	local var40 = var39 or (universeId ~= nil and universeId ~= 0)
	local var41 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule
	
	if var41 then
		var41 = var34
		
		if var41 then
			var41 = false
			
			if var36 ~= nil then
				var41 = var40
				
				if var41 then
					var41 = not (var36.hasLoadedHistory() and #var38 > 0)
				end
			end
		end
	end
	local var42 = nil
	local var43 = nil
	
	if fFlagBuildExperienceChatHistoryLoadingSkeletonModule then
		local var44, var45 = reactModule.useState(function() --[[ line: 276 ]]
			-- upvalues: var36 (ref), sessionId (write), universeId (write), var34 (ref), var41 (ref)
			return {
				session = var36,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var34,
				isLoading = var41
			}
		end)
		var42 = var44
		var43 = var45
	end
	local var46 = var42 ~= nil and (var42.session == var36 and (var42.sessionId == sessionId and (var42.universeId == universeId and var42.hydrateHistoryWhen == var34)))
	local var47 = fFlagBuildExperienceChatHistoryLoadingSkeletonModule and ((if var46 then var42.isLoading else var41) or (var36 ~= nil and var36.getNextHistoryPageToken() ~= nil))
	local var48, var49 = reactModule.useState(nil)
	local var50, var51 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 315 ]]
		-- upvalues: var51 (ref)
		var51(nil)
	end, { var36, sessionId })
	local var52 = sessionId
	local var53 = if if var50 == nil or var50.session ~= var36 then false else var52 == nil or var52 == "" or (if var50.sessionId ~= var52 then var50.sessionId == nil and var50.session.getCasSessionId() == var52 else true) then var50 else nil
	var54, var52 = reactModule.useState(nil)
	local var55 = reactModule.useRef(nil)
	local var56 = reactModule.useRef(nil)
	local var57 = reactModule.useRef(0)
	local var58 = reactModule.useRef(nil)
	local var59 = reactModule.useCallback(function(p11, p12) --[[ line: 330 ]]
		-- upvalues: var55 (ref), var56 (ref), var52 (ref)
		assert(if p11 ~= nil then p12 ~= nil else true, "Active turns require an owning session")
		var55.current = p11
		var56.current = if p11 ~= nil then nil else { session = p12, sessionId = p12.getCasSessionId() }
		var52(p11)
	end, { var52 })
	local current = var56.current
	local var60 = sessionId
	local var61 = if if current == nil or current.session ~= var36 then false else var60 == nil or var60 == "" or (if current.sessionId ~= var60 then current.sessionId == nil and current.session.getCasSessionId() == var60 else true) then var54 else nil
	reactModule.useLayoutEffect(function() --[[ line: 347 ]]
		-- upvalues: var54 (ref), var56 (ref), var36 (ref), sessionId (write), var57 (ref), var58 (ref), var59 (ref), var49 (ref), var51 (ref)
		if var54 ~= nil then
			local current = var56.current
			local var94 = sessionId
			
			if if current == nil or current.session ~= var36 then false else var94 == nil or var94 == "" or (if current.sessionId ~= var94 then current.sessionId == nil and current.session.getCasSessionId() == var94 else true) then
				return
			else
				var57.current += 1
				var58.current = nil
				var54.detach()
				var59(nil, nil)
				var49(nil)
				var51(nil)
			end
		end
	end, { var36, sessionId, var54, var59 })
	local var62 = if var61 ~= nil then var22 else var61.getOptimisticLocalTools
	current = if var61 ~= nil then var23 else var61.getLocalToolActions
	var60 = if var61 ~= nil then var24 else var61.getSetupErrorText
	local var63 = signalsReactModule.useSignalState(var62)
	local var64 = signalsReactModule.useSignalState(current)
	local var65 = signalsReactModule.useSignalState(var60)
	local var66 = reactModule.useMemo(function() --[[ line: 375 ]]
		-- upvalues: var61 (ref), var65 (ref)
		return if var61 == nil then nil else { setupErrorText = var65 }
	end, { var61, var65 })
	local var67 = reactModule.useMemo(function() --[[ line: 383 ]]
		-- upvalues: parseSessionStreamModule (copy), var38 (ref), var36 (ref), sessionId (write), universeId (write), placeId (write), var63 (ref), var48 (ref), var66 (ref), var53 (ref)
		return parseSessionStreamModule(var38, {
			sessionId = if var36 ~= nil then sessionId else var36.getCasSessionId() or sessionId,
			universeId = if var36 ~= nil then universeId else var36.universeId,
			placeId = if var36 ~= nil then placeId else var36.placeId,
			optimisticLocalTools = var63,
			pendingUserMessage = if var48 ~= nil then nil else var48.text,
			pendingUserMessageAfterSequenceId = if var48 ~= nil then nil else var48.afterSequenceId,
			liveAssistantMessage = var66,
			optimisticCancelledStartSequenceId = if var53 ~= nil then nil else var53.startSequenceId
		})
	end, {
		var38, var36, sessionId, universeId, placeId, var63, var48, var66, var53
	})
	local messages = var67.messages
	local subagentTaskState = var67.subagentTaskState
	local includesPublishTool = var67.includesPublishTool
	local var68 = messages[#messages]
	local var69 = if var61 == nil then var68 ~= nil and (var68.kind == "assistant_turn" and not var68.isDone) else true
	local var70 = var69 and hasPendingLocalToolResponse(var63)
	local activeTurnState = var67.activeTurnState
	reactModule.useEffect(function() --[[ line: 426 ]]
		-- upvalues: var61 (ref), activeTurnState (ref)
		if var61 == nil or activeTurnState == nil then
			return
		end
		var61.syncFromTurnState(activeTurnState)
	end, { var61, activeTurnState })
	reactModule.useEffect(function() --[[ line: 433 ]]
		-- upvalues: var67 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var67.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var67.includesPublishTool, placeId })
	local var71, var72 = reactModule.useBinding("")
	local var73, var74 = reactModule.useState(nil)
	local var75 = reactModule.useRef("")
	local var76 = reactModule.useRef(nil)
	local var77 = reactUtilsModule.useClock()
	local var78 = useChatScrollModule()
	local var79 = reactModule.useCallback(function(p13, p14) --[[ line: 448 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p13, p14)
	end, {})
	local var80 = reactModule.useCallback(function(p15) --[[ line: 452 ]]
		-- upvalues: var78 (ref), var36 (ref)
		local var95 = function() --[[ line: 453 ]]
			-- upvalues: p15 (ref)
			return if p15 == nil then false else p15()
		end
		
		var78.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 460 ]]
			-- upvalues: var36 (copy), var95 (ref), var78 (copy), p15 (ref)
			if var36 == nil then return end
			if var36.loadOlderHistory(var95) and var36.getNextHistoryPageToken() ~= nil and var78.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 466 ]]
					-- upvalues: p15 (copy), var78 (copy), var36 (copy), var95 (copy)
					if if p15 ~= nil then false else p15() then return end
					if var78.isViewportUnderfilled() then
						var36.loadOlderHistory(var95)
					end
				end)
			end
		end)
	end, { var36, var78 })
	local var81 = reactModule.useCallback(function(p16) --[[ line: 478 ]]
		-- upvalues: var36 (ref), var78 (ref), var80 (ref)
		task.delay(0.1, function() --[[ line: 479 ]]
			-- upvalues: p16 (ref), var36 (copy), var78 (copy), var80 (copy)
			if p16() then return end
			if var36 == nil then return end
			if var36.getNextHistoryPageToken() == nil then return end
			if var78.isViewportUnderfilled() then
				var80(p16)
				
				return
			end
		end)
	end, { var80, var78, var36 })
	local var82 = reactModule.useCallback(function(p17) --[[ line: 497 ]]
		-- upvalues: var36 (ref), var81 (ref)
		if var36 == nil then return end
		if var36.getNextHistoryPageToken() == nil then
			return
		end
		var81(p17)
	end, { var81, var36 })
	local var83 = reactModule.useRef(var82)
	var83.current = var82
	reactModule.useEffect(function() --[[ line: 509 ]]
		-- upvalues: var78 (ref), var80 (ref)
		var78.setOnScrolledToTop(function() --[[ line: 510 ]]
			-- upvalues: var80 (copy)
			var80(nil)
		end)
		
		return function() --[[ line: 513 ]]
			-- upvalues: var78 (copy)
			var78.setOnScrolledToTop(nil)
		end
	end, { var78.setOnScrolledToTop, var80 })
	reactModule.useEffect(function() --[[ line: 518 ]]
		-- upvalues: var34 (ref), var36 (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var43 (write), sessionId (write), universeId (write), var83 (ref), creatorAgentChatStore (ref), var33 (ref), placeId (write)
		if var34 and var36 ~= nil then
			local var96 = false
			
			local function _(value) --[[ line: 533 | named "setHistoryLoading" ]]
				-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var43 (copy), var96 (write), var36 (copy), sessionId (copy), universeId (copy), var34 (copy)
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil and not var96 then
					var43({
						session = var36,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var34,
						isLoading = value
					})
					
					return
				end
			end
			
			local var97 = not (var36.hasLoadedHistory() and #var36.getMergedHistory(false) > 0)
			
			if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
				var43({
					session = var36,
					sessionId = sessionId,
					universeId = universeId,
					hydrateHistoryWhen = var34,
					isLoading = var97
				})
			end
			local function isHydrateCancelled() --[[ line: 548 ]]
				-- upvalues: var96 (write), sessionId (ref), var36 (copy)
				return if var96 then true elseif sessionId == nil or sessionId == "" then false else var36.getCasSessionId() ~= sessionId
			end
			
			local _ = function() --[[ line: 557 | named "continueAfterSessionReady" ]]
				-- upvalues: var96 (write), sessionId (ref), var36 (copy), var83 (copy), isHydrateCancelled (ref)
				local var100
				if var96 then
					var100 = true
				elseif sessionId == nil or sessionId == "" then
					var100 = false
				else
					var100 = var36.getCasSessionId() ~= sessionId
					var100 = nil
				end
				if var100 then
					return
				end
				var83.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p18) --[[ line: 564 ]]
				-- upvalues: var36 (copy), var96 (write), sessionId (ref), var83 (copy), isHydrateCancelled (ref), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var43 (copy), sessionId (copy), universeId (copy), var34 (copy)
				var36.setCasSessionId(p18)
				
				if var36.hasLoadedHistory() and #var36.getMergedHistory(false) > 0 then
					local var101
					if var96 then
						var101 = true
					elseif sessionId == nil or sessionId == "" then
						var101 = false
					else
						var101 = var36.getCasSessionId() ~= sessionId
						var101 = nil
					end
					if not var101 then
						var83.current(isHydrateCancelled)
					end
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
						if var96 then return end
						var43({
							isLoading = false,
							session = var36,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var34
						})
					end
					return
				elseif var36.refreshSession(isHydrateCancelled) then
					local var102
					if var96 then
						var102 = true
					elseif sessionId == nil or sessionId == "" then
						var102 = false
					else
						var102 = var36.getCasSessionId() ~= sessionId
						var102 = nil
					end
					if not var102 then
						if var96 then
							var102 = true
						elseif sessionId == nil or sessionId == "" then
							var102 = false
						else
							var102 = var36.getCasSessionId() ~= sessionId
							var102 = nil
						end
						if not var102 then
							var83.current(isHydrateCancelled)
						end
					end
				end
				if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
					if var96 then return end
					var43({
						isLoading = false,
						session = var36,
						sessionId = sessionId,
						universeId = universeId,
						hydrateHistoryWhen = var34
					})
				end
			end
			
			task.spawn(function() --[[ line: 577 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var36 (copy), fFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), var43 (copy), var96 (write), var34 (copy), creatorAgentChatStore (copy), sessionId (ref), var33 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var36.hasLoadedHistory() and #var36.getMergedHistory(false) > 0 then
					if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
						if var96 then return end
						var43({
							isLoading = false,
							session = var36,
							sessionId = sessionId,
							universeId = universeId,
							hydrateHistoryWhen = var34
						})
					end
					return
				else
					local var103 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
					while var103.state(false).status == "pending" do
						local var104
						if var96 then
							var104 = true
						elseif sessionId == nil or sessionId == "" then
							var104 = false
						else
							var104 = var36.getCasSessionId() ~= sessionId
							var104 = nil
						end
						if var104 then break end
						task.wait()
					end
					local result
					if var96 then
						result = true
					elseif sessionId == nil or sessionId == "" then
						result = false
					else
						result = var36.getCasSessionId() ~= sessionId
						result = nil
					end
					if result or var103.state(false).status ~= "succeeded" then
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
							if var96 then return end
							var43({
								isLoading = false,
								session = var36,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var34
							})
						end
						return
					else
						result = var103.state(false).result
						local var105 = if result ~= nil then nil else result.sessions
						local var106 = if typeof(var105) == "table" then var105[1] else nil
						local var107 = if typeof(var106) == "table" then var106.sessionId else nil
						
						if typeof(var107) == "string" and var107 ~= "" then
							var33({
								universeId = universeId,
								placeId = placeId,
								sessionId = var107
							})
							
							return
						end
						var36.markHistoryLoaded()
						
						if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
							if var96 then return end
							var43({
								isLoading = false,
								session = var36,
								sessionId = sessionId,
								universeId = universeId,
								hydrateHistoryWhen = var34
							})
						end
					end
				end
			end)
			
			return function() --[[ line: 621 ]]
				-- upvalues: var96 (write)
				var96 = true
			end
		elseif fFlagBuildExperienceChatHistoryLoadingSkeletonModule and var43 ~= nil then
			var43({
				isLoading = false,
				session = var36,
				sessionId = sessionId,
				universeId = universeId,
				hydrateHistoryWhen = var34
			})
		end
	end, {
		var36, sessionId, universeId, placeId, creatorAgentChatStore, var34
	})
	reactModule.useEffect(function() --[[ line: 626 ]]
		-- upvalues: var36 (ref), sessionId (write), var83 (ref), messageBusService (copy), gameMessageId (copy), appLifecycleObserverService (copy)
		if var36 == nil then
			return
		end
		local var108 = false
		
		local function refreshKnownSession() --[[ line: 631 ]]
			-- upvalues: var36 (copy), sessionId (copy), var108 (write), var83 (copy)
			local casSessionId = var36.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 639 ]]
				-- upvalues: var36 (copy), var108 (copy), var83 (copy)
				if var36.refreshSession(function() --[[ line: 640 ]]
					-- upvalues: var108 (copy)
					return var108
				end) and not var108 then
					var83.current(function() --[[ line: 643 ]]
						-- upvalues: var108 (copy)
						return var108
					end)
				end
			end)
		end
		
		local var110 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 650 ]]
			-- upvalues: refreshKnownSession (ref)
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 655 ]]
			-- upvalues: var108 (write), var110 (ref), onUnhideConnection (ref)
			var108 = true
			var110:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var36, sessionId })
	reactModule.useEffect(function() --[[ line: 662 ]]
		-- upvalues: fFlagBuildExperienceFixChatBottomLockModule (copy), var34 (ref), var78 (ref)
		if fFlagBuildExperienceFixChatBottomLockModule and var34 then
			var78.lockToBottom()
			
			return
		end
	end, { var34, var36, sessionId, var78 })
	local var84 = reactModule.useCallback(function(p19) --[[ line: 669 ]]
		-- upvalues: var75 (ref), var72 (ref), var74 (ref)
		var75.current = p19
		var72(p19)
		var74(nil)
	end, { var72, var74 })
	local var85 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p20) --[[ line: 677 ]]
		-- upvalues: var57 (ref), var56 (ref), var36 (ref), sessionId (write), var75 (ref), var84 (ref), var74 (ref), creatorAgentChatModule_1 (copy)
		return function(p21, p22) --[[ line: 678 ]]
			-- upvalues: var57 (copy), p20 (ref), var56 (copy), var36 (copy), sessionId (copy), var75 (copy), var84 (copy), var74 (copy), creatorAgentChatModule_1 (copy)
			if var57.current == p20 then
				local current = var56.current
				local var113 = sessionId
				
				if not (if current == nil or current.session ~= var36 then false else var113 == nil or var113 == "" or (if current.sessionId ~= var113 then current.sessionId == nil and current.session.getCasSessionId() == var113 else true)) then return end
				if p21 ~= nil and var75.current == "" then
					var84(p21)
				end
				var74(creatorAgentChatModule_1.getToolResultFailureComposerError(p22))
				
				return
			end
		end
	end, { var36, sessionId, var84, var74 }) else nil
	local var86 = reactModule.useCallback(function(p23, p24, p25, p26) --[[ line: 694 ]]
		-- upvalues: var57 (ref), var59 (ref), var58 (ref), var49 (ref), p9 (ref), var79 (ref), var84 (ref), var74 (ref), creatorAgentChatModule_1 (copy), var78 (ref), sessionId (write), var31 (ref)
		if var57.current ~= p23 then return end
		var59(nil)
		var58.current = nil
		var49(nil)
		
		if p24 == nil then
			if p26.placeId ~= nil then
				var79(p26.placeId, "Completed")
			end
			var78.scrollToBottomAfterSend()
			local casSessionId = p26.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p9.createUniverseOnFirstPrompt and sessionId == nil and p26.universeId ~= nil then
					local t = {
						universeId = p26.universeId,
						placeId = p26.placeId,
						sessionId = casSessionId
					}
					var31(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 750 ]]
					-- upvalues: p26 (ref), var57 (copy), p23 (ref)
					p26.refreshSession(function() --[[ line: 751 ]]
						-- upvalues: var57 (copy), p23 (copy)
						return var57.current ~= p23
					end)
				end)
			end
			return
		elseif p9.onPromptFailure ~= nil then
			p9.onPromptFailure(p24.errorCode, p24.outOfCreditsReason)
		end
		if p26.placeId ~= nil then
			var79(p26.placeId, "Idle")
		end
		if p25 ~= nil then
			var84(p25)
			var74(creatorAgentChatModule_1.getPromptFailureComposerError(p24))
		end
		task.spawn(function() --[[ line: 721 ]]
			-- upvalues: p26 (ref), var57 (copy), p23 (ref)
			p26.refreshSession(function() --[[ line: 722 ]]
				-- upvalues: var57 (copy), p23 (copy)
				return var57.current ~= p23
			end)
		end)
	end, {
		p9.createUniverseOnFirstPrompt, p9.onPromptFailure, p9.onProjectResolved,
		sessionId, var79, var31, var78, var84, var74, var59, var49
	})
	local var87 = reactModule.useRef(var34)
	reactModule.useEffect(function() --[[ line: 774 ]]
		-- upvalues: var34 (ref), var87 (ref), var69 (ref), var61 (ref), var78 (ref)
		local var116 = var34 and not var87.current
		var87.current = var34
		
		if not var34 then return end
		if var116 or var69 or var61 ~= nil then
			var78.scrollToBottomUnconditionally()
			task.defer(var78.scrollToBottomUnconditionally)
			task.delay(0.15, var78.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var34,
		var69,
		var61,
		#messages,
		var78
	})
	reactModule.useEffect(function() --[[ line: 800 ]]
		-- upvalues: var55 (ref), var56 (ref), var36 (ref), sessionId (write), var53 (ref), var57 (ref), var58 (ref), placeId (write), var79 (ref), creatorAgentChatModule_1 (copy), var86 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var85 (write), var59 (ref), var78 (ref), var67 (ref), var61 (ref), creatorAgentChatStore (ref), var69 (ref)
		local var117
		if var55.current ~= nil then
			local current = var56.current
			var117 = sessionId
			
			if if current == nil or current.session ~= var36 then false else var117 == nil or var117 == "" or (if current.sessionId ~= var117 then current.sessionId == nil and current.session.getCasSessionId() == var117 else true) then return end
		end
		if var53 ~= nil then return end
		if var36 == nil then return end
		local var119
		local casSessionId = var36.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var119 = casSessionId
		else
			var117 = var36.universeId
			local placeId_1 = var36.placeId
			var119 = if var117 == nil or placeId_1 == nil then nil else `{var117}:{placeId_1}`
		end
		if var119 == nil then return end
		local function current(p27, p28) --[[ line: 822 | named "attachResumedTurn" ]]
			-- upvalues: var57 (copy), var58 (copy), placeId (copy), var79 (copy), creatorAgentChatModule_1 (copy), var36 (copy), var86 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var85 (copy), var59 (copy), var78 (copy)
			var57.current += 1
			local current = var57.current
			var58.current = p28
			
			if placeId ~= nil then
				var79(placeId, "Loading")
			end
			local var121 = creatorAgentChatModule_1.createResumedAssistantTurn(var36, p27, function(p29) --[[ line: 832 ]]
				-- upvalues: var86 (copy), current (ref), var36 (copy)
				var86(current, p29, nil, var36)
			end, if p28 ~= nil then nil else p28 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var85(current) else nil)
			var59(var121, var36)
			var121.start()
			var78.scrollToBottomUnconditionally()
		end
		
		if var67.activeTurnState == nil or var67.activeTurnItemIndex == nil or var67.activeTurnState.isDone then
			var58.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var119)
			var117 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var120 = casSessionId ~= nil and (var117 ~= nil and not var117.isDone)
			
			if not var69 and not var120 then return end
			if var120 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var67.activeTurnStartSequenceId
			
			if var58.current == casSessionId and var61 ~= nil then return end
			var117 = creatorAgentChatStore.resumeTurnFromHistory(var119, var67.activeTurnState, var67.activeTurnSequenceIds)
			
			if var117 ~= nil then
				current(var117, casSessionId)
			end
		end
	end, {
		var67, var36, sessionId, creatorAgentChatStore, var69, var61, placeId, var79,
		var86, var78, var59, var53, var85
	})
	local var88 = reactModule.useCallback(function(p30, p31, p32, p33) --[[ line: 898 ]]
		-- upvalues: var49 (ref), creatorAgentChatModule_1 (copy), var86 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var85 (write), var79 (ref), var59 (ref), var78 (ref)
		var49({ text = p31, afterSequenceId = p33 })
		local _ = nil
		local var122 = creatorAgentChatModule_1.createLiveAssistantTurn(p30, p31, function(p34) --[[ line: 905 ]]
			-- upvalues: var86 (copy), p32 (ref), p31 (ref), p30 (ref)
			var86(p32, p34, p31, p30)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var85(p32) else nil)
		
		if p30.placeId ~= nil then
			var79(p30.placeId, "Loading")
		end
		var59(var122, p30)
		var78.scrollToBottomAfterSend()
		var122.start()
	end, {
		var86, var79, var78, var59, var49, var85
	})
	local var89 = reactModule.useCallback(function(p35, p36, p37) --[[ line: 931 ]]
		-- upvalues: var49 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var57 (ref), universeConfigurationModule (copy), var31 (ref), p9 (ref), creatorAgentChatStore (ref), sessionId (write), var88 (ref), var59 (ref), var84 (ref), var74 (ref), CHAT_CREATE_UNIVERSE_ERROR (copy)
		var49({ text = p35, afterSequenceId = p37 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p39) --[[ line: 939 ]]
			-- upvalues: debug (copy), processTime (ref), var57 (copy), p36 (ref), universeConfigurationModule (copy), var31 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var88 (copy), p35 (ref), p37 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p39.universeId,
				rootPlaceId = p39.rootPlaceId
			})
			
			if var57.current == p36 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p39.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 954 ]]
					-- upvalues: universeConfigurationStore (ref), p39 (ref)
					return universeConfigurationStore.setTeamCreate(p39.universeId, true)
				end):andThen(function() --[[ line: 957 ]]
					-- upvalues: var57 (copy), p36 (copy), p39 (ref), var31 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var88 (copy), p35 (copy), p37 (copy)
					if var57.current ~= p36 then
						return nil
					end
					local t = { universeId = p39.universeId, placeId = p39.rootPlaceId }
					var31(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
					var88(creatorAgentChatStore.getSessionForProject(p39.universeId, p39.rootPlaceId, sessionId), p35, p36, p37)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p38) --[[ line: 980 ]]
			-- upvalues: debug (copy), processTime (ref), var57 (copy), p36 (ref), var59 (copy), var49 (copy), var84 (copy), p35 (ref), var74 (copy), CHAT_CREATE_UNIVERSE_ERROR (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p38
			})
			
			if var57.current == p36 then
				var59(nil)
				var49(nil)
				var84(p35)
				var74(CHAT_CREATE_UNIVERSE_ERROR)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p9.onProjectResolved, var59, var84, var74,
		var31, var49, var88
	})
	local var90 = reactModule.useCallback(function() --[[ line: 1008 ]]
		-- upvalues: var75 (ref), var84 (ref), var69 (ref), var56 (ref), var36 (ref), sessionId (write), var55 (ref), var76 (ref), var78 (ref), p9 (ref), universeId (write), var57 (ref), var51 (ref), var89 (ref), var67 (ref), var88 (ref)
		local replaced = string.gsub(var75.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var84("")
			
			return false
		elseif var69 then
			local current = var56.current
			local var127 = sessionId
			local var128 = if if current == nil or current.session ~= var36 then false else var127 == nil or var127 == "" or (if current.sessionId ~= var127 then current.sessionId == nil and current.session.getCasSessionId() == var127 else true) then var55.current else nil
			
			if var128 == nil or not var128.trySubmitComposerText(replaced) then
				return false
			end
			var84("")
			
			if var76.current then
				var76.current.releaseFocus()
			end
			var78.scrollToBottomAfterSend()
			
			return true
		else
			local var129 = p9.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var129 and var36 == nil then
				return false
			end
			var78.captureStickToBottomForSend()
			var57.current += 1
			local current = var57.current
			var51(nil)
			var84("")
			
			if var76.current then
				var76.current.releaseFocus()
			end
			if var129 then
				var89(replaced, current, var67.latestSequenceId)
			else
				var88(var36, replaced, current, var67.latestSequenceId)
			end
			return true
		end
	end, {
		var36, sessionId, universeId, var69, var78, var84, var89, var88,
		p9.createUniverseOnFirstPrompt, var51, var67
	})
	local var91 = reactModule.useCallback(function() --[[ line: 1065 ]]
		-- upvalues: var56 (ref), var36 (ref), sessionId (write), var55 (ref), var57 (ref), var59 (ref), var58 (ref), var49 (ref), var51 (ref), var67 (ref), placeId (write), var79 (ref)
		local current = var56.current
		local var130 = if if current == nil or current.session ~= var36 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var55.current else nil
		
		if var130 == nil then return end
		var57.current += 1
		var130.stop()
		var59(nil)
		var58.current = nil
		var49(nil)
		var51({
			session = var36,
			sessionId = var36.getCasSessionId(),
			startSequenceId = var67.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var79(placeId, "Idle")
		end
	end, {
		var36, sessionId, placeId, var79, var59, var49, var51, var67
	})
	local var92 = p9.autoFocusComposer == nil or p9.autoFocusComposer
	local var93 = if p9.focusComposerWhen == nil then var92 else p9.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1100 ]]
		-- upvalues: var92 (ref), var93 (ref), var76 (ref)
		if var92 and var93 then
			local var131 = false
			
			local var132 = function() --[[ line: 1105 ]]
				-- upvalues: var131 (write)
				return var131
			end
			
			local var133 = 8
			
			local function tryFocus() --[[ line: 180 ]]
				-- upvalues: var132 (ref), var76 (ref), var133 (write), tryFocus (ref)
				if var132() then return end
				local current = var76.current
				
				if current then
					current.focus()
					
					return
				end
				var27 -= 1
				
				if var27 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 1108 ]]
				-- upvalues: var131 (write)
				var131 = true
			end
		end
		return function() --[[ line: 1102 ]] end
	end, { var92, var93 })
	
	return {
		messages = messages,
		localToolActions = var64,
		composerText = var71,
		composerErrorText = var73,
		setComposerText = var84,
		isAssistantResponding = var69,
		canStopAssistantResponse = var61 ~= nil,
		canSendWhileResponding = var70,
		sendMessage = var90,
		stopAssistantResponse = var91,
		setScrollingFrame = var78.setScrollingFrame,
		textBoxRef = var76,
		clockBinding = var77,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p40) --[[ line: 1113 ]]
			-- upvalues: placeId (write), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then
				return
			end
			launchPlaytestWithLoadingStateModule(placeId, p40, true)
		end, { placeId }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState,
		isHistoryLoading = var47
	}
end