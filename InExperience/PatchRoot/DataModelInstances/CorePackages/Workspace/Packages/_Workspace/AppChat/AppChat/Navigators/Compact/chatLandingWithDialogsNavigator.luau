local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local EnumScreensModule = require(AppChat.EnumScreens)
local SharedFlagsModule = require(Parent.SharedFlags)
local AppNavBarModule = require(Parent.AppNavBar)
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local ChatDetails = AppChat.Components.ChatDetails
local GenericDialogTypeModule = require(ChatDetails.Dialogs.GenericDialogType)
local EditChatGroupNameDialogScreenModule = require(ChatDetails.EditChatGroupNameDialog.EditChatGroupNameDialogScreen)
local LeaveGroupDialogScreenModule = require(ChatDetails.LeaveGroupDialog.LeaveGroupDialogScreen)
local ParticipantDialogScreenDeprecatedModule = require(ChatDetails.ParticipantDialog.ParticipantDialogScreenDeprecated)
local RemoveUserDialogScreenModule = require(ChatDetails.RemoveUserDialog.RemoveUserDialogScreen)
local AbuseReportScreenModule = require(AppChat.Components.ChatAbuseReport.AbuseReportScreen)
local MessageContextMenuScreenModule = require(AppChat.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen)
local SquadVoiceChangerOverlayModule = require(Parent.Squads.SquadVoiceChangerOverlay)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local UseGetAndSetRefModule = require(AppChat.Hooks.useGetAndSetRef)
local TrustedFriendsUpsellScreenModule = require(AppChat.Components.TrustedFriendsUpsell.TrustedFriendsUpsellScreen)
local GroupOSADialogScreenModule = require(AppChat.Components.OSA.GroupOSADialogScreen)
local ChatConversation = AppChat.Components.ChatConversation
local CreateUnfilteredChatPartialModalScreenModule = require(ChatConversation.PartialModal.CreateUnfilteredChatPartialModalScreen)
local LearnMorePartialModalScreenModule = require(ChatConversation.PartialModal.LearnMorePartialModalScreen)
local ConversationOverlayScreenModule = require(ChatConversation.PartialModal.ConversationOverlayScreen)
local MakeDialogScreenTelemetryWrapperModule = require(AppChat.Navigators.makeDialogScreenTelemetryWrapper)
local ConfigureTopBarWithNavigationOptionsModule = require(AppChat.configureTopBarWithNavigationOptions)
local GetChatLandingStackNavigatorModule = require(script.Parent.getChatLandingStackNavigator)
local SquadVoiceAbuseReportScreenModule = require(Parent.Squads.SquadVoiceAbuseReportScreen)
local SystemMenuTopBarModule = require(AppChat.Components.TopBar.SystemMenuTopBar)
local ChatConversationTopBarModule = require(AppChat.Components.TopBar.ChatConversationTopBar)
local ChatLandingTopBarModule = require(AppChat.Components.TopBar.ChatLandingTopBar)
local ChatTopBarBaseModule = require(AppChat.Components.TopBar.ChatTopBarBase)
local SquadAddFriendsIconButtonModule = require(AppChat.Components.Squads.SquadAddFriendsIconButton)
local ProviderModule = require(AppChat.Contexts.ChatPagePadding.Provider)
local ChatDetailsTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local ChatDetailsTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local BlockingModal = require(Parent.SocialBlockingModal).BlockingModal
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaScrollAwayFixSocial = SharedFlagsModule.FFlagAppIaScrollAwayFixSocial
local FFlagEnablePartyVoiceChangersInLua = SharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function AppChatNavigatorTelemetryProviders(p1)
	-- upvalues: UseGetAndSetRefModule (copy), ReactModule (copy), ChatDetailsTelemetryStateModule (copy), ChatDetailsTelemetryLayerModule (copy), ChatLandingTelemetryStateModule (copy), ChatLandingTelemetryLayerModule (copy), ChatConversationTelemetryStateModule (copy), ChatConversationTelemetryLayerModule (copy)
	local UseGetAndSetRefModuleResult, UseGetAndSetRefModuleResult2 = UseGetAndSetRefModule({})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseGetAndSetRefModuleResult (copy)
		local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult()
		
		return {
			chatLandingListCount = UseGetAndSetRefModuleResultResult.chatLandingListCount,
			pendingConversationCount = UseGetAndSetRefModuleResultResult.pendingConversationCount,
			unfilteredConversationCount = UseGetAndSetRefModuleResultResult.unfilteredConversationCount,
			searchSessionId = UseGetAndSetRefModuleResultResult.searchSessionId,
			activeFilters = UseGetAndSetRefModuleResultResult.activeFilters
		}
	end, { UseGetAndSetRefModuleResult })
	local UseGetAndSetRefModuleResult1, UseGetAndSetRefModuleResult2_1 = UseGetAndSetRefModule({})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseGetAndSetRefModuleResult1 (copy)
		local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult1()
		
		return {
			conversationId = UseGetAndSetRefModuleResultResult.conversationId,
			moderationType = UseGetAndSetRefModuleResultResult.moderationType,
			userPendingStatus = UseGetAndSetRefModuleResultResult.userPendingStatus
		}
	end, { UseGetAndSetRefModuleResult1 })
	local _ = p1.children
	local UseGetAndSetRefModuleResult3, UseGetAndSetRefModuleResult2_2 = UseGetAndSetRefModule({})
	
	return ReactModule.createElement(ChatLandingTelemetryStateModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseGetAndSetRefModuleResult (copy), UseGetAndSetRefModuleResult2 (copy)
			return {
				get = UseGetAndSetRefModuleResult,
				set = UseGetAndSetRefModuleResult2
			}
		end, {
			UseGetAndSetRefModuleResult,
			UseGetAndSetRefModuleResult2
		})
	}, {
		ReactModule.createElement(ChatLandingTelemetryLayerModule.Provider, { value = UseResult }, {
			ReactModule.createElement(ChatConversationTelemetryStateModule.Provider, {
				value = ReactModule.useMemo(function()
					-- upvalues: UseGetAndSetRefModuleResult1 (copy), UseGetAndSetRefModuleResult2_1 (copy)
					return {
						get = UseGetAndSetRefModuleResult1,
						set = UseGetAndSetRefModuleResult2_1
					}
				end, {
					UseGetAndSetRefModuleResult1,
					UseGetAndSetRefModuleResult2_1
				})
			}, {
				ReactModule.createElement(ChatConversationTelemetryLayerModule.Provider, { value = UseResult1 }, (ReactModule.createElement(ChatDetailsTelemetryStateModule.Provider, {
					value = ReactModule.useMemo(function()
						-- upvalues: UseGetAndSetRefModuleResult3 (copy), UseGetAndSetRefModuleResult2_2 (copy)
						return {
							get = UseGetAndSetRefModuleResult3,
							set = UseGetAndSetRefModuleResult2_2
						}
					end, {
						UseGetAndSetRefModuleResult3,
						UseGetAndSetRefModuleResult2_2
					})
				}, ReactModule.createElement(ChatDetailsTelemetryLayerModule.Provider, {
					value = ReactModule.useCallback(function()
						-- upvalues: UseGetAndSetRefModuleResult3 (copy)
						local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult3()
						
						return {
							participantsCount = UseGetAndSetRefModuleResultResult.participantsCount,
							isGroupOwner = UseGetAndSetRefModuleResultResult.isGroupOwner
						}
					end, {
						UseGetAndSetRefModuleResult3,
						UseGetAndSetRefModuleResult1
					})
				}, p1.children))))
			})
		})
	})
