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

function quickStartSquadInviteFriendsScreen.navigationOptions(p0)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), navProps (ref), reactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	return if fFlagAppChatTopBarConfigDrivenModule() then { backButtonEnabled = true } else {
		backButtonEnabled = true,
		headerText = {
			raw = "Feature.Squads.Action.Party",
			shouldLocalize = true
		},
		renderRight = if p0.navigation and (p0.navigation.getScreenProps and p0.navigation.getScreenProps(navProps.WIDE_MODE, false)) then function()
			-- upvalues: reactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
			return reactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.QuickStartSquadInviteFriends,
				render = function(p1)
					-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy)
					local screenTopBar = p1.getScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends)
					argCheckModule.isType(screenTopBar, "table", "screenTopBar")
					
					return withLocalization({ systemButtonText = "Feature.Squads.Action.Start" })(function(p2)
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref)
						return createSystemMenuButtonModule({
							localizedStrings = p2,
							isDisabled = not screenTopBar.systemButtonEnabled,
							onActivated = screenTopBar.systemButtonActivated
						})
					end)
				end
			})
		end else nil
	}
end

function quickStartSquadInviteFriendsScreen.init(p3)
	-- upvalues: navProps (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), resetForSquadLobbyForWideModeModule (ref), resetForSquadLobbyForCompactModeModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), argCheckModule (ref)
	p3.wideMode = p3.props.navigation.getScreenProps(navProps.WIDE_MODE, false)
	
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
	function p3.navigateIntoSquadLobby(p4)
		-- upvalues: p3 (ref), navProps (copy), resetForSquadLobbyForWideModeModule (copy), resetForSquadLobbyForCompactModeModule (copy)
		local partyAttemptId = p3.props.navigation.getParam("partyAttemptId", nil)
		
		if p3.props.navigation.getScreenProps(navProps.WIDE_MODE, false) then
			resetForSquadLobbyForWideModeModule(p3.props.navigation, p4, { squadCreateOrJoinAttemptId = partyAttemptId })
			
			return
		end
		resetForSquadLobbyForCompactModeModule(p3.props.navigation, p4, { squadCreateOrJoinAttemptId = partyAttemptId })
	end
	
	function p3.onSelectedFriendsChanged(p5, p6)
		-- upvalues: p3 (ref), fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), navProps (copy), argCheckModule (copy)
		if not p3.wideMode then return end
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.QuickStartSquadInviteFriends, { systemButtonEnabled = p5, systemButtonActivated = p6 })
			
			return
		end
		local screenProps = p3.props.navigation.getScreenProps(navProps.SET_SCREEN_TOP_BAR, nil)
		argCheckModule.isNotNil(screenProps, "setScreenTopBar in screenProps")
		
		if screenProps then
			screenProps(enumScreensModule.QuickStartSquadInviteFriends, { systemButtonEnabled = p5, systemButtonActivated = p6 })
			
			return
		end
	end
end

function quickStartSquadInviteFriendsScreen.render(p7)
	-- upvalues: argCheckModule (ref), reactModule (ref), quickStartSquadInviteFriendsContainerModule (ref)
	local var16 = argCheckModule.isNotNil(p7.props.navigation, "navigation in CreateNewChatScreen")
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, if var16.getScreenProps("wideMode", false) then -var16.getScreenProps("topBarHeight", 0) else 0)
	}, {
		reactModule.createElement(quickStartSquadInviteFriendsContainerModule, {
			navigateIntoSquadLobby = p7.navigateIntoSquadLobby,
			partyAttemptId = p7.props.navigation.getParam("partyAttemptId", nil),
			onSelectedFriendsChanged = p7.onSelectedFriendsChanged,
			shouldHideFooterButton = p7.wideMode
		})
	})
end

function quickStartSquadInviteFriendsScreen.didMount(p8)
	if p8.wideMode then
		p8.onSelectedFriendsChanged(false, nil)
	end
end

return quickStartSquadInviteFriendsScreen