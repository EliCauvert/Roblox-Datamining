local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local cryoModule = require(parent.Cryo)
local autoFocusNavigationModule = require(script.Parent.Parent.autoFocusNavigation)
local reactModule = require(parent.React)
local squadAddFriendsIconButtonModule = require(appChat.Components.Squads.SquadAddFriendsIconButton)
local enumScreensModule = require(appChat.EnumScreens)
local chatConversationScreenModule = require(appChat.Components.ChatConversation.ChatConversationScreen)
local chatDetailsScreenModule = require(appChat.Components.ChatDetails.ChatDetailsScreen)
local chatDetailsNavigationOptionsModule = require(appChat.Components.ChatDetails.ChatDetailsNavigationOptions)
local squadInviteFriendsScreenModule = require(appChat.Components.Squads.SquadInviteFriendsScreen)
local squadLobbyScreenModule = require(appChat.Components.Squads.SquadLobbyScreen)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local topBarProviderModule = require(appChat.TopBarProvider)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local withLocalization = require(parent.Localization).withLocalization
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local navProps = require(appChat.Constants).NavProps

local function instantTransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p0, p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), cryoModule (ref), chatDetailsNavigationOptionsModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), reactModule (ref), squadAddFriendsIconButtonModule (ref), navProps (ref), fFlagEnablePartyQuickStartButton (ref), topBarProviderModule (ref), enumScreensModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref), chatConversationScreenModule (ref), autoFocusNavigationModule (ref), chatDetailsScreenModule (ref), getFFlagIsSquadEnabled (ref), squadLobbyScreenModule (ref), squadInviteFriendsScreenModule (ref), fFlagAppChatDisableAbsorbInputSelectableModule (ref), roactNavigationModule (ref), instantTransitionConfig (ref)
	local function getChatDetailsNavigationOptions(_)
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p0 (ref), cryoModule (copy), chatDetailsNavigationOptionsModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
		return if fFlagAppChatTopBarConfigDrivenModule() then p0 or {} else cryoModule.Dictionary.join({
			backButtonEnabled = true,
			headerText = chatDetailsNavigationOptionsModule.getHeaderText(),
			backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsTopBarActionButton("back") else nil
		}, p0 or {})
	end
	
	local function getSquadLobbyNavigationOptions(p2)
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p0 (ref), cryoModule (copy), reactModule (copy), squadAddFriendsIconButtonModule (copy)
		if fFlagAppChatTopBarConfigDrivenModule() then
			return p0 or {}
		end
		local navigation = p2.navigation
		
		return cryoModule.Dictionary.join({
			backButtonEnabled = true,
			renderRight = function()
				-- upvalues: reactModule (copy), squadAddFriendsIconButtonModule (copy), navigation (ref)
				return reactModule.createElement(squadAddFriendsIconButtonModule, { navigation = navigation })
			end
		}, p0 or {})
	end
	
	local function getSquadInviteFriendsNavigationOptions(p3)
		-- upvalues: fFlagAppChatTopBarConfigDrivenModule (copy), p0 (ref), navProps (copy), fFlagEnablePartyQuickStartButton (copy), reactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy), cryoModule (copy)
		if fFlagAppChatTopBarConfigDrivenModule() then
			return p0 or {}
		end
		local t = {
			backButtonEnabled = true,
			headerText = if fFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
		}
		
		if p3.navigation and (p3.navigation.getScreenProps and p3.navigation.getScreenProps(navProps.WIDE_MODE, false)) then
			function t.renderRight()
				-- upvalues: reactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
				return reactModule.createElement(topBarProviderModule, {
					screenName = enumScreensModule.SquadInviteFriends,
					render = function(p4)
						-- upvalues: enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
						local screenTopBar = p4.getScreenTopBar(enumScreensModule.SquadInviteFriends)
						
						return withLocalization({ systemButtonText = "Feature.Squads.Action.Add" })(function(p5)
							-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref)
							return createSystemMenuButtonModule({
								localizedStrings = p5,
								isDisabled = not screenTopBar.systemButtonEnabled,
								onActivated = screenTopBar.systemButtonActivated
							})
						end)
					end
				})
			end
		end
		return cryoModule.Dictionary.join(t, p0 or {})
	end
	
	local list = {
		{
			[enumScreensModule.ChatConversation] = {
				screen = chatConversationScreenModule,
				navigationOptions = cryoModule.Dictionary.join({
					backButtonEnabled = false,
					isRoot = true,
					lockIconEnabled = true,
					tabBarVisible = true
				}, p0 or {})
			}
		},
		{
			[enumScreensModule.ChatDetails] = {
				screen = autoFocusNavigationModule(chatDetailsScreenModule),
				navigationOptions = getChatDetailsNavigationOptions
			}
		}
	}
	
	if getFFlagIsSquadEnabled() then
		table.insert(list, {
			[enumScreensModule.SquadLobby] = {
				screen = autoFocusNavigationModule(squadLobbyScreenModule.WideSquadLobbyScreen),
				navigationOptions = getSquadLobbyNavigationOptions
			}
		})
		table.insert(list, {
			[enumScreensModule.SquadInviteFriends] = {
				screen = autoFocusNavigationModule(squadInviteFriendsScreenModule),
				navigationOptions = getSquadInviteFriendsNavigationOptions
			}
		})
	end
	local t = { tabBarVisible = true }
	
	if fFlagAppChatDisableAbsorbInputSelectableModule then
		t.absorbInputSelectable = false
	end
	return roactNavigationModule.createRobloxStackNavigator(list, {
		defaultNavigationOptions = t,
		transitionConfig = if p1 then instantTransitionConfig else nil
	})
end