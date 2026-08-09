local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local messageBusService = game:GetService("MessageBusService")
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.chatTypes)
local creatorAgentChatModule_1 = require(script.Parent.creatorAgentChat)
local historyToChatMessagesModule = require(script.Parent.historyToChatMessages)
local useChatScrollModule = require(script.Parent.useChatScroll)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(buildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)
local buildLiveActivityControllerModule = require(buildExperience.BuildLiveActivityController)
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)
local buildLiveActivityCleanup = game:DefineFastFlag("BuildLiveActivityCleanup", false)
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")

local function _(p0) --[[ line: 77 | named "trimMessage" ]]
	return string.gsub(p0, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1, p2) --[[ line: 81 | named "shouldShowPendingUserMessage" ]]
	if p2 == nil or p2 == "" then
		return false
	end
	for i = #p1, 1, -1 do
		local var19 = p1[i]
		
		if not var19.isUser then
			continue
		end
		return var19.text ~= p2
	end
	return true
end

local _ = function(p3) --[[ line: 94 | named "refreshVersionHistoryAfterPublish" ]]
	-- upvalues: placeVersionHistoryModule (ref)
	if p3 == nil then
		return
	end
	placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p3)
end

local _ = function(p4, p5) --[[ line: 101 | named "scheduleComposerAutoFocus" ]]
	local var20 = 8
	
	local function tryFocus() --[[ line: 103 ]]
		-- upvalues: p5 (ref), p4 (ref), var20 (write), tryFocus (ref)
		if p5() then return end
		local current = p4.current
		
		if current then
			current.focus()
			
			return
		end
		var20 -= 1
		
		if var20 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p6, p7) --[[ line: 120 | named "getIsAgentLoadingForPlaceId" ]]
	-- upvalues: getPlaytestLoadingStoreModule (ref)
	return if p7 == nil then false else getPlaytestLoadingStoreModule(p6).getAgentStatusForPlaceId(p7)(p6) == "Loading"
end

local _ = function(p8) --[[ line: 127 | named "getResumeSessionKey" ]]
	local casSessionId = p8.getCasSessionId()
	
	if typeof(casSessionId) == "string" and casSessionId ~= "" then
		return casSessionId
	end
	local universeId = p8.universeId
	local placeId = p8.placeId
	
	return if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
end

