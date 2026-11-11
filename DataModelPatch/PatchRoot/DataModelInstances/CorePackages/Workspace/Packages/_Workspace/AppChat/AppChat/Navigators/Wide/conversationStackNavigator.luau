local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local CryoModule = require(Parent.Cryo)
local AutoFocusNavigationModule = require(script.Parent.Parent.autoFocusNavigation)
local ReactModule = require(Parent.React)
local SquadAddFriendsIconButtonModule = require(AppChat.Components.Squads.SquadAddFriendsIconButton)
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatConversationScreenModule = require(AppChat.Components.ChatConversation.ChatConversationScreen)
local ChatDetailsScreenModule = require(AppChat.Components.ChatDetails.ChatDetailsScreen)
local ChatDetailsNavigationOptionsModule = require(AppChat.Components.ChatDetails.ChatDetailsNavigationOptions)
local SquadInviteFriendsScreenModule = require(AppChat.Components.Squads.SquadInviteFriendsScreen)
local SquadLobbyScreenModule = require(AppChat.Components.Squads.SquadLobbyScreen)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local TopBarProviderModule = require(AppChat.TopBarProvider)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local NavProps = require(AppChat.Constants).NavProps

local function instantTransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p1, p2)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), CryoModule (copy), ChatDetailsNavigationOptionsModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ReactModule (copy), SquadAddFriendsIconButtonModule (copy), NavProps (copy), FFlagEnablePartyQuickStartButton (copy), TopBarProviderModule (copy), EnumScreensModule (copy), WithLocalizationFunction (copy), CreateSystemMenuButtonModule (copy), ChatConversationScreenModule (copy), AutoFocusNavigationModule (copy), ChatDetailsScreenModule (copy), GetFFlagIsSquadEnabledFunction (copy), SquadLobbyScreenModule (copy), SquadInviteFriendsScreenModule (copy), FFlagAppChatDisableAbsorbInputSelectableModule (copy), RoactNavigationModule (copy), instantTransitionConfig (copy)
	local function getSquadLobbyNavigationOptions(p3)
		-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), p1 (copy), CryoModule (upval), ReactModule (upval), SquadAddFriendsIconButtonModule (upval)
		if FFlagAppChatTopBarConfigDrivenModule() then
			return p1 or {}
		else
			local Navigation = p3.navigation
			
			return CryoModule.Dictionary.join({
				backButtonEnabled = true,
				renderRight = function()
					-- upvalues: ReactModule (upval), SquadAddFriendsIconButtonModule (upval), Navigation (copy)
					return ReactModule.createElement(SquadAddFriendsIconButtonModule, { navigation = Navigation })
				end
			}, p1 or {})
		end
	end
	
	local function getSquadInviteFriendsNavigationOptions(p3)
		-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), p1 (copy), NavProps (upval), FFlagEnablePartyQuickStartButton (upval), ReactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval), CryoModule (upval)
		if FFlagAppChatTopBarConfigDrivenModule() then
			return p1 or {}
		end
		local config = {
			backButtonEnabled = true,
			headerText = if FFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
		}
		
		if p3.navigation and (p3.navigation.getScreenProps and p3.navigation.getScreenProps(NavProps.WIDE_MODE, false)) then
			function config.renderRight()
				-- upvalues: ReactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval)
				return ReactModule.createElement(TopBarProviderModule, {
					screenName = EnumScreensModule.SquadInviteFriends,
					render = function(p4)
						-- upvalues: EnumScreensModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval)
						local ScreenTopBar = p4.getScreenTopBar(EnumScreensModule.SquadInviteFriends)
						
						return WithLocalizationFunction({ systemButtonText = "Feature.Squads.Action.Add" })(function(LocalizedStrings)
							-- upvalues: CreateSystemMenuButtonModule (upval), ScreenTopBar (copy)
							return CreateSystemMenuButtonModule({
								localizedStrings = LocalizedStrings,
								isDisabled = not ScreenTopBar.systemButtonEnabled,
								onActivated = ScreenTopBar.systemButtonActivated
							})
						end)
					end
				})
			end
		end
		return CryoModule.Dictionary.join(config, p1 or {})
	end
	
	local List = {
		{
			[EnumScreensModule.ChatConversation] = {
				screen = ChatConversationScreenModule,
				navigationOptions = CryoModule.Dictionary.join({
					backButtonEnabled = false,
					isRoot = true,
					lockIconEnabled = true,
					tabBarVisible = true
				}, p1 or {})
			}
		},
		{
			[EnumScreensModule.ChatDetails] = {
				screen = AutoFocusNavigationModule(ChatDetailsScreenModule),
				navigationOptions = function(_)
					-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), p1 (copy), CryoModule (upval), ChatDetailsNavigationOptionsModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
					return if FFlagAppChatTopBarConfigDrivenModule() then p1 or {} else CryoModule.Dictionary.join({
						backButtonEnabled = true,
						headerText = ChatDetailsNavigationOptionsModule.getHeaderText(),
						backButtonTestId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsTopBarActionButton("back") else nil
					}, p1 or {})
				end
			}
		}
	}
	
	if GetFFlagIsSquadEnabledFunction() then
		table.insert(List, {
			[EnumScreensModule.SquadLobby] = {
				screen = AutoFocusNavigationModule(SquadLobbyScreenModule.WideSquadLobbyScreen),
				navigationOptions = getSquadLobbyNavigationOptions
			}
		})
		table.insert(List, {
			[EnumScreensModule.SquadInviteFriends] = {
				screen = AutoFocusNavigationModule(SquadInviteFriendsScreenModule),
				navigationOptions = getSquadInviteFriendsNavigationOptions
			}
		})
	end
	local DefaultNavigationOptions = { tabBarVisible = true }
	
	if FFlagAppChatDisableAbsorbInputSelectableModule then
		DefaultNavigationOptions.absorbInputSelectable = false
	end
	return RoactNavigationModule.createRobloxStackNavigator(List, {
		defaultNavigationOptions = DefaultNavigationOptions,
		transitionConfig = if p2 then instantTransitionConfig else nil
	})
end