end

local ChatLandingStackNavigatorConnector = RoactModule.Component:extend("ChatLandingStackNavigatorConnector")
ChatLandingStackNavigatorConnector.router = GetChatLandingStackNavigatorModule(UserGameSettings.ReducedMotion).router

function ChatLandingStackNavigatorConnector.init(p1)
	-- upvalues: UserGameSettings (copy), MemoizeFunction (copy), GetChatLandingStackNavigatorModule (copy), ChatLandingStackNavigatorConnector (copy)
	p1.state = { shouldReduceMotion = UserGameSettings.ReducedMotion }
	p1.getNavigator = MemoizeFunction(function(p2)
		-- upvalues: GetChatLandingStackNavigatorModule (upval), ChatLandingStackNavigatorConnector (upval)
		local ChatLandingStackNavigatorModule = GetChatLandingStackNavigatorModule(p2)
		ChatLandingStackNavigatorConnector.router = ChatLandingStackNavigatorModule.router
		
		return ChatLandingStackNavigatorModule
	end)
	
	function p1.updateSettings()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({ shouldReduceMotion = UserGameSettings.ReducedMotion })
	end
	
	p1.reducedMotionConnection = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(p1.updateSettings)
end

function ChatLandingStackNavigatorConnector.willUnmount(p1)
	if p1.reducedMotionConnection then
		p1.reducedMotionConnection:Disconnect()
	end
