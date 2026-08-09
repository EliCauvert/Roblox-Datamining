local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local withStyle = UIBlox.Core.Style.withStyle
local images = UIBlox.App.ImageSet.Images
local parent = script.Parent.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local focusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local voiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicator)
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local playerLabelV2Module = require(parent.Components.PlayerLabelV2)
local playerContextualMenuModule = require(parent.Components.PlayerContextualMenu)
local fFlagLuaMenuPerfImprovementsModule = require(parent.Flags.FFlagLuaMenuPerfImprovements)
local pageNavigationWatcherModule = require(parent.Components.PageNavigationWatcher)
local dividerModule = require(parent.Components.Divider)
local barOnTopScrollingFrameModule = require(parent.Components.BarOnTopScrollingFrame)
local pageModule = require(parent.Components.Page)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local assetsModule = require(parent.Resources.Assets)
local constantsModule_1 = require(parent.Resources.Constants)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local unblockPlayerModule = require(robloxGui.Modules.PlayerList.Thunks.UnblockPlayer)
local trustAndSafetyModule = require(robloxGui.Modules.TrustAndSafety)
local onBlockButtonActivatedModule = require(robloxGui.Modules.Settings.onBlockButtonActivated)
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local var27 = settings():GetFVariable("InGameGlobalGuiInset") + 24
local playersPage = roact.PureComponent:extend("PlayersPage")
playersPage.validateProps = t.strictInterface({
	isMenuOpen = t.boolean,
	voiceEnabled = t.optional(t.boolean),
	inspectMenuEnabled = t.boolean,
	friends = t.map(t.integer, t.enum(Enum.FriendStatus)),
	closeMenu = t.callback,
	unblockPlayer = t.callback,
	pageTitle = t.string,
	screenSize = t.Vector2,
	currentPage = t.optional(t.string),
	isRespawnDialogOpen = t.optional(t.boolean),
	isReportDialogOpen = t.optional(t.boolean),
	isGamepadLastInput = t.optional(t.boolean),
	isCurrentZoneActive = t.optional(t.boolean)
})

function playersPage.init(p0) --[[ line: 89 ]]
	-- upvalues: playersService (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), fFlagLuaMenuPerfImprovementsModule (ref)
	p0:setState({
		selectedPlayer = nil,
		pageSizeY = 0,
		voiceChatEnabled = false,
		allMuted = false,
		selectedPlayerRef = nil,
		firstPlayerRef = nil,
		players = playersService:GetPlayers(),
		selectedPlayerPosition = Vector2.new(0, 0)
	})
	
	function p0.setSelectedPlayerRef(p1) --[[ line: 101 ]]
		-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (copy), p0 (ref), roact (copy)
		if getFFlagIGMGamepadSelectionHistoryModule() then
			p0:setState({ selectedPlayerRef = p1 })
			
			return
		end
		p0:setState({ selectedPlayerRef = p1, firstPlayerRef = roact.None })
	end
	
	function p0.setFirstPlayerRef(p2) --[[ line: 114 ]]
		-- upvalues: p0 (ref)
		p0:setState({ firstPlayerRef = p2 })
	end
	
	if fFlagLuaMenuPerfImprovementsModule then
		function p0.positionChanged(p3) --[[ line: 121 ]]
			-- upvalues: p0 (ref)
			p0:setState({ selectedPlayerPosition = p3.AbsolutePosition })
		end
		
		function p0.toggleMoreActions(p4) --[[ line: 126 ]]
			-- upvalues: playersService (copy), p0 (ref), roact (copy)
			local var30 = playersService:GetPlayerByUserId(p4)
			
			if p0.state.selectedPlayer == var30 then
				p0:setState({ selectedPlayer = roact.None })
				
				return
			end
			p0:setState({ selectedPlayer = var30 })
		end
	end
end

local function sortPlayers(p5, p6) --[[ line: 141 ]]
	return p5.Name:lower() < p6.Name:lower()
end

