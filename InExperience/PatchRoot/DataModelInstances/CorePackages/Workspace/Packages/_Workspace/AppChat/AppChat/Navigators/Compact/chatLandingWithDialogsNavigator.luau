local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)
local sharedFlagsModule = require(parent.SharedFlags)
local appNavBarModule = require(parent.AppNavBar)
local memoize = require(parent.AppCommonLib).memoize
local chatDetails = appChat.Components.ChatDetails
local genericDialogTypeModule = require(chatDetails.Dialogs.GenericDialogType)
local editChatGroupNameDialogScreenModule = require(chatDetails.EditChatGroupNameDialog.EditChatGroupNameDialogScreen)
local leaveGroupDialogScreenModule = require(chatDetails.LeaveGroupDialog.LeaveGroupDialogScreen)
local participantDialogScreenDeprecatedModule = require(chatDetails.ParticipantDialog.ParticipantDialogScreenDeprecated)
local removeUserDialogScreenModule = require(chatDetails.RemoveUserDialog.RemoveUserDialogScreen)
local abuseReportScreenModule = require(appChat.Components.ChatAbuseReport.AbuseReportScreen)
local fFlagAppChatEnableTrustedFriendEntryPointModule = require(appChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local trustedContactsModalScreenModule = require(appChat.Components.TrustedContactsModal.TrustedContactsModalScreen)
local messageContextMenuScreenModule = require(appChat.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen)
local squadVoiceChangerOverlayModule = require(parent.Squads.SquadVoiceChangerOverlay)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local chatConversationTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local useGetAndSetRefModule = require(appChat.Hooks.useGetAndSetRef)
local trustedConnectionsUpsellScreenModule = require(appChat.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellScreen)
local trustedFriendsUpsellScreenModule = require(appChat.Components.TrustedFriendsUpsell.TrustedFriendsUpsellScreen)
local groupOSADialogScreenModule = require(appChat.Components.OSA.GroupOSADialogScreen)
local chatConversation = appChat.Components.ChatConversation
local createUnfilteredChatPartialModalScreenModule = require(chatConversation.PartialModal.CreateUnfilteredChatPartialModalScreen)
local learnMorePartialModalScreenModule = require(chatConversation.PartialModal.LearnMorePartialModalScreen)
local conversationOverlayScreenModule = require(chatConversation.PartialModal.ConversationOverlayScreen)
local makeDialogScreenTelemetryWrapperModule = require(appChat.Navigators.makeDialogScreenTelemetryWrapper)
local configureTopBarWithNavigationOptionsModule = require(appChat.configureTopBarWithNavigationOptions)
local getChatLandingStackNavigatorModule = require(script.Parent.getChatLandingStackNavigator)
local squadVoiceAbuseReportScreenModule = require(parent.Squads.SquadVoiceAbuseReportScreen)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local systemMenuTopBarModule = require(appChat.Components.TopBar.SystemMenuTopBar)
local chatConversationTopBarModule = require(appChat.Components.TopBar.ChatConversationTopBar)
local chatLandingTopBarModule = require(appChat.Components.TopBar.ChatLandingTopBar)
local chatTopBarBaseModule = require(appChat.Components.TopBar.ChatTopBarBase)
local squadAddFriendsIconButtonModule = require(appChat.Components.Squads.SquadAddFriendsIconButton)
local providerModule = require(appChat.Contexts.ChatPagePadding.Provider)
local chatDetailsTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local chatDetailsTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local blockingModal = require(parent.SocialBlockingModal).BlockingModal
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagAppIaScrollAwayFixSocial = sharedFlagsModule.FFlagAppIaScrollAwayFixSocial
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagAppChatConsolidateTrustedFriendsModalModule = require(appChat.Flags.FFlagAppChatConsolidateTrustedFriendsModal)
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local function AppChatNavigatorTelemetryProviders(p0)
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatDetailsTelemetryStateModule (ref), chatDetailsTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), chatConversationTelemetryLayerModule (ref)
	local var49, var50 = useGetAndSetRefModule({})
	local var51 = reactModule.useCallback(function()
		-- upvalues: var49 (ref)
		local var57 = var49()
		
		return {
			chatLandingListCount = var57.chatLandingListCount,
			pendingConversationCount = var57.pendingConversationCount,
			unfilteredConversationCount = var57.unfilteredConversationCount
		}
	end, { var49 })
	local var52, var53 = useGetAndSetRefModule({})
	local var54 = reactModule.useCallback(function()
		-- upvalues: var52 (ref)
		local var58 = var52()
		
		return {
			conversationId = var58.conversationId,
			moderationType = var58.moderationType,
			userPendingStatus = var58.userPendingStatus
		}
	end, { var52 })
	local _ = p0.children
	local var55, var56 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, { value = { get = var49, set = var50 } }, {
		reactModule.createElement(chatLandingTelemetryLayerModule.Provider, { value = var51 }, {
			reactModule.createElement(chatConversationTelemetryStateModule.Provider, { value = { get = var52, set = var53 } }, {
				reactModule.createElement(chatConversationTelemetryLayerModule.Provider, { value = var54 }, reactModule.createElement(chatDetailsTelemetryStateModule.Provider, { value = { get = var55, set = var56 } }, reactModule.createElement(chatDetailsTelemetryLayerModule.Provider, {
					value = reactModule.useCallback(function()
						-- upvalues: var55 (ref)
						local var59 = var55()
						
						return {
							participantsCount = var59.participantsCount,
							isGroupOwner = var59.isGroupOwner
						}
					end, { var55, var52 })
				}, p0.children)))
			})
		})
	})
