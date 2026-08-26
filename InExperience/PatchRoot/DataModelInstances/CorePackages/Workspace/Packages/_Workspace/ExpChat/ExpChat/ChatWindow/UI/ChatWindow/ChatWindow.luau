local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dictionary = require(parent.llama).Dictionary
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getGlobalChatTooltipStoreModule = require(expChat.Stores.GetGlobalChatTooltipStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local ui = script:FindFirstAncestor("UI")
local scrollingViewModule = require(ui.ScrollingView)
local topBannerModule = require(ui.TopBanner)
local globalChatTooltipModule = require(ui.GlobalChatTooltip)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fStringReportingIXPLayer = require(parent.SharedFlags).FStringReportingIXPLayer
local getFFlagEnableChatLineReporting = require(parent.SharedFlags).GetFFlagEnableChatLineReporting
local getFFlagMemoizeChatReportingMenu = require(parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local getFFlagChatWindowUseCallbackOptimizationsModule = require(expChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagAEGIS2EnableGatesForExpChatModule = require(expChat.Flags.FFlagAEGIS2EnableGatesForExpChat)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatTopBannerForPresetChatAccessModule = require(expChat.Flags.FFlagExpChatTopBannerForPresetChatAccess)
local useIsARButtonVisibleModule = require(expChat.useIsARButtonVisible)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local fFlagExpChatRewriteInlineModule = require(expChat.Flags.FFlagExpChatRewriteInline)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local t = {
	LayoutOrder = 1,
	showTranslationButton = false,
	size = UDim2.fromScale(1, 1),
	messages = if fFlagExpChatEnableV2ChatWindowModule then nil else {},
	transparencyValue = if getFFlagMemoizeChatReportingMenu() then reactModule.createBinding(configModule.ChatWindowBackgroundTransparency) else configModule.ChatWindowBackgroundTransparency,
	textTransparency = reactModule.createBinding(0),
	mutedUserIds = {},
	verifiedUserIds = {}
}

return reactModule.memo(function(p1)
	-- upvalues: dictionary (ref), t (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), getGlobalChatTooltipStoreModule (ref), reactModule (ref), getFFlagMemoizeChatReportingMenu (ref), fFlagExpChatEnableV2ChatWindowModule (ref), getMessagesStoreModule (ref), list (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagEnableChatLineReporting (ref), useUserExperiment (ref), fStringReportingIXPLayer (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), fFlagExpChatPerfTrackerTabName (ref), expChatPerfTracker (ref), fFlagExpChatRewriteInlineModule (ref), configModule (ref), fFlagExpChatEnableFriendsTab (ref), isChatRegionLockedModule (ref), topBannerModule (ref), scrollingViewModule (ref), textChatService (ref), globalChatTooltipModule (ref)
	local var1 = dictionary.join(t, p1)
	local chatWindowSettings = var1.chatWindowSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local var2 = nil
	local _ = nil
	local var3 = true
	
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		var3 = useIsARButtonVisibleModule()
	elseif fFlagAEGIS2EnableGatesForExpChatModule then
		var2 = signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)
		var3 = showChatEnabledUIModule(var2)
	end
	local var4 = if fFlagExpChatUseUnifiedTooltipStore then signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getIsEligible("GlobalChatTooltip")) else signalsReactModule.useSignalState(getGlobalChatTooltipStoreModule(false).getIsGlobalChatTooltipEligible)
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatWindowOpen = getChatTooltipStoreModule(false).setIsChatWindowOpen
		reactModule.useEffect(function()
			-- upvalues: setIsChatWindowOpen (ref), var1 (ref)
			setIsChatWindowOpen(var1.visible)
			
			return function()
				-- upvalues: setIsChatWindowOpen (copy)
				setIsChatWindowOpen(false)
			end
		end, { var1.visible, setIsChatWindowOpen })
	end
	local var5 = nil
	local _ = nil
	
	if getFFlagMemoizeChatReportingMenu() and not fFlagExpChatEnableV2ChatWindowModule then
		local var6 = reactModule.useRef(if fFlagExpChatEnableV2ChatWindowModule then nil else var1.messages)
		reactModule.useEffect(function()
			-- upvalues: var6 (write), fFlagExpChatEnableV2ChatWindowModule (copy), var1 (ref)
			var6.current = if fFlagExpChatEnableV2ChatWindowModule then nil else var1.messages
		end, {
			if fFlagExpChatEnableV2ChatWindowModule then nil else var1.messages
		})
		var5 = reactModule.useCallback(function()
			-- upvalues: var6 (write)
			return var6.current
		end, {})
	end
	if fFlagExpChatEnableV2ChatWindowModule then
		var5 = reactModule.useCallback(function()
			-- upvalues: getMessagesStoreModule (copy), var1 (ref), list (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
			local var7 = getMessagesStoreModule(false)
			local t = {
				windowMessagesInOrderByTabId = var7.getWindowMessagesInOrderByTabId(false),
				byMessageId = var7.getByMessageId(false),
				windowMessagesInOrder = var7.getWindowMessagesInOrder(false)
			}
			
			if not var1.isChannelBarVisible then
				return list.map(t.windowMessagesInOrder, function(p2)
					-- upvalues: t (ref)
					return t.byMessageId[p2]
				end)
			elseif getFFlagTextChatEnableUniverseChatTabs() then
				local var8 = if var1.targetTextChannel and t.windowMessagesInOrderByTabId[var1.targetTextChannel.Name] then var1.targetTextChannel.Name else var1.selectedChannelName
				
				return if var8 then list.map(t.windowMessagesInOrderByTabId[var8] or {}, function(p2)
					-- upvalues: t (ref)
					return t.byMessageId[p2]
				end) else {}
			end
			return if var1.targetTextChannel then list.map(t.windowMessagesInOrderByTabId[var1.targetTextChannel.Name] or {}, function(p2)
				-- upvalues: t (ref)
				return t.byMessageId[p2]
			end) else {}
		end, {
			var1.isChannelBarVisible,
			var1.targetTextChannel,
			if getFFlagTextChatEnableUniverseChatTabs() then var1.selectedChannelName else nil
		})
	end
	local var7 = if getFFlagEnableChatLineReporting() then useUserExperiment({ fStringReportingIXPLayer }, function(p2)
		-- upvalues: fStringReportingIXPLayer (copy)
		return (p2[fStringReportingIXPLayer] or {}).EnableChatLineReporting
	end) else false
	local var8 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref)
		return if type(p3) == "number" then var1.transparencyValue else p3:map(function(p4)
			-- upvalues: p2 (ref)
			return p2 + p4 * (1 - p2)
		end)
	end, if getFFlagChatWindowUseCallbackOptimizationsModule() then { var1.transparencyValue } else nil)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.resetTargetChannel()
		local var10 = tonumber(p2.userId)
		
		if var10 then
			var1.activateWhisperMode(var10)
		end
	end, if getFFlagChatWindowUseCallbackOptimizationsModule() then { var1.resetTargetChannel, var1.activateWhisperMode } else nil)
	local selectedChannelName = var1.selectedChannelName or "UNKNOWN_TAB"
	local var10 = if fFlagExpChatPerfTrackerTabName then { tabName = selectedChannelName } else nil
	reactModule.useEffect(function()
		-- upvalues: expChatPerfTracker (copy), var10 (ref)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowMountTTI, {}, var10)
		
		return function()
			-- upvalues: expChatPerfTracker (copy)
			expChatPerfTracker.cancelAll()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: expChatPerfTracker (copy), selectedChannelName (ref), var10 (ref)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = selectedChannelName }, var10)
	end, { selectedChannelName })
	local var11 = if fFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = var1.showTranslationButton,
		chatWindowSettings = var1.chatWindowSettings,
		textTransparency = var1.textTransparency,
		onTextMessageLabelButtonActivated = var9,
		isSpatialUIEnabled = var1.isSpatialUIEnabled,
		chatWindowTransparencyBindable = if fFlagExpChatRewriteInlineModule then var1.transparencyValue else nil,
		visible = var1.visible,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then var1.selectedChannelName else nil
	} else {}
	var11.messageComponentsSignal = var1.messageComponentsSignal
	
	return reactModule.createElement("Frame", {
		BackgroundColor3 = backgroundColor3,
		BorderSizePixel = 0,
		LayoutOrder = var1.LayoutOrder,
		Size = var1.size,
		Visible = var1.visible,
		BackgroundTransparency = if fFlagExpChatEnableFriendsTab and var1.suppressBackground then 1 else var8(backgroundTransparency, var1.transparencyValue),
		[reactModule.Change.AbsoluteSize] = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function(p2)
			-- upvalues: textChatService (copy), var1 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var1.onAbsoluteSizeChanged then
				var1.onAbsoluteSizeChanged(p2, chatWindowConfiguration)
			end
		end, { textChatService, var1.onAbsoluteSizeChanged }) else function(p2)
			-- upvalues: textChatService (copy), var1 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var1.onAbsoluteSizeChanged then
				var1.onAbsoluteSizeChanged(p2, chatWindowConfiguration)
			end
		end,
		[reactModule.Change.AbsolutePosition] = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function(p2)
			-- upvalues: textChatService (copy), var1 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var1.onAbsoluteSizeChanged then
				var1.onAbsolutePositionChanged(p2, chatWindowConfiguration)
			end
		end, { textChatService, var1.onAbsolutePositionChanged }) else function(p2)
			-- upvalues: textChatService (copy), var1 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var1.onAbsoluteSizeChanged then
				var1.onAbsolutePositionChanged(p2, chatWindowConfiguration)
			end
		end
	}, {
		hoverLayer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			[reactModule.Event.MouseEnter] = var1.onHovered,
			[reactModule.Event.MouseLeave] = var1.onUnhovered
		}),
		uiSizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = if var1.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(configModule.ChatWindowMaxWidth, configModule.ChatWindowMaxHeight)
		}),
		contentFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = var1.textTransparency:map(function(p2)
				-- upvalues: configModule (copy)
				return p2 < configModule.ChatWindowMessageHideRootFadeThreshold
			end)
		}, {
			TopBanner = if fFlagExpChatEnableFriendsTab and var1.disableLineReporting or isChatRegionLockedModule() or (not var3 or not var7) then nil else reactModule.createElement(topBannerModule, {
				backgroundColor3 = backgroundColor3,
				backgroundTransparency = backgroundTransparency,
				iconTransparency = if getFFlagMemoizeChatReportingMenu() then var1.transparencyValue else var8(backgroundTransparency, var1.transparencyValue),
				onFocus = var1.onFocus,
				onUnfocus = var1.onUnfocus,
				getMessages = if getFFlagMemoizeChatReportingMenu() then var5 else nil,
				messages = if not getFFlagMemoizeChatReportingMenu() then var1.messages else nil
			}),
			scrollingView = reactModule.createElement(scrollingViewModule, dictionary.join({
				size = var1.size,
				isChannelBarVisible = var1.isChannelBarVisible,
				scrollResetKey = var1.scrollResetKey,
				scrollToTopOnReset = if fFlagExpChatEnableFriendsTab then var1.scrollToTopOnReset else nil,
				onCanvasPositionChanged = if fFlagExpChatEnableFriendsTab then var1.onCanvasPositionChanged else nil,
				contentTopPadding = if fFlagExpChatEnableFriendsTab then var1.contentTopPadding else nil
			}, var11))
		}),
		GlobalChatTooltip = if var4 then reactModule.createElement(globalChatTooltipModule, {
			visible = var1.visible,
			targetTextChannel = var1.targetTextChannel,
			chatStatus = var2
		}) else nil
	})
end)