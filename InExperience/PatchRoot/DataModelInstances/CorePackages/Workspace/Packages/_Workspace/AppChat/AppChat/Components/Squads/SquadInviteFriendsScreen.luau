local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local argCheckModule = require(parent.ArgCheck)
local withLocalization = require(parent.Localization).withLocalization
local topBarProviderModule = require(appChat.TopBarProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local enumScreensModule = require(appChat.EnumScreens)
local fFlagEnablePartyQuickStartButton = sharedFlagsModule.FFlagEnablePartyQuickStartButton
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local navProps = require(appChat.Constants).NavProps
local squadInviteFriendsModule = require(parent.Squads.SquadInviteFriends)
local squadInviteFriendsContainerModule = require(parent.Squads.SquadInviteFriendsContainer)
local squadInviteFriendsScreen = reactModule.PureComponent:extend("SquadInviteFriendsScreen")

if not fFlagEnablePartyQuickStartButton then
	function squadInviteFriendsScreen.navigationOptions(_)
		return {
			headerText = {
				raw = "Feature.Squads.Label.InviteToSquad",
				shouldLocalize = true
			}
		}
	end
end
local function navigationOptions(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), navProps (ref), reactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	return if fFlagAppChatTopBarConfigDrivenModule() then {} elseif p1.navigation and (p1.navigation.getScreenProps and p1.navigation.getScreenProps(navProps.WIDE_MODE, false)) then {
		renderRight = function()
			-- upvalues: reactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
			return reactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				render = function(p2)
					-- upvalues: enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
					local screenTopBar = p2.getScreenTopBar(enumScreensModule.SquadInviteFriends)
					
					return withLocalization({ systemButtonText = "Feature.Squads.Action.Add" })(function(p3)
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref)
						return createSystemMenuButtonModule({
							localizedStrings = p3,
							isDisabled = not screenTopBar.systemButtonEnabled,
							onActivated = screenTopBar.systemButtonActivated
						})
					end)
				end
			})
		end
	} else {}
end

squadInviteFriendsScreen.navigationOptions = navigationOptions

function squadInviteFriendsScreen.init(p1)
	-- upvalues: navProps (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), fFlagEnablePartyQuickStartButton (ref), fFlagAppChatTopBarSignalsStoreModule (ref), argCheckModule (ref)
	p1.wideMode = p1.props.navigation.getScreenProps(navProps.WIDE_MODE, false)
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadInviteFriends, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Squads.Action.Add",
			headerText = if fFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
		})
	end
	function p3.onSelectedFriendsChanged(p2, p3)
		-- upvalues: p1 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), navProps (copy), argCheckModule (copy)
		if not p1.wideMode then return end
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadInviteFriends, { systemButtonEnabled = p2, systemButtonActivated = p3 })
			
			return
		end
		local screenProps = p1.props.navigation.getScreenProps(navProps.SET_SCREEN_TOP_BAR, nil)
		argCheckModule.isNotNil(screenProps, "setScreenTopBar in screenProps")
		
		if screenProps then
			screenProps(enumScreensModule.SquadInviteFriends, { systemButtonEnabled = p2, systemButtonActivated = p3 })
			
			return
		end
	end
end

function squadInviteFriendsScreen.render(p1)
	-- upvalues: reactModule (ref), fFlagEnablePartyQuickStartButton (ref), squadInviteFriendsContainerModule (ref), squadInviteFriendsModule (ref)
	return reactModule.createElement(if fFlagEnablePartyQuickStartButton then squadInviteFriendsContainerModule else squadInviteFriendsModule, {
		participants = p1.props.participants,
		onSelectedFriendsChanged = if p1.wideMode then p1.onSelectedFriendsChanged else nil,
		shouldHideFooterButton = p1.wideMode
	})
end

function squadInviteFriendsScreen.didMount(p1)
	if p1.wideMode then
		p1.onSelectedFriendsChanged(false, nil)
	end
end

local var1 = roactRoduxModule.connect(function(p1, p2)
	local conversationId = p1.ChatAppReducer.Conversations[p2.navigation.getParam("conversationId")]
	
	return {
		participants = if conversationId then conversationId.participants else nil
	}
end)(squadInviteFriendsScreen)
var1.navigationOptions = navigationOptions

return var1