end

local chatLandingStackNavigatorConnector = roactModule.Component:extend("ChatLandingStackNavigatorConnector")
chatLandingStackNavigatorConnector.router = getChatLandingStackNavigatorModule(userGameSettingsService.ReducedMotion).router

function chatLandingStackNavigatorConnector.init(p1)
	-- upvalues: userGameSettingsService (ref), memoize (ref), getChatLandingStackNavigatorModule (ref), chatLandingStackNavigatorConnector (ref)
	p1.state = {
		shouldReduceMotion = userGameSettingsService.ReducedMotion
	}
	p1.getNavigator = memoize(function(p2)
		-- upvalues: getChatLandingStackNavigatorModule (copy), chatLandingStackNavigatorConnector (copy)
		local var60 = getChatLandingStackNavigatorModule(p2)
		chatLandingStackNavigatorConnector.router = var60.router
		
		return var60
	end)
	
	function p1.updateSettings()
		-- upvalues: p1 (ref), userGameSettingsService (copy)
		p1:setState({
			shouldReduceMotion = userGameSettingsService.ReducedMotion
		})
	end
	
	p1.reducedMotionConnection = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(p1.updateSettings)
end

function chatLandingStackNavigatorConnector.willUnmount(p3)
	if p3.reducedMotionConnection then
		p3.reducedMotionConnection:Disconnect()
	end
end

local function _(p4)
	local state = p4 and p4.state
	
	if not state or not state.routes or not state.index then
		return nil
	end
	local index = state.routes[state.index]
	
	if not index then
		return nil
	elseif index.routes and index.index then
		local index_1 = index.routes[index.index]
		
		return if index_1 then index_1.routeName else index.routeName
	end
	return index.routeName
end

function chatLandingStackNavigatorConnector.render(p5)
	-- upvalues: fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagAppIaScrollAwayFixSocial (ref), roactNavigationModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enumScreensModule (ref), roactModule (ref), systemMenuTopBarModule (ref), chatConversationTopBarModule (ref), chatLandingTopBarModule (ref), chatTopBarBaseModule (ref), reactModule (ref), squadAddFriendsIconButtonModule (ref), configureTopBarWithNavigationOptionsModule (ref), AppChatNavigatorTelemetryProviders (ref), providerModule (ref)
	local var62 = fFlagAppIaScrollAway and (not (if fFlagAppIaScrollAway then p5.props.navigation.getScreenProps("isInExperience", false) else nil) and appNavBarModule.getScrollAwayEnabled())
	
	if fFlagAppIaScrollAwayFixSocial then
		var62 = var62 and roactNavigationModule.getActiveChildNavigationOptions(p5.props.navigation).tabBarVisible
	end
	local var65, state, index
	local var63 = nil
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local navigation = p5.props.navigation
		state = navigation and navigation.state
		
		if state and state.routes and state.index then
			index = state.routes[state.index]
			
			if not index then
				var65 = nil
			elseif index.routes and index.index then
				local index_1 = index.routes[index.index]
				var65 = if index_1 then index_1.routeName else index.routeName
			else
				var65 = index.routeName
			end
		else
			var65 = nil
		end
		if var65 == enumScreensModule.CreateNewChat or var65 == enumScreensModule.EditChatMembers then
			var63 = roactModule.createElement(systemMenuTopBarModule, { screenName = var65, navigation = p5.props.navigation })
		elseif var65 == enumScreensModule.ChatConversation then
			var63 = roactModule.createElement(chatConversationTopBarModule, {
				screenName = enumScreensModule.ChatConversation,
				navigation = p5.props.navigation
			})
		elseif var65 == enumScreensModule.ChatLanding then
			var63 = roactModule.createElement(chatLandingTopBarModule, {
				screenName = enumScreensModule.ChatLanding,
				navigation = p5.props.navigation
			})
		elseif var65 == enumScreensModule.ChatDetails then
			var63 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.ChatDetails,
				navigation = p5.props.navigation
			})
		elseif var65 == enumScreensModule.SquadLobby then
			var63 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadLobby,
				navigation = p5.props.navigation,
				renderRight = function()
					-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), p5 (ref)
					return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = p5.props.navigation })
				end
			})
		elseif var65 == enumScreensModule.SquadInviteFriends then
			var63 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				navigation = p5.props.navigation
			})
		elseif var65 == enumScreensModule.QuickStartSquadInviteFriends then
			var63 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.QuickStartSquadInviteFriends,
				navigation = p5.props.navigation
			})
		end
	end
	var63 = var63 or configureTopBarWithNavigationOptionsModule(p5.props.navigation)
	var65 = roactModule.createElement
	state = {}
	index = {
		layout = if fFlagAppIaScrollAway and var62 then nil else roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = var63,
		content = roactModule.createElement(providerModule, {
			value = {
				left = p5.props.navigation.getScreenProps("appChatOuterPadding", 12),
				right = p5.props.navigation.getScreenProps("appChatOuterPadding", 12)
			}
		}, {
			navigatorFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if fFlagAppIaScrollAway and var62 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -p5.props.navigation.getScreenProps("topBarHeight", 0))
			}, {
				navigator = roactModule.createElement(p5.getNavigator(p5.state.shouldReduceMotion), p5.props)
			})
		})
	}
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ChatLandingStackNavigator = var65(AppChatNavigatorTelemetryProviders, state, index)
	})
