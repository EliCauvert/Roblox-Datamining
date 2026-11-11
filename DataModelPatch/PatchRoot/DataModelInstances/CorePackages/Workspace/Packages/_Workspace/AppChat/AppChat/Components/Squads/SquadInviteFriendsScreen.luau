local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local ArgCheckModule = require(Parent.ArgCheck)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local TopBarProviderModule = require(AppChat.TopBarProvider)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local NavProps = require(AppChat.Constants).NavProps
local SquadInviteFriendsModule = require(Parent.Squads.SquadInviteFriends)
local SquadInviteFriendsContainerModule = require(Parent.Squads.SquadInviteFriendsContainer)
local SquadInviteFriendsScreen = ReactModule.PureComponent:extend("SquadInviteFriendsScreen")

if not FFlagEnablePartyQuickStartButton then
	function SquadInviteFriendsScreen:navigationOptions()
		return {
			headerText = {
				raw = "Feature.Squads.Label.InviteToSquad",
				shouldLocalize = true
			}
		}
	end
end
local function navigationOptions(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), NavProps (copy), ReactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), WithLocalizationFunction (copy), CreateSystemMenuButtonModule (copy)
	if FFlagAppChatTopBarConfigDrivenModule() then
		return {}
	else
		local ScreenProps = p1.navigation and (p1.navigation.getScreenProps and p1.navigation.getScreenProps(NavProps.WIDE_MODE, false))
		
		return if ScreenProps then {
			renderRight = function()
				-- upvalues: ReactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval)
				return ReactModule.createElement(TopBarProviderModule, {
					screenName = EnumScreensModule.SquadInviteFriends,
					render = function(p2)
						-- upvalues: EnumScreensModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval)
						local ScreenTopBar = p2.getScreenTopBar(EnumScreensModule.SquadInviteFriends)
						
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
		} else {}
	end
end

SquadInviteFriendsScreen.navigationOptions = navigationOptions

function SquadInviteFriendsScreen.init(p1)
	-- upvalues: NavProps (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), FFlagEnablePartyQuickStartButton (copy), FFlagAppChatTopBarSignalsStoreModule (copy), ArgCheckModule (copy)
	p1.wideMode = p1.props.navigation.getScreenProps(NavProps.WIDE_MODE, false)
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.SquadInviteFriends, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Squads.Action.Add",
			headerText = if FFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
		})
	end
	function p1.onSelectedFriendsChanged(SystemButtonEnabled, SystemButtonActivated)
		-- upvalues: p1 (copy), FFlagAppChatTopBarSignalsStoreModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), NavProps (upval), ArgCheckModule (upval)
		if not p1.wideMode then return end
		if FFlagAppChatTopBarSignalsStoreModule or FFlagAppChatTopBarConfigDrivenModule() then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.SquadInviteFriends, {
				systemButtonEnabled = SystemButtonEnabled,
				systemButtonActivated = SystemButtonActivated
			})
			
			return
		end
		local ScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps(NavProps.SET_SCREEN_TOP_BAR, nil)
		ArgCheckModule.isNotNil(ScreenProps, "setScreenTopBar in screenProps")
		
		if ScreenProps then
			ScreenProps(EnumScreensModule.SquadInviteFriends, {
				systemButtonEnabled = SystemButtonEnabled,
				systemButtonActivated = SystemButtonActivated
			})
			
			return
		end
	end
end

function SquadInviteFriendsScreen.render(p1)
	-- upvalues: ReactModule (copy), FFlagEnablePartyQuickStartButton (copy), SquadInviteFriendsContainerModule (copy), SquadInviteFriendsModule (copy)
	return ReactModule.createElement(if FFlagEnablePartyQuickStartButton then SquadInviteFriendsContainerModule else SquadInviteFriendsModule, {
		participants = p1.props.participants,
		onSelectedFriendsChanged = if p1.wideMode then p1.onSelectedFriendsChanged else nil,
		shouldHideFooterButton = p1.wideMode
	})
end

function SquadInviteFriendsScreen.didMount(p1)
	if p1.wideMode then
		p1.onSelectedFriendsChanged(false, nil)
	end
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	local Conversation = p1.ChatAppReducer.Conversations[p2.navigation.getParam("conversationId")]
	
	return {
		participants = Conversation and Conversation.participants or nil
	}
end)(SquadInviteFriendsScreen)
v1.navigationOptions = navigationOptions

return v1