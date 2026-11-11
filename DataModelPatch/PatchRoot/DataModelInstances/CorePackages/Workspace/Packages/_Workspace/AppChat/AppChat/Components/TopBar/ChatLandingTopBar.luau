local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ConstantsModule = require(AppChat.Constants)
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatTopBarBaseModule = require(script.Parent.ChatTopBarBase)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local SearchTopBarModule = require(AppChat.Components.ChatLanding.SearchTopBar)
local SnoozeToastNotificationsButtonModule = require(AppChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local UseChatLandingVisibilityModule = require(AppChat.Hooks.useChatLandingVisibility)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local StreamNotificationsBellIcon = require(Parent.StreamNotifications).StreamNotificationsBellIcon
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local FFlagStreamNotificationBellEntryPoint = SharedFlagsModule.FFlagStreamNotificationBellEntryPoint
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local FlyoutLeftHeader = require(Parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP

local function SearchTopBarWrapper()
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy), UseLocalizationFunction (copy), ReactModule (copy), SearchTopBarModule (copy)
	local TopBarStoreModule = GetTopBarStoreModule(false)
	local SetScreenTopBarFunction = TopBarStoreModule.setScreenTopBar
	local v1 = TopBarStoreModule.getScreenTopBar(EnumScreensModule.ChatLanding)(false)
	local UseLocalizationResult = UseLocalizationFunction({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		filterBox = ReactModule.createElement(SearchTopBarModule, {
			initialInputText = v1.filterText,
			cancelText = UseLocalizationResult.cancelText,
			searchPlaceholderText = UseLocalizationResult.searchPlaceholderText,
			captureFocusOnMount = v1.shouldAutoFocusCenter,
			onSelectCallback = ReactModule.useCallback(function()
				-- upvalues: v1 (copy)
				local CloseInputBarFunction: () -> () = v1.closeInputBar
				
				if CloseInputBarFunction then
					CloseInputBarFunction()
				end
			end, { v1.closeInputBar }),
			resetOnMount = ReactModule.useCallback(function()
				-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
				SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
			end, { SetScreenTopBarFunction }),
			cancelCallback = ReactModule.useCallback(function()
				-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
				SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
			end, { SetScreenTopBarFunction }),
			textChangedCallback = ReactModule.useCallback(function(FilterText)
				-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
				SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { filterText = FilterText })
			end, { SetScreenTopBarFunction })
		})
	})
end

local function v29()
	-- upvalues: ReactModule (copy), SearchTopBarWrapper (copy)
	return ReactModule.createElement(SearchTopBarWrapper)
end

