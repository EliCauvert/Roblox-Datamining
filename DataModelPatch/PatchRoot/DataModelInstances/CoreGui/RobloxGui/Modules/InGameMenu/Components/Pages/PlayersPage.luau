local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Images = UIBlox.App.ImageSet.Images
local Parent = script.Parent.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local FocusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local VoiceIndicatorModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicator)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local PlayerLabelV2Module = require(Parent.Components.PlayerLabelV2)
local PlayerContextualMenuModule = require(Parent.Components.PlayerContextualMenu)
local FFlagLuaMenuPerfImprovementsModule = require(Parent.Flags.FFlagLuaMenuPerfImprovements)
local PageNavigationWatcherModule = require(Parent.Components.PageNavigationWatcher)
local DividerModule = require(Parent.Components.Divider)
local BarOnTopScrollingFrameModule = require(Parent.Components.BarOnTopScrollingFrame)
local PageModule = require(Parent.Components.Page)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local AssetsModule = require(Parent.Resources.Assets)
local ConstantsModule1 = require(Parent.Resources.Constants)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local UnblockPlayerModule = require(RobloxGui.Modules.PlayerList.Thunks.UnblockPlayer)
local TrustAndSafetyModule = require(RobloxGui.Modules.TrustAndSafety)
local OnBlockButtonActivatedModule = require(RobloxGui.Modules.Settings.onBlockButtonActivated)
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local NewInGameGlobalGuiInsetFVariable = settings():GetFVariable("InGameGlobalGuiInset") + 24
local PlayersPage = Roact.PureComponent:extend("PlayersPage")
PlayersPage.validateProps = T.strictInterface({
	isMenuOpen = T.boolean,
	voiceEnabled = T.optional(T.boolean),
	inspectMenuEnabled = T.boolean,
	friends = T.map(T.integer, T.enum(Enum.FriendStatus)),
	closeMenu = T.callback,
	unblockPlayer = T.callback,
	pageTitle = T.string,
	screenSize = T.Vector2,
	currentPage = T.optional(T.string),
	isRespawnDialogOpen = T.optional(T.boolean),
	isReportDialogOpen = T.optional(T.boolean),
	isGamepadLastInput = T.optional(T.boolean),
	isCurrentZoneActive = T.optional(T.boolean)
})

function PlayersPage.init(p1)
	-- upvalues: Players (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), Roact (copy), FFlagLuaMenuPerfImprovementsModule (copy)
	p1:setState({
		selectedPlayer = nil,
		pageSizeY = 0,
		voiceChatEnabled = false,
		allMuted = false,
		selectedPlayerRef = nil,
		firstPlayerRef = nil,
		players = Players:GetPlayers(),
		selectedPlayerPosition = Vector2.new(0, 0)
	})
	
	function p1.setSelectedPlayerRef(SelectedPlayerRef)
		-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (upval), p1 (copy), Roact (upval)
		if GetFFlagIGMGamepadSelectionHistoryModule() then
			p1:setState({ selectedPlayerRef = SelectedPlayerRef })
			
			return
		else
			p1:setState({
				selectedPlayerRef = SelectedPlayerRef,
				firstPlayerRef = Roact.None
			})
		end
	end
	
	function p1.setFirstPlayerRef(FirstPlayerRef)
		-- upvalues: p1 (copy)
		p1:setState({ firstPlayerRef = FirstPlayerRef })
	end
	
	if FFlagLuaMenuPerfImprovementsModule then
		function p1.positionChanged(Frame)
			-- upvalues: p1 (copy)
			p1:setState({ selectedPlayerPosition = Frame.AbsolutePosition })
		end
		
		function p1.toggleMoreActions(UserId)
			-- upvalues: Players (upval), p1 (copy), Roact (upval)
			local Player = Players:GetPlayerByUserId(UserId)
			
			if p1.state.selectedPlayer == Player then
				p1:setState({ selectedPlayer = Roact.None })
				
				return
			else
				p1:setState({ selectedPlayer = Player })
			end
		end
	end
