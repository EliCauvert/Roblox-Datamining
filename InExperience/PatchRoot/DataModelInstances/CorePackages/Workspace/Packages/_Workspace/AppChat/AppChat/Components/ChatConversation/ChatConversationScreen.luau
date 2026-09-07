local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local argCheckModule = require(parent.ArgCheck)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local cryoModule = require(parent.Cryo)
local readingMessagesIsEnabledModule = require(script.Parent.Utils.readingMessagesIsEnabled)
local chatConversationContainerModule = require(script.Parent.ChatConversationContainer)
local loggerModule = require(script.Parent.Logger)
local withChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).withChatPlacementContext
local squadJoinButtonModule = require(parent.Squads.SquadJoinButton)
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local squadComponentAccessWrapperModule = require(parent.Squads.SquadComponentAccessWrapper)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagAppChatMomentShareCardNavigation = sharedFlagsModule.FFlagAppChatMomentShareCardNavigation
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagAppChatMomentShareCardModule = require(appChat.Flags.FFlagAppChatMomentShareCard)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatFixBackButtonOnRotationModule = require(appChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local canPopParentStackModule = require(appChat.Utils.canPopParentStack)

local function _(p1)
	-- upvalues: fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref)
	local wideMode = p1.getScreenProps("wideMode", false)
	
	if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(p1) then
		return true, false
	end
	return not wideMode, wideMode
end

local chatConversationScreen = roactModule.PureComponent:extend("ChatConversationScreen")
chatConversationScreen.defaultProps = { navigation = nil }

function chatConversationScreen.navigationOptions(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), getFFlagIsSquadEnabled (ref), enumScreensModule (ref), roactModule (ref), withChatPlacementContext (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local navigation = p1.navigation
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		local var1, var2
		local wideMode = navigation.getScreenProps("wideMode", false)
		
		if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
			var1 = true
			var2 = false
		else
			var1 = not wideMode
			var2 = wideMode
		end
		return {
			tabBarVisible = false,
			lockIconEnabled = true,
			absorbInput = false,
			backButtonEnabled = var1,
			isRoot = var2
		}
	else
		local conversationId
		local var3 = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
		local frame = nil
		
		if getFFlagIsSquadEnabled() then
			conversationId = navigation.getParam("conversationId", nil)
			conversationId = if conversationId then tostring(conversationId) else nil
			
			local var4 = function()
				-- upvalues: navigation (ref), enumScreensModule (copy), conversationId (write)
				navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
			end
			
			if conversationId then
				frame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Right }),
					GroupUpButton = withChatPlacementContext(function(p2)
						-- upvalues: roactModule (copy), squadComponentAccessWrapperModule (copy), conversationId (write), squadJoinButtonModule (copy), var4 (ref), squadButtonSourceEnum (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
						return roactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversationId }, roactModule.createElement(squadJoinButtonModule, {
							isFullWidth = false,
							isInCard = false,
							layoutOrder = 0,
							shouldAnimate = true,
							shouldShowSignifier = true,
							conversationId = conversationId,
							onActivated = var4,
							squadButtonSource = squadButtonSourceEnum.ChatConversationScreen,
							squadLocation = p2.chatPlacement,
							testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatConversationTopBarButton("squadJoin") else nil
						}))
					end)
				})
			end
		end
		local var5
		local wideMode = navigation.getScreenProps("wideMode", false)
		
		if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
			conversationId = true
			var5 = false
		else
			conversationId = not wideMode
			var5 = wideMode
		end
		return {
			tabBarVisible = false,
			lockIconEnabled = true,
			absorbInput = false,
			backButtonEnabled = conversationId,
			isRoot = var5,
			renderRight = function()
				-- upvalues: roactModule (copy), frame (write)
				return roactModule.createFragment({ groupUp = frame })
			end,
			leftPaddingOverride = var3,
			rightPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12)
		}
	end
end

function chatConversationScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), roactModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), loggerModule (ref), enumScreensModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), getTopBarStoreModule (ref), argCheckModule (ref), cryoModule (ref), readingMessagesIsEnabledModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ConversationPage") else nil
	p1.toastProps = nil
	p1.inputBoxRef = roactModule.createRef()
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		p1.lastHeaderText = nil
		p1.lastIsPrivateConversation = nil
	end
	local navigation = p1.props.navigation
	local conversationId = navigation.getParam and navigation.getParam("conversationId", nil)
	
	function p3.navigateToConversationOverlay()
		-- upvalues: loggerModule (copy), conversationId (ref), p1 (ref), navigation (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ConversationOverlay: {} from {screen}", conversationId)
		navigation.navigate(enumScreensModule.ConversationOverlay, {
			isOverlay = true,
			conversationId = p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil)
		})
	end
	
	function p3.navigateToChatDetails()
		-- upvalues: p1 (ref), loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), navigation (ref), enumScreensModule (copy)
		local conversationId = p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil)
		loggerModule:info("Navigate To ChatDetails: {} from {screen}", conversationId)
		navigation.navigate(enumScreensModule.ChatDetails, if getFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = conversationId,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversationId = conversationId })
	end
	
	if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
		local wideMode = navigation.getScreenProps("wideMode", false)
		local t = {
			navigateToChatDetails = p1.navigateToChatDetails,
			conversationId = conversationId
		}
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			local var1, var2
			local wideMode_1 = navigation.getScreenProps("wideMode", false)
			
			if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
				var1 = true
				var2 = false
			else
				var1 = not wideMode_1
				var2 = wideMode_1
			end
			t.backButtonEnabled = var1
			t.isRoot = var2
			t.leftPaddingOverride = if wideMode then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
			t.rightPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12)
		end
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, t)
	else
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, {
			navigateToChatDetails = p1.navigateToChatDetails,
			conversationId = conversationId
		})
	end
	function p3.writeScreenTopBar()
		-- upvalues: p1 (ref), fFlagAppChatFixBackButtonOnRotationModule (copy), canPopParentStackModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy)
		local var3, var4
		local var5 = if p1.props.navigation.getParam then p1.props.navigation.getParam("conversationId", nil) else nil
		local wideMode = p1.props.navigation.getScreenProps("wideMode", false)
		local navigation = p1.props.navigation
		local wideMode_1 = navigation.getScreenProps("wideMode", false)
		
		if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
			var3 = true
			var4 = false
		else
			var3 = not wideMode_1
			var4 = wideMode_1
		end
		local t = {
			navigateToChatDetails = p1.navigateToChatDetails,
			conversationId = var5,
			backButtonEnabled = var3,
			isRoot = var4,
			leftPaddingOverride = if wideMode then p1.props.navigation.getScreenProps("appChatInnerPadding", 12) else p1.props.navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = p1.props.navigation.getScreenProps("appChatOuterPadding", 12)
		}
		
		if p1.lastHeaderText ~= nil then
			t.headerText = p1.lastHeaderText
		end
		if p1.lastIsPrivateConversation ~= nil then
			t.isPrivateConversation = p1.lastIsPrivateConversation
		end
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, t)
	end
	
	function p3.queueNavigationToToast(p2)
		-- upvalues: p1 (ref)
		if p1.props.navigation.isFocused() then
			p1.navigateToToast(p2)
			p1.toastProps = nil
			
			return
		end
		p1.toastProps = p2
	end
	
	function p3.onDidFocus()
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p1 (ref)
		if fFlagAppChatTopBarConfigDrivenModule() then
			p1.writeScreenTopBar()
		end
		p1.setInputBarCloseCallback(p1.releaseFocus)
		
		if p1.toastProps then
			p1.navigateToToast(p1.toastProps)
			p1.toastProps = nil
		end
	end
	
	function p3.releaseFocus()
		-- upvalues: p1 (ref)
		if p1.inputBoxRef and p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p3.onWillBlur()
		-- upvalues: p1 (ref)
		p1.releaseFocus()
		p1.setInputBarCloseCallback()
	end
	
	function p3.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy), cryoModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, cryoModule.Dictionary.union(p2, { isOverlay = true }))
	end
	
	function p3.openViewProfile(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy), loggerModule (copy)
		local viewUserProfile = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			loggerModule:info("Navigate To UserProfile from {screen}")
			viewUserProfile(p2, {})
			
			return
		end
		loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p3.openGameDetailsPage(p2, p3)
		-- upvalues: p1 (ref), enumScreensModule (copy), loggerModule (copy)
		local gameDetail = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.GameDetail]
		
		if gameDetail then
			loggerModule:info("Navigate To GameDetail from " .. tostring(p3))
			gameDetail(p2, p3)
			
			return
		end
		loggerModule:warning("GameDetail page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p3.getOpenMomentsImmersive()
		-- upvalues: p1 (ref), enumScreensModule (copy)
		return p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.MomentsImmersive]
	end
	
	function p3.navigateToChatConversation(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p2)
		p1.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p2 })
	end
	
	function p3.navigateToScreen(p2, p3, p4)
		-- upvalues: loggerModule (copy), p1 (ref), cryoModule (copy)
		loggerModule:info("Navigate To Screen: {} from {screen}", p2)
		local navigation = p1.props.navigation
		local conversationId = navigation and (navigation.getParam and navigation.getParam("conversationId", nil))
		
		if p3 then
			p1.props.navigation.navigate(p2, cryoModule.Dictionary.union({ conversationId = conversationId, isOverlay = p4 }, p3))
			
			return
		end
		p1.props.navigation.navigate(p2, { conversationId = conversationId })
	end
	
	function p3.navigateBack()
		-- upvalues: p1 (ref)
		if p1.props.navigation.isFocused() then
			p1.props.navigation.goBack()
		end
	end
	
	function p3.navigateToChatLanding()
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ChatLanding from {screen}")
		
		if p1.props.navigation.getScreenProps("wideMode", false) then
			p1.props.navigation.navigate(enumScreensModule.EmptyConversation)
			
			return
		end
		p1.props.navigation.navigate(enumScreensModule.ChatLanding)
	end
	
	function p3.navigateToSquadLobby(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To SquadLobby from {screen}")
		p1.props.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = p2 })
	end
	
	function p3.updateConversationTitle(p2)
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p1 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), argCheckModule (copy)
		local var3 = if p2 then { shouldLocalize = false, raw = p2 } else {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		}
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			p1.lastHeaderText = var3
		end
		local t = { headerText = var3 }
		
		if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, t)
			
			return
		end
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, t)
	end
	
	function p3.setInputBarCloseCallback(p2)
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p1 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, { closeInputBar = p2 })
			
			return
		end
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatLanding, { closeInputBar = p2 })
	end
	
	function p3.getReadingMessagesIsEnabled()
		-- upvalues: readingMessagesIsEnabledModule (copy), p1 (ref)
		return readingMessagesIsEnabledModule(p1.props.navigation)
	end
	
	function p3.updatePrivateConversationTopBar(p2)
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p1 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), argCheckModule (copy)
		if fFlagAppChatTopBarConfigDrivenModule() then
			p1.lastIsPrivateConversation = p2
		end
		if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, { isPrivateConversation = p2 })
			
			return
		end
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, { isPrivateConversation = p2 })
	end
