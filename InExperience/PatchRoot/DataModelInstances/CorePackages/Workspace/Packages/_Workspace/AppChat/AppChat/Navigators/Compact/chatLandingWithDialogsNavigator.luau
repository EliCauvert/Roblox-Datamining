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

local function AppChatNavigatorTelemetryProviders(p1)
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatDetailsTelemetryStateModule (ref), chatDetailsTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), chatConversationTelemetryLayerModule (ref)
	local var1, var2 = useGetAndSetRefModule({})
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local var4 = var1()
		
		return {
			chatLandingListCount = var4.chatLandingListCount,
			pendingConversationCount = var4.pendingConversationCount,
			unfilteredConversationCount = var4.unfilteredConversationCount
		}
	end, { var1 })
	local var4, var5 = useGetAndSetRefModule({})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		local var7 = var4()
		
		return {
			conversationId = var7.conversationId,
			moderationType = var7.moderationType,
			userPendingStatus = var7.userPendingStatus
		}
	end, { var4 })
	local _ = p1.children
	local var7, var8 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, { value = { get = var1, set = var2 } }, {
		reactModule.createElement(chatLandingTelemetryLayerModule.Provider, { value = var3 }, {
			reactModule.createElement(chatConversationTelemetryStateModule.Provider, { value = { get = var4, set = var5 } }, {
				reactModule.createElement(chatConversationTelemetryLayerModule.Provider, { value = var6 }, reactModule.createElement(chatDetailsTelemetryStateModule.Provider, { value = { get = var7, set = var8 } }, reactModule.createElement(chatDetailsTelemetryLayerModule.Provider, {
					value = reactModule.useCallback(function()
						-- upvalues: var7 (ref)
						local var9 = var7()
						
						return {
							participantsCount = var9.participantsCount,
							isGroupOwner = var9.isGroupOwner
						}
					end, { var7, var4 })
				}, p1.children)))
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
		local var1 = getChatLandingStackNavigatorModule(p2)
		chatLandingStackNavigatorConnector.router = var1.router
		
		return var1
	end)
	
	function p1.updateSettings()
		-- upvalues: p1 (ref), userGameSettingsService (copy)
		p1:setState({
			shouldReduceMotion = userGameSettingsService.ReducedMotion
		})
	end
	
	p1.reducedMotionConnection = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(p1.updateSettings)
end

function chatLandingStackNavigatorConnector.willUnmount(p1)
	if p1.reducedMotionConnection then
		p1.reducedMotionConnection:Disconnect()
	end
end

local function _(p1)
	local state = p1 and p1.state
	
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

function chatLandingStackNavigatorConnector.render(p1)
	-- upvalues: fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagAppIaScrollAwayFixSocial (ref), roactNavigationModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), enumScreensModule (ref), roactModule (ref), systemMenuTopBarModule (ref), chatConversationTopBarModule (ref), chatLandingTopBarModule (ref), chatTopBarBaseModule (ref), reactModule (ref), squadAddFriendsIconButtonModule (ref), configureTopBarWithNavigationOptionsModule (ref), AppChatNavigatorTelemetryProviders (ref), providerModule (ref)
	local var1 = fFlagAppIaScrollAway and (not (if fFlagAppIaScrollAway then p1.props.navigation.getScreenProps("isInExperience", false) else nil) and appNavBarModule.getScrollAwayEnabled())
	
	if fFlagAppIaScrollAwayFixSocial then
		var1 = var1 and roactNavigationModule.getActiveChildNavigationOptions(p1.props.navigation).tabBarVisible
	end
	local var2, state, index
	local var3 = nil
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.TopBarRenderInterval)
		end
		local navigation = p1.props.navigation
		state = navigation and navigation.state
		
		if state and state.routes and state.index then
			index = state.routes[state.index]
			
			if not index then
				var2 = nil
			elseif index.routes and index.index then
				local index_1 = index.routes[index.index]
				var2 = if index_1 then index_1.routeName else index.routeName
			else
				var2 = index.routeName
			end
		else
			var2 = nil
		end
		if var2 == enumScreensModule.CreateNewChat or var2 == enumScreensModule.EditChatMembers then
			var3 = roactModule.createElement(systemMenuTopBarModule, { screenName = var2, navigation = p1.props.navigation })
		elseif var2 == enumScreensModule.ChatConversation then
			var3 = roactModule.createElement(chatConversationTopBarModule, {
				screenName = enumScreensModule.ChatConversation,
				navigation = p1.props.navigation
			})
		elseif var2 == enumScreensModule.ChatLanding then
			var3 = roactModule.createElement(chatLandingTopBarModule, {
				screenName = enumScreensModule.ChatLanding,
				navigation = p1.props.navigation
			})
		elseif var2 == enumScreensModule.ChatDetails then
			var3 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.ChatDetails,
				navigation = p1.props.navigation
			})
		elseif var2 == enumScreensModule.SquadLobby then
			var3 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadLobby,
				navigation = p1.props.navigation,
				renderRight = function()
					-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), p1 (ref)
					return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = p1.props.navigation })
				end
			})
		elseif var2 == enumScreensModule.SquadInviteFriends then
			var3 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				navigation = p1.props.navigation
			})
		elseif var2 == enumScreensModule.QuickStartSquadInviteFriends then
			var3 = roactModule.createElement(chatTopBarBaseModule, {
				screenName = enumScreensModule.QuickStartSquadInviteFriends,
				navigation = p1.props.navigation
			})
		end
	end
	var3 = var3 or configureTopBarWithNavigationOptionsModule(p1.props.navigation)
	var2 = roactModule.createElement
	state = {}
	index = {
		layout = if fFlagAppIaScrollAway and var1 then nil else roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		topBar = var3,
		content = roactModule.createElement(providerModule, {
			value = {
				left = p1.props.navigation.getScreenProps("appChatOuterPadding", 12),
				right = p1.props.navigation.getScreenProps("appChatOuterPadding", 12)
			}
		}, {
			navigatorFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if fFlagAppIaScrollAway and var1 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -p1.props.navigation.getScreenProps("topBarHeight", 0))
			}, {
				navigator = roactModule.createElement(p1.getNavigator(p1.state.shouldReduceMotion), p1.props)
			})
		})
	}
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ChatLandingStackNavigator = var2(AppChatNavigatorTelemetryProviders, state, index)
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