end

local function sortPlayers(p1, p2): boolean
	return p1.Name:lower() < p2.Name:lower()
end

function PlayersPage.renderListEntries(p1, Players1)
	-- upvalues: Cryo (copy), sortPlayers (copy), Roact (copy), FFlagLuaMenuPerfImprovementsModule (copy), Players (copy), PlayerLabelV2Module (copy), VoiceIndicatorModule (copy), DividerModule (copy)
	local SortResult = Cryo.List.sort(Players1, sortPlayers)
	local LayoutOrder = 0
	local Elements = {
		ListLayout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	for i, Player in pairs(SortResult) do
		local UserId = FFlagLuaMenuPerfImprovementsModule and Player.UserId or i
		local PositionChanged = FFlagLuaMenuPerfImprovementsModule and p1.positionChanged or function(Frame)
			-- upvalues: p1 (copy)
			p1:setState({ selectedPlayerPosition = Frame.AbsolutePosition })
		end
		local ToggleMoreActions = FFlagLuaMenuPerfImprovementsModule and p1.toggleMoreActions or function()
			-- upvalues: p1 (copy), Player (copy), Roact (upval)
			if p1.state.selectedPlayer == Player then
				p1:setState({ selectedPlayer = Roact.None })
				
				return
			else
				p1:setState({ selectedPlayer = Player })
			end
		end
		local MicLight: string = if Player == Players.LocalPlayer then "MicLight" else "SpeakerLight"
		Elements["player_" .. UserId] = Roact.createElement(PlayerLabelV2Module, {
			username = Player.Name,
			displayName = Player.DisplayName,
			userId = Player.UserId,
			isOnline = true,
			isSelected = p1.state.selectedPlayer == Player,
			LayoutOrder = LayoutOrder,
			onActivated = ToggleMoreActions,
			[Roact.Change.AbsolutePosition] = p1.state.selectedPlayer == Player and PositionChanged or nil,
			[Roact.Ref] = if i == 1 and not p1.state.selectedPlayer then p1.setFirstPlayerRef elseif p1.state.selectedPlayer == Player then p1.setSelectedPlayerRef else nil
		}, {
			Icon = p1.props.voiceEnabled and (Player ~= Players.LocalPlayer and Roact.createElement(VoiceIndicatorModule, {
				hideOnError = true,
				userId = tostring(Player.UserId),
				iconStyle = MicLight,
				onClicked = ToggleMoreActions
			}))
		})
		LayoutOrder += 1
		
		if i < #SortResult then
			Elements["divider_" .. UserId] = Roact.createElement(DividerModule, {
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, -104, 0, 1)
			})
			LayoutOrder += 1
		end
	end
	return Elements
end