return function(p9) --[[ line: 140 | named "useChatSessionCore" ]]
	-- upvalues: getCurrentExperienceProjectModule (ref), creatorAgentChatModule (ref), buildLiveActivity (ref), buildLiveActivityCleanup (ref), reactModule (ref), buildLiveActivityControllerModule (ref), signalsReactModule (ref), historyToChatMessagesModule (ref), placeVersionHistoryModule (ref), reactUtilsModule (ref), useChatScrollModule (ref), getPlaytestLoadingStoreModule (ref), signalsModule (ref), messageBusService (ref), gameMessageId (ref), appLifecycleObserverService (ref), creatorAgentChatModule_1 (ref), launchPlaytestWithLoadingStateModule (ref)
	local placeId = p9.placeId or getCurrentExperienceProjectModule().placeId
	local universeId = p9.universeId or getCurrentExperienceProjectModule().universeId
	local sessionId = p9.sessionId
	local var25 = p9.hydrateHistoryWhen == nil or p9.hydrateHistoryWhen
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	
	if buildLiveActivity or buildLiveActivityCleanup then
		reactModule.useEffect(function() --[[ line: 148 ]]
			-- upvalues: buildLiveActivityControllerModule (copy)
			buildLiveActivityControllerModule.bootstrap(true)
		end, {})
	end
	local var27 = reactModule.useMemo(function() --[[ line: 153 ]]
		-- upvalues: creatorAgentChatStore (ref), universeId (ref), placeId (ref), sessionId (ref)
		return creatorAgentChatStore.getSessionForProject(universeId, placeId, sessionId)
	end, { universeId, placeId, sessionId, creatorAgentChatStore })
	reactModule.useLayoutEffect(function() --[[ line: 157 ]]
		-- upvalues: sessionId (ref), var27 (ref)
		if sessionId == nil or sessionId == "" then
			return
		end
		var27.setCasSessionId(sessionId)
	end, { var27, sessionId })
	local var28 = signalsReactModule.useSignalState(var27.getMergedHistory)
	local var29 = signalsReactModule.useSignalState(var27.getPendingUserMessage)
	local var30 = signalsReactModule.useSignalState(var27.getHasPublishedTurn)
	local var31 = signalsReactModule.useSignalState(var27.getSubagentTaskState)
	local var32, var33 = reactModule.useState(nil)
	local var34 = reactModule.useRef(nil)
	local var35 = reactModule.useRef(0)
	local var36 = reactModule.useRef(nil)
	local var37 = reactModule.useMemo(function() --[[ line: 175 ]]
		-- upvalues: var27 (ref), historyToChatMessagesModule (copy), var28 (ref), var29 (ref), var32 (ref), var31 (ref)
		local var65
		local var61 = historyToChatMessagesModule(var28, {
			sessionId = var27.getCasSessionId() or "",
			universeId = var27.universeId,
			placeId = var27.placeId
		})
		local cloned = table.clone(var61.messages)
		local messages = var61.messages
		local var63 = var29
		
		if var63 == nil or var63 == "" then
			var65 = false
		else
			local var64
			for i = #messages, 1, -1 do
				var64 = messages[i]
				
				if not var64.isUser then
					continue
				end
				local _ = var64.text ~= var63
			end
			var65 = true
		end
		if var65 then
			table.insert(cloned, { id = "pending-user", isUser = true, text = var29 })
		end
		if var32 ~= nil then
			if var61.activeTurnMessageIndex == nil then
				table.insert(cloned, var32)
			else
				cloned[var61.activeTurnMessageIndex] = var32
			end
		end
		return {
			messages = cloned,
			includesPublishTool = var61.includesPublishTool,
			subagentTaskState = var31 or var61.subagentTaskState
		}
	end, {
		var27,
		var28,
		var29,
		var32,
		var31
	})
	local messages = var37.messages
	local subagentTaskState = var37.subagentTaskState
	reactModule.useEffect(function() --[[ line: 214 ]]
		-- upvalues: var29 (ref), var27 (ref), historyToChatMessagesModule (copy)
		if var29 == nil or var29 == "" then return end
		local var67
		local messages = historyToChatMessagesModule(var27.getMergedHistory(false), {
			sessionId = var27.getCasSessionId() or "",
			universeId = var27.universeId,
			placeId = var27.placeId
		}).messages
		
		if var29 == nil or var29 == "" then
			var67 = false
		else
			local var66
			for i = #messages, 1, -1 do
				var66 = messages[i]
				
				if not var66.isUser then
					continue
				end
				local _ = var66.text ~= var29
			end
			var67 = true
		end
		if not var67 then
			var27.setPendingUserMessage(nil)
		end
	end, { var27, var29, var28 })
	reactModule.useEffect(function() --[[ line: 229 ]]
		-- upvalues: var37 (ref), var27 (ref), placeId (ref), placeVersionHistoryModule (copy)
		if not var37.includesPublishTool then return end
		var27.markHasPublishedTurn()
		
		if placeId == nil then
			return
		end
		placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(placeId)
	end, { var37.includesPublishTool, var27, placeId })
	local var38, var39 = reactModule.useBinding("")
	local var40, var41 = reactModule.useState(nil)
	local var42 = reactModule.useRef("")
	local var43 = reactModule.useRef(nil)
	local var44 = reactUtilsModule.useClock()
	local var45 = useChatScrollModule()
	local var46 = reactModule.useCallback(function(p10) --[[ line: 245 ]]
		-- upvalues: placeId (ref), getPlaytestLoadingStoreModule (copy)
		if placeId == nil then
			return
		end
		getPlaytestLoadingStoreModule().setAgentStatusForPlaceId(placeId, p10)
	end, { placeId })
	local var47 = reactModule.useMemo(function() --[[ line: 252 ]]
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(false)
	end, {})
	local var48 = signalsReactModule.useSignalState(reactModule.useCallback(function(p11) --[[ line: 256 ]]
		-- upvalues: placeId (ref), var47 (ref), getPlaytestLoadingStoreModule (copy)
		return if placeId == nil then var47(p11) elseif placeId == nil then false else getPlaytestLoadingStoreModule(p11).getAgentStatusForPlaceId(placeId)(p11) == "Loading"
	end, { placeId, var47 }))
	local var49 = reactModule.useCallback(function(p12) --[[ line: 264 ]]
		-- upvalues: var45 (ref), var27 (ref)
		local var68 = function() --[[ line: 265 ]]
			-- upvalues: p12 (ref)
			return if p12 == nil then false else p12()
		end
		
		var45.captureDistanceFromBottom()
		task.spawn(function() --[[ line: 272 ]]
			-- upvalues: var27 (copy), var68 (ref), var45 (copy), p12 (ref)
			if var27.loadOlderHistory(var68) and var27.getNextHistoryPageToken() ~= nil and var45.isAtTopRef.current then
				task.delay(0.1, function() --[[ line: 275 ]]
					-- upvalues: p12 (copy), var45 (copy), var27 (copy), var68 (copy)
					if if p12 ~= nil then false else p12() then return end
					if var45.isViewportUnderfilled() then
						var27.loadOlderHistory(var68)
					end
				end)
			end
		end)
	end, { var27, var45 })
	local var50 = reactModule.useCallback(function(p13) --[[ line: 287 ]]
		-- upvalues: var27 (ref), var45 (ref), var49 (ref)
		task.delay(0.1, function() --[[ line: 288 ]]
			-- upvalues: p13 (ref), var27 (copy), var45 (copy), var49 (copy)
			if p13() then return end
			if var27.getNextHistoryPageToken() == nil then return end
			if var45.isViewportUnderfilled() then
				var49(p13)
				
				return
			end
		end)
	end, { var49, var45, var27 })
	local var51 = reactModule.useCallback(function(p14) --[[ line: 303 ]]
		-- upvalues: var27 (ref), var50 (ref)
		if var27.getNextHistoryPageToken() == nil then
			return
		end
		var50(p14)
	end, { var50, var27 })
	local var52 = reactModule.useRef(var51)
	var52.current = var51
	reactModule.useEffect(function() --[[ line: 312 ]]
		-- upvalues: var45 (ref), var49 (ref)
		var45.setOnScrolledToTop(function() --[[ line: 313 ]]
			-- upvalues: var49 (copy)
			var49(nil)
		end)
		
		return function() --[[ line: 316 ]]
			-- upvalues: var45 (copy)
			var45.setOnScrolledToTop(nil)
		end
	end, { var45.setOnScrolledToTop, var49 })
	reactModule.useEffect(function() --[[ line: 321 ]]
		-- upvalues: var25 (ref), sessionId (ref), var27 (ref), var52 (ref), universeId (ref), creatorAgentChatStore (ref)
		if var25 then
			local var69 = false
			local var70 = sessionId
			
			local function isHydrateCancelled() --[[ line: 328 ]]
				-- upvalues: var69 (write), var70 (write), var27 (copy)
				return if var69 then true elseif var70 == nil or var70 == "" then false else var27.getCasSessionId() ~= var70
			end
			
			local function _() --[[ line: 337 | named "continueAfterSessionReady" ]]
				-- upvalues: var69 (write), var70 (write), var27 (copy), var52 (copy), isHydrateCancelled (ref)
				local var73
				if var69 then
					var73 = true
				elseif var70 == nil or var70 == "" then
					var73 = false
				else
					var73 = var27.getCasSessionId() ~= var70
					var73 = nil
				end
				if var73 then
					return
				end
				var52.current(isHydrateCancelled)
			end
			
			local function hydrateKnownSession(p15) --[[ line: 344 ]]
				-- upvalues: var27 (copy), var69 (write), var70 (write), var52 (copy), isHydrateCancelled (ref)
				var27.setCasSessionId(p15)
				
				if var27.hasLoadedHistory() and #var27.getMergedHistory(false) > 0 then
					local var74
					if var69 then
						var74 = true
					elseif var70 == nil or var70 == "" then
						var74 = false
					else
						var74 = var27.getCasSessionId() ~= var70
						var74 = nil
					end
					if var74 then
						return
					end
					var52.current(isHydrateCancelled)
					
					return
				elseif var27.refreshSession(isHydrateCancelled) then
					local var75
					if var69 then
						var75 = true
					elseif var70 == nil or var70 == "" then
						var75 = false
					else
						var75 = var27.getCasSessionId() ~= var70
						var75 = nil
					end
					if not var75 then
						if var69 then
							var75 = true
						elseif var70 == nil or var70 == "" then
							var75 = false
						else
							var75 = var27.getCasSessionId() ~= var70
							var75 = nil
						end
						if var75 then return end
						var52.current(isHydrateCancelled)
					end
				end
			end
			
			task.spawn(function() --[[ line: 355 ]]
				-- upvalues: sessionId (copy), hydrateKnownSession (ref), var27 (copy), universeId (copy), creatorAgentChatStore (copy), var69 (write), var70 (write)
				if sessionId ~= nil and sessionId ~= "" then
					hydrateKnownSession(sessionId)
					
					return
				elseif universeId == nil or universeId == 0 or var27.hasLoadedHistory() and #var27.getMergedHistory(false) > 0 then return end
				local var76 = creatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = universeId })
				while var76.state(false).status == "pending" do
					local var77
					if var69 then
						var77 = true
					elseif var70 == nil or var70 == "" then
						var77 = false
					else
						var77 = var27.getCasSessionId() ~= var70
						var77 = nil
					end
					if var77 then break end
					task.wait()
				end
				local result
				if var69 then
					result = true
				elseif var70 == nil or var70 == "" then
					result = false
				else
					result = var27.getCasSessionId() ~= var70
					result = nil
				end
				if result or var76.state(false).status ~= "succeeded" then return end
				result = var76.state(false).result
				local var78 = if result ~= nil then nil else result.sessions
				local var79 = if typeof(var78) == "table" then var78[1] else nil
				local var80 = if typeof(var79) == "table" then var79.sessionId else nil
				
				if typeof(var80) == "string" and var80 ~= "" then
					var70 = var80
					hydrateKnownSession(var80)
					
					return
				end
				var27.markHistoryLoaded()
			end)
			
			return function() --[[ line: 390 ]]
				-- upvalues: var69 (write)
				var69 = true
			end
		end
	end, {
		var27,
		sessionId,
		universeId,
		creatorAgentChatStore,
		var25
	})
	reactModule.useEffect(function() --[[ line: 395 ]]
		-- upvalues: var27 (ref), sessionId (ref), var52 (ref), messageBusService (copy), gameMessageId (copy), appLifecycleObserverService (copy)
		local var81 = false
		
		local function refreshKnownSession() --[[ line: 397 ]]
			-- upvalues: var27 (copy), sessionId (copy), var81 (write), var52 (copy)
			local casSessionId = var27.getCasSessionId()
			
			if (casSessionId == nil or casSessionId == "") and (sessionId ~= nil and sessionId ~= "") then
				casSessionId = sessionId
			end
			if casSessionId == nil or casSessionId == "" then
				return
			end
			task.spawn(function() --[[ line: 405 ]]
				-- upvalues: var27 (copy), var81 (copy), var52 (copy)
				if var27.refreshSession(function() --[[ line: 406 ]]
					-- upvalues: var81 (copy)
					return var81
				end) and not var81 then
					var52.current(function() --[[ line: 409 ]]
						-- upvalues: var81 (copy)
						return var81
					end)
				end
			end)
		end
		
		local var83 = messageBusService:Subscribe(gameMessageId, function(_) --[[ line: 416 ]]
			-- upvalues: refreshKnownSession (ref)
			refreshKnownSession()
		end, false, true)
		local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function() --[[ line: 421 ]]
			-- upvalues: var81 (write), var83 (ref), onUnhideConnection (ref)
			var81 = true
			var83:Disconnect()
			onUnhideConnection:Disconnect()
		end
	end, { var27, sessionId })
	local var53 = reactModule.useCallback(function(p16) --[[ line: 428 ]]
		-- upvalues: var42 (ref), var39 (ref), var41 (ref)
		var42.current = p16
		var39(p16)
		var41(nil)
	end, { var39, var41 })
	local var54 = reactModule.useCallback(function(p17, p18, p19) --[[ line: 435 ]]
		-- upvalues: var35 (ref), var34 (ref), var36 (ref), var33 (ref), var27 (ref), var46 (ref), var53 (ref), var41 (ref), placeId (ref), placeVersionHistoryModule (copy), var45 (ref)
		if var35.current ~= p17 then return end
		var34.current = nil
		var36.current = nil
		var33(nil)
		var27.setPendingUserMessage(nil)
		
		if p18.promptFailureReason == "content_policy" then
			var46("Idle")
			
			if p19 ~= nil then
				var53(p19)
				var41("Your message violates Roblox safety policy. Edit it and try again.")
			end
			task.spawn(function() --[[ line: 450 ]]
				-- upvalues: var27 (copy), var35 (copy), p17 (ref)
				var27.refreshSession(function() --[[ line: 451 ]]
					-- upvalues: var35 (copy), p17 (copy)
					return var35.current ~= p17
				end)
			end)
			
			return
		else
			var46("Completed")
			
			if p18.includesPublishTool then
				var27.markHasPublishedTurn()
				local var86 = placeId
				
				if var86 ~= nil then
					placeVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(var86)
				end
			end
			var45.scrollToBottomAfterSend()
			local casSessionId = var27.getCasSessionId()
			
			if casSessionId ~= nil and casSessionId ~= "" then
				task.spawn(function() --[[ line: 467 ]]
					-- upvalues: var27 (copy), var35 (copy), p17 (ref)
					var27.refreshSession(function() --[[ line: 468 ]]
						-- upvalues: var35 (copy), p17 (copy)
						return var35.current ~= p17
					end)
				end)
			end
		end
	end, {
		var27, placeId, var46, var45, var53, var41
	})
	local var55 = reactModule.useRef(var25)
	reactModule.useEffect(function() --[[ line: 486 ]]
		-- upvalues: var25 (ref), var55 (ref), var48 (ref), var32 (ref), var45 (ref)
		local var88 = var25 and not var55.current
		var55.current = var25
		
		if not var25 then return end
		if var88 or var48 or var32 ~= nil then
			var45.scrollToBottomUnconditionally()
			task.defer(var45.scrollToBottomUnconditionally)
			task.delay(0.15, var45.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		var25,
		var48,
		var32,
		#messages,
		var45
	})
	reactModule.useEffect(function() --[[ line: 512 ]]
		-- upvalues: var34 (ref), var27 (ref), historyToChatMessagesModule (copy), var28 (ref), var35 (ref), var36 (ref), var46 (ref), creatorAgentChatModule_1 (copy), var54 (ref), var33 (ref), var45 (ref), var32 (ref), creatorAgentChatStore (ref), var48 (ref)
		if var34.current ~= nil then return end
		local universeId, var90
		local casSessionId = var27.getCasSessionId()
		
		if typeof(casSessionId) == "string" and casSessionId ~= "" then
			var90 = casSessionId
		else
			universeId = var27.universeId
			local placeId = var27.placeId
			var90 = if universeId == nil or placeId == nil then nil else `{universeId}:{placeId}`
		end
		if var90 == nil then return end
		local var91 = historyToChatMessagesModule(var28, {
			sessionId = var90,
			universeId = var27.universeId,
			placeId = var27.placeId
		})
		
		casSessionId = function(p20, p21) --[[ line: 528 | named "attachResumedTurn" ]]
			-- upvalues: var35 (copy), var36 (copy), var46 (copy), creatorAgentChatModule_1 (copy), var27 (copy), var54 (copy), var34 (copy), var33 (copy), var45 (copy)
			var35.current += 1
			local current = var35.current
			var36.current = p21
			var46("Loading")
			local var95 = creatorAgentChatModule_1.createResumedAssistantTurn(var27, p20, function(p22) --[[ line: 533 ]]
				-- upvalues: var54 (copy), current (ref)
				var54(current, p22, nil)
			end, { afterSequenceId = if p21 ~= nil then nil else p21 - 1 })
			var34.current = var95
			var33(var95.assistantMessage)
			var95.start()
			var45.scrollToBottomUnconditionally()
		end
		
		if var91.activeTurnState == nil or var91.activeTurnMessageIndex == nil or var91.activeTurnState.isDone then
			var36.current = nil
			universeId = creatorAgentChatStore.getActiveTurnHandle(var90)
			local var93 = if universeId ~= nil then nil else universeId.state(false)
			local var94 = universeId ~= nil and (var93 ~= nil and not var93.isDone)
			
			if not var48 and not var94 then return end
			if var94 then
				casSessionId(universeId, nil)
			end
			return
		else
			universeId = var91.activeTurnStartSequenceId
			
			if var36.current == universeId and var32 ~= nil then return end
			local var92 = creatorAgentChatStore.resumeTurnFromHistory(var90, var91.activeTurnState, var91.activeTurnSequenceIds)
			
			if var92 ~= nil then
				casSessionId(var92, universeId)
			end
		end
	end, {
		var28, var27, creatorAgentChatStore, var48, var32, var46, var54, var45
	})
	local var56 = reactModule.useCallback(function() --[[ line: 592 ]]
		-- upvalues: var42 (ref), var53 (ref), var48 (ref), var34 (ref), var43 (ref), var45 (ref), var35 (ref), var46 (ref), var27 (ref), creatorAgentChatModule_1 (copy), var54 (ref), var33 (ref)
		local replaced = string.gsub(var42.current, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var53("")
			
			return false
		elseif var48 then
			local current = var34.current
			
			if current == nil or not current.trySubmitComposerText(replaced) then
				return false
			end
			var53("")
			
			if var43.current then
				var43.current.releaseFocus()
			end
			var45.scrollToBottomAfterSend()
			
			return true
		else
			var45.captureStickToBottomForSend()
			var35.current += 1
			local current = var35.current
			var46("Loading")
			var27.setPendingUserMessage(replaced)
			local _ = nil
			local var97 = creatorAgentChatModule_1.createLiveAssistantTurn(var27, replaced, function(p23) --[[ line: 618 ]]
				-- upvalues: var54 (copy), current (ref), replaced (ref)
				var54(current, p23, replaced)
			end)
			var34.current = var97
			var33(var97.assistantMessage)
			var53("")
			
			if var43.current then
				var43.current.releaseFocus()
			end
			var45.scrollToBottomAfterSend()
			var97.start()
			
			return true
		end
	end, {
		var27, var48, var46, var45, var53, var54
	})
	local var57 = reactModule.useCallback(function() --[[ line: 642 ]]
		-- upvalues: var35 (ref), var34 (ref), var36 (ref), var33 (ref), var27 (ref), var46 (ref)
		var35.current += 1
		local current = var34.current
		
		if current ~= nil then
			current.stop()
		end
		var34.current = nil
		var36.current = nil
		var33(nil)
		var27.setPendingUserMessage(nil)
		var46("Idle")
	end, { var27, var46 })
	local var58 = p9.autoFocusComposer == nil or p9.autoFocusComposer
	local var59 = if p9.focusComposerWhen == nil then var58 else p9.focusComposerWhen
	reactModule.useEffect(function() --[[ line: 657 ]]
		-- upvalues: var58 (ref), var59 (ref), var43 (ref)
		if var58 and var59 then
			local var98 = false
			
			local var99 = function() --[[ line: 662 ]]
				-- upvalues: var98 (write)
				return var98
			end
			
			local var100 = 8
			
			local function tryFocus() --[[ line: 103 ]]
				-- upvalues: var99 (ref), var43 (ref), var100 (write), tryFocus (ref)
				if var99() then return end
				local current = var43.current
				
				if current then
					current.focus()
					
					return
				end
				var20 -= 1
				
				if var20 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function() --[[ line: 665 ]]
				-- upvalues: var98 (write)
				var98 = true
			end
		end
		return function() --[[ line: 659 ]] end
	end, { var58, var59 })
	local placeId_1 = p9.placeId or getCurrentExperienceProjectModule().placeId
	
	return {
		messages = messages,
		composerText = var38,
		composerErrorText = var40,
		setComposerText = var53,
		isAssistantResponding = var48,
		sendMessage = var56,
		stopAssistantResponse = var57,
		setScrollingFrame = var45.setScrollingFrame,
		textBoxRef = var43,
		clockBinding = var44,
		playtestPlaceId = placeId_1,
		launchPlaytest = if placeId_1 ~= nil then nil else reactModule.useCallback(function(p24) --[[ line: 670 ]]
			-- upvalues: p9 (ref), getCurrentExperienceProjectModule (copy), launchPlaytestWithLoadingStateModule (copy)
			local placeId = p9.placeId or getCurrentExperienceProjectModule().placeId
			
			if placeId == nil then
				return
			end
			launchPlaytestWithLoadingStateModule(placeId, p24, true)
		end, { p9.placeId }),
		hasPublishedTurn = var30,
		subagentTaskState = subagentTaskState
	}
end