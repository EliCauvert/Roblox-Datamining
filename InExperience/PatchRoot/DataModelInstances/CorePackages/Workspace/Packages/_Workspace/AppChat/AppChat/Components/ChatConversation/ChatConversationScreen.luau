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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatFixBackButtonOnRotationModule = require(appChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local canPopParentStackModule = require(appChat.Utils.canPopParentStack)

local function _(p0) --[[ line: 40 | named "getBackButtonConfig" ]]
	-- upvalues: fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref)
	local wideMode = p0.getScreenProps("wideMode", false)
	
	if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(p0) then
		return true, false
	end
	return not wideMode, wideMode
end

local chatConversationScreen = roactModule.PureComponent:extend("ChatConversationScreen")
chatConversationScreen.defaultProps = { navigation = nil }

function chatConversationScreen.navigationOptions(p1) --[[ line: 52 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), getFFlagIsSquadEnabled (ref), enumScreensModule (ref), roactModule (ref), withChatPlacementContext (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local navigation = p1.navigation
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		local var23, var24
		local wideMode = navigation.getScreenProps("wideMode", false)
		
		if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
			var23 = true
			var24 = false
		else
			var23 = not wideMode
			var24 = wideMode
		end
		return {
			tabBarVisible = false,
			lockIconEnabled = true,
			absorbInput = false,
			backButtonEnabled = var23,
			isRoot = var24
		}
	else
		local conversationId
		local var25 = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
		local frame = nil
		
		if getFFlagIsSquadEnabled() then
			conversationId = navigation.getParam("conversationId", nil)
			conversationId = if conversationId then tostring(conversationId) else nil
			
			local var28 = function() --[[ line: 74 ]]
				-- upvalues: navigation (ref), enumScreensModule (copy), conversationId (write)
				navigation.navigate(enumScreensModule.SquadLobby, { conversationId = conversationId })
			end
			
			if conversationId then
				frame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Right }),
					GroupUpButton = withChatPlacementContext(function(p2) --[[ line: 88 ]]
						-- upvalues: roactModule (copy), squadComponentAccessWrapperModule (copy), conversationId (write), squadJoinButtonModule (copy), var28 (ref), squadButtonSourceEnum (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
						return roactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = conversationId }, roactModule.createElement(squadJoinButtonModule, {
							isFullWidth = false,
							isInCard = false,
							layoutOrder = 0,
							shouldAnimate = true,
							shouldShowSignifier = true,
							conversationId = conversationId,
							onActivated = var28,
							squadButtonSource = squadButtonSourceEnum.ChatConversationScreen,
							squadLocation = p2.chatPlacement,
							testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatConversationTopBarButton("squadJoin") else nil
						}))
					end)
				})
			end
		end
		local var30
		local wideMode = navigation.getScreenProps("wideMode", false)
		
		if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
			conversationId = true
			var30 = false
		else
			conversationId = not wideMode
			var30 = wideMode
		end
		return {
			tabBarVisible = false,
			lockIconEnabled = true,
			absorbInput = false,
			backButtonEnabled = conversationId,
			isRoot = var30,
			renderRight = function() --[[ line: 121 ]]
				-- upvalues: roactModule (copy), frame (write)
				return roactModule.createFragment({ groupUp = frame })
			end,
			leftPaddingOverride = var25,
			rightPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12)
		}
	end
end