function PlayersPage.getMoreActions(p2, p3)
	-- upvalues: Players (copy), Images (copy), RbxAnalyticsService (copy), SendAnalyticsModule (copy), ConstantsModule1 (copy), Roact (copy), AssetsModule (copy), GuiService (copy), TrustAndSafetyModule (copy), Default (copy), NewResult (copy), ConstantsModule (copy), BlockingUtilityModule (copy), OnBlockButtonActivatedModule (copy)
	local List = {}
	
	if p2.state.selectedPlayer ~= nil then
		if p2.state.selectedPlayer ~= Players.LocalPlayer then
			local Friend = if p2.props.friends[p2.state.selectedPlayer.UserId] then p2.props.friends[p2.state.selectedPlayer.UserId] else Enum.FriendStatus.Unknown
			local AddFriend = p3.addFriend
			local IconsActionsFriendsFriendAdd = Images["icons/actions/friends/friendAdd"]
			
			if Friend == Enum.FriendStatus.Friend then
				AddFriend = p3.unfriend
				IconsActionsFriendsFriendAdd = Images["icons/actions/friends/friendRemove"]
			elseif Friend == Enum.FriendStatus.FriendRequestSent then
				AddFriend = p3.cancelFriend
				IconsActionsFriendsFriendAdd = Images["icons/actions/friends/friendRemove"]
			elseif Friend == Enum.FriendStatus.FriendRequestReceived then
				AddFriend = p3.acceptFriend
			end
			table.insert(List, {
				text = AddFriend,
				icon = IconsActionsFriendsFriendAdd,
				onActivated = function()
					-- upvalues: p2 (copy), Friend (ref), Players (upval), RbxAnalyticsService (upval), SendAnalyticsModule (upval), ConstantsModule1 (upval), Roact (upval)
					local SelectedPlayer = p2.state.selectedPlayer
					
					if Friend == Enum.FriendStatus.Friend or Friend == Enum.FriendStatus.FriendRequestSent then
						Players.LocalPlayer:RevokeFriendship(SelectedPlayer)
					else
						Players.LocalPlayer:RequestFriendship(SelectedPlayer)
						RbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						SendAnalyticsModule(ConstantsModule1.AnalyticsMenuActionName, ConstantsModule1.AnalyticsRequestFriendName, {})
					end
					p2:setState({ selectedPlayer = Roact.None })
				end
			})
		end
		table.insert(List, {
			text = p3.viewAvatar,
			icon = AssetsModule.Images.ViewAvatar,
			onActivated = function()
				-- upvalues: GuiService (upval), p2 (copy), Roact (upval), SendAnalyticsModule (upval), ConstantsModule1 (upval)
				GuiService:InspectPlayerFromUserIdWithCtx(p2.state.selectedPlayer.UserId, "escapeMenu")
				p2:setState({ selectedPlayer = Roact.None })
				p2.props.closeMenu()
				SendAnalyticsModule(ConstantsModule1.AnalyticsMenuActionName, ConstantsModule1.AnalyticsExamineAvatarName, {})
			end
		})
		
		if p2.state.selectedPlayer ~= Players.LocalPlayer then
			table.insert(List, {
				text = p3.reportAbuse,
				icon = Images["icons/actions/feedback"],
				onActivated = function()
					-- upvalues: p2 (copy), TrustAndSafetyModule (upval), ConstantsModule1 (upval), Roact (upval)
					TrustAndSafetyModule.openReportDialogForPlayer(p2.state.selectedPlayer, ConstantsModule1.AnalyticsMenuActionName)
					p2:setState({ selectedPlayer = Roact.None })
				end
			})
			
			if p2.props.voiceEnabled then
				local Participant = Default.participants[tostring(p2.state.selectedPlayer.UserId)]
				
				if Participant then
					local IsMutedLocally = Participant.isMutedLocally
					table.insert(List, {
						text = if IsMutedLocally then "Unmute Player" else "Mute Player",
						icon = Default:GetIcon(if IsMutedLocally then "Unmute" else "Mute", "Misc"),
						onActivated = function()
							-- upvalues: p2 (copy), NewResult (upval), Default (upval), ConstantsModule (upval), Roact (upval)
							local SelectedPlayer = p2.state.selectedPlayer
							NewResult:debug("Muting Player {}", SelectedPlayer.UserId)
							Default:ToggleMutePlayer(SelectedPlayer.UserId, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
							p2:setState({ selectedPlayer = Roact.None })
						end
					})
				end
			end
			local SelectedPlayer = p2.state.selectedPlayer
			local IsPlayerBlockedByUserId = BlockingUtilityModule:IsPlayerBlockedByUserId(SelectedPlayer.UserId)
			table.insert(List, {
				text = IsPlayerBlockedByUserId and p3.unblockPlayer or p3.blockPlayer,
				icon = Images["icons/actions/block"],
				onActivated = function()
					-- upvalues: IsPlayerBlockedByUserId (copy), p2 (copy), SelectedPlayer (copy), OnBlockButtonActivatedModule (upval), Roact (upval)
					if IsPlayerBlockedByUserId then
						p2.props.unblockPlayer(SelectedPlayer)
					else
						OnBlockButtonActivatedModule(SelectedPlayer, nil, p2.__componentName)
					end
					p2:setState({ selectedPlayer = Roact.None })
				end
			})
		end
	end
	return List
end

function PlayersPage.renderFocusHandler(p2, IsCurrentZoneActive)
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), ConstantsModule1 (copy), Roact (copy), FocusHandlerModule (copy), GuiService (copy)
	return Roact.createElement(FocusHandlerModule, {
		isFocused = IsCurrentZoneActive and (p2.props.currentPage == "Players" and (p2.props.isMenuOpen and (not p2.props.isReportDialogOpen and (not p2.state.selectedPlayer and (p2.state.selectedPlayerRef or p2.state.firstPlayerRef) ~= nil)))),
		shouldForgetPreviousSelection = if GetFFlagIGMGamepadSelectionHistoryModule() then p2.props.currentPage == ConstantsModule1.MainPagePageKey or not p2.props.isCurrentZoneActive else nil,
		didFocus = GetFFlagIGMGamepadSelectionHistoryModule() and function(p3)
			-- upvalues: GuiService (upval), p2 (copy)
			GuiService.SelectedCoreObject = p3 or p2.state.firstPlayerRef
		end or function()
			-- upvalues: GuiService (upval), p2 (copy)
			GuiService.SelectedCoreObject = p2.state.selectedPlayerRef or p2.state.firstPlayerRef
		end
	})
