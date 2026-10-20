local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local MessageBusService = game:GetService("MessageBusService")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseCreateModule = require(Parent.DataHydration.UniverseCreate)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.chatTypes)
local CreatorAgentChatModule1 = require(script.Parent.creatorAgentChat)
local ParseSessionStreamModule = require(script.Parent.parseSessionStream)
local UseChatScrollModule = require(script.Parent.useChatScroll)
local GetPlaytestLoadingStoreModule = require(BuildExperience.Stores.GetPlaytestLoadingStore)
local _ = require(BuildExperience.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local GetDefaultTemplatePlaceIdModule = require(BuildExperience.utils.getDefaultTemplatePlaceId)
local LaunchPlaytestWithLoadingStateModule = require(BuildExperience.utils.launchPlaytestWithLoadingState)
local Debug = CreatorAgentChatModule.debug
local GameMessageId = MessageBusService:GetMessageId("Game", "onGameLeave")
local Signal = SignalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
})
local Signal1 = SignalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
})
local Signal2 = SignalsModule.createSignal(nil)
local Signal3 = SignalsModule.createSignal({})

local function _(p1, p2): boolean
	-- upvalues: GetPlaytestLoadingStoreModule (copy)
	local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule(p1)
	
	return p2 ~= nil and PlaytestLoadingStoreModule.getAgentStatusForPlaceId(p2)(p1) == "Loading"
end

local _ = function(Text: string): string
	return string.gsub(Text, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1)
	-- upvalues: PlaceVersionHistoryModule (copy)
	if p1 ~= nil then
		PlaceVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(p1)
		
		return
	end
end