end

local function _(p1)
	local State = p1 and p1.state
	
	if not State or not State.routes or not State.index then
		return nil
	end
	local Route = State.routes[State.index]
	
	if not Route then
		return nil
	elseif Route.routes and Route.index then
		local Route1 = Route.routes[Route.index]
		
		return Route1 and Route1.routeName or Route.routeName
	else
		return Route.routeName
	end
end

function ChatLandingStackNavigatorConnector.render(p1)
	-- upvalues: FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagAppIaScrollAwayFixSocial (copy), RoactNavigationModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), EnumScreensModule (copy), RoactModule (copy), SystemMenuTopBarModule (copy), ChatConversationTopBarModule (copy), ChatLandingTopBarModule (copy), ChatTopBarBaseModule (copy), ReactModule (copy), SquadAddFriendsIconButtonModule (copy), ConfigureTopBarWithNavigationOptionsModule (copy), AppChatNavigatorTelemetryProviders (copy), ProviderModule (copy), FFlagAppChatConsoleFocusFixesModule (copy)
	local IsInExperienceScreenProps = if FFlagAppIaScrollAway then p1.props.navigation.getScreenProps("isInExperience", false) else nil
	local ScrollAwayEnabled = FFlagAppIaScrollAway and (not IsInExperienceScreenProps and AppNavBarModule.getScrollAwayEnabled())
	
	if FFlagAppIaScrollAwayFixSocial then
		local ActiveChildNavigationOptions = RoactNavigationModule.getActiveChildNavigationOptions(p1.props.navigation)
		ScrollAwayEnabled = ScrollAwayEnabled and ActiveChildNavigationOptions.tabBarVisible
	end
	local Element = nil
	
	if FFlagAppChatPerfTrackingModule then
		AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.TopBarRenderInterval)
	end
	local Navigation = p1.props.navigation
	local State = Navigation and Navigation.state
	local RouteName = nil
	
	if State and State.routes and State.index then
		local Route = State.routes[State.index]
		
		if Route then
			if Route.routes and Route.index then
				local Route1 = Route.routes[Route.index]
				RouteName = Route1 and Route1.routeName or Route.routeName
			else
				RouteName = Route.routeName
			end
		else
			RouteName = nil
		end
	else
		RouteName = nil
	end
	if RouteName == EnumScreensModule.CreateNewChat or RouteName == EnumScreensModule.EditChatMembers then
		Element = RoactModule.createElement(SystemMenuTopBarModule, { screenName = RouteName, navigation = p1.props.navigation })
	elseif RouteName == EnumScreensModule.ChatConversation then
		Element = RoactModule.createElement(ChatConversationTopBarModule, {
			screenName = EnumScreensModule.ChatConversation,
			navigation = p1.props.navigation
		})
	elseif RouteName == EnumScreensModule.ChatLanding then
		Element = RoactModule.createElement(ChatLandingTopBarModule, {
			screenName = EnumScreensModule.ChatLanding,
			navigation = p1.props.navigation
		})
	elseif RouteName == EnumScreensModule.ChatDetails then
		Element = RoactModule.createElement(ChatTopBarBaseModule, {
			screenName = EnumScreensModule.ChatDetails,
			navigation = p1.props.navigation
		})
	elseif RouteName == EnumScreensModule.SquadLobby then
		Element = RoactModule.createElement(ChatTopBarBaseModule, {
			screenName = EnumScreensModule.SquadLobby,
			navigation = p1.props.navigation,
			renderRight = function()
				-- upvalues: ReactModule (upval), SquadAddFriendsIconButtonModule (upval), p1 (copy)
				return ReactModule.createElement(SquadAddFriendsIconButtonModule, { navigation = p1.props.navigation })
			end
		})
	elseif RouteName == EnumScreensModule.SquadInviteFriends then
		Element = RoactModule.createElement(ChatTopBarBaseModule, {
			screenName = EnumScreensModule.SquadInviteFriends,
			navigation = p1.props.navigation
		})
	elseif RouteName == EnumScreensModule.QuickStartSquadInviteFriends then
		Element = RoactModule.createElement(ChatTopBarBaseModule, {
			screenName = EnumScreensModule.QuickStartSquadInviteFriends,
			navigation = p1.props.navigation
		})
	end
	if not Element then
		Element = ConfigureTopBarWithNavigationOptionsModule(p1.props.navigation)
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ClipsDescendants = not FFlagAppChatConsoleFocusFixesModule or nil
	}, {
		ChatLandingStackNavigator = RoactModule.createElement(AppChatNavigatorTelemetryProviders, {}, {
			layout = if FFlagAppIaScrollAway and ScrollAwayEnabled then nil else RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			topBar = Element,
			content = RoactModule.createElement(ProviderModule, {
				value = {
					left = p1.props.navigation.getScreenProps("appChatOuterPadding", 12),
					right = p1.props.navigation.getScreenProps("appChatOuterPadding", 12)
				}
			}, {
				navigatorFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = if FFlagAppIaScrollAway and ScrollAwayEnabled then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -p1.props.navigation.getScreenProps("topBarHeight", 0))
				}, {
					navigator = RoactModule.createElement(p1.getNavigator(p1.state.shouldReduceMotion), p1.props)
				})
			})
		})
	})