end

function PlayersPage.renderWithLocalizedAndSelectionCursor(p2, p3, Callback)
	-- upvalues: NewInGameGlobalGuiInsetFVariable (copy), Roact (copy), PlayerContextualMenuModule (copy), PageModule (copy), Default (copy), ConstantsModule (copy), CursorKind (copy), WithFoundationOrUIBloxStyleFunction (copy), BarOnTopScrollingFrameModule (copy), PageNavigationWatcherModule (copy), Players (copy)
	local Y = 0
	local NewX = 0
	local MoreActions = {}
	
	if p2.state.selectedPlayer ~= nil then
		MoreActions = p2:getMoreActions(p3)
		local v1 = #MoreActions * 56
		local X: number = p2.props.screenSize.X
		local Y1 = p2.props.screenSize.Y
		Y = if p2.state.selectedPlayerPosition.Y + v1 + NewInGameGlobalGuiInsetFVariable < Y1 then p2.state.selectedPlayerPosition.Y else Y1 - v1 - NewInGameGlobalGuiInsetFVariable
		NewX = if p2.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= X then p2.state.selectedPlayerPosition.X + 400 + 20 else X - 352 - 24
	end
	local Element = nil
	local IsCurrentZoneActive = p2.props.isGamepadLastInput and (not p2.props.isRespawnDialogOpen and p2.props.isCurrentZoneActive)
	Element = p2.state.selectedPlayer and Roact.createElement(PlayerContextualMenuModule, {
		actionWidth = 352,
		moreActions = MoreActions,
		xOffset = NewX,
		yOffset = Y,
		canCaptureFocus = IsCurrentZoneActive,
		onClose = function()
			-- upvalues: p2 (copy), Roact (upval)
			p2:setState({ selectedPlayer = Roact.None })
		end
	}) or nil
	
	return Roact.createElement(PageModule, {
		pageTitle = p2.props.pageTitle,
		titleChildren = p2.props.voiceEnabled and Roact.createElement("ImageButton", {
			Size = UDim2.fromOffset(36, 36),
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			BorderSizePixel = 0,
			Position = UDim2.new(1, 4, 0.5, 0),
			Image = Default:GetIcon(if p2.state.allMuted then "UnmuteAll" else "MuteAll", "Misc"),
			[Roact.Event.Activated] = function()
				-- upvalues: Default (upval), p2 (copy), ConstantsModule (upval)
				Default:MuteAll(not p2.state.allMuted, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				p2:setState({ allMuted = not p2.state.allMuted })
			end,
			SelectionImageObject = Callback(CursorKind.RoundedRect)
		})
	}, {
		PlayerListContent = WithFoundationOrUIBloxStyleFunction(function(_)
			return {}
		end, function(_)
			-- upvalues: Roact (upval), p2 (copy), BarOnTopScrollingFrameModule (upval), Element (ref)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[Roact.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p2 (upval)
					p2:setState({ pageSizeY = Frame.AbsoluteSize.Y })
				end
			}, {
				PlayerList = Roact.createElement(BarOnTopScrollingFrameModule, {
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					CanvasSize = UDim2.new(1, 0, 0, #p2.state.players * 72),
					ScrollingEnabled = p2.state.selectedPlayer == nil
				}, p2:renderListEntries(p2.state.players)),
				MoreActionsMenu = Element
			})
		end),
		FocusHandler = p2:renderFocusHandler(IsCurrentZoneActive),
		Watcher = Roact.createElement(PageNavigationWatcherModule, {
			desiredPage = "Players",
			onNavigateTo = function()
				-- upvalues: p2 (copy), Players (upval)
				p2:setState({ players = Players:GetPlayers() })
			end,
			onNavigateAway = function()
				-- upvalues: p2 (copy), Roact (upval)
				p2:setState({ selectedPlayer = Roact.None })
			end
		})
	})
end

function PlayersPage.renderWithLocalized(p2, p3)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p4)
		-- upvalues: p2 (copy), p3 (copy)
		return p2:renderWithLocalizedAndSelectionCursor(p3, p4)
	end)
