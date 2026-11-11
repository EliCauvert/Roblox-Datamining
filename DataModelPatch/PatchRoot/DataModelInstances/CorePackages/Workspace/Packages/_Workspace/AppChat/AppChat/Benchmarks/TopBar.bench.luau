local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local DescribeFunction = JestGlobalsModule.describe
local BeforeEachFunction = JestGlobalsModule.beforeEach
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local RenderFunction = ReactTestingLibraryModule.render
local ActFunction = ReactTestingLibraryModule.act
local BenchmarkFunction = require(Parent.Dev.JestBenchmark).benchmark
local BenchmarkUtilsModule = require(Parent.Dev.BenchmarkUtils)
local MountComponentTimesFunction = BenchmarkUtilsModule.mountComponentTimes
local WrapWithProvidersModule = require(script.Parent.Utils.wrapWithProviders)
local EnumScreensModule = require(AppChat.EnumScreens)
local CreateChatTopBarModule = require(AppChat.createChatTopBar)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local ChatTopBarBaseModule = require(AppChat.Components.TopBar.ChatTopBarBase)
local SystemMenuTopBarModule = require(AppChat.Components.TopBar.SystemMenuTopBar)
local ChatConversationTopBarModule = require(AppChat.Components.TopBar.ChatConversationTopBar)
local ChatLandingTopBarModule = require(AppChat.Components.TopBar.ChatLandingTopBar)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local FoundationModule = require(Parent.Foundation)
local StreamNotificationsBellIcon = require(Parent.StreamNotifications).StreamNotificationsBellIcon
local UseChatLandingVisibilityModule = require(AppChat.Hooks.useChatLandingVisibility)
local WithTelemetryModule = require(AppChat.Telemetry.withTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local SnoozeToastNotificationsButtonModule = require(AppChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local ConstantsModule = require(AppChat.Constants)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local FFlagStreamNotificationBellEntryPoint = SharedFlagsModule.FFlagStreamNotificationBellEntryPoint
local FFlagAppChatRemoveNotifications = SharedFlagsModule.FFlagAppChatRemoveNotifications
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local State = {
	ChatAppReducer = {
		ChatSettings = { chatEnabled = true },
		Presence = { byUserId = {} }
	},
	NotificationBadgeCounts = { TopBarNotificationIcon = 3 }
}
local Navigation = (function()
	return {
		getScreenProps = function(p1, p2)
			local Entry = ({
				isInExperience = false,
				topBarHeight = 48,
				navigateToRootStack = nil,
				wideMode = false
			})[p1]
			
			return if Entry == nil then p2 else Entry
		end,
		pop = function() end,
		navigate = function() end,
		goBack = function() end,
		state = { routeName = "Benchmark", key = "bench-1", params = {} }
	}
end)()

local function _(p1, p2)
	-- upvalues: GetTopBarStoreModule (copy)
	local TopBarStoreModule = GetTopBarStoreModule(false)
	TopBarStoreModule.resetStore()
	TopBarStoreModule.setScreenTopBar(p1, p2)
end

BenchmarkUtilsModule.benchFile(script, function()
	-- upvalues: BeforeEachFunction (copy), GetTopBarStoreModule (copy), DescribeFunction (copy), CreateChatTopBarModule (copy), BenchmarkFunction (copy), RenderFunction (copy), WrapWithProvidersModule (copy), ReactModule (copy), Navigation (copy), State (copy), EnumScreensModule (copy), ChatTopBarBaseModule (copy), CreateSystemMenuButtonModule (copy), SystemMenuTopBarModule (copy), ChatConversationTopBarModule (copy), ConstantsModule (copy), UseChatLandingVisibilityModule (copy), WithTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), FFlagAppChatRemoveNotifications (copy), ChatLandingTelemetryEventsModule (copy), FFlagEnableHeaderBarButtonsUpdate (copy), RoactModule (copy), FoundationModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), SnoozeToastNotificationsButtonModule (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabledFunction (copy), ChatLandingTopBarModule (copy), ActFunction (copy), MountComponentTimesFunction (copy)
	BeforeEachFunction(function()
		-- upvalues: GetTopBarStoreModule (upval)
		GetTopBarStoreModule(false).resetStore()
	end)
	DescribeFunction("Simple header (back + title)", function()
		-- upvalues: CreateChatTopBarModule (upval), BenchmarkFunction (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), Navigation (upval), State (upval), EnumScreensModule (upval), GetTopBarStoreModule (upval), ChatTopBarBaseModule (upval)
		local function LegacySimpleHeader(p1)
			-- upvalues: CreateChatTopBarModule (upval)
			return CreateChatTopBarModule({
				backButtonEnabled = true,
				navigation = p1.navigation,
				headerText = {
					raw = "Feature.Chat.Label.Details",
					shouldLocalize = true
				}
			})
		end
		
		BenchmarkFunction("Legacy: createChatTopBar", function()
			-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), LegacySimpleHeader (copy), Navigation (upval), State (upval)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(LegacySimpleHeader, { navigation = Navigation }), { rodux = { state = State } })):unmount()
		end)
		BenchmarkFunction("Config-driven: ChatTopBarBase", function()
			-- upvalues: EnumScreensModule (upval), GetTopBarStoreModule (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), ChatTopBarBaseModule (upval), Navigation (upval), State (upval)
			local ChatDetails = EnumScreensModule.ChatDetails
			local config = {
				backButtonEnabled = true,
				headerText = {
					raw = "Feature.Chat.Label.Details",
					shouldLocalize = true
				}
			}
			local TopBarStoreModule = GetTopBarStoreModule(false)
			TopBarStoreModule.resetStore()
			TopBarStoreModule.setScreenTopBar(ChatDetails, config)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(ChatTopBarBaseModule, {
				screenName = EnumScreensModule.ChatDetails,
				navigation = Navigation
			}), { rodux = { state = State } })):unmount()
		end)
	end)
	DescribeFunction("System menu (create/edit)", function()
		-- upvalues: CreateChatTopBarModule (upval), CreateSystemMenuButtonModule (upval), BenchmarkFunction (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), Navigation (upval), State (upval), EnumScreensModule (upval), GetTopBarStoreModule (upval), SystemMenuTopBarModule (upval)
		local function LegacySystemMenu(p1)
			-- upvalues: CreateChatTopBarModule (upval), CreateSystemMenuButtonModule (upval)
			return CreateChatTopBarModule({
				closeButtonEnabled = true,
				navigation = p1.navigation,
				headerText = {
					raw = "Feature.Chat.Action.NewChat",
					shouldLocalize = true
				},
				renderRight = function()
					-- upvalues: CreateSystemMenuButtonModule (upval)
					return CreateSystemMenuButtonModule({
						isDisabled = false,
						localizedStrings = { systemButtonText = "Feature.Chat.Action.Add" },
						onActivated = function() end
					})
				end
			})
		end
		
		BenchmarkFunction("Legacy: createChatTopBar + systemMenuButton", function()
			-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), LegacySystemMenu (copy), Navigation (upval), State (upval)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(LegacySystemMenu, { navigation = Navigation }), { rodux = { state = State } })):unmount()
		end)
		BenchmarkFunction("Config-driven: SystemMenuTopBar", function()
			-- upvalues: EnumScreensModule (upval), GetTopBarStoreModule (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), SystemMenuTopBarModule (upval), Navigation (upval), State (upval)
			local CreateNewChat = EnumScreensModule.CreateNewChat
			local config = {
				closeButtonEnabled = true,
				systemButtonEnabled = true,
				systemButtonText = "Feature.Chat.Action.Add",
				headerText = {
					raw = "Feature.Chat.Action.NewChat",
					shouldLocalize = true
				}
			}
			local TopBarStoreModule = GetTopBarStoreModule(false)
			TopBarStoreModule.resetStore()
			TopBarStoreModule.setScreenTopBar(CreateNewChat, config)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(SystemMenuTopBarModule, {
				screenName = EnumScreensModule.CreateNewChat,
				navigation = Navigation
			}), { rodux = { state = State } })):unmount()
		end)
	end)
	DescribeFunction("Conversation header (face pile + squad join)", function()
		-- upvalues: CreateChatTopBarModule (upval), BenchmarkFunction (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), Navigation (upval), State (upval), EnumScreensModule (upval), GetTopBarStoreModule (upval), ChatConversationTopBarModule (upval)
		local function LegacyConversationHeader(p1)
			-- upvalues: CreateChatTopBarModule (upval)
			return CreateChatTopBarModule({
				backButtonEnabled = true,
				conversationId = "bench-conv-123",
				navigation = p1.navigation,
				headerText = { raw = "Test Conversation", shouldLocalize = false },
				navigateToChatDetails = function() end
			})
		end
		
		BenchmarkFunction("Legacy: createChatTopBar + conversationId", function()
			-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), LegacyConversationHeader (copy), Navigation (upval), State (upval)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(LegacyConversationHeader, { navigation = Navigation }), { rodux = { state = State } })):unmount()
		end)
		BenchmarkFunction("Config-driven: ChatConversationTopBar", function()
			-- upvalues: EnumScreensModule (upval), GetTopBarStoreModule (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), ChatConversationTopBarModule (upval), Navigation (upval), State (upval)
			local ChatConversation = EnumScreensModule.ChatConversation
			local config = {
				backButtonEnabled = true,
				conversationId = "bench-conv-123",
				headerText = { raw = "Test Conversation", shouldLocalize = false },
				navigateToChatDetails = function() end
			}
			local TopBarStoreModule = GetTopBarStoreModule(false)
			TopBarStoreModule.resetStore()
			TopBarStoreModule.setScreenTopBar(ChatConversation, config)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(ChatConversationTopBarModule, {
				screenName = EnumScreensModule.ChatConversation,
				navigation = Navigation
			}), { rodux = { state = State } })):unmount()
		end)
	end)
	DescribeFunction("Landing (visibility hooks + icon row)", function()
		-- upvalues: ConstantsModule (upval), UseChatLandingVisibilityModule (upval), WithTelemetryModule (upval), ChatLandingTelemetryLayerModule (upval), FFlagAppChatRemoveNotifications (upval), ChatLandingTelemetryEventsModule (upval), EnumScreensModule (upval), FFlagEnableHeaderBarButtonsUpdate (upval), RoactModule (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), CreateChatTopBarModule (upval), BenchmarkFunction (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), Navigation (upval), State (upval), GetTopBarStoreModule (upval), ChatLandingTopBarModule (upval)
		local function LegacyLandingWithVisibility(p1)
			-- upvalues: ConstantsModule (upval), UseChatLandingVisibilityModule (upval), WithTelemetryModule (upval), ChatLandingTelemetryLayerModule (upval), FFlagAppChatRemoveNotifications (upval), ChatLandingTelemetryEventsModule (upval), EnumScreensModule (upval), FFlagEnableHeaderBarButtonsUpdate (upval), RoactModule (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), CreateChatTopBarModule (upval)
			local Navigation = p1.navigation
			local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
			local IconButtonWidth = ConstantsModule:GetIconButtonWidth(WideModeScreenProps)
			local UseChatLandingVisibilityModuleResult = UseChatLandingVisibilityModule()
			
			return CreateChatTopBarModule({
				isTitleLeftAligned = true,
				shouldBoldHeader = true,
				isRoot = true,
				navigation = Navigation,
				headerText = {
					raw = "Feature.Chat.Label.ChatTitle",
					shouldLocalize = true
				},
				renderRight = function()
					-- upvalues: WithTelemetryModule (upval), ChatLandingTelemetryLayerModule (upval), UseChatLandingVisibilityModuleResult (copy), FFlagAppChatRemoveNotifications (upval), ChatLandingTelemetryEventsModule (upval), Navigation (copy), EnumScreensModule (upval), FFlagEnableHeaderBarButtonsUpdate (upval), RoactModule (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButtonWidth (copy), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), WideModeScreenProps (copy)
					return WithTelemetryModule(ChatLandingTelemetryLayerModule.Context)(function(p2)
						-- upvalues: UseChatLandingVisibilityModuleResult (upval), FFlagAppChatRemoveNotifications (upval), ChatLandingTelemetryEventsModule (upval), Navigation (upval), EnumScreensModule (upval), FFlagEnableHeaderBarButtonsUpdate (upval), RoactModule (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButtonWidth (upval), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), WideModeScreenProps (upval)
						local TopBarShowSearch = UseChatLandingVisibilityModuleResult.topBarShowSearch
						local TopBarShowCreateChatGroup = UseChatLandingVisibilityModuleResult.topBarShowCreateChatGroup
						local TopBarShowNotifications = not FFlagAppChatRemoveNotifications and UseChatLandingVisibilityModuleResult.topBarShowNotifications
						local TopBarShowSnoozeNotifications = UseChatLandingVisibilityModuleResult.topBarShowSnoozeNotifications
						local NotificationCount = UseChatLandingVisibilityModuleResult.notificationCount
						
						local function OnActivated()
							-- upvalues: p2 (copy), ChatLandingTelemetryEventsModule (upval)
							p2.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
						end
						
						local function OnActivated1()
							-- upvalues: Navigation (upval), EnumScreensModule (upval), p2 (copy), ChatLandingTelemetryEventsModule (upval)
							Navigation.navigate(EnumScreensModule.CreateNewChat)
							p2.emit(ChatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
						end
						
						return if FFlagEnableHeaderBarButtonsUpdate then RoactModule.createElement(FoundationModule.View, {
							tag = "row align-x-right align-y-center gap-xsmall auto-xy"
						}, {
							filter = if TopBarShowSearch then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 1,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.MagnifyingGlass,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("search") else nil,
								onActivated = OnActivated
							}) else nil,
							createNewChat = if TopBarShowCreateChatGroup then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 2,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.PlusLarge,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
								onActivated = OnActivated1
							}) else nil,
							notifications = if TopBarShowNotifications then RoactModule.createElement(StreamNotificationsBellIcon, {
								layoutOrder = 3,
								notificationCount = NotificationCount,
								entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
							}) else nil,
							snoozeChatNotifications = if TopBarShowSnoozeNotifications then RoactModule.createElement(SnoozeToastNotificationsButtonModule, {
								layoutOrder = 4,
								size = UDim2.new(0, IconButtonWidth, 1, 0)
							}) else nil
						}) else RoactModule.createFragment({
							filter = TopBarShowSearch and (if FFlagDebugAppChatEnableDomLocatorsModule then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 1,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.MagnifyingGlass,
								testId = DomLocatorsModule.chatLandingTopBarIconButton("search"),
								onActivated = OnActivated
							}) else RoactModule.createElement(IconButton, {
								layoutOrder = 1,
								size = UDim2.new(0, IconButtonWidth, 1, 0),
								icon = Images["icons/common/search"],
								onActivated = OnActivated
							})),
							createNewChat = TopBarShowCreateChatGroup and (if FFlagDebugAppChatEnableDomLocatorsModule then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 2,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.PlusLarge,
								testId = DomLocatorsModule.chatLandingTopBarIconButton("createChat"),
								onActivated = OnActivated1
							}) else RoactModule.createElement(IconButton, {
								layoutOrder = 2,
								size = UDim2.new(0, IconButtonWidth, 1, 0),
								icon = if GetFFlagIsSquadEnabledFunction() then Images["icons/common/plus"] else Images["icons/actions/compose"],
								onActivated = OnActivated1
							})),
							notifications = TopBarShowNotifications and (if FFlagDebugAppChatEnableDomLocatorsModule then RoactModule.createElement(FoundationModule.View, {
								tag = "row align-x-center align-y-center radius-circle",
								Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
								testId = DomLocatorsModule.chatLandingTopBarIconButton("notifications")
							}, {
								BellIcon = RoactModule.createElement(StreamNotificationsBellIcon, {
									notificationCount = NotificationCount,
									compactWidth = not WideModeScreenProps,
									entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil
								})
							}) else RoactModule.createElement(StreamNotificationsBellIcon, {
								layoutOrder = 3,
								notificationCount = NotificationCount,
								compactWidth = not WideModeScreenProps,
								entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil
							})),
							snoozeChatNotifications = if TopBarShowSnoozeNotifications then RoactModule.createElement(SnoozeToastNotificationsButtonModule, {
								layoutOrder = 4,
								size = UDim2.new(0, IconButtonWidth, 1, 0)
							}) else nil
						})
					end)
				end
			})
		end
		
		BenchmarkFunction("Legacy: createChatTopBar + telemetry + experiments + icon row", function()
			-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), LegacyLandingWithVisibility (copy), Navigation (upval), State (upval)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(LegacyLandingWithVisibility, { navigation = Navigation }), { rodux = { state = State } })):unmount()
		end)
		BenchmarkFunction("Config-driven: ChatLandingTopBar", function()
			-- upvalues: EnumScreensModule (upval), GetTopBarStoreModule (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), ChatLandingTopBarModule (upval), Navigation (upval), State (upval)
			local ChatLanding = EnumScreensModule.ChatLanding
			local config = {
				isTitleLeftAligned = true,
				shouldBoldHeader = true,
				isRoot = true,
				headerText = {
					raw = "Feature.Chat.Label.ChatTitle",
					shouldLocalize = true
				}
			}
			local TopBarStoreModule = GetTopBarStoreModule(false)
			TopBarStoreModule.resetStore()
			TopBarStoreModule.setScreenTopBar(ChatLanding, config)
			RenderFunction(WrapWithProvidersModule(ReactModule.createElement(ChatLandingTopBarModule, {
				screenName = EnumScreensModule.ChatLanding,
				navigation = Navigation
			}), { rodux = { state = State } })):unmount()
		end)
	end)
	DescribeFunction("Rerender with title change", function()
		-- upvalues: CreateChatTopBarModule (upval), BenchmarkFunction (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), Navigation (upval), State (upval), ActFunction (upval), GetTopBarStoreModule (upval), ChatTopBarBaseModule (upval)
		local function LegacyRerenderHeader(p1)
			-- upvalues: CreateChatTopBarModule (upval)
			return CreateChatTopBarModule({
				backButtonEnabled = true,
				navigation = p1.navigation,
				headerText = { shouldLocalize = false, raw = p1.title }
			})
		end
		
		BenchmarkFunction("Legacy: rerender via new props", function()
			-- upvalues: RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), LegacyRerenderHeader (copy), Navigation (upval), State (upval), ActFunction (upval)
			local RenderResult = RenderFunction(WrapWithProvidersModule(ReactModule.createElement(LegacyRerenderHeader, { title = "Title A", navigation = Navigation }), { rodux = { state = State } }))
			ActFunction(function()
				-- upvalues: RenderResult (copy), WrapWithProvidersModule (upval), ReactModule (upval), LegacyRerenderHeader (upval), Navigation (upval), State (upval)
				RenderResult:rerender(WrapWithProvidersModule(ReactModule.createElement(LegacyRerenderHeader, { title = "Title B", navigation = Navigation }), { rodux = { state = State } }))
			end)
			RenderResult:unmount()
		end)
		BenchmarkFunction("Config-driven: rerender via setScreenTopBar", function()
			-- upvalues: GetTopBarStoreModule (upval), RenderFunction (upval), WrapWithProvidersModule (upval), ReactModule (upval), ChatTopBarBaseModule (upval), Navigation (upval), State (upval), ActFunction (upval)
			local config = {
				backButtonEnabled = true,
				headerText = { raw = "Title A", shouldLocalize = false }
			}
			local TopBarStoreModule = GetTopBarStoreModule(false)
			TopBarStoreModule.resetStore()
			TopBarStoreModule.setScreenTopBar("BenchRerender", config)
			local RenderResult = RenderFunction(WrapWithProvidersModule(ReactModule.createElement(ChatTopBarBaseModule, { screenName = "BenchRerender", navigation = Navigation }), { rodux = { state = State } }))
			ActFunction(function()
				-- upvalues: GetTopBarStoreModule (upval)
				GetTopBarStoreModule(false).setScreenTopBar("BenchRerender", { headerText = { raw = "Title B", shouldLocalize = false } })
			end)
			RenderResult:unmount()
		end)
	end)
	DescribeFunction("Mount scaling", function()
		-- upvalues: CreateChatTopBarModule (upval), ReactModule (upval), Navigation (upval), WrapWithProvidersModule (upval), State (upval), EnumScreensModule (upval), GetTopBarStoreModule (upval), ChatTopBarBaseModule (upval), MountComponentTimesFunction (upval)
		local WrapWithProvidersModuleResult = WrapWithProvidersModule(ReactModule.createElement(function(p1)
			-- upvalues: CreateChatTopBarModule (upval)
			return CreateChatTopBarModule({
				backButtonEnabled = true,
				navigation = p1.navigation,
				headerText = {
					raw = "Feature.Chat.Label.Details",
					shouldLocalize = true
				}
			})
		end, { navigation = Navigation }), { rodux = { state = State } })
		local ChatDetails = EnumScreensModule.ChatDetails
		local config = {
			backButtonEnabled = true,
			headerText = {
				raw = "Feature.Chat.Label.Details",
				shouldLocalize = true
			}
		}
		local TopBarStoreModule = GetTopBarStoreModule(false)
		TopBarStoreModule.resetStore()
		TopBarStoreModule.setScreenTopBar(ChatDetails, config)
		local WrapWithProvidersModuleResult1 = WrapWithProvidersModule(ReactModule.createElement(ChatTopBarBaseModule, {
			screenName = EnumScreensModule.ChatDetails,
			navigation = Navigation
		}), { rodux = { state = State } })
		MountComponentTimesFunction(WrapWithProvidersModuleResult, "Legacy simple header", 25)
		MountComponentTimesFunction(WrapWithProvidersModuleResult1, "Config-driven simple header", 25)
		MountComponentTimesFunction(WrapWithProvidersModuleResult, "Legacy simple header", 50)
		MountComponentTimesFunction(WrapWithProvidersModuleResult1, "Config-driven simple header", 50)
		MountComponentTimesFunction(WrapWithProvidersModuleResult, "Legacy simple header", 100)
		MountComponentTimesFunction(WrapWithProvidersModuleResult1, "Config-driven simple header", 100)
	end)
end)