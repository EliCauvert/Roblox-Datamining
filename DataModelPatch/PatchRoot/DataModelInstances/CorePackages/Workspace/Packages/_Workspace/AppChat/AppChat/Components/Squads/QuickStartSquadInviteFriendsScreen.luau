local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ResetForSquadLobbyForCompactModeModule = require(AppChat.Utils.resetForSquadLobbyForCompactMode)
local ResetForSquadLobbyForWideModeModule = require(AppChat.Utils.resetForSquadLobbyForWideMode)
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local TopBarProviderModule = require(AppChat.TopBarProvider)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local NavProps = require(AppChat.Constants).NavProps
local QuickStartSquadInviteFriendsContainerModule = require(Parent.Squads.QuickStartSquadInviteFriendsContainer)
local QuickStartSquadInviteFriendsScreen = ReactModule.PureComponent:extend("QuickStartSquadInviteFriendsScreen")

function QuickStartSquadInviteFriendsScreen.navigationOptions(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), NavProps (copy), ReactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ArgCheckModule (copy), WithLocalizationFunction (copy), CreateSystemMenuButtonModule (copy)
	if FFlagAppChatTopBarConfigDrivenModule() then
		return { backButtonEnabled = true }
	else
		local ScreenProps = p1.navigation and (p1.navigation.getScreenProps and p1.navigation.getScreenProps(NavProps.WIDE_MODE, false))
		
		return {
			backButtonEnabled = true,
			headerText = {
				raw = "Feature.Squads.Action.Party",
				shouldLocalize = true
			},
			renderRight = if ScreenProps then function()
				-- upvalues: ReactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval)
				return ReactModule.createElement(TopBarProviderModule, {
					screenName = EnumScreensModule.QuickStartSquadInviteFriends,
					render = function(p2)
						-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval)
						local ScreenTopBar = p2.getScreenTopBar(EnumScreensModule.QuickStartSquadInviteFriends)
						ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
						
						return WithLocalizationFunction({ systemButtonText = "Feature.Squads.Action.Start" })(function(LocalizedStrings)
							-- upvalues: CreateSystemMenuButtonModule (upval), ScreenTopBar (copy)
							return CreateSystemMenuButtonModule({
								localizedStrings = LocalizedStrings,
								isDisabled = not ScreenTopBar.systemButtonEnabled,
								onActivated = ScreenTopBar.systemButtonActivated
							})
						end)
					end
				})
			end else nil
		}
	end
end

function QuickStartSquadInviteFriendsScreen.init(p1)
	-- upvalues: NavProps (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), ResetForSquadLobbyForWideModeModule (copy), ResetForSquadLobbyForCompactModeModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), ArgCheckModule (copy)
	p1.wideMode = p1.props.navigation.getScreenProps(NavProps.WIDE_MODE, false)
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.QuickStartSquadInviteFriends, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Squads.Action.Start",
			headerText = {
				raw = "Feature.Squads.Action.Party",
				shouldLocalize = true
			}
		})
	end
	function p1.navigateIntoSquadLobby(p2)
		-- upvalues: p1 (copy), NavProps (upval), ResetForSquadLobbyForWideModeModule (upval), ResetForSquadLobbyForCompactModeModule (upval)
		local PartyAttemptIdParam = p1.props.navigation.getParam("partyAttemptId", nil)
		
		if p1.props.navigation.getScreenProps(NavProps.WIDE_MODE, false) then
			ResetForSquadLobbyForWideModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = PartyAttemptIdParam })
			
			return
		else
			ResetForSquadLobbyForCompactModeModule(p1.props.navigation, p2, { squadCreateOrJoinAttemptId = PartyAttemptIdParam })
		end
	end
	
	function p1.onSelectedFriendsChanged(SystemButtonEnabled, SystemButtonActivated)
		-- upvalues: p1 (copy), FFlagAppChatTopBarSignalsStoreModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), NavProps (upval), ArgCheckModule (upval)
		if not p1.wideMode then return end
		if FFlagAppChatTopBarSignalsStoreModule or FFlagAppChatTopBarConfigDrivenModule() then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.QuickStartSquadInviteFriends, {
				systemButtonEnabled = SystemButtonEnabled,
				systemButtonActivated = SystemButtonActivated
			})
			
			return
		end
		local ScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps(NavProps.SET_SCREEN_TOP_BAR, nil)
		ArgCheckModule.isNotNil(ScreenProps, "setScreenTopBar in screenProps")
		
		if ScreenProps then
			ScreenProps(EnumScreensModule.QuickStartSquadInviteFriends, {
				systemButtonEnabled = SystemButtonEnabled,
				systemButtonActivated = SystemButtonActivated
			})
			
			return
		end
	end
end

function QuickStartSquadInviteFriendsScreen.render(p1)
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

function QuickStartSquadInviteFriendsScreen.didMount(p1)
	if p1.wideMode then
		p1.onSelectedFriendsChanged(false, nil)
	end
end

return QuickStartSquadInviteFriendsScreen