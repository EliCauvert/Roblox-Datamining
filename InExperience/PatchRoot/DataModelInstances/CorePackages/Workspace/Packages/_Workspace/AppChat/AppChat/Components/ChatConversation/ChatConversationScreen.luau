local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local CryoModule = require(Parent.Cryo)
local ReadingMessagesIsEnabledModule = require(script.Parent.Utils.readingMessagesIsEnabled)
local ChatConversationContainerModule = require(script.Parent.ChatConversationContainer)
local LoggerModule = require(script.Parent.Logger)
local FFlagAppChatMomentShareCardNavigation = require(Parent.SharedFlags).FFlagAppChatMomentShareCardNavigation
local FFlagAppChatIxpScreenExposureModule = require(AppChat.Flags.FFlagAppChatIxpScreenExposure)
local FFlagAppChatIxpParallelScreenLayersModule = require(AppChat.Flags.FFlagAppChatIxpParallelScreenLayers)
local FStringAppChatConversationComposerIxpLayerModule = require(AppChat.Flags.FStringAppChatConversationComposerIxpLayer)
local FStringAppChatConversationPerformanceIxpLayerModule = require(AppChat.Flags.FStringAppChatConversationPerformanceIxpLayer)
local FStringAppChatConversationMessagesIxpLayerModule = require(AppChat.Flags.FStringAppChatConversationMessagesIxpLayer)
local FFlagAppChatMomentShareCardModule = require(AppChat.Flags.FFlagAppChatMomentShareCard)
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local FFlagAppChatFixBackButtonOnRotationModule = require(AppChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local CanPopParentStackModule = require(AppChat.Utils.canPopParentStack)

local function _(p1) --[[ Line: 39 | Named "getBackButtonConfig" ]]
	-- upvalues: FFlagAppChatFixBackButtonOnRotationModule (copy), CanPopParentStackModule (copy)
	local WideModeScreenProps = p1.getScreenProps("wideMode", false)
	
	if FFlagAppChatFixBackButtonOnRotationModule and CanPopParentStackModule(p1) then
		return true, false
	else
		return not WideModeScreenProps, WideModeScreenProps
	end
end

local ChatConversationScreen = RoactModule.PureComponent:extend("ChatConversationScreen")
ChatConversationScreen.defaultProps = { navigation = nil }

function ChatConversationScreen.navigationOptions(p1) --[[ Line: 51 ]]
	-- upvalues: FFlagAppChatFixBackButtonOnRotationModule (copy), CanPopParentStackModule (copy)
	local Navigation = p1.navigation
	local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
	local IsRoot = nil
	local NoWideModeScreenProps = nil
	
	if FFlagAppChatFixBackButtonOnRotationModule and CanPopParentStackModule(Navigation) then
		NoWideModeScreenProps = true
		IsRoot = false
	else
		NoWideModeScreenProps = not WideModeScreenProps
		IsRoot = WideModeScreenProps
	end
	return {
		tabBarVisible = false,
		lockIconEnabled = true,
		absorbInput = false,
		backButtonEnabled = NoWideModeScreenProps,
		isRoot = IsRoot
	}
end

function ChatConversationScreen.init(p1) --[[ Line: 64 ]]
	-- upvalues: FFlagAppChatIxpScreenExposureModule (copy), IXPNavigationUtilsModule (copy), FFlagAppChatIxpParallelScreenLayersModule (copy), FStringAppChatConversationComposerIxpLayerModule (copy), FStringAppChatConversationPerformanceIxpLayerModule (copy), FStringAppChatConversationMessagesIxpLayerModule (copy), RoactModule (copy), LoggerModule (copy), EnumScreensModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), FFlagAppChatFixBackButtonOnRotationModule (copy), CanPopParentStackModule (copy), GetTopBarStoreModule (copy), CryoModule (copy), ReadingMessagesIsEnabledModule (copy)
	p1.ixpSubscription = if FFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ConversationPage") else nil
	p1.composerIxpSubscription = if FFlagAppChatIxpScreenExposureModule and FFlagAppChatIxpParallelScreenLayersModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, FStringAppChatConversationComposerIxpLayerModule) else nil
	p1.performanceIxpSubscription = if FFlagAppChatIxpScreenExposureModule and FFlagAppChatIxpParallelScreenLayersModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, FStringAppChatConversationPerformanceIxpLayerModule) else nil
	p1.messagesIxpSubscription = if FFlagAppChatIxpScreenExposureModule and FFlagAppChatIxpParallelScreenLayersModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, FStringAppChatConversationMessagesIxpLayerModule) else nil
	p1.toastProps = nil
	p1.inputBoxRef = RoactModule.createRef()
	p1.lastHeaderText = nil
	p1.lastIsPrivateConversation = nil
	local Navigation = p1.props.navigation
	local ConversationIdParam = Navigation.getParam and Navigation.getParam("conversationId", nil)
	
	function p1.navigateToConversationOverlay() --[[ Line: 97 ]]
		-- upvalues: LoggerModule (upval), ConversationIdParam (copy), p1 (copy), Navigation (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To ConversationOverlay: {} from {screen}", ConversationIdParam)
		Navigation.navigate(EnumScreensModule.ConversationOverlay, {
			isOverlay = true,
			conversationId = p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil)
		})
	end
	
	function p1.navigateToChatDetails() --[[ Line: 107 ]]
		-- upvalues: p1 (copy), LoggerModule (upval), GetFFlagAppChatEnableRootedNavigationModule (upval), Navigation (copy), EnumScreensModule (upval)
		local ConversationIdParam = p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil)
		LoggerModule:info("Navigate To ChatDetails: {} from {screen}", ConversationIdParam)
		Navigation.navigate(EnumScreensModule.ChatDetails, if GetFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = ConversationIdParam,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversationId = ConversationIdParam })
	end
	
	local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
	local WideModeScreenProps1 = Navigation.getScreenProps("wideMode", false)
	local NoWideModeScreenProps1 = nil
	local IsRoot = nil
	
	if FFlagAppChatFixBackButtonOnRotationModule and CanPopParentStackModule(Navigation) then
		NoWideModeScreenProps1 = true
		IsRoot = false
	else
		NoWideModeScreenProps1 = not WideModeScreenProps1
		IsRoot = WideModeScreenProps1
	end
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, {
		navigateToChatDetails = p1.navigateToChatDetails,
		conversationId = ConversationIdParam,
		backButtonEnabled = NoWideModeScreenProps1,
		isRoot = IsRoot,
		leftPaddingOverride = if WideModeScreenProps then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12)
	})
	
	function p1.writeScreenTopBar() --[[ Line: 133 ]]
		-- upvalues: p1 (copy), FFlagAppChatFixBackButtonOnRotationModule (upval), CanPopParentStackModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval)
		local ConversationIdParam = if p1.props.navigation.getParam then p1.props.navigation.getParam("conversationId", nil) else nil
		local WideModeScreenProps = p1.props.navigation.getScreenProps("wideMode", false)
		local Navigation = p1.props.navigation
		local WideModeScreenProps1 = Navigation.getScreenProps("wideMode", false)
		local NoWideModeScreenProps1 = nil
		local IsRoot = nil
		
		if FFlagAppChatFixBackButtonOnRotationModule and CanPopParentStackModule(Navigation) then
			NoWideModeScreenProps1 = true
			IsRoot = false
		else
			NoWideModeScreenProps1 = not WideModeScreenProps1
			IsRoot = WideModeScreenProps1
		end
		local config = {
			navigateToChatDetails = p1.navigateToChatDetails,
			conversationId = ConversationIdParam,
			backButtonEnabled = NoWideModeScreenProps1,
			isRoot = IsRoot,
			leftPaddingOverride = if WideModeScreenProps then p1.props.navigation.getScreenProps("appChatInnerPadding", 12) else p1.props.navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = p1.props.navigation.getScreenProps("appChatOuterPadding", 12)
		}
		
		if p1.lastHeaderText ~= nil then
			config.headerText = p1.lastHeaderText
		end
		if p1.lastIsPrivateConversation ~= nil then
			config.isPrivateConversation = p1.lastIsPrivateConversation
		end
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, config)
	end
	
	function p1.queueNavigationToToast(ToastProps) --[[ Line: 161 ]]
		-- upvalues: p1 (copy)
		if p1.props.navigation.isFocused() then
			p1.navigateToToast(ToastProps)
			p1.toastProps = nil
			
			return
		else
			p1.toastProps = ToastProps
		end
	end
	
	function p1.onDidFocus() --[[ Line: 171 ]]
		-- upvalues: p1 (copy)
		p1.writeScreenTopBar()
		p1.setInputBarCloseCallback(p1.releaseFocus)
		
		if p1.toastProps then
			p1.navigateToToast(p1.toastProps)
			p1.toastProps = nil
		end
	end
	
	function p1.releaseFocus() --[[ Line: 185 ]]
		-- upvalues: p1 (copy)
		if p1.inputBoxRef and p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p1.onWillBlur() --[[ Line: 191 ]]
		-- upvalues: p1 (copy)
		p1.releaseFocus()
		p1.setInputBarCloseCallback()
	end
	
	function p1.navigateToToast(ToastProps) --[[ Line: 197 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval), CryoModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, CryoModule.Dictionary.union(ToastProps, { isOverlay = true }))
	end
	
	function p1.openViewProfile(p2) --[[ Line: 206 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval), LoggerModule (upval)
		local NavigateToLuaAppPagesScreenProp: (any, any) -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.ViewUserProfile]
		
		if NavigateToLuaAppPagesScreenProp then
			LoggerModule:info("Navigate To UserProfile from {screen}")
			NavigateToLuaAppPagesScreenProp(p2, {})
			
			return
		else
			LoggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
		end
	end
	
	function p1.openGameDetailsPage(p2, p3) --[[ Line: 218 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval), LoggerModule (upval)
		local NavigateToLuaAppPagesScreenProp: (any, any) -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.GameDetail]
		
		if NavigateToLuaAppPagesScreenProp then
			LoggerModule:info("Navigate To GameDetail from " .. tostring(p3))
			NavigateToLuaAppPagesScreenProp(p2, p3)
			
			return
		else
			LoggerModule:warning("GameDetail page was not set in navigateToLuaAppPages screenProps")
		end
	end
	
	function p1.getOpenMomentsImmersive() --[[ Line: 231 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		return p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.MomentsImmersive]
	end
	
	function p1.navigateToChatConversation(ConversationId) --[[ Line: 236 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
	end
	
	function p1.navigateToScreen(p2, p3, IsOverlay) --[[ Line: 241 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), CryoModule (upval)
		LoggerModule:info("Navigate To Screen: {} from {screen}", p2)
		local Navigation = p1.props.navigation
		local ConversationIdParam = Navigation and (Navigation.getParam and Navigation.getParam("conversationId", nil))
		
		if p3 then
			p1.props.navigation.navigate(p2, CryoModule.Dictionary.union({
				conversationId = ConversationIdParam,
				isOverlay = IsOverlay
			}, p3))
			
			return
		else
			p1.props.navigation.navigate(p2, { conversationId = ConversationIdParam })
		end
	end
	
	function p1.navigateBack() --[[ Line: 261 ]]
		-- upvalues: p1 (copy)
		if p1.props.navigation.isFocused() then
			p1.props.navigation.goBack()
		end
	end
	
	function p1.navigateToChatLanding() --[[ Line: 267 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To ChatLanding from {screen}")
		
		if p1.props.navigation.getScreenProps("wideMode", false) then
			p1.props.navigation.navigate(EnumScreensModule.EmptyConversation)
			
			return
		else
			p1.props.navigation.navigate(EnumScreensModule.ChatLanding)
		end
	end
	
	function p1.navigateToSquadLobby(ConversationId) --[[ Line: 277 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To SquadLobby from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
	end
	
	function p1.updateConversationTitle(Raw) --[[ Line: 282 ]]
		-- upvalues: p1 (copy), GetTopBarStoreModule (upval), EnumScreensModule (upval)
		local Config = if Raw then { shouldLocalize = false, raw = Raw } else {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		}
		p1.lastHeaderText = Config
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, { headerText = Config })
	end
	
	function p1.setInputBarCloseCallback(CloseInputBar) --[[ Line: 298 ]]
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatLanding, { closeInputBar = CloseInputBar })
	end
	
	function p1.getReadingMessagesIsEnabled() --[[ Line: 302 ]]
		-- upvalues: ReadingMessagesIsEnabledModule (upval), p1 (copy)
		return ReadingMessagesIsEnabledModule(p1.props.navigation)
	end
	
	function p1.updatePrivateConversationTopBar(IsPrivateConversation) --[[ Line: 306 ]]
		-- upvalues: p1 (copy), GetTopBarStoreModule (upval), EnumScreensModule (upval)
		p1.lastIsPrivateConversation = IsPrivateConversation
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, { isPrivateConversation = IsPrivateConversation })
	end
end

function ChatConversationScreen.didUpdate(p1, p2) --[[ Line: 313 ]]
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	local ConversationIdParam = p1.props.navigation and (p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil))
	
	if (p2.navigation and (p2.navigation.getParam and p2.navigation.getParam("conversationId", nil))) ~= ConversationIdParam then
		p1.lastHeaderText = nil
		p1.lastIsPrivateConversation = nil
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, { conversationId = ConversationIdParam })
	end
end

function ChatConversationScreen.render(p1) --[[ Line: 331 ]]
	-- upvalues: ArgCheckModule (copy), FFlagAppChatMomentShareCardModule (copy), FFlagAppChatMomentShareCardNavigation (copy), RoactModule (copy), RoactNavigationModule (copy), ChatConversationContainerModule (copy)
	local NavigationInChatConversationScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in ChatConversationScreen")
	local ConversationIdParam = NavigationInChatConversationScreen.getParam("conversationId", nil)
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		container = RoactModule.createElement(ChatConversationContainerModule, {
			topBarHeight = NavigationInChatConversationScreen.getScreenProps("topBarHeight", 0),
			wideMode = NavigationInChatConversationScreen.getScreenProps("wideMode", false),
			openGameDetailsPage = p1.openGameDetailsPage,
			openMomentsDeepLink = if FFlagAppChatMomentShareCardModule and FFlagAppChatMomentShareCardNavigation then p1.getOpenMomentsImmersive() else nil,
			getReadingMessagesIsEnabled = p1.getReadingMessagesIsEnabled,
			conversationId = ConversationIdParam and tostring(ConversationIdParam) or nil,
			inputBoxRef = p1.inputBoxRef,
			updateConversationTitle = p1.updateConversationTitle,
			updatePrivateConversationTopBar = p1.updatePrivateConversationTopBar,
			releaseInputBarFocus = p1.releaseFocus,
			navigateBack = p1.navigateBack,
			navigateToToast = p1.queueNavigationToToast,
			openViewProfile = p1.openViewProfile,
			navigateToChatConversation = p1.navigateToChatConversation,
			navigateToChatLanding = p1.navigateToChatLanding,
			navigateToScreen = p1.navigateToScreen,
			navigateToSquadLobby = p1.navigateToSquadLobby,
			navigateToConversationOverlay = p1.navigateToConversationOverlay,
			navigation = p1.props.navigation
		}),
		eventsAdapter = RoactModule.createElement(RoactNavigationModule.NavigationEvents, { onDidFocus = p1.onDidFocus, onWillBlur = p1.onWillBlur })
	})
end

function ChatConversationScreen.didMount(p1) --[[ Line: 375 ]]
	-- upvalues: LoggerModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy)
	LoggerModule:info("{screen} mounted")
	local Navigation = p1.props.navigation
	local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, {
		leftPaddingOverride = if WideModeScreenProps then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12)
	})
end

function ChatConversationScreen.willUnmount(p1) --[[ Line: 387 ]]
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	GetTopBarStoreModule(false).clearScreenTopBar(EnumScreensModule.ChatConversation)
	
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
	if p1.composerIxpSubscription then
		p1.composerIxpSubscription.remove()
	end
	if p1.performanceIxpSubscription then
		p1.performanceIxpSubscription.remove()
	end
	if p1.messagesIxpSubscription then
		p1.messagesIxpSubscription.remove()
	end
end

return ChatConversationScreen