function chatConversationScreen.init(p3) --[[ line: 131 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), roactModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), loggerModule (ref), enumScreensModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), getTopBarStoreModule (ref), argCheckModule (ref), cryoModule (ref), readingMessagesIsEnabledModule (ref)
	p3.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p3.props.navigation, "Party.ConversationPage") else nil
	p3.toastProps = nil
	p3.inputBoxRef = roactModule.createRef()
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		p3.lastHeaderText = nil
		p3.lastIsPrivateConversation = nil
	end
	local navigation = p3.props.navigation
	local conversationId = navigation.getParam and navigation.getParam("conversationId", nil)
	
	function p3.navigateToConversationOverlay() --[[ line: 148 ]]
		-- upvalues: loggerModule (copy), conversationId (ref), p3 (ref), navigation (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ConversationOverlay: {} from {screen}", conversationId)
		navigation.navigate(enumScreensModule.ConversationOverlay, {
			isOverlay = true,
			conversationId = p3.props.navigation.getParam and p3.props.navigation.getParam("conversationId", nil)
		})
	end
	
	function p3.navigateToChatDetails() --[[ line: 158 ]]
		-- upvalues: p3 (ref), loggerModule (copy), navigation (ref), enumScreensModule (copy)
		local conversationId = p3.props.navigation.getParam and p3.props.navigation.getParam("conversationId", nil)
		loggerModule:info("Navigate To ChatDetails: {} from {screen}", conversationId)
		navigation.navigate(enumScreensModule.ChatDetails, { conversationId = conversationId })
	end
	
	if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
		local wideMode = navigation.getScreenProps("wideMode", false)
		local t = {
			navigateToChatDetails = p3.navigateToChatDetails,
			conversationId = conversationId
		}
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			local var36, var37
			local wideMode_1 = navigation.getScreenProps("wideMode", false)
			
			if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
				var36 = true
				var37 = false
			else
				var36 = not wideMode_1
				var37 = wideMode_1
			end
			t.backButtonEnabled = var36
			t.isRoot = var37
			t.leftPaddingOverride = if wideMode then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
			t.rightPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12)
		end
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, t)
	else
		local setScreenTopBar = p3.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, {
			navigateToChatDetails = p3.navigateToChatDetails,
			conversationId = conversationId
		})
	end
	function p3.writeScreenTopBar() --[[ line: 190 ]]
		-- upvalues: p3 (ref), fFlagAppChatFixBackButtonOnRotationModule (copy), canPopParentStackModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy)
		local var42, var43
		local var39 = if p3.props.navigation.getParam then p3.props.navigation.getParam("conversationId", nil) else nil
		local wideMode = p3.props.navigation.getScreenProps("wideMode", false)
		local navigation = p3.props.navigation
		local wideMode_1 = navigation.getScreenProps("wideMode", false)
		
		if fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(navigation) then
			var42 = true
			var43 = false
		else
			var42 = not wideMode_1
			var43 = wideMode_1
		end
		local t = {
			navigateToChatDetails = p3.navigateToChatDetails,
			conversationId = var39,
			backButtonEnabled = var42,
			isRoot = var43,
			leftPaddingOverride = if wideMode then p3.props.navigation.getScreenProps("appChatInnerPadding", 12) else p3.props.navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = p3.props.navigation.getScreenProps("appChatOuterPadding", 12)
		}
		
		if p3.lastHeaderText ~= nil then
			t.headerText = p3.lastHeaderText
		end
		if p3.lastIsPrivateConversation ~= nil then
			t.isPrivateConversation = p3.lastIsPrivateConversation
		end
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, t)
	end
	
	function p3.queueNavigationToToast(p4) --[[ line: 218 ]]
		-- upvalues: p3 (ref)
		if p3.props.navigation.isFocused() then
			p3.navigateToToast(p4)
			p3.toastProps = nil
			
			return
		end
		p3.toastProps = p4
	end
	
	function p3.onDidFocus() --[[ line: 228 ]]
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p3 (ref)
		if fFlagAppChatTopBarConfigDrivenModule() then
			p3.writeScreenTopBar()
		end
		p3.setInputBarCloseCallback(p3.releaseFocus)
		
		if p3.toastProps then
			p3.navigateToToast(p3.toastProps)
			p3.toastProps = nil
		end
	end
	
	function p3.releaseFocus() --[[ line: 244 ]]
		-- upvalues: p3 (ref)
		if p3.inputBoxRef and p3.inputBoxRef:getValue() then
			p3.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p3.onWillBlur() --[[ line: 250 ]]
		-- upvalues: p3 (ref)
		p3.releaseFocus()
		p3.setInputBarCloseCallback()
	end
	
	function p3.navigateToToast(p5) --[[ line: 256 ]]
		-- upvalues: loggerModule (copy), p3 (ref), enumScreensModule (copy), cryoModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p3.props.navigation.navigate(enumScreensModule.RoactChatToast, cryoModule.Dictionary.union(p5, { isOverlay = true }))
	end
	
	function p3.openViewProfile(p6) --[[ line: 265 ]]
		-- upvalues: p3 (ref), enumScreensModule (copy), loggerModule (copy)
		local viewUserProfile = p3.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			loggerModule:info("Navigate To UserProfile from {screen}")
			viewUserProfile(p6, {})
			
			return
		end
		loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p3.openGameDetailsPage(p7, p8) --[[ line: 277 ]]
		-- upvalues: p3 (ref), enumScreensModule (copy), loggerModule (copy)
		local gameDetail = p3.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.GameDetail]
		
		if gameDetail then
			loggerModule:info("Navigate To GameDetail from " .. tostring(p8))
			gameDetail(p7, p8)
			
			return
		end
		loggerModule:warning("GameDetail page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p3.navigateToChatConversation(p9) --[[ line: 290 ]]
		-- upvalues: loggerModule (copy), p3 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p9)
		p3.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p9 })
	end
	
	function p3.navigateToScreen(p10, p11, p12) --[[ line: 295 ]]
		-- upvalues: loggerModule (copy), p3 (ref), cryoModule (copy)
		loggerModule:info("Navigate To Screen: {} from {screen}", p10)
		local navigation = p3.props.navigation
		local conversationId = navigation and (navigation.getParam and navigation.getParam("conversationId", nil))
		
		if p11 then
			p3.props.navigation.navigate(p10, cryoModule.Dictionary.union({ conversationId = conversationId, isOverlay = p12 }, p11))
			
			return
		end
		p3.props.navigation.navigate(p10, { conversationId = conversationId })
	end
	
	function p3.navigateBack() --[[ line: 315 ]]
		-- upvalues: p3 (ref)
		if p3.props.navigation.isFocused() then
			p3.props.navigation.goBack()
		end
	end
	
	function p3.navigateToChatLanding() --[[ line: 321 ]]
		-- upvalues: loggerModule (copy), p3 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ChatLanding from {screen}")
		
		if p3.props.navigation.getScreenProps("wideMode", false) then
			p3.props.navigation.navigate(enumScreensModule.EmptyConversation)
			
			return
		end
		p3.props.navigation.navigate(enumScreensModule.ChatLanding)
	end
	
	function p3.navigateToSquadLobby(p13) --[[ line: 331 ]]
		-- upvalues: loggerModule (copy), p3 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To SquadLobby from {screen}")
		p3.props.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = p13 })
	end
	
	function p3.updateConversationTitle(p14) --[[ line: 336 ]]
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p3 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), argCheckModule (copy)
		local var46 = if p14 then { shouldLocalize = false, raw = p14 } else {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		}
		
		if fFlagAppChatTopBarConfigDrivenModule() then
			p3.lastHeaderText = var46
		end
		local t = { headerText = var46 }
		
		if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, t)
			
			return
		end
		local setScreenTopBar = p3.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, t)
	end
	
	function p3.setInputBarCloseCallback(p15) --[[ line: 361 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p3 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, { closeInputBar = p15 })
			
			return
		end
		local setScreenTopBar = p3.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatLanding, { closeInputBar = p15 })
	end
	
	function p3.getReadingMessagesIsEnabled() --[[ line: 371 ]]
		-- upvalues: readingMessagesIsEnabledModule (copy), p3 (ref)
		return readingMessagesIsEnabledModule(p3.props.navigation)
	end
	
	function p3.updatePrivateConversationTopBar(p16) --[[ line: 375 ]]
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p3 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), argCheckModule (copy)
		if fFlagAppChatTopBarConfigDrivenModule() then
			p3.lastIsPrivateConversation = p16
		end
		if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, { isPrivateConversation = p16 })
			
			return
		end
		local setScreenTopBar = p3.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, { isPrivateConversation = p16 })
	end
