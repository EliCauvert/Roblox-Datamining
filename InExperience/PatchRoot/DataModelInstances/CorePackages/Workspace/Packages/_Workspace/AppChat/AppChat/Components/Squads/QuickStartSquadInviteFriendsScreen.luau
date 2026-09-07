local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local resetForSquadLobbyForCompactModeModule = require(appChat.Utils.resetForSquadLobbyForCompactMode)
local resetForSquadLobbyForWideModeModule = require(appChat.Utils.resetForSquadLobbyForWideMode)
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local withLocalization = require(parent.Localization).withLocalization
local topBarProviderModule = require(appChat.TopBarProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local enumScreensModule = require(appChat.EnumScreens)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local navProps = require(appChat.Constants).NavProps
local quickStartSquadInviteFriendsContainerModule = require(parent.Squads.QuickStartSquadInviteFriendsContainer)
local quickStartSquadInviteFriendsScreen = reactModule.PureComponent:extend("QuickStartSquadInviteFriendsScreen")

function quickStartSquadInviteFriendsScreen.navigationOptions(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), navProps (ref), reactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	return if fFlagAppChatTopBarConfigDrivenModule() then { backButtonEnabled = true } else {
		backButtonEnabled = true,
		headerText = {
			raw = "Feature.Squads.Action.Party",
			shouldLocalize = true
		},
		renderRight = if p1.navigation and (p1.navigation.getScreenProps and p1.navigation.getScreenProps(navProps.WIDE_MODE, false)) then function()
			-- upvalues: reactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
			return reactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.QuickStartSquadInviteFriends,
				render = function(p2)
					-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
					local screenTopBar = p2.getScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends)
					argCheckModule.isType(screenTopBar, "table", "screenTopBar")
					
					return withLocalization({ systemButtonText = "Feature.Squads.Action.Start" })(function(p3)
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref)
						return createSystemMenuButtonModule({
							localizedStrings = p3,
							isDisabled = not screenTopBar.systemButtonEnabled,
							onActivated = screenTopBar.systemButtonActivated
						})
					end)
				end
			})
		end else nil
	}
end

function quickStartSquadInviteFriendsScreen.init(p1)
	-- upvalues: navProps (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), resetForSquadLobbyForWideModeModule (ref), resetForSquadLobbyForCompactModeModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), argCheckModule (ref)
	p1.wideMode = p1.props.navigation.getScreenProps(navProps.WIDE_MODE, false)
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Squads.Action.Start",
			headerText = {
				raw = "Feature.Squads.Action.Party",
				shouldLocalize = true
			}
		})
	end
	function p3.navigateIntoSquadLobby(p2)
		-- upvalues: p1 (ref), navProps (copy), resetForSquadLobbyForWideModeModule (copy), resetForSquadLobbyForCompactModeModule (copy)
		local partyAttemptId = p1.props.navigation.getParam("partyAttemptId", nil)
		
		if p1.props.navigation.getScreenProps(navProps.WIDE_MODE, false) then
			resetForSquadLobbyForWideModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = partyAttemptId })
			
			return
		end
		resetForSquadLobbyForCompactModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = partyAttemptId })
	end
	
	function p3.onSelectedFriendsChanged(p2, p3)
		-- upvalues: p1 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), navProps (copy), argCheckModule (copy)
		if not p1.wideMode then return end
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends, { systemButtonEnabled = p2, systemButtonActivated = p3 })
			
			return
		end
		local screenProps = p1.props.navigation.getScreenProps(navProps.SET_SCREEN_TOP_BAR, nil)
		argCheckModule.isNotNil(screenProps, "setScreenTopBar in screenProps")
		
		if screenProps then
			screenProps(enumScreensModule.QuickStartSquadInviteFriends, { systemButtonEnabled = p2, systemButtonActivated = p3 })
			
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