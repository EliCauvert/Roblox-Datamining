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
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local function AppChatNavigatorTelemetryProviders(p0) --[[ line: 71 ]]
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatDetailsTelemetryStateModule (ref), chatDetailsTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), chatConversationTelemetryLayerModule (ref)
	local var47, var48 = useGetAndSetRefModule({})
	local var49 = reactModule.useCallback(function() --[[ line: 74 ]]
		-- upvalues: var47 (ref)
		local var55 = var47()
		
		return {
			chatLandingListCount = var55.chatLandingListCount,
			pendingConversationCount = var55.pendingConversationCount,
			unfilteredConversationCount = var55.unfilteredConversationCount
		}
	end, { var47 })
	local var50, var51 = useGetAndSetRefModule({})
	local var52 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: var50 (ref)
		local var56 = var50()
		
		return {
			conversationId = var56.conversationId,
			moderationType = var56.moderationType,
			userPendingStatus = var56.userPendingStatus
		}
	end, { var50 })
	local _ = p0.children
	local var53, var54 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, { value = { get = var47, set = var48 } }, {
		reactModule.createElement(chatLandingTelemetryLayerModule.Provider, { value = var49 }, {
			reactModule.createElement(chatConversationTelemetryStateModule.Provider, { value = { get = var50, set = var51 } }, {
				reactModule.createElement(chatConversationTelemetryLayerModule.Provider, { value = var52 }, reactModule.createElement(chatDetailsTelemetryStateModule.Provider, { value = { get = var53, set = var54 } }, reactModule.createElement(chatDetailsTelemetryLayerModule.Provider, {
					value = reactModule.useCallback(function() --[[ line: 96 ]]
						-- upvalues: var53 (ref)
						local var57 = var53()
						
						return {
							participantsCount = var57.participantsCount,
							isGroupOwner = var57.isGroupOwner
						}
					end, { var53, var50 })
				}, p0.children)))
			})
		})
	})
end

local chatLandingStackNavigatorConnector = roactModule.Component:extend("ChatLandingStackNavigatorConnector")
chatLandingStackNavigatorConnector.router = getChatLandingStackNavigatorModule(userGameSettingsService.ReducedMotion).router

function chatLandingStackNavigatorConnector.init(p1) --[[ line: 143 ]]
	-- upvalues: userGameSettingsService (ref), memoize (ref), getChatLandingStackNavigatorModule (ref), chatLandingStackNavigatorConnector (ref)
	p1.state = {
		shouldReduceMotion = userGameSettingsService.ReducedMotion
	}
	p1.getNavigator = memoize(function(p2) --[[ line: 148 ]]
		-- upvalues: getChatLandingStackNavigatorModule (copy), chatLandingStackNavigatorConnector (copy)
		local var58 = getChatLandingStackNavigatorModule(p2)
		chatLandingStackNavigatorConnector.router = var58.router
		
		return var58
	end)
	
	function p1.updateSettings() --[[ line: 155 ]]
		-- upvalues: p1 (ref), userGameSettingsService (copy)
		p1:setState({
			shouldReduceMotion = userGameSettingsService.ReducedMotion
		})
	end
	
	p1.reducedMotionConnection = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(p1.updateSettings)
end

function chatLandingStackNavigatorConnector.willUnmount(p3) --[[ line: 164 ]]
	if p3.reducedMotionConnection then
		p3.reducedMotionConnection:Disconnect()
	end
end

local function _(p4) --[[ line: 170 | named "getActiveRouteName" ]]
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

function chatLandingStackNavigatorConnector.render(p5) --[[ line: 187 ]]
	-- upvalues: fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagAppIaScrollAwayFixSocial (ref), roactNavigationModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enumScreensModule (ref), roactModule (ref), systemMenuTopBarModule (ref), chatConversationTopBarModule (ref), chatLandingTopBarModule (ref), chatTopBarBaseModule (ref), reactModule (ref), squadAddFriendsIconButtonModule (ref), configureTopBarWithNavigationOptionsModule (ref), AppChatNavigatorTelemetryProviders (ref), providerModule (ref)
	local var60 = fFlagAppIaScrollAway and (not (if fFlagAppIaScrollAway then p5.props.navigation.getScreenProps("isInExperience", false) else nil) and appNavBarModule.getScrollAwayEnabled())
	
	if fFlagAppIaScrollAwayFixSocial then
		var60 = var60 and roactNavigationModule.getActiveChildNavigationOptions(p5.props.navigation).tabBarVisible
	end
	local var63, state, index
	local var61 = nil
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local navigation = p5.props.navigation
		state = navigation and navigation.state
		
		if state and state.routes and state.index then
			index = state.routes[state.index]
			
			if not index then
				var63 = nil
			elseif index.routes and index.index then
				local index_1 = index.routes[index.index]
				var63 = if index_1 then index_1.routeName else index.routeName
			else
				var63 = index.routeName
			end
		else
			var63 = nil
		end
		if var63 == enumScreensModule.CreateNewChat or var63 == enumScreensModule.EditChatMembers then
			var61 = roactModule.createElement(systemMenuTopBarModule, { screenName = var63, navigation = p5.props.navigation })
		elseif var63 == enumScreensModule.ChatConversation then
			var61 = roactModule.createElement(chatConversationTopBarModule, {
				screenName = enumScreensModule.ChatConversation,
				navigation = p5.props.navigation
			})
		elseif var63 == enumScreensModule.ChatLanding then
			var61 = roactModule.createElement(chatLandingTopBarModule, {
				screenName = enumScreensModule.ChatLanding,
				navigation = p5.props.navigation
			})
		elseif var63 == enumScreensModule.ChatDetails then
			var61 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.ChatDetails,
				navigation = p5.props.navigation
			})
		elseif var63 == enumScreensModule.SquadLobby then
			var61 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadLobby,
				navigation = p5.props.navigation,
				renderRight = function() --[[ line: 227 ]]
					-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), p5 (ref)
					return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = p5.props.navigation })
				end
			})
		elseif var63 == enumScreensModule.SquadInviteFriends then
			var61 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				navigation = p5.props.navigation
			})
		elseif var63 == enumScreensModule.QuickStartSquadInviteFriends then
			var61 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.QuickStartSquadInviteFriends,
				navigation = p5.props.navigation
			})
		end
	end
	var61 = var61 or configureTopBarWithNavigationOptionsModule(p5.props.navigation)
	var63 = roactModule.createElement
	state = {}
	index = {
		layout = if fFlagAppIaScrollAway and var60 then nil else roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = var61,
		content = roactModule.createElement(providerModule, {
			value = {
				left = p5.props.navigation.getScreenProps("appChatOuterPadding", 12),
				right = p5.props.navigation.getScreenProps("appChatOuterPadding", 12)
			}
		}, {
			navigatorFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if fFlagAppIaScrollAway and var60 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -p5.props.navigation.getScreenProps("topBarHeight", 0))
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
		ChatLandingStackNavigator = var63(AppChatNavigatorTelemetryProviders, state, index)
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

if fFlagAppChatEnableDoubleOptIn then
	table.insert(list, {
		[enumScreensModule.TrustedConnectionsUpsell] = {
			screen = trustedConnectionsUpsellScreenModule,
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