end

function chatConversationScreen.didUpdate(p17, p18) --[[ line: 390 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), argCheckModule (ref)
	local conversationId = p17.props.navigation and (p17.props.navigation.getParam and p17.props.navigation.getParam("conversationId", nil))
	
	if (p18.navigation and (p18.navigation.getParam and p18.navigation.getParam("conversationId", nil))) ~= conversationId then
		if fFlagAppChatTopBarConfigDrivenModule() then
			p17.lastHeaderText = nil
			p17.lastIsPrivateConversation = nil
		end
		if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, { conversationId = conversationId })
			
			return
		end
		local setScreenTopBar = p17.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatConversation, { conversationId = conversationId })
	end
end

function chatConversationScreen.render(p19) --[[ line: 418 ]]
	-- upvalues: argCheckModule (ref), roactModule (ref), roactNavigationModule (ref), chatConversationContainerModule (ref)
	local var53 = argCheckModule.isNotNil(p19.props.navigation, "navigation in ChatConversationScreen")
	local conversationId = var53.getParam("conversationId", nil)
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		container = roactModule.createElement(chatConversationContainerModule, {
			topBarHeight = var53.getScreenProps("topBarHeight", 0),
			wideMode = var53.getScreenProps("wideMode", false),
			openGameDetailsPage = p19.openGameDetailsPage,
			getReadingMessagesIsEnabled = p19.getReadingMessagesIsEnabled,
			conversationId = conversationId and tostring(conversationId) or nil,
			inputBoxRef = p19.inputBoxRef,
			updateConversationTitle = p19.updateConversationTitle,
			updatePrivateConversationTopBar = p19.updatePrivateConversationTopBar,
			releaseInputBarFocus = p19.releaseFocus,
			navigateBack = p19.navigateBack,
			navigateToToast = p19.queueNavigationToToast,
			openViewProfile = p19.openViewProfile,
			navigateToChatConversation = p19.navigateToChatConversation,
			navigateToChatLanding = p19.navigateToChatLanding,
			navigateToScreen = p19.navigateToScreen,
			navigateToSquadLobby = p19.navigateToSquadLobby,
			navigateToConversationOverlay = p19.navigateToConversationOverlay,
			navigation = p19.props.navigation
		}),
		eventsAdapter = roactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = p19.onDidFocus, onWillBlur = p19.onWillBlur })
	})
end

function chatConversationScreen.didMount(p20) --[[ line: 458 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		local navigation = p20.props.navigation
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatConversation, {
			leftPaddingOverride = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12)
		})
	end
end

function chatConversationScreen.willUnmount(p21) --[[ line: 472 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.ChatConversation)
	end
	if p21.ixpSubscription then
		p21.ixpSubscription.remove()
	end
end

return chatConversationScreen