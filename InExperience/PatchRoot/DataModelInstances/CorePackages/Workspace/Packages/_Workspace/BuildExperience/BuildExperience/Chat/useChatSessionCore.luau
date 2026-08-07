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
local fFlagBuildExperienceToolResultFailureRecoveryModule = require(buildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local _ = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local parseSessionStreamModule = require(script.Parent.parseSessionStream)
local useChatScrollModule = require(script.Parent.useChatScroll)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local getDefaultTemplatePlaceIdModule = require(buildExperience.utils.getDefaultTemplatePlaceId)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)
local debug = creatorAgentChatModule.debug
local CHAT_CREATE_UNIVERSE_ERROR = localizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")
local var20 = signalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local var21 = signalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local var22 = signalsModule.createSignal(nil)
local var23 = signalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p0, p1, p2) --[[ line: 132 | named "sessionOwnerMatches" ]]
	return if p0 == nil or p0.session ~= p1 then false else p2 == nil or p2 == "" or (if p0.sessionId ~= p2 then p0.sessionId == nil and p0.session.getCasSessionId() == p2 else true)
end

local function hasPendingLocalToolResponse(p3) --[[ line: 142 ]]
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

local _ = function(p4) --[[ line: 156 | named "trimMessage" ]]
	return string.gsub(p4, "^%s*(.-)%s*$", "%1")
end