end

function chatConversationScreen.didUpdate(p1, p2)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), argCheckModule (ref)
	local conversationId = p1.props.navigation and (p1.props.navigation.getParam and p1.props.navigation.getParam("conversationId", nil))
	
	if (p2.navigation and (p2.navigation.getParam and p2.navigation.getParam("conversationId", nil))) ~= conversationId then
		if fFlagAppChatTopBarConfigDrivenModule() then
			p1.lastHeaderText = nil
			p1.lastIsPrivateConversation = nil
		end
		if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, { conversationId = conversationId })
			
			return
		end
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, { conversationId = conversationId })
	end
end

function chatConversationScreen.render(p1)
	-- upvalues: argCheckModule (ref), fFlagAppChatMomentShareCardModule (ref), fFlagAppChatMomentShareCardNavigation (ref), roactModule (ref), roactNavigationModule (ref), chatConversationContainerModule (ref)
	local var1 = argCheckModule.isNotNil(p1.props.navigation, "navigation in ChatConversationScreen")
	local conversationId = var1.getParam("conversationId", nil)
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		container = roactModule.createElement(chatConversationContainerModule, {
			topBarHeight = var1.getScreenProps("topBarHeight", 0),
			wideMode = var1.getScreenProps("wideMode", false),
			openGameDetailsPage = p1.openGameDetailsPage,
			openMomentsDeepLink = if fFlagAppChatMomentShareCardModule and fFlagAppChatMomentShareCardNavigation then p1.getOpenMomentsImmersive() else nil,
			getReadingMessagesIsEnabled = p1.getReadingMessagesIsEnabled,
			conversationId = conversationId and tostring(conversationId) or nil,
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
		eventsAdapter = roactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = p1.onDidFocus, onWillBlur = p1.onWillBlur })
	})
end

function chatConversationScreen.didMount(p1)
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		local navigation = p1.props.navigation
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, {
			leftPaddingOverride = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12)
		})
	end
end

function chatConversationScreen.willUnmount(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.ChatConversation)
	end
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return chatConversationScreen