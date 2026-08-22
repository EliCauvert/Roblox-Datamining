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

return reactModule.memo(function(p0) --[[ line: 60 ]]
	-- upvalues: dictionary (ref), t (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), getGlobalChatTooltipStoreModule (ref), reactModule (ref), getFFlagMemoizeChatReportingMenu (ref), fFlagExpChatEnableV2ChatWindowModule (ref), getMessagesStoreModule (ref), list (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagEnableChatLineReporting (ref), useUserExperiment (ref), fStringReportingIXPLayer (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), fFlagExpChatPerfTrackerTabName (ref), expChatPerfTracker (ref), fFlagExpChatRewriteInlineModule (ref), configModule (ref), fFlagExpChatEnableFriendsTab (ref), isChatRegionLockedModule (ref), topBannerModule (ref), scrollingViewModule (ref), textChatService (ref), globalChatTooltipModule (ref)
	local var24 = dictionary.join(t, p0)
	local chatWindowSettings = var24.chatWindowSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local var25 = nil
	local _ = nil
	local var26 = true
	
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		var26 = useIsARButtonVisibleModule()
	elseif fFlagAEGIS2EnableGatesForExpChatModule then
		var25 = signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)
		var26 = showChatEnabledUIModule(var25)
	end
	local var27 = if fFlagExpChatUseUnifiedTooltipStore then signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getIsEligible("GlobalChatTooltip")) else signalsReactModule.useSignalState(getGlobalChatTooltipStoreModule(false).getIsGlobalChatTooltipEligible)
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatWindowOpen = getChatTooltipStoreModule(false).setIsChatWindowOpen
		reactModule.useEffect(function() --[[ line: 89 ]]
			-- upvalues: setIsChatWindowOpen (ref), var24 (ref)
			setIsChatWindowOpen(var24.visible)
			
			return function() --[[ line: 91 ]]
				-- upvalues: setIsChatWindowOpen (copy)
				setIsChatWindowOpen(false)
			end
		end, { var24.visible, setIsChatWindowOpen })
	end
	local var28 = nil
	local _ = nil
	
	if getFFlagMemoizeChatReportingMenu() and not fFlagExpChatEnableV2ChatWindowModule then
		local var29 = reactModule.useRef(if fFlagExpChatEnableV2ChatWindowModule then nil else var24.messages)
		reactModule.useEffect(function() --[[ line: 101 ]]
			-- upvalues: var29 (write), fFlagExpChatEnableV2ChatWindowModule (copy), var24 (ref)
			var29.current = if fFlagExpChatEnableV2ChatWindowModule then nil else var24.messages
		end, {
			if fFlagExpChatEnableV2ChatWindowModule then nil else var24.messages
		})
		var28 = reactModule.useCallback(function() --[[ line: 105 ]]
			-- upvalues: var29 (write)
			return var29.current
		end, {})
	end
	if fFlagExpChatEnableV2ChatWindowModule then
		var28 = reactModule.useCallback(function() --[[ line: 111 ]]
			-- upvalues: getMessagesStoreModule (copy), var24 (ref), list (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
			local var36 = getMessagesStoreModule(false)
			local t = {
				windowMessagesInOrderByTabId = var36.getWindowMessagesInOrderByTabId(false),
				byMessageId = var36.getByMessageId(false),
				windowMessagesInOrder = var36.getWindowMessagesInOrder(false)
			}
			
			if not var24.isChannelBarVisible then
				return list.map(t.windowMessagesInOrder, function(p1) --[[ line: 120 ]]
					-- upvalues: t (ref)
					return t.byMessageId[p1]
				end)
			elseif getFFlagTextChatEnableUniverseChatTabs() then
				local var38 = if var24.targetTextChannel and t.windowMessagesInOrderByTabId[var24.targetTextChannel.Name] then var24.targetTextChannel.Name else var24.selectedChannelName
				
				return if var38 then list.map(t.windowMessagesInOrderByTabId[var38] or {}, function(p2) --[[ line: 135 ]]
					-- upvalues: t (ref)
					return t.byMessageId[p2]
				end) else {}
			end
			return if var24.targetTextChannel then list.map(t.windowMessagesInOrderByTabId[var24.targetTextChannel.Name] or {}, function(p3) --[[ line: 143 ]]
				-- upvalues: t (ref)
				return t.byMessageId[p3]
			end) else {}
		end, {
			var24.isChannelBarVisible,
			var24.targetTextChannel,
			if getFFlagTextChatEnableUniverseChatTabs() then var24.selectedChannelName else nil
		})
	end
	local var30 = if getFFlagEnableChatLineReporting() then useUserExperiment({ fStringReportingIXPLayer }, function(p4) --[[ line: 161 ]]
		-- upvalues: fStringReportingIXPLayer (copy)
		return (p4[fStringReportingIXPLayer] or {}).EnableChatLineReporting
	end) else false
	local var31 = reactModule.useCallback(function(p5, p6) --[[ line: 167 ]]
		-- upvalues: var24 (ref)
		return if type(p6) == "number" then var24.transparencyValue else p6:map(function(p7) --[[ line: 172 ]]
			-- upvalues: p5 (ref)
			return p5 + p7 * (1 - p5)
		end)
	end, if getFFlagChatWindowUseCallbackOptimizationsModule() then { var24.transparencyValue } else nil)
	local var32 = reactModule.useCallback(function(p8) --[[ line: 178 ]]
		-- upvalues: var24 (ref)
		var24.resetTargetChannel()
		local var39 = tonumber(p8.userId)
		
		if var39 then
			var24.activateWhisperMode(var39)
		end
	end, if getFFlagChatWindowUseCallbackOptimizationsModule() then { var24.resetTargetChannel, var24.activateWhisperMode } else nil)
	local selectedChannelName = var24.selectedChannelName or "UNKNOWN_TAB"
	local var34 = if fFlagExpChatPerfTrackerTabName then { tabName = selectedChannelName } else nil
	reactModule.useEffect(function() --[[ line: 192 ]]
		-- upvalues: expChatPerfTracker (copy), var34 (ref)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowMountTTI, {}, var34)
		
		return function() --[[ line: 194 ]]
			-- upvalues: expChatPerfTracker (copy)
			expChatPerfTracker.cancelAll()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: expChatPerfTracker (copy), selectedChannelName (ref), var34 (ref)
		expChatPerfTracker.finish(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = selectedChannelName }, var34)
	end, { selectedChannelName })
	local var35 = if fFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = var24.showTranslationButton,
		chatWindowSettings = var24.chatWindowSettings,
		textTransparency = var24.textTransparency,
		onTextMessageLabelButtonActivated = var32,
		isSpatialUIEnabled = var24.isSpatialUIEnabled,
		chatWindowTransparencyBindable = if fFlagExpChatRewriteInlineModule then var24.transparencyValue else nil,
		visible = var24.visible,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then var24.selectedChannelName else nil
	} else {}
	var35.messageComponentsSignal = var24.messageComponentsSignal
	
	return reactModule.createElement("Frame", {
		BackgroundColor3 = backgroundColor3,
		BorderSizePixel = 0,
		LayoutOrder = var24.LayoutOrder,
		Size = var24.size,
		Visible = var24.visible,
		BackgroundTransparency = if fFlagExpChatEnableFriendsTab and var24.suppressBackground then 1 else var31(backgroundTransparency, var24.transparencyValue),
		[reactModule.Change.AbsoluteSize] = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function(p10) --[[ line: 266 ]]
			-- upvalues: textChatService (copy), var24 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var24.onAbsoluteSizeChanged then
				var24.onAbsoluteSizeChanged(p10, chatWindowConfiguration)
			end
		end, { textChatService, var24.onAbsoluteSizeChanged }) else function(p9) --[[ line: 272 ]]
			-- upvalues: textChatService (copy), var24 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var24.onAbsoluteSizeChanged then
				var24.onAbsoluteSizeChanged(p9, chatWindowConfiguration)
			end
		end,
		[reactModule.Change.AbsolutePosition] = if getFFlagChatWindowUseCallbackOptimizationsModule() then reactModule.useCallback(function(p12) --[[ line: 279 ]]
			-- upvalues: textChatService (copy), var24 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var24.onAbsoluteSizeChanged then
				var24.onAbsolutePositionChanged(p12, chatWindowConfiguration)
			end
		end, { textChatService, var24.onAbsolutePositionChanged }) else function(p11) --[[ line: 285 ]]
			-- upvalues: textChatService (copy), var24 (ref)
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			
			if chatWindowConfiguration and var24.onAbsoluteSizeChanged then
				var24.onAbsolutePositionChanged(p11, chatWindowConfiguration)
			end
		end
	}, {
		hoverLayer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			[reactModule.Event.MouseEnter] = var24.onHovered,
			[reactModule.Event.MouseLeave] = var24.onUnhovered
		}),
		uiSizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = if var24.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(configModule.ChatWindowMaxWidth, configModule.ChatWindowMaxHeight)
		}),
		contentFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = var24.textTransparency:map(function(p13) --[[ line: 219 ]]
				-- upvalues: configModule (copy)
				return p13 < configModule.ChatWindowMessageHideRootFadeThreshold
			end)
		}, {
			TopBanner = if fFlagExpChatEnableFriendsTab and var24.disableLineReporting or isChatRegionLockedModule() or (not var26 or not var30) then nil else reactModule.createElement(topBannerModule, {
				backgroundColor3 = backgroundColor3,
				backgroundTransparency = backgroundTransparency,
				iconTransparency = if getFFlagMemoizeChatReportingMenu() then var24.transparencyValue else var31(backgroundTransparency, var24.transparencyValue),
				onFocus = var24.onFocus,
				onUnfocus = var24.onUnfocus,
				getMessages = if getFFlagMemoizeChatReportingMenu() then var28 else nil,
				messages = if not getFFlagMemoizeChatReportingMenu() then var24.messages else nil
			}),
			scrollingView = reactModule.createElement(scrollingViewModule, dictionary.join({
				size = var24.size,
				isChannelBarVisible = var24.isChannelBarVisible,
				scrollResetKey = var24.scrollResetKey,
				scrollToTopOnReset = if fFlagExpChatEnableFriendsTab then var24.scrollToTopOnReset else nil,
				onCanvasPositionChanged = if fFlagExpChatEnableFriendsTab then var24.onCanvasPositionChanged else nil,
				contentTopPadding = if fFlagExpChatEnableFriendsTab then var24.contentTopPadding else nil
			}, var35))
		}),
		GlobalChatTooltip = if var27 then reactModule.createElement(globalChatTooltipModule, {
			visible = var24.visible,
			targetTextChannel = var24.targetTextChannel,
			chatStatus = var25
		}) else nil
	})
end)