function playersPage.renderListEntries(p7, p8) --[[ line: 145 ]]
	-- upvalues: cryo (ref), sortPlayers (ref), roact (ref), fFlagLuaMenuPerfImprovementsModule (ref), playersService (ref), playerLabelV2Module (ref), voiceIndicatorModule (ref), dividerModule (ref)
	local var31 = cryo.List.sort(p8, sortPlayers)
	local var32 = 0
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	for i, v in pairs(var31) do
		local var34 = if fFlagLuaMenuPerfImprovementsModule then v.UserId else i
		local var35 = if fFlagLuaMenuPerfImprovementsModule then p7.positionChanged else function(p9) --[[ line: 160 ]]
			-- upvalues: p7 (ref)
			p7:setState({ selectedPlayerPosition = p9.AbsolutePosition })
		end
		local var36 = if fFlagLuaMenuPerfImprovementsModule then p7.toggleMoreActions else function() --[[ line: 167 ]]
			-- upvalues: p7 (ref), v (ref), roact (copy)
			if p7.state.selectedPlayer == v then
				p7:setState({ selectedPlayer = roact.None })
				
				return
			end
			p7:setState({ selectedPlayer = v })
		end
		local setSelectedPlayerRef = nil
		
		if i == 1 and not p7.state.selectedPlayer then
			setSelectedPlayerRef = p7.setFirstPlayerRef
		elseif p7.state.selectedPlayer == v then
			setSelectedPlayerRef = p7.setSelectedPlayerRef
		end
		t["player_" .. var34] = roact.createElement(playerLabelV2Module, {
			username = v.Name,
			displayName = v.DisplayName,
			userId = v.UserId,
			isOnline = true,
			isSelected = p7.state.selectedPlayer == v,
			LayoutOrder = var32,
			onActivated = var36,
			[roact.Change.AbsolutePosition] = if p7.state.selectedPlayer == v then var35 else nil,
			[roact.Ref] = setSelectedPlayerRef
		}, {
			Icon = p7.props.voiceEnabled and (v ~= playersService.LocalPlayer and roact.createElement(voiceIndicatorModule, {
				hideOnError = true,
				userId = tostring(v.UserId),
				iconStyle = if v ~= playersService.LocalPlayer then "MicLight" else "SpeakerLight",
				onClicked = var36
			}))
		})
		var32 += 1
		
		if i < #var31 then
			t["divider_" .. var34] = roact.createElement(dividerModule, { LayoutOrder = var32, Size = UDim2.new(1, -104, 0, 1) })
			var32 += 1
		end
	end
	return t
end

