local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ResetForSquadLobbyForCompactModeModule = require(AppChat.Utils.resetForSquadLobbyForCompactMode)
local ResetForSquadLobbyForWideModeModule = require(AppChat.Utils.resetForSquadLobbyForWideMode)
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local EnumScreensModule = require(AppChat.EnumScreens)
local NavProps = require(AppChat.Constants).NavProps
local QuickStartSquadInviteFriendsContainerModule = require(Parent.Squads.QuickStartSquadInviteFriendsContainer)
local QuickStartSquadInviteFriendsScreen = ReactModule.PureComponent:extend("QuickStartSquadInviteFriendsScreen")

function QuickStartSquadInviteFriendsScreen:navigationOptions() --[[ Line: 19 ]]
	return { backButtonEnabled = true }
end

function QuickStartSquadInviteFriendsScreen.init(p1) --[[ Line: 25 ]]
	-- upvalues: NavProps (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), ResetForSquadLobbyForWideModeModule (copy), ResetForSquadLobbyForCompactModeModule (copy)
	p1.wideMode = p1.props.navigation.getScreenProps(NavProps.WIDE_MODE, false)
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.QuickStartSquadInviteFriends, {
		backButtonEnabled = true,
		systemButtonText = "Feature.Squads.Action.Start",
		headerText = {
			raw = "Feature.Squads.Action.Party",
			shouldLocalize = true
		}
	})
	
	function p1.navigateIntoSquadLobby(p2) --[[ Line: 37 ]]
		-- upvalues: p1 (copy), NavProps (upval), ResetForSquadLobbyForWideModeModule (upval), ResetForSquadLobbyForCompactModeModule (upval)
		local PartyAttemptIdParam = p1.props.navigation.getParam("partyAttemptId", nil)
		
		if p1.props.navigation.getScreenProps(NavProps.WIDE_MODE, false) then
			ResetForSquadLobbyForWideModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = PartyAttemptIdParam })
			
			return
		else
			ResetForSquadLobbyForCompactModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = PartyAttemptIdParam })
		end
	end
	
	function p1.onSelectedFriendsChanged(SystemButtonEnabled, SystemButtonActivated) --[[ Line: 51 ]]
		-- upvalues: p1 (copy), GetTopBarStoreModule (upval), EnumScreensModule (upval)
		if p1.wideMode then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.QuickStartSquadInviteFriends, {
				systemButtonEnabled = SystemButtonEnabled,
				systemButtonActivated = SystemButtonActivated
			})
			
			return
		end
	end
end

function QuickStartSquadInviteFriendsScreen.render(p1) --[[ Line: 63 ]]
	-- upvalues: ArgCheckModule (copy), ReactModule (copy), QuickStartSquadInviteFriendsContainerModule (copy)
	local NavigationInCreateNewChatScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in CreateNewChatScreen")
	local TopBarHeightScreenProps = NavigationInCreateNewChatScreen.getScreenProps("topBarHeight", 0)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, if NavigationInCreateNewChatScreen.getScreenProps("wideMode", false) then -TopBarHeightScreenProps else 0)
	}, {
		ReactModule.createElement(QuickStartSquadInviteFriendsContainerModule, {
			navigateIntoSquadLobby = p1.navigateIntoSquadLobby,
			partyAttemptId = p1.props.navigation.getParam("partyAttemptId", nil),
			onSelectedFriendsChanged = p1.onSelectedFriendsChanged,
			shouldHideFooterButton = p1.wideMode
		})
	})
end

function QuickStartSquadInviteFriendsScreen.didMount(p1) --[[ Line: 81 ]]
	if p1.wideMode then
		p1.onSelectedFriendsChanged(false, nil)
	end
end

return QuickStartSquadInviteFriendsScreen