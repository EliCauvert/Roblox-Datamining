local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local enumScreensModule = require(appChat.EnumScreens)
local fFlagEnablePartyQuickStartButton = sharedFlagsModule.FFlagEnablePartyQuickStartButton
local navProps = require(appChat.Constants).NavProps
local squadInviteFriendsModule = require(parent.Squads.SquadInviteFriends)
local squadInviteFriendsContainerModule = require(parent.Squads.SquadInviteFriendsContainer)
local squadInviteFriendsScreen = reactModule.PureComponent:extend("SquadInviteFriendsScreen")

local function navigationOptions(_)
	return {}
end

squadInviteFriendsScreen.navigationOptions = navigationOptions

function squadInviteFriendsScreen.init(p1)
	-- upvalues: navProps (ref), getTopBarStoreModule (ref), enumScreensModule (ref), fFlagEnablePartyQuickStartButton (ref)
	p1.wideMode = p1.props.navigation.getScreenProps(navProps.WIDE_MODE, false)
	getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadInviteFriends, {
		backButtonEnabled = true,
		systemButtonText = "Feature.Squads.Action.Add",
		headerText = if fFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
	})
	
	function p0.onSelectedFriendsChanged(p2, p3)
		-- upvalues: p1 (ref), getTopBarStoreModule (copy), enumScreensModule (copy)
		if p1.wideMode then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.SquadInviteFriends, { systemButtonEnabled = p2, systemButtonActivated = p3 })
			
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