end

local list = {
	{
		[enumScreensModule.ChatLandingStack] = chatLandingStackNavigatorConnector
	},
	{
		[genericDialogTypeModule.EditChatGroupNameDialog] = {
			screen = editChatGroupNameDialogScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[genericDialogTypeModule.LeaveGroupDialog] = {
			screen = makeDialogScreenTelemetryWrapperModule(leaveGroupDialogScreenModule),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[genericDialogTypeModule.ParticipantDialog] = {
			screen = makeDialogScreenTelemetryWrapperModule(participantDialogScreenDeprecatedModule),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[genericDialogTypeModule.RemoveUserDialog] = {
			screen = removeUserDialogScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[enumScreensModule.CreateUnfilteredChatPartialModal] = {
			screen = createUnfilteredChatPartialModalScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[enumScreensModule.LearnMorePartialModal] = {
			screen = learnMorePartialModalScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	}
}
table.insert(list, {
	[enumScreensModule.AppChatReportAbuse] = {
		screen = abuseReportScreenModule,
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})

if fFlagAppChatEnableTrustedFriendEntryPointModule then
	table.insert(list, {
		[enumScreensModule.AppChatTrustedContactsModal] = {
			screen = trustedContactsModalScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	})
end
table.insert(list, {
	[enumScreensModule.BlockingModal] = {
		screen = blockingModal,
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})
table.insert(list, {
	[enumScreensModule.MessageContextMenu] = {
		screen = messageContextMenuScreenModule,
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})

if getFFlagIsSquadEnabled() and getFFlagEnableCrossExpVoice() then
	table.insert(list, {
		[enumScreensModule.SquadVoiceReportAbuse] = {
			screen = squadVoiceAbuseReportScreenModule,
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	})
end
table.insert(list, {
	[enumScreensModule.ConversationOverlay] = {
		screen = conversationOverlayScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if fFlagAppChatEnableDoubleOptIn or fFlagAppChatConsolidateTrustedFriendsModalModule then
	table.insert(list, {
		[enumScreensModule.TrustedConnectionsUpsell] = {
			screen = if fFlagAppChatConsolidateTrustedFriendsModalModule then trustedFriendsUpsellScreenModule else trustedConnectionsUpsellScreenModule,
			navigationOptions = {
				transparent = true,
				overlayTransparency = 0.5,
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end
table.insert(list, {
	[enumScreensModule.GroupOSADialog] = {
		screen = groupOSADialogScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if fFlagEnablePartyVoiceChangersInLua then
	table.insert(list, {
		[enumScreensModule.SquadVoiceChangers] = {
			screen = squadVoiceChangerOverlayModule,
			navigationOptions = { overlayEnabled = true, overlayTransparency = 0.5 }
		}
	})
end
return roactNavigationModule.createRobloxStackNavigator(list, {
	defaultNavigationOptions = if fFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})