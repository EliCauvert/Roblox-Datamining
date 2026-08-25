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
	local var20 = getTopBarStoreModule(false)
	local setScreenTopBar = var20.setScreenTopBar
	local var21 = var20.getScreenTopBar(enumScreensModule.ChatLanding)(false)
	local var22 = useLocalization({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		filterBox = reactModule.createElement(searchTopBarModule, {
			initialInputText = var21.filterText,
			cancelText = var22.cancelText,
			searchPlaceholderText = var22.searchPlaceholderText,
			captureFocusOnMount = var21.shouldAutoFocusCenter,
			onSelectCallback = reactModule.useCallback(function()
				-- upvalues: var21 (ref)
				local closeInputBar = var21.closeInputBar
				
				if closeInputBar then
					closeInputBar()
				end
			end, { var21.closeInputBar }),
			resetOnMount = reactModule.useCallback(function()
				-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
				setScreenTopBar(enumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
			end, { setScreenTopBar }),
			cancelCallback = reactModule.useCallback(function()
				-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
				setScreenTopBar(enumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
			end, { setScreenTopBar }),
			textChangedCallback = reactModule.useCallback(function(p0)
				-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
				setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p0 })
			end, { setScreenTopBar })
		})
	})
end

local var19 = function()
	-- upvalues: reactModule (ref), SearchTopBarWrapper (ref)
	return reactModule.createElement(SearchTopBarWrapper)
end

