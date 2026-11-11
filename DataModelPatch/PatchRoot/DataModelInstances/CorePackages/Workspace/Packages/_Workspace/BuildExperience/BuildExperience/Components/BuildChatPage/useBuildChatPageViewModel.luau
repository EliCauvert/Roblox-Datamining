local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local _ = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)
local UseChatPlaytestFooterModule = require(BuildExperience.Chat.useChatPlaytestFooter)
local UseChatSessionCoreModule = require(BuildExperience.Chat.useChatSessionCore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local GetBuildOverflowMenuStoreModule = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local _ = require(script.Parent.BuildChatPageView)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function _(): number
	-- upvalues: UserInputService (copy), GuiService (copy)
	return if UserInputService.OnScreenKeyboardVisible then math.max(0, UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(UniverseId)
	-- upvalues: UniverseConfigurationModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UniverseId (copy), UniverseConfigurationStore (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UniverseId (upval), UniverseConfigurationStore (upval)
			return if UniverseId == nil or UniverseId == 0 then nil else UniverseConfigurationStore.getAndFetchSummary(UniverseId).data(p1)
		end)
	end, { UniverseConfigurationStore, UniverseId })))
end

local _ = function(p1, p2)
	local Name = if p2 == nil then nil else p2.name
	
	return if typeof(Name) == "string" and Name ~= "" then Name else p1
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), useUniverseSummary (copy), GetBuildOverflowMenuStoreModule (copy), GetCreatorAgentResumeStoreModule (copy), ReactModule (copy), UserInputService (copy), GuiService (copy), UseChatSessionCoreModule (copy), UseChatPlaytestFooterModule (copy), UniverseConfigurationModule (copy), SendBuildExperienceEventModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseUniverseSummaryResult = useUniverseSummary(p1.target.universeId)
	local BuildOverflowMenuStoreModule = GetBuildOverflowMenuStoreModule()
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if UserInputService.OnScreenKeyboardVisible then math.max(0, UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y) else 0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UserInputService (upval), GuiService (upval)
		UseStateResult2_1(if UserInputService.OnScreenKeyboardVisible then math.max(0, UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y) else 0)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UserInputService (upval)
		UseResult()
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(UseResult)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(UseResult)
		local Connection2 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(UseResult)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { UseResult })
	local UseResult1 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y)
	end, {})
	local Largest: number = if UseStateResult1 <= 0 or UseStateResult3 <= 0 then 0 else math.max(0, UseStateResult3 - UseStateResult1)
	local IsIsNewGameTarget = p1.target.isNewGameTarget == true
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseUniverseSummaryResult (copy)
		local ExperienceName = p1.target.experienceName
		local Name = if UseUniverseSummaryResult == nil then nil else UseUniverseSummaryResult.name
		
		return {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			experienceName = if typeof(Name) == "string" and Name ~= "" then Name else ExperienceName,
			isNewGameTarget = p1.target.isNewGameTarget,
			creatorName = p1.target.creatorName,
			gameIcon = p1.target.gameIcon
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.experienceName, p1.target.isNewGameTarget, p1.target.creatorName,
		p1.target.gameIcon, UseUniverseSummaryResult
	})
	local UseChatSessionCoreModuleResult = UseChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = p1.target.universeId,
		placeId = p1.target.placeId,
		sessionId = p1.target.sessionId,
		createUniverseOnFirstPrompt = IsIsNewGameTarget,
		onProjectResolved = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), UseMemoResult (copy)
			if p1.onNavigateToResolvedTarget ~= nil then
				p1.onNavigateToResolvedTarget({
					universeId = p2.universeId,
					placeId = p2.placeId,
					sessionId = p2.sessionId,
					experienceName = UseMemoResult.experienceName,
					isNewGameTarget = UseMemoResult.isNewGameTarget,
					creatorName = UseMemoResult.creatorName,
					gameIcon = UseMemoResult.gameIcon
				})
			end
		end, {
			p1.onNavigateToResolvedTarget,
			UseMemoResult.experienceName,
			UseMemoResult.isNewGameTarget,
			UseMemoResult.creatorName,
			UseMemoResult.gameIcon
		})
	})
	local BuildChatPlaytestCta = UseChatPlaytestFooterModule(UseChatSessionCoreModuleResult, "BuildChatPlaytestCta")
	local SubagentTaskState = UseChatSessionCoreModuleResult.subagentTaskState
	local HasTaskGroups: boolean = SubagentTaskState ~= nil and #SubagentTaskState.groups > 0
	local IsChatEmpty = #UseChatSessionCoreModuleResult.messages == 0
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseChatSessionCoreModuleResult (copy), UniverseConfigurationModule (upval)
		local UniverseId = p1.target.universeId
		local NoIsAssistantResponding: boolean = UseRefResult.current and not UseChatSessionCoreModuleResult.isAssistantResponding
		UseRefResult.current = UseChatSessionCoreModuleResult.isAssistantResponding
		
		if not NoIsAssistantResponding or UniverseId == nil or UniverseId == 0 then
			return function() end
		end
		local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
		
		if UniverseConfigurationStore.getSummary(UniverseId).data(false) ~= nil then
			UniverseConfigurationStore.fetchSummary(UniverseId)
		end
		return function() end
	end, {
		p1.target.universeId,
		UseChatSessionCoreModuleResult.isAssistantResponding
	})
	ReactModule.useEffect(function()
		-- upvalues: CreatorAgentResumeStoreModule (copy), p1 (copy)
		CreatorAgentResumeStoreModule.setActiveTarget({
			universeId = p1.target.universeId,
			sessionId = p1.target.sessionId
		})
		
		return function()
			-- upvalues: CreatorAgentResumeStoreModule (upval)
			CreatorAgentResumeStoreModule.setActiveTarget(nil)
		end
	end, {
		CreatorAgentResumeStoreModule,
		p1.target.universeId,
		p1.target.sessionId
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseChatSessionCoreModuleResult (copy)
		if UseChatSessionCoreModuleResult.textBoxRef.current then
			UseChatSessionCoreModuleResult.textBoxRef.current.releaseFocus()
		end
	end, { UseChatSessionCoreModuleResult.textBoxRef })
	
	return {
		target = UseMemoResult,
		keyboardOverlap = Largest,
		onPageMetricsChanged = UseResult1,
		selectedChipGroupName = UseStateResult,
		onChipActivated = ReactModule.useCallback(function(p2)
			-- upvalues: UseResult2 (copy), UseStateResult2 (copy)
			UseResult2()
			UseStateResult2(p2)
		end, { UseResult2 }),
		onChipBottomSheetClose = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end,
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseResult2 (copy), p1 (copy)
			UseResult2()
			p1.onClose()
		end, { UseResult2, p1.onClose }),
		onOverflowMenuAction = ReactModule.useCallback(function(p2)
			-- upvalues: UseResult2 (copy), p1 (copy)
			if p2.type == "openPage" then
				UseResult2()
				
				if p1.onOpenConfigurationPage then
					p1.onOpenConfigurationPage(p2.page)
				end
			end
		end, { UseResult2, p1.onOpenConfigurationPage }),
		onPlayActivated = ReactModule.useCallback(function()
			-- upvalues: SendBuildExperienceEventModule (upval), p1 (copy), UseChatSessionCoreModuleResult (copy)
			SendBuildExperienceEventModule("PLAY_CLICK", {
				universeId = p1.target.universeId,
				placeId = UseChatSessionCoreModuleResult.playtestPlaceId
			})
			
			if UseChatSessionCoreModuleResult.launchPlaytest then
				UseChatSessionCoreModuleResult.launchPlaytest("BuildChatPage")
			end
		end, {
			UseChatSessionCoreModuleResult.launchPlaytest,
			UseChatSessionCoreModuleResult.playtestPlaceId,
			p1.target.universeId
		}),
		onOpenAgentsPage = ReactModule.useCallback(function()
			-- upvalues: SubagentTaskState (copy), UseResult2 (copy), p1 (copy)
			if SubagentTaskState ~= nil then
				UseResult2()
				p1.onOpenAgentsPage(SubagentTaskState)
				
				return
			end
		end, { UseResult2, p1.onOpenAgentsPage, SubagentTaskState }),
		buildOverflowMenuStore = BuildOverflowMenuStoreModule,
		messages = UseChatSessionCoreModuleResult.messages,
		localToolActions = UseChatSessionCoreModuleResult.localToolActions,
		clockBinding = UseChatSessionCoreModuleResult.clockBinding,
		onPlaytest = BuildChatPlaytestCta.onPlaytest,
		isPlaytestLoading = BuildChatPlaytestCta.isPlaytestLoading,
		isChatEmpty = IsChatEmpty,
		isNewGameTarget = IsIsNewGameTarget,
		hasPublishedTurn = UseChatSessionCoreModuleResult.hasPublishedTurn,
		hasTaskGroups = HasTaskGroups,
		taskState = SubagentTaskState,
		scrollingFrameRef = UseChatSessionCoreModuleResult.setScrollingFrame,
		composerText = UseChatSessionCoreModuleResult.composerText,
		composerErrorText = UseChatSessionCoreModuleResult.composerErrorText,
		onComposerChanged = UseChatSessionCoreModuleResult.setComposerText,
		textBoxRef = UseChatSessionCoreModuleResult.textBoxRef,
		isAssistantResponding = UseChatSessionCoreModuleResult.isAssistantResponding,
		canStopAssistantResponse = UseChatSessionCoreModuleResult.canStopAssistantResponse,
		onSend = UseChatSessionCoreModuleResult.sendMessage,
		onStop = UseChatSessionCoreModuleResult.stopAssistantResponse,
		statusChipGap = UseTokensResult.Gap.Small,
		paddingBottom = UseTokensResult.Padding.Small + Largest
	}
end