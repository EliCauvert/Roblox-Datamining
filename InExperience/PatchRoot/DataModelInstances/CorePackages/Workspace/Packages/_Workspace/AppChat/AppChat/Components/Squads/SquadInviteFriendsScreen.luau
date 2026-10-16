local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local NavProps = require(AppChat.Constants).NavProps
local SquadInviteFriendsModule = require(Parent.Squads.SquadInviteFriends)
local SquadInviteFriendsContainerModule = require(Parent.Squads.SquadInviteFriendsContainer)
local SquadInviteFriendsScreen = ReactModule.PureComponent:extend("SquadInviteFriendsScreen")

local function navigationOptions(_) --[[ Line: 22 ]]
	return {}
end

SquadInviteFriendsScreen.navigationOptions = navigationOptions

function SquadInviteFriendsScreen.init(p1) --[[ Line: 27 ]]
	-- upvalues: NavProps (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), FFlagEnablePartyQuickStartButton (copy)
	p1.wideMode = p1.props.navigation.getScreenProps(NavProps.WIDE_MODE, false)
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.SquadInviteFriends, {
		backButtonEnabled = true,
		systemButtonText = "Feature.Squads.Action.Add",
		headerText = if FFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
	})
	
	function p1.onSelectedFriendsChanged(SystemButtonEnabled, SystemButtonActivated) --[[ Line: 41 ]]
		-- upvalues: p1 (copy), GetTopBarStoreModule (upval), EnumScreensModule (upval)
		if p1.wideMode then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.SquadInviteFriends, {
				systemButtonEnabled = SystemButtonEnabled,
				systemButtonActivated = SystemButtonActivated
			})
			
			return
		end
	end
end

function SquadInviteFriendsScreen.render(p1) --[[ Line: 53 ]]
	-- upvalues: ReactModule (copy), FFlagEnablePartyQuickStartButton (copy), SquadInviteFriendsContainerModule (copy), SquadInviteFriendsModule (copy)
	return ReactModule.createElement(if FFlagEnablePartyQuickStartButton then SquadInviteFriendsContainerModule else SquadInviteFriendsModule, {
		participants = p1.props.participants,
		onSelectedFriendsChanged = if p1.wideMode then p1.onSelectedFriendsChanged else nil,
		shouldHideFooterButton = p1.wideMode
	})
end

function SquadInviteFriendsScreen.didMount(p1) --[[ Line: 63 ]]
	if p1.wideMode then
		p1.onSelectedFriendsChanged(false, nil)
	end
end

local v1 = RoactRoduxModule.connect(function(p1, p2) --[[ Line: 69 ]]
	local Conversation = p1.ChatAppReducer.Conversations[p2.navigation.getParam("conversationId")]
	
	return {
		participants = Conversation and Conversation.participants or nil
	}
end)(SquadInviteFriendsScreen)
v1.navigationOptions = navigationOptions

return v1