return function(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), constantsModule (ref), getTopBarStoreModule (ref), useSignalState (ref), useChatLandingVisibilityModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), useLocalization (ref), var19 (ref), reactModule (ref), enumScreensModule (ref), chatLandingTelemetryEventsModule (ref), flyoutLeftHeader (ref), flyoutSidePanelIXP (ref), fFlagEnableHeaderBarButtonsUpdate (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), argoPartyExperimentation (ref), streamNotificationsBellIcon (ref), fFlagStreamNotificationBellEntryPoint (ref), appPage (ref), snoozeToastNotificationsButtonModule (ref), iconButton (ref), images (ref), getFFlagIsSquadEnabled (ref), chatTopBarBaseModule (ref)
	if not fFlagAppChatTopBarConfigDrivenModule() then
		return nil
	end
	local screenName = p1.screenName
	local navigation = p1.navigation
	local isInExperience = navigation.getScreenProps("isInExperience", false)
	local wideMode = navigation.getScreenProps("wideMode", false)
	local var25 = constantsModule:GetIconButtonWidth(wideMode)
	local var26 = getTopBarStoreModule(false)
	local setScreenTopBar = var26.setScreenTopBar
	local var27 = useSignalState(var26.getScreenTopBar(screenName))
	local var28 = useChatLandingVisibilityModule()
	local var29 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local shouldRenderCenter = var27.shouldRenderCenter
	local rightHidden = var27.rightHidden
	local headerText = var27.headerText or { raw = "", shouldLocalize = false }
	local var31 = if headerText.shouldLocalize then useLocalization({
		headerText = if headerText.shouldLocalize then headerText.raw else nil
	}).headerText else headerText.raw or ""
	local var32 = if shouldRenderCenter then var19 else nil
	local var33 = reactModule.useCallback(function()
		-- upvalues: setScreenTopBar (ref), enumScreensModule (copy), var29 (ref), chatLandingTelemetryEventsModule (copy)
		setScreenTopBar(enumScreensModule.ChatLanding, {
			shouldRenderCenter = true,
			shouldAutoFocusCenter = true,
			isSecondary = true
		})
		var29.emit(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
	end, { var29, setScreenTopBar })
	local var34 = reactModule.useCallback(function()
		-- upvalues: navigation (ref), enumScreensModule (copy), var29 (ref), chatLandingTelemetryEventsModule (copy)
		navigation.navigate(enumScreensModule.CreateNewChat)
		var29.emit(chatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
	end, { var29, navigation })
	local var35 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not isInExperience
	
	return reactModule.createElement(chatTopBarBaseModule, {
		screenName = screenName,
		navigation = navigation,
		renderRight = if not shouldRenderCenter then function()
			-- upvalues: rightHidden (ref), var28 (ref), fFlagEnableHeaderBarButtonsUpdate (copy), reactModule (copy), foundationModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy), var33 (ref), argoPartyExperimentation (copy), var34 (ref), streamNotificationsBellIcon (copy), fFlagStreamNotificationBellEntryPoint (copy), appPage (copy), snoozeToastNotificationsButtonModule (copy), var25 (ref), iconButton (copy), images (copy), getFFlagIsSquadEnabled (copy), wideMode (ref)
			if rightHidden then
				return nil
			end
			local topBarShowSearch = var28.topBarShowSearch
			local topBarShowCreateChatGroup = var28.topBarShowCreateChatGroup
			local topBarShowNotifications = var28.topBarShowNotifications
			local topBarShowSnoozeNotifications = var28.topBarShowSnoozeNotifications
			local notificationCount = var28.notificationCount
			
			return if fFlagEnableHeaderBarButtonsUpdate then reactModule.createElement(foundationModule.View, {
				tag = "row align-x-right align-y-center gap-xsmall auto-xy"
			}, {
				filter = if topBarShowSearch then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 1,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.MagnifyingGlass,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("search") else nil,
					onActivated = var33
				}) else nil,
				createNewChat = if topBarShowCreateChatGroup then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					size = foundationModule.Enums.InputSize.Medium,
					icon = if argoPartyExperimentation.getIsRenameEnabled() then foundationModule.Enums.IconName.PencilSquare else foundationModule.Enums.IconName.PlusLarge,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
					onActivated = var34
				}) else nil,
				notifications = if topBarShowNotifications then reactModule.createElement(streamNotificationsBellIcon, {
					layoutOrder = 3,
					notificationCount = notificationCount,
					entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
				}) else nil,
				snoozeChatNotifications = if topBarShowSnoozeNotifications then reactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var25, 1, 0) }) else nil
			}) else reactModule.createElement(reactModule.Fragment, nil, {
				filter = topBarShowSearch and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 1,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.MagnifyingGlass,
					testId = domLocatorsModule.chatLandingTopBarIconButton("search"),
					onActivated = var33
				}) else reactModule.createElement(iconButton, {
					layoutOrder = 1,
					size = UDim2.new(0, var25, 1, 0),
					icon = images["icons/common/search"],
					onActivated = var33
				})),
				createNewChat = topBarShowCreateChatGroup and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					LayoutOrder = 2,
					size = foundationModule.Enums.InputSize.Medium,
					icon = foundationModule.Enums.IconName.PlusLarge,
					testId = domLocatorsModule.chatLandingTopBarIconButton("createChat"),
					onActivated = var34
				}) else reactModule.createElement(iconButton, {
					layoutOrder = 2,
					size = UDim2.new(0, var25, 1, 0),
					icon = if getFFlagIsSquadEnabled() then images["icons/common/plus"] else images["icons/actions/compose"],
					onActivated = var34
				})),
				notifications = topBarShowNotifications and (if fFlagDebugAppChatEnableDomLocatorsModule then reactModule.createElement(foundationModule.View, {
					tag = "row align-x-center align-y-center radius-circle",
					Size = UDim2.new(0, var25, 0, var25),
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
				snoozeChatNotifications = if topBarShowSnoozeNotifications then reactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var25, 1, 0) }) else nil
			})
		end else nil,
		renderCenter = var32,
		renderLeft = if var35 then function()
			-- upvalues: reactModule (copy), flyoutLeftHeader (copy), var31 (ref), flyoutSidePanelIXP (copy)
			return reactModule.createElement(flyoutLeftHeader, {
				titleText = var31,
				isFlyoutEntrypointEnabled = flyoutSidePanelIXP.isFlyoutSidePanelEnabled(),
				isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
			})
		end else nil,
		hideTitle = var35
	})
end