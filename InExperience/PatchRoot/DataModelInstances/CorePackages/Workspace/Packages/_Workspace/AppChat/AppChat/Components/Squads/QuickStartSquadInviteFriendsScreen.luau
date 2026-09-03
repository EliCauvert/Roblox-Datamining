local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local resetForSquadLobbyForCompactModeModule = require(appChat.Utils.resetForSquadLobbyForCompactMode)
local resetForSquadLobbyForWideModeModule = require(appChat.Utils.resetForSquadLobbyForWideMode)
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local enumScreensModule = require(appChat.EnumScreens)
local navProps = require(appChat.Constants).NavProps
local quickStartSquadInviteFriendsContainerModule = require(parent.Squads.QuickStartSquadInviteFriendsContainer)
local quickStartSquadInviteFriendsScreen = reactModule.PureComponent:extend("QuickStartSquadInviteFriendsScreen")

function quickStartSquadInviteFriendsScreen.navigationOptions(_)
	return { backButtonEnabled = true }
end

function quickStartSquadInviteFriendsScreen.init(p1)
	-- upvalues: navProps (ref), getTopBarStoreModule (ref), enumScreensModule (ref), resetForSquadLobbyForWideModeModule (ref), resetForSquadLobbyForCompactModeModule (ref)
	p1.wideMode = p1.props.navigation.getScreenProps(navProps.WIDE_MODE, false)
	getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends, {
		backButtonEnabled = true,
		systemButtonText = "Feature.Squads.Action.Start",
		headerText = {
			raw = "Feature.Squads.Action.Party",
			shouldLocalize = true
		}
	})
	
	function p0.navigateIntoSquadLobby(p2)
		-- upvalues: p1 (ref), navProps (copy), resetForSquadLobbyForWideModeModule (copy), resetForSquadLobbyForCompactModeModule (copy)
		local partyAttemptId = p1.props.navigation.getParam("partyAttemptId", nil)
		
		if p1.props.navigation.getScreenProps(navProps.WIDE_MODE, false) then
			resetForSquadLobbyForWideModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = partyAttemptId })
			
			return
		end
		resetForSquadLobbyForCompactModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = partyAttemptId })
	end
	
	function p0.onSelectedFriendsChanged(p2, p3)
		-- upvalues: p1 (ref), getTopBarStoreModule (copy), enumScreensModule (copy)
		if p1.wideMode then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends, { systemButtonEnabled = p2, systemButtonActivated = p3 })
			
			return
		end
	end
end

function quickStartSquadInviteFriendsScreen.render(p1)
	-- upvalues: argCheckModule (ref), reactModule (ref), quickStartSquadInviteFriendsContainerModule (ref)
	local var1 = argCheckModule.isNotNil(p1.props.navigation, "navigation in CreateNewChatScreen")
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, if var1.getScreenProps("wideMode", false) then -var1.getScreenProps("topBarHeight", 0) else 0)
	}, {
		reactModule.createElement(quickStartSquadInviteFriendsContainerModule, {
			navigateIntoSquadLobby = p1.navigateIntoSquadLobby,
			partyAttemptId = p1.props.navigation.getParam("partyAttemptId", nil),
			onSelectedFriendsChanged = p1.onSelectedFriendsChanged,
			shouldHideFooterButton = p1.wideMode
		})
	})
end

function quickStartSquadInviteFriendsScreen.didMount(p1)
	if p1.wideMode then
		p1.onSelectedFriendsChanged(false, nil)
	end
end

return quickStartSquadInviteFriendsScreen