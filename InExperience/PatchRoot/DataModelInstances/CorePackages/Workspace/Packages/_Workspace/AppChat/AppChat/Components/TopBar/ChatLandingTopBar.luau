local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(appChat.Constants)
local enumScreensModule = require(appChat.EnumScreens)
local chatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local searchTopBarModule = require(appChat.Components.ChatLanding.SearchTopBar)
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

return function(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), constantsModule (ref), getTopBarStoreModule (ref), useSignalState (ref), useChatLandingVisibilityModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useLocalization (ref), var1 (ref), reactModule (ref), enumScreensModule (ref), chatLandingTelemetryEventsModule (ref), flyoutLeftHeader (ref), flyoutSidePanelIXP (ref), fFlagEnableHeaderBarButtonsUpdate (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), argoPartyExperimentation (ref), streamNotificationsBellIcon (ref), fFlagStreamNotificationBellEntryPoint (ref), appPage (ref), snoozeToastNotificationsButtonModule (ref), iconButton (ref), images (ref), getFFlagIsSquadEnabled (ref), chatTopBarBaseModule (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local screenName = p1.screenName
	local navigation = p1.navigation
	local isInExperience = navigation.getScreenProps("isInExperience", false)
	local wideMode = navigation.getScreenProps("wideMode", false)
	local var2 = constantsModule:GetIconButtonWidth(wideMode)
	local var3 = getTopBarStoreModule(false)
	local setScreenTopBar = var3.setScreenTopBar
	local var4 = useSignalState(var3.getScreenTopBar(screenName))
	local var5 = useChatLandingVisibilityModule()
	local var6 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local shouldRenderCenter = var4.shouldRenderCenter
	local rightHidden = var4.rightHidden
	local headerText = var4.headerText or { raw = "", shouldLocalize = false }
	local var7 = if headerText.shouldLocalize then useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	}).headerText else headerText.raw or ""
	local var8 = if shouldRenderCenter then var1 else nil
	local var9 = reactModule.useCallback(function()
		-- upvalues: setScreenTopBar (ref), enumScreensModule (copy), var6 (ref), chatLandingTelemetryEventsModule (copy)
		setScreenTopBar(enumScreensModule.ChatLanding, {
			shouldRenderCenter = true,
			shouldAutoFocusCenter = true,
			isSecondary = true
		})
		var6.emit(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
	end, { var6, setScreenTopBar })
	local var10 = reactModule.useCallback(function()
		-- upvalues: navigation (ref), enumScreensModule (copy), var6 (ref), chatLandingTelemetryEventsModule (copy)
		navigation.navigate(enumScreensModule.CreateNewChat)
		var6.emit(chatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
	end, { var6, navigation })
	local var11 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not isInExperience
	
	return reactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderRight = if not shouldRenderCenter then function()
			-- upvalues: rightHidden (ref), var5 (ref), fFlagEnableHeaderBarButtonsUpdate (copy), reactModule (copy), foundationModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy), var9 (ref), argoPartyExperimentation (copy), var10 (ref), streamNotificationsBellIcon (copy), fFlagStreamNotificationBellEntryPoint (copy), appPage (copy), snoozeToastNotificationsButtonModule (copy), var2 (ref), iconButton (copy), images (copy), getFFlagIsSquadEnabled (copy), wideMode (ref)
			if rightHidden then
				return nil
			end
			local topBarShowSearch = var5.topBarShowSearch
			local topBarShowCreateChatGroup = var5.topBarShowCreateChatGroup
			local topBarShowNotifications = var5.topBarShowNotifications
			local topBarShowSnoozeNotifications = var5.topBarShowSnoozeNotifications
			local notificationCount = var5.notificationCount
			
			return if fFlagEnableHeaderBarButtonsUpdate then reactModule.createElement(foundationModule.View, {
				tag = "row align-x-right align-y-center gap-xsmall auto-xy"
			}, {
				filter = if topBarShowSearch then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 1,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.MagnifyingGlass,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("search") else nil,
					onActivated = var9
				}) else nil,
				createNewChat = if topBarShowCreateChatGroup then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					size = foundationModule.Enums.InputSize.Medium,
					icon = if argoPartyExperimentation.getIsRenameEnabled() then foundationModule.Enums.IconName.PencilSquare else foundationModule.Enums.IconName.PlusLarge,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
					onActivated = var10
				}) else nil,
				notifications = if topBarShowNotifications then reactModule.createElement(streamNotificationsBellIcon, {
					layoutOrder = 3,
					notificationCount = notificationCount,
					entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
				}) else nil,
				snoozeChatNotifications = if topBarShowSnoozeNotifications then reactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var2, 1, 0) }) else nil
			}) else reactModule.createElement(reactModule.Fragment, nil, {
				filter = topBarShowSearch and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 1,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.MagnifyingGlass,
					testId = domLocatorsModule.chatLandingTopBarIconButton("search"),
					onActivated = var9
				}) else reactModule.createElement(iconButton, {
					layoutOrder = 1,
					size = UDim2.new(0, var2, 1, 0),
					icon = images["icons/common/search"],
					onActivated = var9
				})),
				createNewChat = topBarShowCreateChatGroup and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.PlusLarge,
					testId = domLocatorsModule.chatLandingTopBarIconButton("createChat"),
					onActivated = var10
				}) else reactModule.createElement(iconButton, {
					layoutOrder = 2,
					size = UDim2.new(0, var2, 1, 0),
					icon = if getFFlagIsSquadEnabled() then images["icons/common/plus"] else images["icons/actions/compose"],
					onActivated = var10
				})),
				notifications = topBarShowNotifications and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.View, {
					tag = "row align-x-center align-y-center radius-circle",
					Size = UDim2.new(0, var2, 0, var2),
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
				snoozeChatNotifications = if topBarShowSnoozeNotifications then reactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var2, 1, 0) }) else nil
			})
		end else nil,
		renderCenter = var8,
		renderLeft = if var11 then function()
			-- upvalues: reactModule (copy), flyoutLeftHeader (copy), var7 (ref), flyoutSidePanelIXP (copy)
			return reactModule.createElement(flyoutLeftHeader, {
				titleText = var7,
				isFlyoutEntrypointEnabled = flyoutSidePanelIXP.isFlyoutSidePanelEnabled(),
				isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
			})
		end else nil,
		hideTitle = var11
	})
end