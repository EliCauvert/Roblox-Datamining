local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(appChat.Constants)
local enumScreensModule = require(appChat.EnumScreens)
local chatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local searchTopBarModule = require(appChat.Components.ChatLanding.SearchTopBar)
local chatLandingSearchRowModule = require(script.Parent.ChatLandingSearchRow)
local snoozeToastNotificationsButtonModule = require(appChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local useChatLandingVisibilityModule = require(appChat.Hooks.useChatLandingVisibility)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryEventsModule = require(appChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local streamNotificationsBellIcon = require(parent.StreamNotifications).StreamNotificationsBellIcon
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local domLocatorsModule = require(appChat.Utils.DomLocators)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatFoundationSearchInputModule = require(appChat.Flags.FFlagAppChatFoundationSearchInput)
local fFlagEnableHeaderBarButtonsUpdate = sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local fFlagStreamNotificationBellEntryPoint = sharedFlagsModule.FFlagStreamNotificationBellEntryPoint
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local flyoutLeftHeader = require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP

local function SearchTopBarWrapper()
	-- upvalues: getTopBarStoreModule (ref), enumScreensModule (ref), useLocalization (ref), reactModule (ref), searchTopBarModule (ref)
	local var1 = getTopBarStoreModule(false)
	local setScreenTopBar = var1.setScreenTopBar
	local var2 = var1.getScreenTopBar(enumScreensModule.ChatLanding)(false)
	local var3 = useLocalization({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		filterBox = reactModule.createElement(searchTopBarModule, {
			initialInputText = var2.filterText,
			cancelText = var3.cancelText,
			searchPlaceholderText = var3.searchPlaceholderText,
			captureFocusOnMount = var2.shouldAutoFocusCenter,
			onSelectCallback = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				local closeInputBar = var2.closeInputBar
				
				if closeInputBar then
					closeInputBar()
				end
			end, { var2.closeInputBar }),
			resetOnMount = reactModule.useCallback(function()
				-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
				setScreenTopBar(enumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
			end, { setScreenTopBar }),
			cancelCallback = reactModule.useCallback(function()
				-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
				setScreenTopBar(enumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
			end, { setScreenTopBar }),
			textChangedCallback = reactModule.useCallback(function(p1)
				-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
				setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p1 })
			end, { setScreenTopBar })
		})
	})
end

local var1 = function()
	-- upvalues: reactModule (ref), SearchTopBarWrapper (ref)
	return reactModule.createElement(SearchTopBarWrapper)
end

local var2 = function()
	-- upvalues: reactModule (ref), chatLandingSearchRowModule (ref)
	return reactModule.createElement(chatLandingSearchRowModule)
end

return function(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), constantsModule (ref), getTopBarStoreModule (ref), useSignalState (ref), useChatLandingVisibilityModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useLocalization (ref), fFlagAppChatFoundationSearchInputModule (ref), var2 (ref), var1 (ref), reactModule (ref), enumScreensModule (ref), chatLandingTelemetryEventsModule (ref), flyoutLeftHeader (ref), flyoutSidePanelIXP (ref), fFlagEnableHeaderBarButtonsUpdate (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), argoPartyExperimentation (ref), streamNotificationsBellIcon (ref), fFlagStreamNotificationBellEntryPoint (ref), appPage (ref), snoozeToastNotificationsButtonModule (ref), iconButton (ref), images (ref), getFFlagIsSquadEnabled (ref), chatTopBarBaseModule (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local screenName = p1.screenName
	local navigation = p1.navigation
	local isInExperience = navigation.getScreenProps("isInExperience", false)
	local wideMode = navigation.getScreenProps("wideMode", false)
	local var3 = constantsModule:GetIconButtonWidth(wideMode)
	local var4 = getTopBarStoreModule(false)
	local setScreenTopBar = var4.setScreenTopBar
	local var5 = useSignalState(var4.getScreenTopBar(screenName))
	local var6 = useChatLandingVisibilityModule()
	local var7 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local shouldRenderCenter = var5.shouldRenderCenter
	local rightHidden = var5.rightHidden
	local headerText = var5.headerText or { raw = "", shouldLocalize = false }
	local var8 = if headerText.shouldLocalize then useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	}).headerText else headerText.raw or ""
	local var9 = if shouldRenderCenter then if fFlagAppChatFoundationSearchInputModule then var2 else var1 else nil
	local var10 = reactModule.useCallback(function()
		-- upvalues: setScreenTopBar (ref), enumScreensModule (copy), var7 (ref), chatLandingTelemetryEventsModule (copy)
		setScreenTopBar(enumScreensModule.ChatLanding, {
			shouldRenderCenter = true,
			shouldAutoFocusCenter = true,
			isSecondary = true
		})
		var7.emit(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
	end, { var7, setScreenTopBar })
	local var11 = reactModule.useCallback(function()
		-- upvalues: navigation (ref), enumScreensModule (copy), var7 (ref), chatLandingTelemetryEventsModule (copy)
		navigation.navigate(enumScreensModule.CreateNewChat)
		var7.emit(chatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
	end, { var7, navigation })
	local var12 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not isInExperience
	
	return reactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderRight = if not shouldRenderCenter then function()
			-- upvalues: rightHidden (ref), var6 (ref), fFlagEnableHeaderBarButtonsUpdate (copy), reactModule (copy), foundationModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy), var10 (ref), argoPartyExperimentation (copy), var11 (ref), streamNotificationsBellIcon (copy), fFlagStreamNotificationBellEntryPoint (copy), appPage (copy), snoozeToastNotificationsButtonModule (copy), var3 (ref), iconButton (copy), images (copy), getFFlagIsSquadEnabled (copy), wideMode (ref)
			if rightHidden then
				return nil
			end
			local topBarShowSearch = var6.topBarShowSearch
			local topBarShowCreateChatGroup = var6.topBarShowCreateChatGroup
			local topBarShowNotifications = var6.topBarShowNotifications
			local topBarShowSnoozeNotifications = var6.topBarShowSnoozeNotifications
			local notificationCount = var6.notificationCount
			
			return if fFlagEnableHeaderBarButtonsUpdate then reactModule.createElement(foundationModule.View, {
				tag = "row align-x-right align-y-center gap-xsmall auto-xy"
			}, {
				filter = if topBarShowSearch then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 1,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.MagnifyingGlass,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("search") else nil,
					onActivated = var10
				}) else nil,
				createNewChat = if topBarShowCreateChatGroup then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					size = foundationModule.Enums.InputSize.Medium,
					icon = if argoPartyExperimentation.getIsRenameEnabled() then foundationModule.Enums.IconName.PencilSquare else foundationModule.Enums.IconName.PlusLarge,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
					onActivated = var11
				}) else nil,
				notifications = if topBarShowNotifications then reactModule.createElement(streamNotificationsBellIcon, {
					layoutOrder = 3,
					notificationCount = notificationCount,
					entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
				}) else nil,
				snoozeChatNotifications = if topBarShowSnoozeNotifications then reactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var3, 1, 0) }) else nil
			}) else reactModule.createElement(reactModule.Fragment, nil, {
				filter = topBarShowSearch and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 1,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.MagnifyingGlass,
					testId = domLocatorsModule.chatLandingTopBarIconButton("search"),
					onActivated = var10
				}) else reactModule.createElement(iconButton, {
					layoutOrder = 1,
					size = UDim2.new(0, var3, 1, 0),
					icon = images["icons/common/search"],
					onActivated = var10
				})),
				createNewChat = topBarShowCreateChatGroup and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.PlusLarge,
					testId = domLocatorsModule.chatLandingTopBarIconButton("createChat"),
					onActivated = var11
				}) else reactModule.createElement(iconButton, {
					layoutOrder = 2,
					size = UDim2.new(0, var3, 1, 0),
					icon = if getFFlagIsSquadEnabled() then images["icons/common/plus"] else images["icons/actions/compose"],
					onActivated = var11
				})),
				notifications = topBarShowNotifications and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.View, {
					tag = "row align-x-center align-y-center radius-circle",
					Size = UDim2.new(0, var3, 0, var3),
					testId = domLocatorsModule.chatLandingTopBarIconButton("notifications")
				}, {
					BellIcon = reactModule.createElement(streamNotificationsBellIcon, {
						notificationCount = notificationCount,
						compactWidth = not wideMode,
						entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil
					})
				}) else reactModule.createElement(streamNotificationsBellIcon, {
					layoutOrder = 3,
					notificationCount = notificationCount,
					compactWidth = not wideMode,
					entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil
				})),
				snoozeChatNotifications = if topBarShowSnoozeNotifications then reactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var3, 1, 0) }) else nil
			})
		end else nil,
		renderCenter = var9,
		renderLeft = if var12 then function()
			-- upvalues: reactModule (copy), flyoutLeftHeader (copy), var8 (ref), flyoutSidePanelIXP (copy)
			return reactModule.createElement(flyoutLeftHeader, {
				titleText = var8,
				isFlyoutEntrypointEnabled = flyoutSidePanelIXP.isFlyoutSidePanelEnabled(),
				isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
			})
		end else nil,
		hideTitle = var12
	})
end