end

local List = {
	{
		[EnumScreensModule.ChatLandingStack] = ChatLandingStackNavigatorConnector
	},
	{
		[GenericDialogTypeModule.EditChatGroupNameDialog] = {
			screen = EditChatGroupNameDialogScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[GenericDialogTypeModule.LeaveGroupDialog] = {
			screen = MakeDialogScreenTelemetryWrapperModule(LeaveGroupDialogScreenModule),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[GenericDialogTypeModule.ParticipantDialog] = {
			screen = MakeDialogScreenTelemetryWrapperModule(ParticipantDialogScreenDeprecatedModule),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[GenericDialogTypeModule.RemoveUserDialog] = {
			screen = RemoveUserDialogScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[EnumScreensModule.CreateUnfilteredChatPartialModal] = {
			screen = CreateUnfilteredChatPartialModalScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[EnumScreensModule.LearnMorePartialModal] = {
			screen = LearnMorePartialModalScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	}
}
table.insert(List, {
	[EnumScreensModule.AppChatReportAbuse] = {
		screen = AbuseReportScreenModule,
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})
table.insert(List, {
	[EnumScreensModule.BlockingModal] = {
		screen = BlockingModal,
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})
table.insert(List, {
	[EnumScreensModule.MessageContextMenu] = {
		screen = MessageContextMenuScreenModule,
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})

if GetFFlagIsSquadEnabledFunction() and GetFFlagEnableCrossExpVoiceFunction() then
	table.insert(List, {
		[EnumScreensModule.SquadVoiceReportAbuse] = {
			screen = SquadVoiceAbuseReportScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	})
end
table.insert(List, {
	[EnumScreensModule.ConversationOverlay] = {
		screen = ConversationOverlayScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})
table.insert(List, {
	[EnumScreensModule.TrustedConnectionsUpsell] = {
		screen = TrustedFriendsUpsellScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})
table.insert(List, {
	[EnumScreensModule.GroupOSADialog] = {
		screen = GroupOSADialogScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if FFlagEnablePartyVoiceChangersInLua then
	table.insert(List, {
		[EnumScreensModule.SquadVoiceChangers] = {
			screen = SquadVoiceChangerOverlayModule,
			navigationOptions = { overlayEnabled = true, overlayTransparency = 0.5 }
		}
	})
end
return RoactNavigationModule.createRobloxStackNavigator(List, {
	defaultNavigationOptions = if FFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})