function playersPage.getMoreActions(p10, p11) --[[ line: 224 ]]
	-- upvalues: playersService (ref), images (ref), rbxAnalyticsService (ref), sendAnalyticsModule (ref), constantsModule_1 (ref), roact (ref), assetsModule (ref), guiService (ref), trustAndSafetyModule (ref), default (ref), name (ref), constantsModule (ref), blockingUtilityModule (ref), onBlockButtonActivatedModule (ref)
	local t = {}
	
	if p10.state.selectedPlayer ~= nil then
		local var38
		if p10.state.selectedPlayer ~= playersService.LocalPlayer then
			var38 = if p10.props.friends[p10.state.selectedPlayer.UserId] then p10.props.friends[p10.state.selectedPlayer.UserId] else Enum.FriendStatus.Unknown
			local addFriend = p11.addFriend
			local friendAdd = images["icons/actions/friends/friendAdd"]
			
			if var38 == Enum.FriendStatus.Friend then
				addFriend = p11.unfriend
				friendAdd = images["icons/actions/friends/friendRemove"]
			elseif var38 == Enum.FriendStatus.FriendRequestSent then
				addFriend = p11.cancelFriend
				friendAdd = images["icons/actions/friends/friendRemove"]
			elseif var38 == Enum.FriendStatus.FriendRequestReceived then
				addFriend = p11.acceptFriend
			end
			table.insert(t, {
				text = addFriend,
				icon = friendAdd,
				onActivated = function() --[[ line: 249 ]]
					-- upvalues: p10 (ref), var38 (write), playersService (copy), rbxAnalyticsService (copy), sendAnalyticsModule (copy), constantsModule_1 (copy), roact (copy)
					local selectedPlayer = p10.state.selectedPlayer
					
					if var38 == Enum.FriendStatus.Friend or var38 == Enum.FriendStatus.FriendRequestSent then
						playersService.LocalPlayer:RevokeFriendship(selectedPlayer)
					else
						playersService.LocalPlayer:RequestFriendship(selectedPlayer)
						rbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						sendAnalyticsModule(constantsModule_1.AnalyticsMenuActionName, constantsModule_1.AnalyticsRequestFriendName, {})
					end
					p10:setState({ selectedPlayer = roact.None })
				end
			})
		end
		table.insert(t, {
			text = p11.viewAvatar,
			icon = assetsModule.Images.ViewAvatar,
			onActivated = function() --[[ line: 271 ]]
				-- upvalues: guiService (copy), p10 (ref), roact (copy), sendAnalyticsModule (copy), constantsModule_1 (copy)
				guiService:InspectPlayerFromUserIdWithCtx(p10.state.selectedPlayer.UserId, "escapeMenu")
				p10:setState({ selectedPlayer = roact.None })
				p10.props.closeMenu()
				sendAnalyticsModule(constantsModule_1.AnalyticsMenuActionName, constantsModule_1.AnalyticsExamineAvatarName, {})
			end
		})
		
		if p10.state.selectedPlayer ~= playersService.LocalPlayer then
			table.insert(t, {
				text = p11.reportAbuse,
				icon = images["icons/actions/feedback"],
				onActivated = function() --[[ line: 285 ]]
					-- upvalues: p10 (ref), trustAndSafetyModule (copy), constantsModule_1 (copy), roact (copy)
					trustAndSafetyModule.openReportDialogForPlayer(p10.state.selectedPlayer, constantsModule_1.AnalyticsMenuActionName)
					p10:setState({ selectedPlayer = roact.None })
				end
			})
			
			if p10.props.voiceEnabled then
				var38 = default.participants[tostring(p10.state.selectedPlayer.UserId)]
				
				if var38 then
					local isMutedLocally = var38.isMutedLocally
					table.insert(t, {
						text = if isMutedLocally then "Unmute Player" else "Mute Player",
						icon = default:GetIcon(if isMutedLocally then "Unmute" else "Mute", "Misc"),
						onActivated = function() --[[ line: 302 ]]
							-- upvalues: p10 (ref), name (copy), default (copy), constantsModule (copy), roact (copy)
							local selectedPlayer = p10.state.selectedPlayer
							name:debug("Muting Player {}", selectedPlayer.UserId)
							default:ToggleMutePlayer(selectedPlayer.UserId, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
							p10:setState({ selectedPlayer = roact.None })
						end
					})
				end
			end
			var38 = p10.state.selectedPlayer
			local userId = blockingUtilityModule:IsPlayerBlockedByUserId(var38.UserId)
			table.insert(t, {
				text = if userId then p11.unblockPlayer else p11.blockPlayer,
				icon = images["icons/actions/block"],
				onActivated = function() --[[ line: 322 ]]
					-- upvalues: userId (ref), p10 (ref), var38 (ref), onBlockButtonActivatedModule (copy), roact (copy)
					if userId then
						p10.props.unblockPlayer(var38)
					else
						onBlockButtonActivatedModule(var38, nil, p10.__componentName)
					end
					p10:setState({ selectedPlayer = roact.None })
				end
			})
		end
	end
	return t
end

function playersPage.renderFocusHandler(p12, p13) --[[ line: 340 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule_1 (ref), roact (ref), focusHandlerModule (ref), guiService (ref)
	local var40 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var40 = if p12.props.currentPage ~= constantsModule_1.MainPagePageKey then not p12.props.isCurrentZoneActive else true
	end
	local createElement = roact.createElement
	local t = {}
	local var42 = p13
	
	if var42 then
		var42 = false
		
		if p12.props.currentPage == "Players" then
			var42 = p12.props.isMenuOpen
			
			if var42 then
				var42 = not p12.props.isReportDialogOpen
				
				if var42 then
					var42 = not p12.state.selectedPlayer
					
					if var42 then
						var42 = (p12.state.selectedPlayerRef or p12.state.firstPlayerRef) ~= nil
					end
				end
			end
		end
	end
	t.isFocused = var42
	t.shouldForgetPreviousSelection = var40
	t.didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p14) --[[ line: 356 ]]
		-- upvalues: guiService (copy), p12 (ref)
		guiService.SelectedCoreObject = p14 or p12.state.firstPlayerRef
	end else function() --[[ line: 360 ]]
		-- upvalues: guiService (copy), p12 (ref)
		guiService.SelectedCoreObject = p12.state.selectedPlayerRef or p12.state.firstPlayerRef
	end
	
	return createElement(focusHandlerModule, t)
end

function playersPage.renderWithLocalizedAndSelectionCursor(p15, p16, p17) --[[ line: 367 ]]
	-- upvalues: var27 (ref), roact (ref), playerContextualMenuModule (ref), pageModule (ref), default (ref), constantsModule (ref), cursorKind (ref), withStyle (ref), barOnTopScrollingFrameModule (ref), pageNavigationWatcherModule (ref), playersService (ref)
	local var43 = 0
	local var44 = 0
	local t = {}
	
	if p15.state.selectedPlayer ~= nil then
		t = p15:getMoreActions(p16)
		local var46 = #t * 56
		local x = p15.props.screenSize.X
		local y = p15.props.screenSize.Y
		var43 = if p15.state.selectedPlayerPosition.Y + var46 + var27 < y then p15.state.selectedPlayerPosition.Y else y - var46 - var27
		var44 = if p15.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= x then p15.state.selectedPlayerPosition.X + 400 + 20 else x - 352 - 24
	end
	local _ = nil
	local isCurrentZoneActive = p15.props.isGamepadLastInput and (not p15.props.isRespawnDialogOpen and p15.props.isCurrentZoneActive)
	local var48 = p15.state.selectedPlayer and roact.createElement(playerContextualMenuModule, {
		actionWidth = 352,
		moreActions = t,
		xOffset = var44,
		yOffset = var43,
		canCaptureFocus = isCurrentZoneActive,
		onClose = function() --[[ line: 411 ]]
			-- upvalues: p15 (ref), roact (copy)
			p15:setState({ selectedPlayer = roact.None })
		end
	}) or nil
	
	return roact.createElement(pageModule, {
		pageTitle = p15.props.pageTitle,
		titleChildren = p15.props.voiceEnabled and roact.createElement("ImageButton", {
			Size = UDim2.fromOffset(36, 36),
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			BorderSizePixel = 0,
			Position = UDim2.new(1, 4, 0.5, 0),
			Image = default:GetIcon(if p15.state.allMuted then "UnmuteAll" else "MuteAll", "Misc"),
			[roact.Event.Activated] = function() --[[ line: 426 ]]
				-- upvalues: default (copy), p15 (ref), constantsModule (copy)
				default:MuteAll(not p15.state.allMuted, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				p15:setState({ allMuted = not p15.state.allMuted })
			end,
			SelectionImageObject = p17(cursorKind.RoundedRect)
		})
	}, {
		PlayerListContent = withStyle(function(_) --[[ line: 435 ]]
			-- upvalues: roact (copy), p15 (ref), barOnTopScrollingFrameModule (copy), var48 (write)
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[roact.Change.AbsoluteSize] = function(p18) --[[ line: 440 ]]
					-- upvalues: p15 (copy)
					p15:setState({ pageSizeY = p18.AbsoluteSize.Y })
				end
			}, {
				PlayerList = roact.createElement(barOnTopScrollingFrameModule, {
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					CanvasSize = UDim2.new(1, 0, 0, #p15.state.players * 72),
					ScrollingEnabled = p15.state.selectedPlayer == nil
				}, p15:renderListEntries(p15.state.players)),
				MoreActionsMenu = var48
			})
		end),
		FocusHandler = p15:renderFocusHandler(isCurrentZoneActive),
		Watcher = roact.createElement(pageNavigationWatcherModule, {
			desiredPage = "Players",
			onNavigateTo = function() --[[ line: 459 ]]
				-- upvalues: p15 (ref), playersService (copy)
				p15:setState({ players = playersService:GetPlayers() })
			end,
			onNavigateAway = function() --[[ line: 464 ]]
				-- upvalues: p15 (ref), roact (copy)
				p15:setState({ selectedPlayer = roact.None })
			end
		})
	})
end

function playersPage.renderWithLocalized(p19, p20) --[[ line: 473 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p21) --[[ line: 474 ]]
		-- upvalues: p19 (ref), p20 (ref)
		return p19:renderWithLocalizedAndSelectionCursor(p20, p21)
	end)
end

function playersPage.render(p22) --[[ line: 479 ]]
	-- upvalues: withLocalizationModule (ref)
	return withLocalizationModule({
		addFriend = "CoreScripts.InGameMenu.Actions.AddFriend",
		acceptFriend = "CoreScripts.InGameMenu.Actions.AcceptFriend",
		unfriend = "CoreScripts.InGameMenu.Actions.Unfriend",
		cancelFriend = "CoreScripts.InGameMenu.Actions.CancelFriend",
		viewAvatar = "CoreScripts.InGameMenu.Actions.ViewAvatar",
		reportAbuse = "CoreScripts.InGameMenu.Actions.ReportAbuse",
		blockPlayer = "CoreScripts.InGameMenu.Actions.BlockPlayer",
		unblockPlayer = "CoreScripts.InGameMenu.Actions.UnblockPlayer"
	})(function(p23) --[[ line: 489 ]]
		-- upvalues: p22 (ref)
		return p22:renderWithLocalized(p23)
	end)
end

function playersPage.didUpdate(p24, p25, _) --[[ line: 494 ]]
	-- upvalues: playersService (ref), roact (ref)
	if p24.props.isMenuOpen and not p25.isMenuOpen then
		p24:setState({
			players = playersService:GetPlayers(),
			selectedPlayer = roact.None
		})
	end
	local selectedPlayerRef = p24.state.selectedPlayerRef
	
	if selectedPlayerRef and p24.state.selectedPlayerPosition ~= selectedPlayerRef.AbsolutePosition then
		p24:setState({
			selectedPlayerPosition = selectedPlayerRef.AbsolutePosition
		})
	end
end

return roactRodux.UNSTABLE_connect2(function(p26, _) --[[ line: 512 ]]
	-- upvalues: constantsModule_1 (ref)
	return {
		isMenuOpen = p26.isMenuOpen,
		voiceEnabled = p26.voiceState.voiceEnabled,
		friends = p26.friends,
		inspectMenuEnabled = p26.displayOptions.inspectMenuEnabled,
		screenSize = p26.screenSize,
		currentPage = p26.menuPage,
		isRespawnDialogOpen = p26.respawn.dialogOpen,
		isReportDialogOpen = p26.report.dialogOpen or p26.report.reportSentOpen,
		isGamepadLastInput = p26.displayOptions.inputType == constantsModule_1.InputType.Gamepad,
		isCurrentZoneActive = p26.currentZone == 1
	}
end, function(p27) --[[ line: 525 ]]
	-- upvalues: closeMenuModule (ref), unblockPlayerModule (ref)
	return {
		closeMenu = function() --[[ line: 527 ]]
			-- upvalues: p27 (ref), closeMenuModule (copy)
			p27(closeMenuModule)
		end,
		unblockPlayer = function(p28) --[[ line: 531 ]]
			-- upvalues: p27 (ref), unblockPlayerModule (copy)
			return p27(unblockPlayerModule(p28))
		end
	}
end)(playersPage)