local _ = function(p1, p2)
	local v1 = 8
	
	local function tryFocus()
		-- upvalues: p2 (copy), p1 (copy), v1 (ref), tryFocus (copy)
		if p2() then return end
		local Current = p1.current
		
		if Current then
			Current.focus()
			
			return
		end
		v1 -= 1
		
		if v1 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(p1)
	local CasSessionId = p1.getCasSessionId()
	
	if typeof(CasSessionId) == "string" and CasSessionId ~= "" then
		return CasSessionId
	else
		local UniverseId = p1.universeId
		local PlaceId = p1.placeId
		
		return if UniverseId == nil or PlaceId == nil then nil else `{UniverseId}:{PlaceId}`
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), CreatorAgentChatModule (copy), Signal3 (copy), SignalsReactModule (copy), Signal (copy), Signal1 (copy), Signal2 (copy), ParseSessionStreamModule (copy), PlaceVersionHistoryModule (copy), ReactUtilsModule (copy), UseChatScrollModule (copy), GetPlaytestLoadingStoreModule (copy), MessageBusService (copy), GameMessageId (copy), AppLifecycleObserverService (copy), CreatorAgentChatModule1 (copy), UniverseCreateModule (copy), GetDefaultTemplatePlaceIdModule (copy), Debug (copy), UniverseConfigurationModule (copy), LaunchPlaytestWithLoadingStateModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local PlaceId = p1.placeId
	local UniverseId = p1.universeId
	local SessionId = p1.sessionId
	
	if UseStateResult ~= nil then
		PlaceId = UseStateResult.placeId
		UniverseId = UseStateResult.universeId
		SessionId = UseStateResult.sessionId
	end
	local NoHydrateHistoryWhen = p1.hydrateHistoryWhen == nil or p1.hydrateHistoryWhen
	local CreatorAgentChatStore = CreatorAgentChatModule.getCreatorAgentChatStore()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UniverseId (ref), CreatorAgentChatStore (copy), PlaceId (ref), SessionId (ref)
		return if UniverseId == nil then nil else CreatorAgentChatStore.getSessionForProject(UniverseId, PlaceId, SessionId)
	end, { UniverseId, PlaceId, SessionId, CreatorAgentChatStore })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref)
		if UseMemoResult ~= nil and SessionId ~= nil and SessionId ~= "" then
			UseMemoResult.setCasSessionId(SessionId)
			
			return
		end
	end, { UseMemoResult, SessionId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal3 else UseMemoResult.getMergedHistory)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(nil)
	end, { UseMemoResult })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2_3 (copy)
		UseRefResult.current = Current
		UseStateResult2_3(Current)
	end, { UseStateResult2_3 })
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseStateResult4 == nil then Signal else UseStateResult4.getOptimisticLocalTools)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(if UseStateResult4 == nil then Signal1 else UseStateResult4.getLocalToolActions)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(if UseStateResult4 == nil then Signal2 else UseStateResult4.getSetupErrorText)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult4 (copy), UseSignalStateResult3 (copy)
		return if UseStateResult4 == nil then nil else { setupErrorText = UseSignalStateResult3 }
	end, { UseStateResult4, UseSignalStateResult3 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ParseSessionStreamModule (upval), UseSignalStateResult (copy), UseMemoResult (copy), SessionId (ref), UniverseId (ref), PlaceId (ref), UseSignalStateResult1 (copy), UseStateResult1 (copy), UseMemoResult1 (copy), UseStateResult3 (copy)
		return ParseSessionStreamModule(UseSignalStateResult, {
			sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
			universeId = if UseMemoResult == nil then UniverseId else UseMemoResult.universeId,
			placeId = if UseMemoResult == nil then PlaceId else UseMemoResult.placeId,
			optimisticLocalTools = UseSignalStateResult1,
			pendingUserMessage = if UseStateResult1 == nil then nil else UseStateResult1.text,
			pendingUserMessageAfterSequenceId = if UseStateResult1 == nil then nil else UseStateResult1.afterSequenceId,
			liveAssistantMessage = UseMemoResult1,
			optimisticCancelledStartSequenceId = if UseStateResult3 == nil then nil else UseStateResult3.startSequenceId
		})
	end, {
		UseSignalStateResult, UseMemoResult, SessionId, UniverseId, PlaceId,
		UseSignalStateResult1, UseStateResult1, UseMemoResult1, UseStateResult3
	})
	local Messages = UseMemoResult2.messages
	local SubagentTaskState = UseMemoResult2.subagentTaskState
	local IncludesPublishTool = UseMemoResult2.includesPublishTool
	local ActiveTurnState = UseMemoResult2.activeTurnState
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), ActiveTurnState (copy)
		if UseStateResult4 ~= nil and ActiveTurnState ~= nil then
			UseStateResult4.syncFromTurnState(ActiveTurnState)
			
			return
		end
	end, { UseStateResult4, ActiveTurnState })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2 (copy), PlaceId (ref), PlaceVersionHistoryModule (upval)
		if not UseMemoResult2.includesPublishTool then return end
		local PlaceId1 = PlaceId
		
		if PlaceId1 ~= nil then
			PlaceVersionHistoryModule.getPlaceVersionHistoryStore().fetchHistory(PlaceId1)
			
			return
		end
	end, { UseMemoResult2.includesPublishTool, PlaceId })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseRefResult3 = ReactModule.useRef("")
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseClockResult = ReactUtilsModule.useClock()
	local UseChatScrollModuleResult = UseChatScrollModule()
	local UseSignalStateResult4 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2): boolean
		-- upvalues: PlaceId (ref), GetPlaytestLoadingStoreModule (upval)
		local PlaceId1 = PlaceId
		local PlaytestLoadingStoreModule = GetPlaytestLoadingStoreModule(p2)
		
		return PlaceId1 ~= nil and PlaytestLoadingStoreModule.getAgentStatusForPlaceId(PlaceId1)(p2) == "Loading"
	end, { PlaceId })))
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GetPlaytestLoadingStoreModule (upval)
		GetPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p2, p3)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseChatScrollModuleResult (copy), UseMemoResult (copy)
		local function v93()
			-- upvalues: Callback (copy)
			return Callback ~= nil and Callback()
		end
		
		UseChatScrollModuleResult.captureDistanceFromBottom()
		task.spawn(function()
			-- upvalues: UseMemoResult (upval), v93 (copy), UseChatScrollModuleResult (upval), Callback (copy)
			if UseMemoResult == nil then return end
			if UseMemoResult.loadOlderHistory(v93) and UseMemoResult.getNextHistoryPageToken() ~= nil and UseChatScrollModuleResult.isAtTopRef.current then
				task.delay(0.1, function()
					-- upvalues: Callback (upval), UseChatScrollModuleResult (upval), UseMemoResult (upval), v93 (upval)
					if Callback ~= nil and Callback() then return end
					if UseChatScrollModuleResult.isViewportUnderfilled() then
						UseMemoResult.loadOlderHistory(v93)
					end
				end)
			end
		end)
	end, { UseMemoResult, UseChatScrollModuleResult })
	local UseResult3 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseMemoResult (copy), UseChatScrollModuleResult (copy), UseResult2 (copy)
		task.delay(0.1, function()
			-- upvalues: Callback (copy), UseMemoResult (upval), UseChatScrollModuleResult (upval), UseResult2 (upval)
			if Callback() then return end
			if UseMemoResult == nil then return end
			if UseMemoResult.getNextHistoryPageToken() == nil then return end
			if UseChatScrollModuleResult.isViewportUnderfilled() then
				UseResult2(Callback)
				
				return
			end
		end)
	end, { UseResult2, UseChatScrollModuleResult, UseMemoResult })
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy), UseResult3 (copy)
		if UseMemoResult == nil then return end
		if UseMemoResult.getNextHistoryPageToken() ~= nil then
			UseResult3(p2)
			
			return
		end
	end, { UseResult3, UseMemoResult })
	local UseRefResult5 = ReactModule.useRef(UseResult4)
	UseRefResult5.current = UseResult4
	ReactModule.useEffect(function()
		-- upvalues: UseChatScrollModuleResult (copy), UseResult2 (copy)
		UseChatScrollModuleResult.setOnScrolledToTop(function()
			-- upvalues: UseResult2 (upval)
			UseResult2(nil)
		end)
		
		return function()
			-- upvalues: UseChatScrollModuleResult (upval)
			UseChatScrollModuleResult.setOnScrolledToTop(nil)
		end
	end, { UseChatScrollModuleResult.setOnScrolledToTop, UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseMemoResult (copy), SessionId (ref), UseRefResult5 (copy), UniverseId (ref), CreatorAgentChatStore (copy)
		if not NoHydrateHistoryWhen or UseMemoResult == nil then return end
		local Flag = false
		local CasSessionId = SessionId
		
		local function isHydrateCancelled(): boolean
			-- upvalues: Flag (ref), CasSessionId (ref), UseMemoResult (upval)
			return if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId
		end
		
		local function _()
			-- upvalues: Flag (ref), CasSessionId (ref), UseMemoResult (upval), UseRefResult5 (upval), isHydrateCancelled (copy)
			if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
				UseRefResult5.current(isHydrateCancelled)
				
				return
			end
		end
		
		local function hydrateKnownSession(SessionId)
			-- upvalues: UseMemoResult (upval), Flag (ref), CasSessionId (ref), UseRefResult5 (upval), isHydrateCancelled (copy)
			UseMemoResult.setCasSessionId(SessionId)
			
			if UseMemoResult.hasLoadedHistory() and #UseMemoResult.getMergedHistory(false) > 0 then
				if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
					UseRefResult5.current(isHydrateCancelled)
					
					return
				end
				return
			elseif UseMemoResult.refreshSession(isHydrateCancelled) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
				if if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId then return end
				UseRefResult5.current(isHydrateCancelled)
			end
		end
		
		task.spawn(function()
			-- upvalues: SessionId (upval), hydrateKnownSession (copy), UniverseId (upval), UseMemoResult (upval), CreatorAgentChatStore (upval), Flag (ref), CasSessionId (ref)
			if SessionId ~= nil and SessionId ~= "" then
				hydrateKnownSession(SessionId)
				
				return
			end
			if UniverseId == nil or UniverseId == 0 or UseMemoResult.hasLoadedHistory() and #UseMemoResult.getMergedHistory(false) > 0 then return end
			local SessionFindByUniverseResult = CreatorAgentChatStore.sessionFindByUniverse({ sort = "desc", universeId = UniverseId })
			while SessionFindByUniverseResult.state(false).status == "pending" and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) do
				task.wait()
			end
			if (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) or SessionFindByUniverseResult.state(false).status ~= "succeeded" then return end
			local Result = SessionFindByUniverseResult.state(false).result
			local Sessions = if Result == nil then nil else Result.sessions
			local Session = if typeof(Sessions) == "table" then Sessions[1] else nil
			local SessionId1 = if typeof(Session) == "table" then Session.sessionId else nil
			
			if typeof(SessionId1) == "string" and SessionId1 ~= "" then
				CasSessionId = SessionId1
				hydrateKnownSession(SessionId1)
				
				return
			else
				UseMemoResult.markHistoryLoaded()
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseMemoResult,
		SessionId,
		UniverseId,
		CreatorAgentChatStore,
		NoHydrateHistoryWhen
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref), UseRefResult5 (copy), MessageBusService (upval), GameMessageId (upval), AppLifecycleObserverService (upval)
		if UseMemoResult == nil then return end
		local Flag = false
		
		local function refreshKnownSession()
			-- upvalues: UseMemoResult (upval), SessionId (upval), Flag (ref), UseRefResult5 (upval)
			local CasSessionId = UseMemoResult.getCasSessionId()
			
			if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
				CasSessionId = SessionId
			end
			if CasSessionId ~= nil and CasSessionId ~= "" then
				task.spawn(function()
					-- upvalues: UseMemoResult (upval), Flag (upval), UseRefResult5 (upval)
					if UseMemoResult.refreshSession(function()
						-- upvalues: Flag (upval)
						return Flag
					end) and not Flag then
						UseRefResult5.current(function()
							-- upvalues: Flag (upval)
							return Flag
						end)
					end
				end)
				
				return
			end
		end
		
		local SubscribeResult = MessageBusService:Subscribe(GameMessageId, function(_)
			-- upvalues: refreshKnownSession (copy)
			refreshKnownSession()
		end, false, true)
		local OnUnhideConnection = AppLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: Flag (ref), SubscribeResult (copy), OnUnhideConnection (copy)
			Flag = true
			SubscribeResult:Disconnect()
			OnUnhideConnection:Disconnect()
		end
	end, { UseMemoResult, SessionId })
	local UseResult5 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy), UseBindingResult2 (copy), UseStateResult2_4 (copy)
		UseRefResult3.current = Current
		UseBindingResult2(Current)
		UseStateResult2_4(nil)
	end, { UseBindingResult2, UseStateResult2_4 })
	local UseResult6 = ReactModule.useCallback(function(Current, p2, p3, p4)
		-- upvalues: UseRefResult1 (copy), UseResult (copy), UseRefResult2 (copy), UseStateResult2_1 (copy), UseResult1 (copy), UseResult5 (copy), UseStateResult2_4 (copy), CreatorAgentChatModule1 (upval), UseChatScrollModuleResult (copy), p1 (copy), SessionId (ref), UseStateResult2 (copy)
		if UseRefResult1.current ~= Current then return end
		UseResult(nil)
		UseRefResult2.current = nil
		UseStateResult2_1(nil)
		
		if p2 == nil then
			if p4.placeId ~= nil then
				UseResult1(p4.placeId, "Completed")
			end
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			local CasSessionId = p4.getCasSessionId()
			
			if CasSessionId ~= nil and CasSessionId ~= "" then
				if p1.createUniverseOnFirstPrompt and SessionId == nil and p4.universeId ~= nil then
					local config = {
						universeId = p4.universeId,
						placeId = p4.placeId,
						sessionId = CasSessionId
					}
					UseStateResult2(config)
					
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(config)
					end
				end
				task.spawn(function()
					-- upvalues: p4 (copy), UseRefResult1 (upval), Current (copy)
					p4.refreshSession(function(): boolean
						-- upvalues: UseRefResult1 (upval), Current (upval)
						return UseRefResult1.current ~= Current
					end)
				end)
			end
			return
		else
			if p4.placeId ~= nil then
				UseResult1(p4.placeId, "Idle")
			end
			if p3 ~= nil then
				UseResult5(p3)
				UseStateResult2_4(CreatorAgentChatModule1.getPromptFailureComposerError(p2))
			end
			task.spawn(function()
				-- upvalues: p4 (copy), UseRefResult1 (upval), Current (copy)
				p4.refreshSession(function(): boolean
					-- upvalues: UseRefResult1 (upval), Current (upval)
					return UseRefResult1.current ~= Current
				end)
			end)
		end
	end, {
		p1.createUniverseOnFirstPrompt, p1.onProjectResolved, SessionId, UseResult1,
		UseStateResult2, UseChatScrollModuleResult, UseResult5, UseStateResult2_4,
		UseResult, UseStateResult2_1
	})
	local UseRefResult6 = ReactModule.useRef(NoHydrateHistoryWhen)
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseRefResult6 (copy), UseSignalStateResult4 (copy), UseStateResult4 (copy), UseChatScrollModuleResult (copy)
		local NoCurrent: boolean = NoHydrateHistoryWhen and not UseRefResult6.current
		UseRefResult6.current = NoHydrateHistoryWhen
		
		if not NoHydrateHistoryWhen then return end
		if NoCurrent or UseSignalStateResult4 or UseStateResult4 ~= nil then
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
			task.defer(UseChatScrollModuleResult.scrollToBottomUnconditionally)
			task.delay(0.15, UseChatScrollModuleResult.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		NoHydrateHistoryWhen,
		UseSignalStateResult4,
		UseStateResult4,
		#Messages,
		UseChatScrollModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult3 (copy), UseMemoResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), PlaceId (ref), UseResult1 (copy), CreatorAgentChatModule1 (upval), UseResult6 (copy), UseResult (copy), UseChatScrollModuleResult (copy), UseMemoResult2 (copy), UseStateResult4 (copy), CreatorAgentChatStore (copy), UseSignalStateResult4 (copy)
		if UseRefResult.current ~= nil then return end
		if UseStateResult3 ~= nil then return end
		if UseMemoResult == nil then return end
		local CasSessionId = UseMemoResult.getCasSessionId()
		local Text = nil
		
		if typeof(CasSessionId) == "string" and CasSessionId ~= "" then
			Text = CasSessionId
		else
			local UniverseId = UseMemoResult.universeId
			local PlaceId1 = UseMemoResult.placeId
			Text = if UniverseId == nil or PlaceId1 == nil then nil else `{UniverseId}:{PlaceId1}`
		end
		if Text == nil then return end
		local function attachResumedTurn(ActiveTurnHandle, Current: number)
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), PlaceId (upval), UseResult1 (upval), CreatorAgentChatModule1 (upval), UseMemoResult (upval), UseResult6 (upval), UseResult (upval), UseChatScrollModuleResult (upval)
			UseRefResult1.current += 1
			local Current1 = UseRefResult1.current
			UseRefResult2.current = Current
			
			if PlaceId ~= nil then
				UseResult1(PlaceId, "Loading")
			end
			local ResumedAssistantTurn = CreatorAgentChatModule1.createResumedAssistantTurn(UseMemoResult, ActiveTurnHandle, function(p2)
				-- upvalues: UseResult6 (upval), Current1 (copy), UseMemoResult (upval)
				UseResult6(Current1, p2, nil, UseMemoResult)
			end, if Current == nil then nil else Current - 1)
			UseResult(ResumedAssistantTurn)
			ResumedAssistantTurn.start()
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
		end
		
		if UseMemoResult2.activeTurnState == nil or UseMemoResult2.activeTurnItemIndex == nil or UseMemoResult2.activeTurnState.isDone then
			UseRefResult2.current = nil
			local ActiveTurnHandle = CreatorAgentChatStore.getActiveTurnHandle(Text)
			local StateResult = if ActiveTurnHandle == nil then nil else ActiveTurnHandle.state(false)
			local NoIsDone: boolean = ActiveTurnHandle ~= nil and (StateResult ~= nil and not StateResult.isDone)
			
			if not UseSignalStateResult4 and not NoIsDone then return end
			if NoIsDone then
				attachResumedTurn(ActiveTurnHandle, nil)
			end
			return
		else
			local ActiveTurnStartSequenceId = UseMemoResult2.activeTurnStartSequenceId
			
			if UseRefResult2.current == ActiveTurnStartSequenceId and UseStateResult4 ~= nil then return end
			local ResumeTurnFromHistoryResult = CreatorAgentChatStore.resumeTurnFromHistory(Text, UseMemoResult2.activeTurnState, UseMemoResult2.activeTurnSequenceIds)
			
			if ResumeTurnFromHistoryResult ~= nil then
				attachResumedTurn(ResumeTurnFromHistoryResult, ActiveTurnStartSequenceId)
			end
		end
	end, {
		UseMemoResult2, UseMemoResult, CreatorAgentChatStore, UseSignalStateResult4,
		UseStateResult4, PlaceId, UseResult1, UseResult6, UseChatScrollModuleResult,
		UseResult, UseStateResult3
	})
	local UseResult7 = ReactModule.useCallback(function(p2, Text, p3, AfterSequenceId)
		-- upvalues: UseStateResult2_1 (copy), CreatorAgentChatModule1 (upval), UseResult6 (copy), UseResult1 (copy), UseResult (copy), UseChatScrollModuleResult (copy)
		UseStateResult2_1({ text = Text, afterSequenceId = AfterSequenceId })
		local LiveAssistantTurn = CreatorAgentChatModule1.createLiveAssistantTurn(p2, Text, function(p4)
			-- upvalues: UseResult6 (upval), p3 (copy), Text (copy), p2 (copy)
			UseResult6(p3, p4, Text, p2)
		end)
		
		if p2.placeId ~= nil then
			UseResult1(p2.placeId, "Loading")
		end
		UseResult(LiveAssistantTurn)
		UseChatScrollModuleResult.scrollToBottomAfterSend()
		LiveAssistantTurn.start()
	end, {
		UseResult6,
		UseResult1,
		UseChatScrollModuleResult,
		UseResult,
		UseStateResult2_1
	})
	local UseResult8 = ReactModule.useCallback(function(Text, Current, AfterSequenceId)
		-- upvalues: UseStateResult2_1 (copy), UniverseCreateModule (upval), GetDefaultTemplatePlaceIdModule (upval), Debug (upval), UseRefResult1 (copy), UniverseConfigurationModule (upval), UseStateResult2 (copy), p1 (copy), CreatorAgentChatStore (copy), SessionId (ref), UseResult7 (copy), UseResult (copy), UseResult5 (copy), UseStateResult2_4 (copy)
		UseStateResult2_1({ text = Text, afterSequenceId = AfterSequenceId })
		local ClockTime = os.clock()
		UniverseCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = GetDefaultTemplatePlaceIdModule()
		}):andThen(function(Result)
			-- upvalues: Debug (upval), ClockTime (copy), UseRefResult1 (upval), Current (copy), UniverseConfigurationModule (upval), UseStateResult2 (upval), p1 (upval), CreatorAgentChatStore (upval), SessionId (upval), UseResult7 (upval), Text (copy), AfterSequenceId (copy)
			Debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				universeId = Result.universeId,
				rootPlaceId = Result.rootPlaceId
			})
			
			if UseRefResult1.current == Current then
				local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
				
				return UniverseConfigurationStore.patchConfiguration(Result.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: UniverseConfigurationStore (copy), Result (copy)
					return UniverseConfigurationStore.setTeamCreate(Result.universeId, true)
				end):andThen(function()
					-- upvalues: UseRefResult1 (upval), Current (upval), Result (copy), UseStateResult2 (upval), p1 (upval), CreatorAgentChatStore (upval), SessionId (upval), UseResult7 (upval), Text (upval), AfterSequenceId (upval)
					if UseRefResult1.current ~= Current then
						return nil
					end
					local config = {
						universeId = Result.universeId,
						placeId = Result.rootPlaceId
					}
					UseStateResult2(config)
					
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(config)
					end
					UseResult7(CreatorAgentChatStore.getSessionForProject(Result.universeId, Result.rootPlaceId, SessionId), Text, Current, AfterSequenceId)
					
					return nil
				end)
			else
				return nil
			end
		end):catch(function(Err)
			-- upvalues: Debug (upval), ClockTime (copy), UseRefResult1 (upval), Current (copy), UseResult (upval), UseStateResult2_1 (upval), UseResult5 (upval), Text (copy), UseStateResult2_4 (upval)
			Debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				error = Err
			})
			
			if UseRefResult1.current == Current then
				UseResult(nil)
				UseStateResult2_1(nil)
				UseResult5(Text)
				UseStateResult2_4("The assistant couldn't create an experience. Please try again.")
				
				return
			end
		end)
	end, {
		SessionId, CreatorAgentChatStore, p1.onProjectResolved, UseResult, UseResult5,
		UseStateResult2_4, UseStateResult2, UseStateResult2_1, UseResult7
	})
	local UseResult9 = ReactModule.useCallback(function(): boolean
		-- upvalues: UseRefResult3 (copy), UseResult5 (copy), UseSignalStateResult4 (copy), UseRefResult (copy), UseRefResult4 (copy), UseChatScrollModuleResult (copy), p1 (copy), UniverseId (ref), UseMemoResult (copy), UseRefResult1 (copy), UseStateResult2_2 (copy), UseResult8 (copy), UseMemoResult2 (copy), UseResult7 (copy)
		local Replaced = string.gsub(UseRefResult3.current, "^%s*(.-)%s*$", "%1")
		
		if Replaced == "" then
			UseResult5("")
			
			return false
		end
		if UseSignalStateResult4 then
			local Current = UseRefResult.current
			
			if Current == nil or not Current.trySubmitComposerText(Replaced) then
				return false
			end
			UseResult5("")
			
			if UseRefResult4.current then
				UseRefResult4.current.releaseFocus()
			end
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			
			return true
		else
			local NoUniverseId: boolean = p1.createUniverseOnFirstPrompt == true and UniverseId == nil
			
			if not NoUniverseId and UseMemoResult == nil then
				return false
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult1.current += 1
			local Current = UseRefResult1.current
			UseStateResult2_2(nil)
			UseResult5("")
			
			if UseRefResult4.current then
				UseRefResult4.current.releaseFocus()
			end
			if NoUniverseId then
				UseResult8(Replaced, Current, UseMemoResult2.latestSequenceId)
			else
				UseResult7(UseMemoResult, Replaced, Current, UseMemoResult2.latestSequenceId)
			end
			return true
		end
	end, {
		UseMemoResult, UniverseId, UseSignalStateResult4, UseChatScrollModuleResult,
		UseResult5, UseResult8, UseResult7, p1.createUniverseOnFirstPrompt,
		UseStateResult2_2, UseMemoResult2
	})
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseResult (copy), UseRefResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseMemoResult2 (copy), PlaceId (ref), UseResult1 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		UseRefResult1.current += 1
		Current.stop()
		UseResult(nil)
		UseRefResult2.current = nil
		UseStateResult2_1(nil)
		UseStateResult2_2({
			startSequenceId = UseMemoResult2.activeTurnStartSequenceId
		})
		
		if PlaceId ~= nil then
			UseResult1(PlaceId, "Idle")
		end
	end, {
		PlaceId, UseResult1, UseResult, UseStateResult2_1, UseStateResult2_2,
		UseMemoResult2
	})
	local NoAutoFocusComposer = p1.autoFocusComposer == nil or p1.autoFocusComposer
	local NoAutoFocusComposer1 = if p1.focusComposerWhen == nil then NoAutoFocusComposer else p1.focusComposerWhen
	ReactModule.useEffect(function()
		-- upvalues: NoAutoFocusComposer (copy), NoAutoFocusComposer1 (copy), UseRefResult4 (copy)
		if NoAutoFocusComposer and NoAutoFocusComposer1 then
			local Flag = false
			
			local function v134()
				-- upvalues: Flag (ref)
				return Flag
			end
			
			local v1 = 8
			
			local function tryFocus()
				-- upvalues: v134 (copy), UseRefResult4 (copy), v1 (ref), tryFocus (copy)
				if v134() then return end
				local Current = UseRefResult4.current
				
				if Current then
					Current.focus()
					
					return
				end
				v1 -= 1
				
				if v1 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		else
			return function() end
		end
	end, { NoAutoFocusComposer, NoAutoFocusComposer1 })
	local UseResult11 = ReactModule.useCallback(function(p2)
		-- upvalues: PlaceId (ref), LaunchPlaytestWithLoadingStateModule (upval)
		if PlaceId ~= nil then
			LaunchPlaytestWithLoadingStateModule(PlaceId, p2, true)
			
			return
		end
	end, { PlaceId })
	
	return {
		messages = Messages,
		localToolActions = UseSignalStateResult2,
		composerText = UseBindingResult,
		composerErrorText = UseStateResult5,
		setComposerText = UseResult5,
		isAssistantResponding = UseSignalStateResult4,
		canStopAssistantResponse = UseStateResult4 ~= nil,
		sendMessage = UseResult9,
		stopAssistantResponse = UseResult10,
		setScrollingFrame = UseChatScrollModuleResult.setScrollingFrame,
		textBoxRef = UseRefResult4,
		clockBinding = UseClockResult,
		playtestPlaceId = PlaceId,
		launchPlaytest = if PlaceId == nil then nil else UseResult11,
		hasPublishedTurn = IncludesPublishTool,
		subagentTaskState = SubagentTaskState
	}
end