return function(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), ConstantsModule (copy), GetTopBarStoreModule (copy), UseSignalStateFunction (copy), UseChatLandingVisibilityModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseLocalizationFunction (copy), v29 (copy), ReactModule (copy), EnumScreensModule (copy), ChatLandingTelemetryEventsModule (copy), FlyoutLeftHeader (copy), FlyoutSidePanelIXP (copy), FFlagEnableHeaderBarButtonsUpdate (copy), FoundationModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ArgoPartyExperimentation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), SnoozeToastNotificationsButtonModule (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabledFunction (copy), ChatTopBarBaseModule (copy)
	if FFlagAppChatTopBarConfigDrivenModule() then
		local ScreenName = p1.screenName
		local Navigation = p1.navigation
		local IsInExperienceScreenProps = Navigation.getScreenProps("isInExperience", false)
		local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
		local IconButtonWidth = ConstantsModule:GetIconButtonWidth(WideModeScreenProps)
		local TopBarStoreModule = GetTopBarStoreModule(false)
		local SetScreenTopBarFunction = TopBarStoreModule.setScreenTopBar
		local UseSignalStateResult = UseSignalStateFunction((TopBarStoreModule.getScreenTopBar(ScreenName)))
		local UseChatLandingVisibilityModuleResult = UseChatLandingVisibilityModule()
		local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
		local ShouldRenderCenter = UseSignalStateResult.shouldRenderCenter
		local RightHidden = UseSignalStateResult.rightHidden
		local HeaderText = UseSignalStateResult.headerText or { raw = "", shouldLocalize = false }
		local UseLocalizationResult = UseLocalizationFunction({
			headerText = HeaderText.shouldLocalize and HeaderText.raw or nil
		})
		local HeaderText1 = HeaderText.shouldLocalize and UseLocalizationResult.headerText or (HeaderText.raw or "")
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, {
				shouldRenderCenter = true,
				shouldAutoFocusCenter = true,
				isSecondary = true
			})
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
		end, { UseTelemetryModuleResult, SetScreenTopBarFunction })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy), EnumScreensModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
			Navigation.navigate(EnumScreensModule.CreateNewChat)
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
		end, { UseTelemetryModuleResult, Navigation })
		
		local function v49()
			-- upvalues: ReactModule (upval), FlyoutLeftHeader (upval), HeaderText1 (copy), FlyoutSidePanelIXP (upval)
			return ReactModule.createElement(FlyoutLeftHeader, {
				titleText = HeaderText1,
				isFlyoutEntrypointEnabled = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled(),
				isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
			})
		end
		
		local NoIsInExperienceScreenProps: boolean = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() and not IsInExperienceScreenProps
		
		return ReactModule.createElement(ChatTopBarBaseModule, {
			screenName = ScreenName,
			navigation = Navigation,
			renderRight = if ShouldRenderCenter then nil else function()
				-- upvalues: RightHidden (copy), UseChatLandingVisibilityModuleResult (copy), FFlagEnableHeaderBarButtonsUpdate (upval), ReactModule (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), UseResult (copy), ArgoPartyExperimentation (upval), UseResult1 (copy), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButtonWidth (copy), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), WideModeScreenProps (copy)
				if RightHidden then
					return nil
				else
					local TopBarShowSearch = UseChatLandingVisibilityModuleResult.topBarShowSearch
					local TopBarShowCreateChatGroup = UseChatLandingVisibilityModuleResult.topBarShowCreateChatGroup
					local TopBarShowNotifications = UseChatLandingVisibilityModuleResult.topBarShowNotifications
					local TopBarShowSnoozeNotifications = UseChatLandingVisibilityModuleResult.topBarShowSnoozeNotifications
					local NotificationCount = UseChatLandingVisibilityModuleResult.notificationCount
					
					return if FFlagEnableHeaderBarButtonsUpdate then ReactModule.createElement(FoundationModule.View, {
						tag = "row align-x-right align-y-center gap-xsmall auto-xy"
					}, {
						filter = if TopBarShowSearch then ReactModule.createElement(FoundationModule.IconButton, {
							isCircular = true,
							LayoutOrder = 1,
							size = FoundationModule.Enums.InputSize.Medium,
							icon = FoundationModule.Enums.IconName.MagnifyingGlass,
							testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("search") else nil,
							onActivated = UseResult
						}) else nil,
						createNewChat = if TopBarShowCreateChatGroup then ReactModule.createElement(FoundationModule.IconButton, {
							isCircular = true,
							LayoutOrder = 2,
							size = FoundationModule.Enums.InputSize.Medium,
							icon = if ArgoPartyExperimentation.getIsRenameEnabled() then FoundationModule.Enums.IconName.PencilSquare else FoundationModule.Enums.IconName.PlusLarge,
							testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
							onActivated = UseResult1
						}) else nil,
						notifications = if TopBarShowNotifications then ReactModule.createElement(StreamNotificationsBellIcon, {
							layoutOrder = 3,
							notificationCount = NotificationCount,
							entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil,
							testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
						}) else nil,
						snoozeChatNotifications = if TopBarShowSnoozeNotifications then ReactModule.createElement(SnoozeToastNotificationsButtonModule, {
							layoutOrder = 4,
							size = UDim2.new(0, IconButtonWidth, 1, 0)
						}) else nil
					}) else ReactModule.createElement(ReactModule.Fragment, nil, {
						filter = TopBarShowSearch and (if FFlagDebugAppChatEnableDomLocatorsModule then ReactModule.createElement(FoundationModule.IconButton, {
							isCircular = true,
							LayoutOrder = 1,
							size = FoundationModule.Enums.InputSize.Medium,
							icon = FoundationModule.Enums.IconName.MagnifyingGlass,
							testId = DomLocatorsModule.chatLandingTopBarIconButton("search"),
							onActivated = UseResult
						}) else ReactModule.createElement(IconButton, {
							layoutOrder = 1,
							size = UDim2.new(0, IconButtonWidth, 1, 0),
							icon = Images["icons/common/search"],
							onActivated = UseResult
						})),
						createNewChat = TopBarShowCreateChatGroup and (if FFlagDebugAppChatEnableDomLocatorsModule then ReactModule.createElement(FoundationModule.IconButton, {
							isCircular = true,
							LayoutOrder = 2,
							size = FoundationModule.Enums.InputSize.Medium,
							icon = FoundationModule.Enums.IconName.PlusLarge,
							testId = DomLocatorsModule.chatLandingTopBarIconButton("createChat"),
							onActivated = UseResult1
						}) else ReactModule.createElement(IconButton, {
							layoutOrder = 2,
							size = UDim2.new(0, IconButtonWidth, 1, 0),
							icon = if GetFFlagIsSquadEnabledFunction() then Images["icons/common/plus"] else Images["icons/actions/compose"],
							onActivated = UseResult1
						})),
						notifications = TopBarShowNotifications and (if FFlagDebugAppChatEnableDomLocatorsModule then ReactModule.createElement(FoundationModule.View, {
							tag = "row align-x-center align-y-center radius-circle",
							Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
							testId = DomLocatorsModule.chatLandingTopBarIconButton("notifications")
						}, {
							BellIcon = ReactModule.createElement(StreamNotificationsBellIcon, {
								notificationCount = NotificationCount,
								compactWidth = not WideModeScreenProps,
								entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil
							})
						}) else ReactModule.createElement(StreamNotificationsBellIcon, {
							layoutOrder = 3,
							notificationCount = NotificationCount,
							compactWidth = not WideModeScreenProps,
							entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil
						})),
						snoozeChatNotifications = if TopBarShowSnoozeNotifications then ReactModule.createElement(SnoozeToastNotificationsButtonModule, {
							layoutOrder = 4,
							size = UDim2.new(0, IconButtonWidth, 1, 0)
						}) else nil
					})
				end
			end,
			renderCenter = if ShouldRenderCenter then v29 else nil,
			renderLeft = if NoIsInExperienceScreenProps then v49 else nil,
			hideTitle = NoIsInExperienceScreenProps
		})
	else
		return nil
	end
end