local _ = function(p5) --[[ line: 160 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p5 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p5)
end

local _ = function(p6, p7) --[[ line: 167 | named "scheduleComposerAutoFocus" ]]
	local var25 = 8
	
	local function tryFocus() --[[ line: 169 ]]
		-- upvalues: p7 (ref), p6 (ref), var25 (write), tryFocus (ref)
		if p7() then return end
		local current = p6.current
		
		if current then
			current.focus()
			
			return
		end
		var25 -= 1
		
		if var25 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p8) --[[ line: 186 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

return function(p9) --[[ line: 199 | named "useChatSessionCore" ]]
	-- upvalues: reactModule (ref), creatorAgentChatModule (ref), var23 (ref), signalsModule (ref), signalsReactModule (ref), var20 (ref), var21 (ref), var22 (ref), parseSessionStreamModule (ref), hasPendingLocalToolResponse (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (ref), creatorAgentChatModule_1 (ref), universeCreateModule (ref), getDefaultTemplatePlaceIdModule (ref), debug (ref), universeConfigurationModule (ref), CHAT_CREATE_UNIVERSE_ERROR (ref), launchPlaytestWithLoadingStateModule (ref)
	local var28, var29 = reactModule.useState(nil)
	local var30, var31 = reactModule.useState(nil)
	local placeId = p9.placeId
	local universeId = p9.universeId
	local sessionId = p9.sessionId
	
	if var28 ~= nil then
		placeId = var28.placeId
		universeId = var28.universeId
		sessionId = var28.sessionId
	end
	if (sessionId == nil or sessionId == "") and (var30 ~= nil and var30.universeId == universeId) and var30.placeId == placeId then
		sessionId = var30.sessionId
	end
	local var32 = p9.hydrateHistoryWhen == nil or p9.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	local var34 = reactModule.useMemo(function() --[[ line: 221 ]]
		-- upvalues: universeId (write), creatorAgentChatStore (ref), placeId (write), sessionId (write)
		return if universeId == nil then nil else creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 228 ]]
		-- upvalues: var34 (ref), sessionId (write)
		if var34 == nil or sessionId == nil or sessionId == "" then
			return
		end
		var34.setCasSessionId(sessionId)
	end, { var34, sessionId })
	local var35 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 235 ]]
		-- upvalues: var34 (ref), var23 (copy), signalsModule (copy)
		return if var34 == nil then var23 else signalsModule.createComputed(function(p10) --[[ line: 240 ]]
			-- upvalues: var34 (copy)
			return {
				session = var34,
				sessionId = var34.getCasSessionId(),
				events = var34.getMergedHistory(p10)
			}
		end)
	end, { var34 }))
	local var36 = if var35.session == var34 and var35.sessionId == (if var34 ~= nil then nil else var34.getCasSessionId()) then var35.events else {}
	local var37, var38 = reactModule.useState(nil)
	local var39, var40 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 270 ]]
		-- upvalues: var40 (ref)
		var40(nil)
	end, { var34, sessionId })
	local var41 = sessionId
	local var42 = if if var39 == nil or var39.session ~= var34 then false else var41 == nil or var41 == "" or (if var39.sessionId ~= var41 then var39.sessionId == nil and var39.session.getCasSessionId() == var41 else true) then var39 else nil
	var43, var41 = reactModule.useState(nil)
	local var44 = reactModule.useRef(nil)
	local var45 = reactModule.useRef(nil)
	local var46 = reactModule.useRef(0)
	local var47 = reactModule.useRef(nil)
	local var48 = reactModule.useCallback(function(p11, p12) --[[ line: 285 ]]
		-- upvalues: var44 (ref), var45 (ref), var41 (ref)
		assert(if p11 ~= nil then p12 ~= nil else true, "Active turns require an owning session")
		var44.current = p11
		var45.current = if p11 ~= nil then nil else { session = p12, sessionId = p12.getCasSessionId() }
		var41(p11)
	end, { var41 })
	local current = var45.current
	local var49 = sessionId
	local var50 = if if current == nil or current.session ~= var34 then false else var49 == nil or var49 == "" or (if current.sessionId ~= var49 then current.sessionId == nil and current.session.getCasSessionId() == var49 else true) then var43 else nil
	reactModule.useLayoutEffect(function() --[[ line: 302 ]]
		-- upvalues: var43 (ref), var45 (ref), var34 (ref), sessionId (write), var46 (ref), var47 (ref), var48 (ref), var38 (ref), var40 (ref)
		if var43 ~= nil then
			local current = var45.current
			local var83 = sessionId
			
			if if current == nil or current.session ~= var34 then false else var83 == nil or var83 == "" or (if current.sessionId ~= var83 then current.sessionId == nil and current.session.getCasSessionId() == var83 else true) then
				return
			else
				var46.current += 1
				var47.current = nil
				var43.detach()
				var48(nil, nil)
				var38(nil)
				var40(nil)
			end
		end
	end, { var34, sessionId, var43, var48 })
	local var51 = if var50 ~= nil then var20 else var50.getOptimisticLocalTools
	current = if var50 ~= nil then var21 else var50.getLocalToolActions
	var49 = if var50 ~= nil then var22 else var50.getSetupErrorText
	local var52 = signalsReactModule.useSignalState(var51)
	local var53 = signalsReactModule.useSignalState(current)
	local var54 = signalsReactModule.useSignalState(var49)
	local var55 = reactModule.useMemo(function() --[[ line: 330 ]]
		-- upvalues: var50 (ref), var54 (ref)
		return if var50 == nil then nil else { setupErrorText = var54 }
	end, { var50, var54 })
	local var56 = reactModule.useMemo(function() --[[ line: 338 ]]
		-- upvalues: parseSessionStreamModule (copy), var36 (ref), var34 (ref), sessionId (write), universeId (write), placeId (write), var52 (ref), var37 (ref), var55 (ref), var42 (ref)
		return parseSessionStreamModule(var36, {
			sessionId = if var34 ~= nil then sessionId else var34.getCasSessionId() or sessionId,
			universeId = if var34 ~= nil then universeId else var34.universeId,
			placeId = if var34 ~= nil then placeId else var34.placeId,
			optimisticLocalTools = var52,
			pendingUserMessage = if var37 ~= nil then nil else var37.text,
			pendingUserMessageAfterSequenceId = if var37 ~= nil then nil else var37.afterSequenceId,
			liveAssistantMessage = var55,
			optimisticCancelledStartSequenceId = if var42 ~= nil then nil else var42.startSequenceId
		})
	end, {
		var36, var34, sessionId, universeId, placeId, var52, var37, var55, var42
	})
	local messages = var56.messages
	local subagentTaskState = var56.subagentTaskState
	local includesPublishTool = var56.includesPublishTool
	local var57 = messages[#messages]
	local var58 = if var50 == nil then var57 ~= nil and (var57.kind == "assistant_turn" and not var57.isDone) else true
	local var59 = var58 and hasPendingLocalToolResponse(var52)
	local activeTurnState = var56.activeTurnState
	reactModule.useEffect(function() --[[ line: 381 ]]
		-- upvalues: var50 (ref), activeTurnState (ref)
		if var50 == nil or activeTurnState == nil then
			return
		end
		var50.syncFromTurnState(activeTurnState)
	end, { var50, activeTurnState })
	reactModule.useEffect(function() --[[ line: 388 ]]
		-- upvalues: var56 (ref), placeId (write), placeVersionHistoryModule (copy)
		if not var56.includesPublishTool then return end
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var56.includesPublishTool, placeId })
	local var60, var61 = reactModule.useBinding("")
	local var62, var63 = reactModule.useState(nil)
	local var64 = reactModule.useRef("")
	local var65 = reactModule.useRef(nil)
	local var66 = reactUtilsModule.useClock()
	local var67 = useChatScrollModule()
	local var68 = reactModule.useCallback(function(p13, p14) --[[ line: 403 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy)
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p13, p14)
	end, {})
	local var69 = reactModule.useCallback(function(p15) --[[ line: 407 ]]
		-- upvalues: var67 (ref), var34 (ref)
		local var84 = function() --[[ line: 408 ]]
			-- upvalues: p15 (ref)
			return if p15 == nil then false else p15()
		end
		
		var67.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 415 ]]
			-- upvalues: var34 (copy), var84 (ref), var67 (copy), p15 (ref)
			if var34 == nil then return end
			if var34.loadOlderHistory(var84) and var34.getNextHistoryPageToken() ~= nil and var67.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 421 ]]
					-- upvalues: p15 (copy), var67 (copy), var34 (copy), var84 (copy)
					if if p15 ~= nil then false else p15() then return end
					if var67.isViewportUnderfilled() then
						var34.loadOlderHistory(var84)
					end
				end)
			end
		end)
	end, { var34, var67 })
	local var70 = reactModule.useCallback(function(p16) --[[ line: 433 ]]
		-- upvalues: var34 (ref), var67 (ref), var69 (ref)
		task.delay(0.1, function() --[[ line: 434 ]]
			-- upvalues: p16 (ref), var34 (copy), var67 (copy), var69 (copy)
			if p16() then return end
			if var34 == nil then return end
			if var34.getNextHistoryPageToken() == nil then return end
			if var67.isViewportUnderfilled() then
				var69(p16)
				
				return
			end
		end)
	end, { var69, var67, var34 })
	local var71 = reactModule.useCallback(function(p17) --[[ line: 452 ]]
		-- upvalues: var34 (ref), var70 (ref)
		if var34 == nil then return end
		if var34.getNextHistoryPageToken() == nil then
			return
		end
		var70(p17)
	end, { var70, var34 })
	local var72 = reactModule.useRef(var71)
	var72.current = var71
	reactModule.useEffect(function() --[[ line: 464 ]]
		-- upvalues: var67 (ref), var69 (ref)
		var67.setOnScrolledToTop(function() --[[ line: 465 ]]
			-- upvalues: var69 (copy)
			var69(nil)
		end)
		
		return function() --[[ line: 468 ]]
			-- upvalues: var67 (copy)
			var67.setOnScrolledToTop(nil)
		end
	end, { var67.setOnScrolledToTop, var69 })
	reactModule.useEffect(function() --[[ line: 473 ]]
		-- upvalues: var32 (ref), var34 (ref), sessionId (write), var72 (ref), universeId (write), creatorAgentChatStore (ref), var31 (ref), placeId (write)
		if var32 and var34 ~= nil then
			local var85 = false
			
			local function isHydrateCancelled() --[[ line: 480 ]]
				-- upvalues: var85 (write), sessionId (ref), var34 (copy)
				return if var85 then true elseif sessionId == nil or sessionId == "" then false else var34.getCasSessionId() ~= sessionId
			end
			
			local function _() --[[ line: 489 | named "continueAfterSessionReady" ]]
				-- upvalues: var85 (write), sessionId (ref), var34 (copy), var72 (copy), isHydrateCancelled (ref)
				local var88
				if var85 then
					var88 = true
				elseif sessionId == nil or sessionId == "" then
					var88 = false
				else
					var88 = var34.getCasSessionId() ~= sessionId
					var88 = nil
				end
				if var88 then
					return
				end
				var72.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p18) --[[ line: 496 ]]
				-- upvalues: var34 (copy), var85 (write), sessionId (ref), var72 (copy), isHydrateCancelled (ref)
				var34.setCasSessionId(p18)
				
				if var34.hasLoadedHistory() and #var34.getMergedHistory(false) > 0 then
					local var89
					if var85 then
						var89 = true
					elseif sessionId == nil or sessionId == "" then
						var89 = false
					else
						var89 = var34.getCasSessionId() ~= sessionId
						var89 = nil
					end
					if var89 then
						return
					end
					var72.current(isHydrateCancelled)
					
					return
				elseif var34.refreshSession(isHydrateCancelled) then
					local var90
					if var85 then
						var90 = true
					elseif sessionId == nil or sessionId == "" then
						var90 = false
					else
						var90 = var34.getCasSessionId() ~= sessionId
						var90 = nil
					end
					if not var90 then
						if var85 then
							var90 = true
						elseif sessionId == nil or sessionId == "" then
							var90 = false
						else
							var90 = var34.getCasSessionId() ~= sessionId
							var90 = nil
						end
						if var90 then return end
						var72.current(isHydrateCancelled)
					end
				end
			end
			
			task.spawn(function() --[[ line: 507 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), universeId (copy), var34 (copy), creatorAgentChatStore (copy), var85 (write), sessionId (ref), var31 (copy), placeId (copy)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var34.hasLoadedHistory() and #var34.getMergedHistory(false) > 0 then return end
				local var91 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
				while var91.state(false).status == "pending" do
					local var92
					if var85 then
						var92 = true
					elseif sessionId == nil or sessionId == "" then
						var92 = false
					else
						var92 = var34.getCasSessionId() ~= sessionId
						var92 = nil
					end
					if var92 then break end
					task.wait()
				end
				local result
				if var85 then
					result = true
				elseif sessionId == nil or sessionId == "" then
					result = false
				else
					result = var34.getCasSessionId() ~= sessionId
					result = nil
				end
				if result or var91.state(false).status ~= "succeeded" then return end
				result = var91.state(false).result
				local var93 = if result ~= nil then nil else result.sessions
				local var94 = if typeof(var93) == "table" then var93[1] else nil
				local var95 = if typeof(var94) == "table" then var94.sessionId else nil
				
				if typeof(var95) == "string" and var95 ~= "" then
					var31({
						universeId = universeId,
						placeId = placeId,
						sessionId = var95
					})
					
					return
				end
				var34.markHistoryLoaded()
			end)
			
			return function() --[[ line: 548 ]]
				-- upvalues: var85 (write)
				var85 = true
			end
		end
	end, {
		var34, sessionId, universeId, placeId, creatorAgentChatStore, var32
	})
	reactModule.useEffect(function() --[[ line: 553 ]]
		-- upvalues: var34 (ref), sessionId (write), var72 (ref), messageBusService (copy), gameMessageId (copy), appLifecycleObserverService (copy)
		if var34 == nil then
			return
		end
		local var96 = false
		
		local function refreshKnownSession() --[[ line: 558 ]]
			-- upvalues: var34 (copy), sessionId (copy), var96 (write), var72 (copy)
			local casSessionId = var34.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 566 ]]
				-- upvalues: var34 (copy), var96 (copy), var72 (copy)
				if var34.refreshSession(function() --[[ line: 567 ]]
					-- upvalues: var96 (copy)
					return var96
				end) and not var96 then
					var72.current(function() --[[ line: 570 ]]
						-- upvalues: var96 (copy)
						return var96
					end)
				end
			end)
		end
		
		local var98 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 577 ]]
			-- upvalues: refreshKnownSession (ref)
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 582 ]]
			-- upvalues: var96 (write), var98 (ref), onUnhideConnection (ref)
			var96 = true
			var98:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var34, sessionId })
	local var73 = reactModule.useCallback(function(p19) --[[ line: 589 ]]
		-- upvalues: var64 (ref), var61 (ref), var63 (ref)
		var64.current = p19
		var61(p19)
		var63(nil)
	end, { var61, var63 })
	local var74 = if fFlagBuildExperienceToolResultFailureRecoveryModule then reactModule.useCallback(function(p20) --[[ line: 597 ]]
		-- upvalues: var46 (ref), var45 (ref), var34 (ref), sessionId (write), var64 (ref), var73 (ref), var63 (ref), creatorAgentChatModule_1 (copy)
		return function(p21, p22) --[[ line: 598 ]]
			-- upvalues: var46 (copy), p20 (ref), var45 (copy), var34 (copy), sessionId (copy), var64 (copy), var73 (copy), var63 (copy), creatorAgentChatModule_1 (copy)
			if var46.current == p20 then
				local current = var45.current
				local var101 = sessionId
				
				if not (if current == nil or current.session ~= var34 then false else var101 == nil or var101 == "" or (if current.sessionId ~= var101 then current.sessionId == nil and current.session.getCasSessionId() == var101 else true)) then return end
				if p21 ~= nil and var64.current == "" then
					var73(p21)
				end
				var63(creatorAgentChatModule_1.getToolResultFailureComposerError(p22))
				
				return
			end
		end
	end, { var34, sessionId, var73, var63 }) else nil
	local var75 = reactModule.useCallback(function(p23, p24, p25, p26) --[[ line: 614 ]]
		-- upvalues: var46 (ref), var48 (ref), var47 (ref), var38 (ref), p9 (ref), var68 (ref), var73 (ref), var63 (ref), creatorAgentChatModule_1 (copy), var67 (ref), sessionId (write), var29 (ref)
		if var46.current ~= p23 then return end
		var48(nil)
		var47.current = nil
		var38(nil)
		
		if p24 == nil then
			if p26.placeId ~= nil then
				var68(p26.placeId, "Completed")
			end
			var67.scrollToBottomAfterSend()
			local casSessionId = p26.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				if p9.createUniverseOnFirstPrompt and sessionId == nil and p26.universeId ~= nil then
					local t = {
						universeId = p26.universeId,
						placeId = p26.placeId,
						sessionId = casSessionId
					}
					var29(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
				end
				task.spawn(function() --[[ line: 670 ]]
					-- upvalues: p26 (ref), var46 (copy), p23 (ref)
					p26.refreshSession(function() --[[ line: 671 ]]
						-- upvalues: var46 (copy), p23 (copy)
						return var46.current ~= p23
					end)
				end)
			end
			return
		elseif p9.onPromptFailure ~= nil then
			p9.onPromptFailure(p24.errorCode, p24.outOfCreditsReason)
		end
		if p26.placeId ~= nil then
			var68(p26.placeId, "Idle")
		end
		if p25 ~= nil then
			var73(p25)
			var63(creatorAgentChatModule_1.getPromptFailureComposerError(p24))
		end
		task.spawn(function() --[[ line: 641 ]]
			-- upvalues: p26 (ref), var46 (copy), p23 (ref)
			p26.refreshSession(function() --[[ line: 642 ]]
				-- upvalues: var46 (copy), p23 (copy)
				return var46.current ~= p23
			end)
		end)
	end, {
		p9.createUniverseOnFirstPrompt, p9.onPromptFailure, p9.onProjectResolved,
		sessionId, var68, var29, var67, var73, var63, var48, var38
	})
	local var76 = reactModule.useRef(var32)
	reactModule.useEffect(function() --[[ line: 694 ]]
		-- upvalues: var32 (ref), var76 (ref), var58 (ref), var50 (ref), var67 (ref)
		local var104 = var32 and not var76.current
		var76.current = var32
		
		if not var32 then return end
		if var104 or var58 or var50 ~= nil then
			var67.scrollToBottomUnconditionally()
			task.defer(var67.scrollToBottomUnconditionally)
			task.delay(0.15, var67.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var32,
		var58,
		var50,
		#messages,
		var67
	})
	reactModule.useEffect(function() --[[ line: 720 ]]
		-- upvalues: var44 (ref), var45 (ref), var34 (ref), sessionId (write), var42 (ref), var46 (ref), var47 (ref), placeId (write), var68 (ref), creatorAgentChatModule_1 (copy), var75 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var74 (write), var48 (ref), var67 (ref), var56 (ref), var50 (ref), creatorAgentChatStore (ref), var58 (ref)
		local var105
		if var44.current ~= nil then
			local current = var45.current
			var105 = sessionId
			
			if if current == nil or current.session ~= var34 then false else var105 == nil or var105 == "" or (if current.sessionId ~= var105 then current.sessionId == nil and current.session.getCasSessionId() == var105 else true) then return end
		end
		if var42 ~= nil then return end
		if var34 == nil then return end
		local var107
		local casSessionId = var34.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var107 = casSessionId
		else
			var105 = var34.universeId
			local placeId_1 = var34.placeId
			var107 = if var105 == nil or placeId_1 == nil then nil else `{var105}:{placeId_1}`
		end
		if var107 == nil then return end
		local function current(p27, p28) --[[ line: 742 | named "attachResumedTurn" ]]
			-- upvalues: var46 (copy), var47 (copy), placeId (copy), var68 (copy), creatorAgentChatModule_1 (copy), var34 (copy), var75 (copy), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var74 (copy), var48 (copy), var67 (copy)
			var46.current += 1
			local current = var46.current
			var47.current = p28
			
			if placeId ~= nil then
				var68(placeId, "Loading")
			end
			local var109 = creatorAgentChatModule_1.createResumedAssistantTurn(var34, p27, function(p29) --[[ line: 752 ]]
				-- upvalues: var75 (copy), current (ref), var34 (copy)
				var75(current, p29, nil, var34)
			end, if p28 ~= nil then nil else p28 - 1, if fFlagBuildExperienceToolResultFailureRecoveryModule then var74(current) else nil)
			var48(var109, var34)
			var109.start()
			var67.scrollToBottomUnconditionally()
		end
		
		if var56.activeTurnState == nil or var56.activeTurnItemIndex == nil or var56.activeTurnState.isDone then
			var47.current = nil
			casSessionId = creatorAgentChatStore.getActiveTurnHandle(var107)
			var105 = if casSessionId ~= nil then nil else casSessionId.state(false)
			local var108 = casSessionId ~= nil and (var105 ~= nil and not var105.isDone)
			
			if not var58 and not var108 then return end
			if var108 then
				current(casSessionId, nil)
			end
			return
		else
			casSessionId = var56.activeTurnStartSequenceId
			
			if var47.current == casSessionId and var50 ~= nil then return end
			var105 = creatorAgentChatStore.resumeTurnFromHistory(var107, var56.activeTurnState, var56.activeTurnSequenceIds)
			
			if var105 ~= nil then
				current(var105, casSessionId)
			end
		end
	end, {
		var56, var34, sessionId, creatorAgentChatStore, var58, var50, placeId, var68,
		var75, var67, var48, var42, var74
	})
	local var77 = reactModule.useCallback(function(p30, p31, p32, p33) --[[ line: 818 ]]
		-- upvalues: var38 (ref), creatorAgentChatModule_1 (copy), var75 (ref), fFlagBuildExperienceToolResultFailureRecoveryModule (copy), var74 (write), var68 (ref), var48 (ref), var67 (ref)
		var38({ text = p31, afterSequenceId = p33 })
		local _ = nil
		local var110 = creatorAgentChatModule_1.createLiveAssistantTurn(p30, p31, function(p34) --[[ line: 825 ]]
			-- upvalues: var75 (copy), p32 (ref), p31 (ref), p30 (ref)
			var75(p32, p34, p31, p30)
		end, if fFlagBuildExperienceToolResultFailureRecoveryModule then var74(p32) else nil)
		
		if p30.placeId ~= nil then
			var68(p30.placeId, "Loading")
		end
		var48(var110, p30)
		var67.scrollToBottomAfterSend()
		var110.start()
	end, {
		var75, var68, var67, var48, var38, var74
	})
	local var78 = reactModule.useCallback(function(p35, p36, p37) --[[ line: 851 ]]
		-- upvalues: var38 (ref), universeCreateModule (copy), getDefaultTemplatePlaceIdModule (copy), debug (copy), var46 (ref), universeConfigurationModule (copy), var29 (ref), p9 (ref), creatorAgentChatStore (ref), sessionId (write), var77 (ref), var48 (ref), var73 (ref), var63 (ref), CHAT_CREATE_UNIVERSE_ERROR (copy)
		var38({ text = p35, afterSequenceId = p37 })
		local processTime = os.clock()
		universeCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p39) --[[ line: 859 ]]
			-- upvalues: debug (copy), processTime (ref), var46 (copy), p36 (ref), universeConfigurationModule (copy), var29 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var77 (copy), p35 (ref), p37 (ref)
			debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				universeId = p39.universeId,
				rootPlaceId = p39.rootPlaceId
			})
			
			if var46.current == p36 then
				local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
				
				return universeConfigurationStore.patchConfiguration(p39.universeId, { audiences = { 1 } }):andThen(function() --[[ line: 874 ]]
					-- upvalues: universeConfigurationStore (ref), p39 (ref)
					return universeConfigurationStore.setTeamCreate(p39.universeId, true)
				end):andThen(function() --[[ line: 877 ]]
					-- upvalues: var46 (copy), p36 (copy), p39 (ref), var29 (copy), p9 (copy), creatorAgentChatStore (copy), sessionId (copy), var77 (copy), p35 (copy), p37 (copy)
					if var46.current ~= p36 then
						return nil
					end
					local t = { universeId = p39.universeId, placeId = p39.rootPlaceId }
					var29(t)
					
					if p9.onProjectResolved ~= nil then
						p9.onProjectResolved(t)
					end
					var77(creatorAgentChatStore.getSessionForProject(p39.universeId, p39.rootPlaceId, sessionId), p35, p36, p37)
					
					return nil
				end)
			end
			return nil
		end):catch(function(p38) --[[ line: 900 ]]
			-- upvalues: debug (copy), processTime (ref), var46 (copy), p36 (ref), var48 (copy), var38 (copy), var73 (copy), p35 (ref), var63 (copy), CHAT_CREATE_UNIVERSE_ERROR (copy)
			debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - processTime) * 1000 + 0.5),
				error = p38
			})
			
			if var46.current == p36 then
				var48(nil)
				var38(nil)
				var73(p35)
				var63(CHAT_CREATE_UNIVERSE_ERROR)
				
				return
			end
		end)
	end, {
		sessionId, creatorAgentChatStore, p9.onProjectResolved, var48, var73, var63,
		var29, var38, var77
	})
	local var79 = reactModule.useCallback(function() --[[ line: 928 ]]
		-- upvalues: var64 (ref), var73 (ref), var58 (ref), var45 (ref), var34 (ref), sessionId (write), var44 (ref), var65 (ref), var67 (ref), p9 (ref), universeId (write), var46 (ref), var40 (ref), var78 (ref), var56 (ref), var77 (ref)
		local replaced = string.gsub(var64.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var73("")
			
			return false
		elseif var58 then
			local current = var45.current
			local var115 = sessionId
			local var116 = if if current == nil or current.session ~= var34 then false else var115 == nil or var115 == "" or (if current.sessionId ~= var115 then current.sessionId == nil and current.session.getCasSessionId() == var115 else true) then var44.current else nil
			
			if var116 == nil or not var116.trySubmitComposerText(replaced) then
				return false
			end
			var73("")
			
			if var65.current then
				var65.current.releaseFocus()
			end
			var67.scrollToBottomAfterSend()
			
			return true
		else
			local var117 = p9.createUniverseOnFirstPrompt == true and universeId == nil
			
			if not var117 and var34 == nil then
				return false
			end
			var67.captureStickToBottomForSend()
			var46.current += 1
			local current = var46.current
			var40(nil)
			var73("")
			
			if var65.current then
				var65.current.releaseFocus()
			end
			if var117 then
				var78(replaced, current, var56.latestSequenceId)
			else
				var77(var34, replaced, current, var56.latestSequenceId)
			end
			return true
		end
	end, {
		var34, sessionId, universeId, var58, var67, var73, var78, var77,
		p9.createUniverseOnFirstPrompt, var40, var56
	})
	local var80 = reactModule.useCallback(function() --[[ line: 985 ]]
		-- upvalues: var45 (ref), var34 (ref), sessionId (write), var44 (ref), var46 (ref), var48 (ref), var47 (ref), var38 (ref), var40 (ref), var56 (ref), placeId (write), var68 (ref)
		local current = var45.current
		local var118 = if if current == nil or current.session ~= var34 then false else sessionId == nil or sessionId == "" or (if current.sessionId ~= sessionId then current.sessionId == nil and current.session.getCasSessionId() == sessionId else true) then var44.current else nil
		
		if var118 == nil then return end
		var46.current += 1
		var118.stop()
		var48(nil)
		var47.current = nil
		var38(nil)
		var40({
			session = var34,
			sessionId = var34.getCasSessionId(),
			startSequenceId = var56.activeTurnStartSequenceId
		})
		
		if placeId ~= nil then
			var68(placeId, "Idle")
		end
	end, {
		var34, sessionId, placeId, var68, var48, var38, var40, var56
	})
	local var81 = p9.autoFocusComposer == nil or p9.autoFocusComposer
	local var82 = if p9.focusComposerWhen == nil then var81 else p9.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 1020 ]]
		-- upvalues: var81 (ref), var82 (ref), var65 (ref)
		if var81 and var82 then
			local var119 = false
			
			local var120 = function() --[[ line: 1025 ]]
				-- upvalues: var119 (write)
				return var119
			end
			
			local var121 = 8
			
			local function tryFocus() --[[ line: 169 ]]
				-- upvalues: var120 (ref), var65 (ref), var121 (write), tryFocus (ref)
				if var120() then return end
				local current = var65.current
				
				if current then
					current.focus()
					
					return
				end
				var25 -= 1
				
				if var25 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 1028 ]]
				-- upvalues: var119 (write)
				var119 = true
			end
		end
		return function() --[[ line: 1022 ]] end
	end, { var81, var82 })
	
	return {
		messages = messages,
		localToolActions = var53,
		composerText = var60,
		composerErrorText = var62,
		setComposerText = var73,
		isAssistantResponding = var58,
		canStopAssistantResponse = var50 ~= nil,
		canSendWhileResponding = var59,
		sendMessage = var79,
		stopAssistantResponse = var80,
		setScrollingFrame = var67.setScrollingFrame,
		textBoxRef = var65,
		clockBinding = var66,
		playtestPlaceId = placeId,
		launchPlaytest = if placeId ~= nil then nil else reactModule.useCallback(function(p40) --[[ line: 1033 ]]
			-- upvalues: placeId (write), launchPlaytestWithLoadingStateModule (copy)
			if placeId == nil then
				return
			end
			launchPlaytestWithLoadingStateModule(placeId, p40, true)
		end, { placeId }),
		hasPublishedTurn = includesPublishTool,
		subagentTaskState = subagentTaskState
	}
end