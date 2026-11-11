local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local Dictionary = require(Parent.llama).Dictionary
local List = require(Parent.llama).List
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ConfigModule = require(ExpChat.Config)
local UseInterpolatedClientSettingsModule = require(ExpChat.ClientSettings.useInterpolatedClientSettings)
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetGlobalChatTooltipStoreModule = require(ExpChat.Stores.GetGlobalChatTooltipStore)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local UI = script:FindFirstAncestor("UI")
local ScrollingViewModule = require(UI.ScrollingView)
local TranslatedTextMessageModule = require(UI.TranslatedTextMessage)
local TopBannerModule = require(UI.TopBanner)
local GlobalChatTooltipModule = require(UI.GlobalChatTooltip)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local ShowChatEnabledUIModule = require(ExpChat.showChatEnabledUI)
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local GetResult = require(Parent.UserProfiles).Stores.VerifiedBadgeDisplayStore.get()
local FStringReportingIXPLayer = require(Parent.SharedFlags).FStringReportingIXPLayer
local GetFFlagEnableChatLineReportingFunction = require(Parent.SharedFlags).GetFFlagEnableChatLineReporting
local GetFFlagMemoizeChatReportingMenuFunction = require(Parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local GetFFlagChatWindowUseCallbackOptimizationsModule = require(ExpChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagAEGIS2EnableGatesForExpChatModule = require(ExpChat.Flags.FFlagAEGIS2EnableGatesForExpChat)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatTopBannerForPresetChatAccessModule = require(ExpChat.Flags.FFlagExpChatTopBannerForPresetChatAccess)
local UseIsARButtonVisibleModule = require(ExpChat.useIsARButtonVisible)
local FFlagEnableVerifiedBadgeStore = require(Parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local EnableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local FFlagExpChatPerfTracking = require(Parent.SharedFlags).FFlagExpChatPerfTracking
local FFlagExpChatWindowMessageSourceRefactor = require(Parent.SharedFlags).FFlagExpChatWindowMessageSourceRefactor
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local FFlagExpChatChannelTabRefactor = require(Parent.SharedFlags).FFlagExpChatChannelTabRefactor
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local FFlagExpChatRewriteInlineModule = require(ExpChat.Flags.FFlagExpChatRewriteInline)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local ExpChatShowGlobalChatTooltip = game:DefineFastFlag("ExpChatShowGlobalChatTooltip", false)
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local config = {
	LayoutOrder = 1,
	showTranslationButton = false,
	size = UDim2.fromScale(1, 1),
	messages = if FFlagExpChatEnableV2ChatWindowModule then nil else {},
	transparencyValue = if GetFFlagMemoizeChatReportingMenuFunction() then ReactModule.createBinding(ConfigModule.ChatWindowBackgroundTransparency) else ConfigModule.ChatWindowBackgroundTransparency,
	textTransparency = ReactModule.createBinding(0),
	mutedUserIds = {},
	verifiedUserIds = {}
}

return (ReactModule.memo(function(p1)
	-- upvalues: Dictionary (copy), config (copy), UseInterpolatedClientSettingsModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatTopBannerForPresetChatAccessModule (copy), UseIsARButtonVisibleModule (copy), FFlagAEGIS2EnableGatesForExpChatModule (copy), GetChatStatusStoreModule (copy), SignalsReactModule (copy), ShowChatEnabledUIModule (copy), ExpChatShowGlobalChatTooltip (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), GetGlobalChatTooltipStoreModule (copy), ReactModule (copy), GetFFlagMemoizeChatReportingMenuFunction (copy), FFlagExpChatEnableV2ChatWindowModule (copy), GetMessagesStoreModule (copy), List (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagEnableChatLineReportingFunction (copy), UseUserExperimentFunction (copy), FStringReportingIXPLayer (copy), GetFFlagChatWindowUseCallbackOptimizationsModule (copy), FFlagExpChatWindowMessageSourceRefactor (copy), FFlagEnableVerifiedBadgeStore (copy), GetResult (copy), TranslatedTextMessageModule (copy), EnableInExpChatRewriteEngineFeature (copy), FFlagExpChatRewriteInlineModule (copy), FFlagExpChatPerfTracking (copy), FFlagExpChatChannelTabRefactor (copy), ExpChatPerfTracker (copy), ConfigModule (copy), FFlagExpChatEnableFriendsTab (copy), IsChatRegionLockedModule (copy), TopBannerModule (copy), ScrollingViewModule (copy), TextChatService (copy), GlobalChatTooltipModule (copy)
	local JoinResult = Dictionary.join(config, p1)
	local ChatWindowSettings = JoinResult.chatWindowSettings
	local BackgroundTransparency = UseInterpolatedClientSettingsModule(ChatWindowSettings).BackgroundTransparency
	local BackgroundColor3 = UseInterpolatedClientSettingsModule(ChatWindowSettings).BackgroundColor3
	local UseSignalStateResult = nil
	local v1 = true
	
	if FFlagExpChatPresetChatEnabled and FFlagExpChatTopBannerForPresetChatAccessModule then
		v1 = UseIsARButtonVisibleModule()
	elseif FFlagAEGIS2EnableGatesForExpChatModule then
		UseSignalStateResult = SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)
		v1 = ShowChatEnabledUIModule(UseSignalStateResult)
	end
	local UseSignalStateResult1 = if ExpChatShowGlobalChatTooltip then if FFlagExpChatUseUnifiedTooltipStore then SignalsReactModule.useSignalState(GetChatTooltipStoreModule(false).getIsEligible("GlobalChatTooltip")) else SignalsReactModule.useSignalState(GetGlobalChatTooltipStoreModule(false).getIsGlobalChatTooltipEligible) else false
	
	if FFlagExpChatUseUnifiedTooltipStore then
		local SetIsChatWindowOpenFunction = GetChatTooltipStoreModule(false).setIsChatWindowOpen
		ReactModule.useEffect(function()
			-- upvalues: SetIsChatWindowOpenFunction (copy), JoinResult (copy)
			SetIsChatWindowOpenFunction(JoinResult.visible)
			
			return function()
				-- upvalues: SetIsChatWindowOpenFunction (upval)
				SetIsChatWindowOpenFunction(false)
			end
		end, { JoinResult.visible, SetIsChatWindowOpenFunction })
	end
	local UseResult = nil
	local UseRefResult = nil
	
	if GetFFlagMemoizeChatReportingMenuFunction() and not FFlagExpChatEnableV2ChatWindowModule then
		UseRefResult = ReactModule.useRef(if FFlagExpChatEnableV2ChatWindowModule then nil else JoinResult.messages)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (ref), FFlagExpChatEnableV2ChatWindowModule (upval), JoinResult (copy)
			UseRefResult.current = if FFlagExpChatEnableV2ChatWindowModule then nil else JoinResult.messages
		end, {
			if FFlagExpChatEnableV2ChatWindowModule then nil else JoinResult.messages
		})
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (ref)
			return UseRefResult.current
		end, {})
	end
	if FFlagExpChatEnableV2ChatWindowModule then
		UseResult = ReactModule.useCallback(function()
			-- upvalues: GetMessagesStoreModule (upval), JoinResult (copy), List (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval)
			local MessagesStoreModule = GetMessagesStoreModule(false)
			local config = {
				windowMessagesInOrderByTabId = MessagesStoreModule.getWindowMessagesInOrderByTabId(false),
				byMessageId = MessagesStoreModule.getByMessageId(false),
				windowMessagesInOrder = MessagesStoreModule.getWindowMessagesInOrder(false)
			}
			
			if not JoinResult.isChannelBarVisible then
				return List.map(config.windowMessagesInOrder, function(p2)
					-- upvalues: config (copy)
					return config.byMessageId[p2]
				end)
			elseif GetFFlagTextChatEnableUniverseChatTabsFunction() then
				local Name = if JoinResult.targetTextChannel and config.windowMessagesInOrderByTabId[JoinResult.targetTextChannel.Name] then JoinResult.targetTextChannel.Name else JoinResult.selectedChannelName
				
				return if Name then List.map(config.windowMessagesInOrderByTabId[Name] or {}, function(p2)
					-- upvalues: config (copy)
					return config.byMessageId[p2]
				end) else {}
			else
				return if JoinResult.targetTextChannel then List.map(config.windowMessagesInOrderByTabId[JoinResult.targetTextChannel.Name] or {}, function(p2)
					-- upvalues: config (copy)
					return config.byMessageId[p2]
				end) else {}
			end
		end, {
			JoinResult.isChannelBarVisible,
			JoinResult.targetTextChannel,
			if GetFFlagTextChatEnableUniverseChatTabsFunction() then JoinResult.selectedChannelName else nil
		})
	end
	local UseUserExperimentResult = if GetFFlagEnableChatLineReportingFunction() then UseUserExperimentFunction({ FStringReportingIXPLayer }, function(p2)
		-- upvalues: FStringReportingIXPLayer (upval)
		return (p2[FStringReportingIXPLayer] or {}).EnableChatLineReporting
	end) else false
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: JoinResult (copy)
		return if type(p3) == "number" then JoinResult.transparencyValue else p3:map(function(p4): number
			-- upvalues: p2 (copy)
			return p2 + p4 * (1 - p2)
		end)
	end, if GetFFlagChatWindowUseCallbackOptimizationsModule() then { JoinResult.transparencyValue } else nil)
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: JoinResult (copy)
		JoinResult.resetTargetChannel()
		local Number: number? = tonumber(p2.userId)
		
		if Number then
			JoinResult.activateWhisperMode(Number)
		end
	end, if GetFFlagChatWindowUseCallbackOptimizationsModule() then {
		JoinResult.resetTargetChannel,
		JoinResult.activateWhisperMode
	} else nil)
	local UseResult3 = if FFlagExpChatEnableV2ChatWindowModule or FFlagExpChatWindowMessageSourceRefactor then nil else ReactModule.useCallback(function(p2)
		-- upvalues: Dictionary (upval), FFlagEnableVerifiedBadgeStore (upval), GetResult (upval), JoinResult (copy), ReactModule (upval), TranslatedTextMessageModule (upval), EnableInExpChatRewriteEngineFeature (upval), UseResult2 (copy), FFlagExpChatRewriteInlineModule (upval)
		local MapResult = Dictionary.map(p2, function(Message, LayoutOrder)
			-- upvalues: FFlagEnableVerifiedBadgeStore (upval), GetResult (upval), Dictionary (upval), JoinResult (upval), ReactModule (upval), TranslatedTextMessageModule (upval), EnableInExpChatRewriteEngineFeature (upval), UseResult2 (upval), FFlagExpChatRewriteInlineModule (upval)
			if Message.isVisibleInChatWindow then
				return ReactModule.createElement(TranslatedTextMessageModule, {
					message = Message,
					LayoutOrder = LayoutOrder,
					isUserVerified = if FFlagEnableVerifiedBadgeStore then if Message.userId then GetResult.isBadgeVisible((tonumber(Message.userId))) else false elseif Message.userId then Dictionary.has(JoinResult.verifiedUserIds, Message.userId) else false,
					textTransparency = JoinResult.textTransparency,
					transparencyValue = if EnableInExpChatRewriteEngineFeature then JoinResult.transparencyValue else nil,
					onTextMessageLabelButtonActivated = UseResult2,
					chatWindowSettings = JoinResult.chatWindowSettings,
					showTranslationButton = JoinResult.showTranslationButton,
					isSpatialUIEnabled = JoinResult.isSpatialUIEnabled,
					onToggle = function() end,
					chatWindowTransparencyBindable = if FFlagExpChatRewriteInlineModule then JoinResult.transparencyValue else nil
				}), Message.messageId
			else
				return nil, nil
			end
		end)
		MapResult["$layout"] = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
		
		return MapResult
	end, if GetFFlagChatWindowUseCallbackOptimizationsModule() then {
		JoinResult.messages,
		JoinResult.textTransparency,
		JoinResult.verifiedUserIds,
		JoinResult.chatWindowSettings,
		JoinResult.showTranslationButton
	} else nil)
	
	if FFlagExpChatPerfTracking then
		local SelectedChannelName = if FFlagExpChatChannelTabRefactor then JoinResult.selectedChannelName or "UNKNOWN_TAB" elseif JoinResult.targetTextChannel then JoinResult.targetTextChannel.Name else "UNKNOWN_TAB"
		ReactModule.useEffect(function()
			-- upvalues: ExpChatPerfTracker (upval)
			ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.ChatWindowMountTTI, {})
			
			return function()
				-- upvalues: ExpChatPerfTracker (upval)
				ExpChatPerfTracker.cancelAll()
			end
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: ExpChatPerfTracker (upval), SelectedChannelName (copy)
			ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = SelectedChannelName })
		end, { SelectedChannelName })
	end
	local Config = if FFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = JoinResult.showTranslationButton,
		chatWindowSettings = JoinResult.chatWindowSettings,
		textTransparency = JoinResult.textTransparency,
		onTextMessageLabelButtonActivated = UseResult2,
		isSpatialUIEnabled = JoinResult.isSpatialUIEnabled,
		chatWindowTransparencyBindable = if FFlagExpChatRewriteInlineModule then JoinResult.transparencyValue else nil,
		visible = JoinResult.visible,
		selectedChannelName = if GetFFlagTextChatEnableUniverseChatTabsFunction() then JoinResult.selectedChannelName else nil
	} else {}
	
	if FFlagExpChatWindowMessageSourceRefactor then
		Config.messageComponentsSignal = JoinResult.messageComponentsSignal
	end
	local DisableLineReporting = FFlagExpChatEnableFriendsTab and JoinResult.disableLineReporting
	
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = BackgroundColor3,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.LayoutOrder,
		Size = JoinResult.size,
		Visible = JoinResult.visible,
		BackgroundTransparency = UseResult1(BackgroundTransparency, JoinResult.transparencyValue),
		[ReactModule.Change.AbsoluteSize] = if GetFFlagChatWindowUseCallbackOptimizationsModule() then ReactModule.useCallback(function(p2)
			-- upvalues: TextChatService (upval), JoinResult (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if ChatWindowConfiguration and JoinResult.onAbsoluteSizeChanged then
				JoinResult.onAbsoluteSizeChanged(p2, ChatWindowConfiguration)
			end
		end, { TextChatService, JoinResult.onAbsoluteSizeChanged }) else function(p2)
			-- upvalues: TextChatService (upval), JoinResult (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if ChatWindowConfiguration and JoinResult.onAbsoluteSizeChanged then
				JoinResult.onAbsoluteSizeChanged(p2, ChatWindowConfiguration)
			end
		end,
		[ReactModule.Change.AbsolutePosition] = if GetFFlagChatWindowUseCallbackOptimizationsModule() then ReactModule.useCallback(function(p2)
			-- upvalues: TextChatService (upval), JoinResult (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if ChatWindowConfiguration and JoinResult.onAbsoluteSizeChanged then
				JoinResult.onAbsolutePositionChanged(p2, ChatWindowConfiguration)
			end
		end, { TextChatService, JoinResult.onAbsolutePositionChanged }) else function(p2)
			-- upvalues: TextChatService (upval), JoinResult (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if ChatWindowConfiguration and JoinResult.onAbsoluteSizeChanged then
				JoinResult.onAbsolutePositionChanged(p2, ChatWindowConfiguration)
			end
		end
	}, {
		hoverLayer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Event.MouseEnter] = JoinResult.onHovered,
			[ReactModule.Event.MouseLeave] = JoinResult.onUnhovered
		}),
		uiSizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = if JoinResult.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(ConfigModule.ChatWindowMaxWidth, ConfigModule.ChatWindowMaxHeight)
		}),
		contentFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = JoinResult.textTransparency:map(function(p2): boolean
				-- upvalues: ConfigModule (upval)
				return p2 < ConfigModule.ChatWindowMessageHideRootFadeThreshold
			end)
		}, {
			TopBanner = if DisableLineReporting or IsChatRegionLockedModule() or not v1 or not UseUserExperimentResult then nil else ReactModule.createElement(TopBannerModule, {
				backgroundColor3 = BackgroundColor3,
				backgroundTransparency = BackgroundTransparency,
				iconTransparency = if GetFFlagMemoizeChatReportingMenuFunction() then JoinResult.transparencyValue else UseResult1(BackgroundTransparency, JoinResult.transparencyValue),
				onFocus = JoinResult.onFocus,
				onUnfocus = JoinResult.onUnfocus,
				getMessages = if GetFFlagMemoizeChatReportingMenuFunction() then UseResult else nil,
				messages = if GetFFlagMemoizeChatReportingMenuFunction() then nil else JoinResult.messages
			}),
			scrollingView = ReactModule.createElement(ScrollingViewModule, Dictionary.join({
				size = JoinResult.size,
				targetTextChannel = JoinResult.targetTextChannel,
				isChannelBarVisible = JoinResult.isChannelBarVisible,
				scrollResetKey = if FFlagExpChatChannelTabRefactor then JoinResult.scrollResetKey else nil
			}, Config), if FFlagExpChatEnableV2ChatWindowModule or FFlagExpChatWindowMessageSourceRefactor then nil else UseResult3(JoinResult.messages))
		}),
		GlobalChatTooltip = if ExpChatShowGlobalChatTooltip and UseSignalStateResult1 then ReactModule.createElement(GlobalChatTooltipModule, {
			visible = JoinResult.visible,
			targetTextChannel = JoinResult.targetTextChannel,
			chatStatus = UseSignalStateResult
		}) else nil
	})
end))