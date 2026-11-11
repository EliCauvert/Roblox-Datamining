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
local WithChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).withChatPlacementContext
local SquadJoinButtonModule = require(Parent.Squads.SquadJoinButton)
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local SquadComponentAccessWrapperModule = require(Parent.Squads.SquadComponentAccessWrapper)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagAppChatFixBackButtonOnRotationModule = require(AppChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local CanPopParentStackModule = require(AppChat.Utils.canPopParentStack)

local function _(p1)
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

function ChatConversationScreen.navigationOptions(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), FFlagAppChatFixBackButtonOnRotationModule (copy), CanPopParentStackModule (copy), GetFFlagIsSquadEnabledFunction (copy), EnumScreensModule (copy), RoactModule (copy), WithChatPlacementContextFunction (copy), SquadComponentAccessWrapperModule (copy), SquadJoinButtonModule (copy), SquadButtonSourceEnum (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy)
	local Navigation = p1.navigation
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
		local NoWideModeScreenProps = nil
		local IsRoot = nil
		
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
	else
		local AppChatInnerPaddingScreenProps = if Navigation.getScreenProps("wideMode", false) then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12)
		local Frame = nil
		
		if GetFFlagIsSquadEnabledFunction() then
			local ConversationIdParam = Navigation.getParam("conversationId", nil)
			local Text = if ConversationIdParam then tostring(ConversationIdParam) else nil
			
			local function OnActivated()
				-- upvalues: Navigation (copy), EnumScreensModule (upval), Text (ref)
				Navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = Text })
			end
			
			if Text then
				Frame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Right }),
					GroupUpButton = WithChatPlacementContextFunction(function(p2)
						-- upvalues: RoactModule (upval), SquadComponentAccessWrapperModule (upval), Text (ref), SquadJoinButtonModule (upval), OnActivated (copy), SquadButtonSourceEnum (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
						return RoactModule.createElement(SquadComponentAccessWrapperModule, { parentChannelId = Text }, RoactModule.createElement(SquadJoinButtonModule, {
							isFullWidth = false,
							isInCard = false,
							layoutOrder = 0,
							shouldAnimate = true,
							shouldShowSignifier = true,
							conversationId = Text,
							onActivated = OnActivated,
							squadButtonSource = SquadButtonSourceEnum.ChatConversationScreen,
							squadLocation = p2.chatPlacement,
							testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatConversationTopBarButton("squadJoin") else nil
						}))
					end)
				})
			end
		end
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
			isRoot = IsRoot,
			renderRight = function()
				-- upvalues: RoactModule (upval), Frame (ref)
				return RoactModule.createFragment({ groupUp = Frame })
			end,
			leftPaddingOverride = AppChatInnerPaddingScreenProps,
			rightPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12)
		}
	end
end

