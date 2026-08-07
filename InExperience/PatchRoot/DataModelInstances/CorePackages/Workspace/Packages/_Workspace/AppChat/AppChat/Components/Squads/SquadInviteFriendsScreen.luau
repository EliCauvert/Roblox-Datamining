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
	function squadInviteFriendsScreen.navigationOptions(_) --[[ line: 29 ]]
		return {
			headerText = {
				raw = "Feature.Squads.Label.InviteToSquad",
				shouldLocalize = true
			}
		}
	end
end
local function navigationOptions(p0) --[[ line: 39 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), navProps (ref), reactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	return if fFlagAppChatTopBarConfigDrivenModule() then {} elseif p0.navigation and (p0.navigation.getScreenProps and p0.navigation.getScreenProps(navProps.WIDE_MODE, false)) then {
		renderRight = function() --[[ line: 53 ]]
			-- upvalues: reactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
			return reactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.SquadInviteFriends,
				render = function(p1) --[[ line: 56 ]]
					-- upvalues: enumScreensModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
					local screenTopBar = p1.getScreenTopBar(enumScreensModule.SquadInviteFriends)
					
					return withLocalization({ systemButtonText = "Feature.Squads.Action.Add" })(function(p2) --[[ line: 61 ]]
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref)
						return createSystemMenuButtonModule({
							localizedStrings = p2,
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

function squadInviteFriendsScreen.init(p3) --[[ line: 75 ]]
	-- upvalues: navProps (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), fFlagEnablePartyQuickStartButton (ref), fFlagAppChatTopBarSignalsStoreModule (ref), argCheckModule (ref)
	p3.wideMode = p3.props.navigation.getScreenProps(navProps.WIDE_MODE, false)
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadInviteFriends, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Squads.Action.Add",
			headerText = if fFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
		})
	end
	function p3.onSelectedFriendsChanged(p4, p5) --[[ line: 91 ]]
		-- upvalues: p3 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), navProps (copy), argCheckModule (copy)
		if not p3.wideMode then return end
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadInviteFriends, { systemButtonEnabled = p4, systemButtonActivated = p5 })
			
			return
		end
		local screenProps = p3.props.navigation.getScreenProps(navProps.SET_SCREEN_TOP_BAR, nil)
		argCheckModule.isNotNil(screenProps, "setScreenTopBar in screenProps")
		
		if screenProps then
			screenProps(enumScreensModule.SquadInviteFriends, { systemButtonEnabled = p4, systemButtonActivated = p5 })
			
			return
		end
	end
end

function squadInviteFriendsScreen.render(p6) --[[ line: 117 ]]
	-- upvalues: reactModule (ref), fFlagEnablePartyQuickStartButton (ref), squadInviteFriendsContainerModule (ref), squadInviteFriendsModule (ref)
	return reactModule.createElement(if fFlagEnablePartyQuickStartButton then squadInviteFriendsContainerModule else squadInviteFriendsModule, {
		participants = p6.props.participants,
		onSelectedFriendsChanged = if p6.wideMode then p6.onSelectedFriendsChanged else nil,
		shouldHideFooterButton = p6.wideMode
	})
end

function squadInviteFriendsScreen.didMount(p7) --[[ line: 127 ]]
	if p7.wideMode then
		p7.onSelectedFriendsChanged(false, nil)
	end
end

local var15 = roactRoduxModule.connect(function(p8, p9) --[[ line: 133 ]]
	local conversationId = p8.ChatAppReducer.Conversations[p9.navigation.getParam("conversationId")]
	
	return {
		participants = if conversationId then conversationId.participants else nil
	}
end)(squadInviteFriendsScreen)
var15.navigationOptions = navigationOptions

return var15