end

function PlayersPage.render(p2)
	-- upvalues: WithLocalizationModule (copy)
	return WithLocalizationModule({
		addFriend = "CoreScripts.InGameMenu.Actions.AddFriend",
		acceptFriend = "CoreScripts.InGameMenu.Actions.AcceptFriend",
		unfriend = "CoreScripts.InGameMenu.Actions.Unfriend",
		cancelFriend = "CoreScripts.InGameMenu.Actions.CancelFriend",
		viewAvatar = "CoreScripts.InGameMenu.Actions.ViewAvatar",
		reportAbuse = "CoreScripts.InGameMenu.Actions.ReportAbuse",
		blockPlayer = "CoreScripts.InGameMenu.Actions.BlockPlayer",
		unblockPlayer = "CoreScripts.InGameMenu.Actions.UnblockPlayer"
	})(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderWithLocalized(p3)
	end)
end

function PlayersPage.didUpdate(p2, p3, _)
	-- upvalues: Players (copy), Roact (copy)
	if p2.props.isMenuOpen and not p3.isMenuOpen then
		p2:setState({
			players = Players:GetPlayers(),
			selectedPlayer = Roact.None
		})
	end
	local SelectedPlayerRef = p2.state.selectedPlayerRef
	
	if SelectedPlayerRef and p2.state.selectedPlayerPosition ~= SelectedPlayerRef.AbsolutePosition then
		p2:setState({
			selectedPlayerPosition = SelectedPlayerRef.AbsolutePosition
		})
	end
end

return RoactRodux.UNSTABLE_connect2(function(p2, _)
	-- upvalues: ConstantsModule1 (copy)
	return {
		isMenuOpen = p2.isMenuOpen,
		voiceEnabled = p2.voiceState.voiceEnabled,
		friends = p2.friends,
		inspectMenuEnabled = p2.displayOptions.inspectMenuEnabled,
		screenSize = p2.screenSize,
		currentPage = p2.menuPage,
		isRespawnDialogOpen = p2.respawn.dialogOpen,
		isReportDialogOpen = p2.report.dialogOpen or p2.report.reportSentOpen,
		isGamepadLastInput = p2.displayOptions.inputType == ConstantsModule1.InputType.Gamepad,
		isCurrentZoneActive = p2.currentZone == 1
	}
end, function(Callback)
	-- upvalues: CloseMenuModule (copy), UnblockPlayerModule (copy)
	return {
		closeMenu = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end,
		unblockPlayer = function(p2)
			-- upvalues: Callback (copy), UnblockPlayerModule (upval)
			return Callback(UnblockPlayerModule(p2))
		end
	}
end)(PlayersPage)