function ChatConversationScreen.init(p1)
	-- upvalues: RoactModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), LoggerModule (copy), EnumScreensModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), FFlagAppChatFixBackButtonOnRotationModule (copy), CanPopParentStackModule (copy), GetTopBarStoreModule (copy), ArgCheckModule (copy), CryoModule (copy), ReadingMessagesIsEnabledModule (copy)
	p1.toastProps = nil
	p1.inputBoxRef = RoactModule.createRef()
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		p1.lastHeaderText = nil
		p1.lastIsPrivateConversation = nil
	end
	local Navigation = p1.props.navigation
	local ConversationIdParam = Navigation.getParam and Navigation.getParam("conversationId", nil)
	
	function p1.navigateToConversationOverlay()
		-- upvalues: LoggerModule (upval), ConversationIdParam (copy), p1 (copy), Navigation (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To ConversationOverlay: {} from {screen}", ConversationIdParam)
		Navigation.navigate(EnumScreensModule.ConversationOverlay, {
			isOverlay = true,
			conversationId = p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil)
		})
	end
	
	function p1.navigateToChatDetails()
		-- upvalues: p1 (copy), LoggerModule (upval), Navigation (copy), EnumScreensModule (upval)
		local ConversationIdParam = p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil)
		LoggerModule:info("Navigate To ChatDetails: {} from {screen}", ConversationIdParam)
		Navigation.navigate(EnumScreensModule.ChatDetails, { conversationId = ConversationIdParam })
	end
	
	if FFlagAppChatTopBarConfigDrivenModule() or FFlagAppChatTopBarSignalsStoreModule then
		local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
		local config = {
			navigateToChatDetails = p1.navigateToChatDetails,
			conversationId = ConversationIdParam
		}
		
		if FFlagAppChatTopBarConfigDrivenModule() then
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
			config.backButtonEnabled = NoWideModeScreenProps1
			config.isRoot = IsRoot
			config.leftPaddingOverride = if WideModeScreenProps then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12)
			config.rightPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12)
		end
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, config)
	else
		local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
		SetScreenTopBarScreenProps(EnumScreensModule.ChatConversation, {
			navigateToChatDetails = p1.navigateToChatDetails,
			conversationId = ConversationIdParam
		})
	end
	function p1.writeScreenTopBar()
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
	
	function p1.queueNavigationToToast(ToastProps)
		-- upvalues: p1 (copy)
		if p1.props.navigation.isFocused() then
			p1.navigateToToast(ToastProps)
			p1.toastProps = nil
			
			return
		else
			p1.toastProps = ToastProps
		end
	end
	
	function p1.onDidFocus()
		-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), p1 (copy)
		if FFlagAppChatTopBarConfigDrivenModule() then
			p1.writeScreenTopBar()
		end
		p1.setInputBarCloseCallback(p1.releaseFocus)
		
		if p1.toastProps then
			p1.navigateToToast(p1.toastProps)
			p1.toastProps = nil
		end
	end
	
	function p1.releaseFocus()
		-- upvalues: p1 (copy)
		if p1.inputBoxRef and p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p1.onWillBlur()
		-- upvalues: p1 (copy)
		p1.releaseFocus()
		p1.setInputBarCloseCallback()
	end
	
	function p1.navigateToToast(ToastProps)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval), CryoModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, CryoModule.Dictionary.union(ToastProps, { isOverlay = true }))
	end
	
	function p1.openViewProfile(p2)
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
	
	function p1.openGameDetailsPage(p2, p3)
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
	
	function p1.navigateToChatConversation(ConversationId)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
	end
	
	function p1.navigateToScreen(p2, p3, IsOverlay)
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
	
	function p1.navigateBack()
		-- upvalues: p1 (copy)
		if p1.props.navigation.isFocused() then
			p1.props.navigation.goBack()
		end
	end
	
	function p1.navigateToChatLanding()
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To ChatLanding from {screen}")
		
		if p1.props.navigation.getScreenProps("wideMode", false) then
			p1.props.navigation.navigate(EnumScreensModule.EmptyConversation)
			
			return
		else
			p1.props.navigation.navigate(EnumScreensModule.ChatLanding)
		end
	end
	
	function p1.navigateToSquadLobby(ConversationId)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To SquadLobby from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
	end
	
	function p1.updateConversationTitle(Raw)
		-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), p1 (copy), FFlagAppChatTopBarSignalsStoreModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), ArgCheckModule (upval)
		local Config = if Raw then { shouldLocalize = false, raw = Raw } else {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		}
		
		if FFlagAppChatTopBarConfigDrivenModule() then
			p1.lastHeaderText = Config
		end
		local config = { headerText = Config }
		
		if FFlagAppChatTopBarConfigDrivenModule() or FFlagAppChatTopBarSignalsStoreModule then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, config)
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.ChatConversation, config)
		end
	end
	
	function p1.setInputBarCloseCallback(CloseInputBar)
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy), ArgCheckModule (upval)
		if FFlagAppChatTopBarSignalsStoreModule then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatLanding, { closeInputBar = CloseInputBar })
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.ChatLanding, { closeInputBar = CloseInputBar })
		end
	end
	
	function p1.getReadingMessagesIsEnabled()
		-- upvalues: ReadingMessagesIsEnabledModule (upval), p1 (copy)
		return ReadingMessagesIsEnabledModule(p1.props.navigation)
	end
	
	function p1.updatePrivateConversationTopBar(IsPrivateConversation)
		-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), p1 (copy), FFlagAppChatTopBarSignalsStoreModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), ArgCheckModule (upval)
		if FFlagAppChatTopBarConfigDrivenModule() then
			p1.lastIsPrivateConversation = IsPrivateConversation
		end
		if FFlagAppChatTopBarConfigDrivenModule() or FFlagAppChatTopBarSignalsStoreModule then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, { isPrivateConversation = IsPrivateConversation })
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.ChatConversation, { isPrivateConversation = IsPrivateConversation })
		end
	end
end

function ChatConversationScreen.didUpdate(p1, p2)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), ArgCheckModule (copy)
	local ConversationIdParam = p1.props.navigation and (p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil))
	
	if (p2.navigation and (p2.navigation.getParam and p2.navigation.getParam("conversationId", nil))) ~= ConversationIdParam then
		if FFlagAppChatTopBarConfigDrivenModule() then
			p1.lastHeaderText = nil
			p1.lastIsPrivateConversation = nil
		end
		if FFlagAppChatTopBarConfigDrivenModule() or FFlagAppChatTopBarSignalsStoreModule then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, { conversationId = ConversationIdParam })
			
			return
		end
		local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
		SetScreenTopBarScreenProps(EnumScreensModule.ChatConversation, { conversationId = ConversationIdParam })
	end
end

function ChatConversationScreen.render(p1)
	-- upvalues: ArgCheckModule (copy), RoactModule (copy), RoactNavigationModule (copy), ChatConversationContainerModule (copy)
	local NavigationInChatConversationScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in ChatConversationScreen")
	local ConversationIdParam = NavigationInChatConversationScreen.getParam("conversationId", nil)
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		container = RoactModule.createElement(ChatConversationContainerModule, {
			topBarHeight = NavigationInChatConversationScreen.getScreenProps("topBarHeight", 0),
			wideMode = NavigationInChatConversationScreen.getScreenProps("wideMode", false),
			openGameDetailsPage = p1.openGameDetailsPage,
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

function ChatConversationScreen.didMount(p1)
	-- upvalues: LoggerModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy)
	LoggerModule:info("{screen} mounted")
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		local Navigation = p1.props.navigation
		local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatConversation, {
			leftPaddingOverride = if WideModeScreenProps then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12)
		})
	end
end

function ChatConversationScreen:willUnmount()
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy)
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).clearScreenTopBar(EnumScreensModule.ChatConversation)
	end
end

return ChatConversationScreen