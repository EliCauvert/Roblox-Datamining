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
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var7 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var8 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
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
local var30 = settings():GetFVariable("InGameGlobalGuiInset") + 24
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

function playersPage.init(p0) --[[ line: 96 ]]
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
	
	function p0.setSelectedPlayerRef(p1) --[[ line: 108 ]]
		-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (copy), p0 (ref), roact (copy)
		if getFFlagIGMGamepadSelectionHistoryModule() then
			p0:setState({ selectedPlayerRef = p1 })
			
			return
		end
		p0:setState({ selectedPlayerRef = p1, firstPlayerRef = roact.None })
	end
	
	function p0.setFirstPlayerRef(p2) --[[ line: 121 ]]
		-- upvalues: p0 (ref)
		p0:setState({ firstPlayerRef = p2 })
	end
	
	if fFlagLuaMenuPerfImprovementsModule then
		function p0.positionChanged(p3) --[[ line: 128 ]]
			-- upvalues: p0 (ref)
			p0:setState({ selectedPlayerPosition = p3.AbsolutePosition })
		end
		
		function p0.toggleMoreActions(p4) --[[ line: 133 ]]
			-- upvalues: playersService (copy), p0 (ref), roact (copy)
			local var33 = playersService:GetPlayerByUserId(p4)
			
			if p0.state.selectedPlayer == var33 then
				p0:setState({ selectedPlayer = roact.None })
				
				return
			end
			p0:setState({ selectedPlayer = var33 })
		end
	end
end

local function sortPlayers(p5, p6) --[[ line: 148 ]]
	return p5.Name:lower() < p6.Name:lower()
end

function playersPage.renderListEntries(p7, p8) --[[ line: 152 ]]
	-- upvalues: cryo (ref), sortPlayers (ref), roact (ref), fFlagLuaMenuPerfImprovementsModule (ref), playersService (ref), playerLabelV2Module (ref), voiceIndicatorModule (ref), dividerModule (ref)
	local var34 = cryo.List.sort(p8, sortPlayers)
	local var35 = 0
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	for i, v in pairs(var34) do
		local var37 = if fFlagLuaMenuPerfImprovementsModule then v.UserId else i
		local var38 = if fFlagLuaMenuPerfImprovementsModule then p7.positionChanged else function(p9) --[[ line: 167 ]]
			-- upvalues: p7 (ref)
			p7:setState({ selectedPlayerPosition = p9.AbsolutePosition })
		end
		local var39 = if fFlagLuaMenuPerfImprovementsModule then p7.toggleMoreActions else function() --[[ line: 174 ]]
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
		t["player_" .. var37] = roact.createElement(playerLabelV2Module, {
			username = v.Name,
			displayName = v.DisplayName,
			userId = v.UserId,
			isOnline = true,
			isSelected = p7.state.selectedPlayer == v,
			LayoutOrder = var35,
			onActivated = var39,
			[roact.Change.AbsolutePosition] = if p7.state.selectedPlayer == v then var38 else nil,
			[roact.Ref] = setSelectedPlayerRef
		}, {
			Icon = p7.props.voiceEnabled and (v ~= playersService.LocalPlayer and roact.createElement(voiceIndicatorModule, {
				hideOnError = true,
				userId = tostring(v.UserId),
				iconStyle = if v ~= playersService.LocalPlayer then "MicLight" else "SpeakerLight",
				onClicked = var39
			}))
		})
		var35 += 1
		
		if i < #var34 then
			t["divider_" .. var37] = roact.createElement(dividerModule, { LayoutOrder = var35, Size = UDim2.new(1, -104, 0, 1) })
			var35 += 1
		end
	end
	return t
end

function playersPage.getMoreActions(p10, p11) --[[ line: 231 ]]
	-- upvalues: playersService (ref), images (ref), rbxAnalyticsService (ref), sendAnalyticsModule (ref), constantsModule_1 (ref), roact (ref), assetsModule (ref), guiService (ref), trustAndSafetyModule (ref), default (ref), name (ref), constantsModule (ref), blockingUtilityModule (ref), onBlockButtonActivatedModule (ref)
	local t = {}
	
	if p10.state.selectedPlayer ~= nil then
		local var41
		if p10.state.selectedPlayer ~= playersService.LocalPlayer then
			var41 = if p10.props.friends[p10.state.selectedPlayer.UserId] then p10.props.friends[p10.state.selectedPlayer.UserId] else Enum.FriendStatus.Unknown
			local addFriend = p11.addFriend
			local friendAdd = images["icons/actions/friends/friendAdd"]
			
			if var41 == Enum.FriendStatus.Friend then
				addFriend = p11.unfriend
				friendAdd = images["icons/actions/friends/friendRemove"]
			elseif var41 == Enum.FriendStatus.FriendRequestSent then
				addFriend = p11.cancelFriend
				friendAdd = images["icons/actions/friends/friendRemove"]
			elseif var41 == Enum.FriendStatus.FriendRequestReceived then
				addFriend = p11.acceptFriend
			end
			table.insert(t, {
				text = addFriend,
				icon = friendAdd,
				onActivated = function() --[[ line: 256 ]]
					-- upvalues: p10 (ref), var41 (write), playersService (copy), rbxAnalyticsService (copy), sendAnalyticsModule (copy), constantsModule_1 (copy), roact (copy)
					local selectedPlayer = p10.state.selectedPlayer
					
					if var41 == Enum.FriendStatus.Friend or var41 == Enum.FriendStatus.FriendRequestSent then
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
			onActivated = function() --[[ line: 278 ]]
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
				onActivated = function() --[[ line: 292 ]]
					-- upvalues: p10 (ref), trustAndSafetyModule (copy), constantsModule_1 (copy), roact (copy)
					trustAndSafetyModule.openReportDialogForPlayer(p10.state.selectedPlayer, constantsModule_1.AnalyticsMenuActionName)
					p10:setState({ selectedPlayer = roact.None })
				end
			})
			
			if p10.props.voiceEnabled then
				var41 = default.participants[tostring(p10.state.selectedPlayer.UserId)]
				
				if var41 then
					local isMutedLocally = var41.isMutedLocally
					table.insert(t, {
						text = if isMutedLocally then "Unmute Player" else "Mute Player",
						icon = default:GetIcon(if isMutedLocally then "Unmute" else "Mute", "Misc"),
						onActivated = function() --[[ line: 309 ]]
							-- upvalues: p10 (ref), name (copy), default (copy), constantsModule (copy), roact (copy)
							local selectedPlayer = p10.state.selectedPlayer
							name:debug("Muting Player {}", selectedPlayer.UserId)
							default:ToggleMutePlayer(selectedPlayer.UserId, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
							p10:setState({ selectedPlayer = roact.None })
						end
					})
				end
			end
			var41 = p10.state.selectedPlayer
			local userId = blockingUtilityModule:IsPlayerBlockedByUserId(var41.UserId)
			table.insert(t, {
				text = if userId then p11.unblockPlayer else p11.blockPlayer,
				icon = images["icons/actions/block"],
				onActivated = function() --[[ line: 329 ]]
					-- upvalues: userId (ref), p10 (ref), var41 (ref), onBlockButtonActivatedModule (copy), roact (copy)
					if userId then
						p10.props.unblockPlayer(var41)
					else
						onBlockButtonActivatedModule(var41, nil, p10.__componentName)
					end
					p10:setState({ selectedPlayer = roact.None })
				end
			})
		end
	end
	return t
end

function playersPage.renderFocusHandler(p12, p13) --[[ line: 347 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule_1 (ref), roact (ref), focusHandlerModule (ref), guiService (ref)
	local var43 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var43 = if p12.props.currentPage ~= constantsModule_1.MainPagePageKey then not p12.props.isCurrentZoneActive else true
	end
	local createElement = roact.createElement
	local t = {}
	local var45 = p13
	
	if var45 then
		var45 = false
		
		if p12.props.currentPage == "Players" then
			var45 = p12.props.isMenuOpen
			
			if var45 then
				var45 = not p12.props.isReportDialogOpen
				
				if var45 then
					var45 = not p12.state.selectedPlayer
					
					if var45 then
						var45 = (p12.state.selectedPlayerRef or p12.state.firstPlayerRef) ~= nil
					end
				end
			end
		end
	end
	t.isFocused = var45
	t.shouldForgetPreviousSelection = var43
	t.didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p14) --[[ line: 363 ]]
		-- upvalues: guiService (copy), p12 (ref)
		guiService.SelectedCoreObject = p14 or p12.state.firstPlayerRef
	end else function() --[[ line: 367 ]]
		-- upvalues: guiService (copy), p12 (ref)
		guiService.SelectedCoreObject = p12.state.selectedPlayerRef or p12.state.firstPlayerRef
	end
	
	return createElement(focusHandlerModule, t)
end

function playersPage.renderWithLocalizedAndSelectionCursor(p15, p16, p17) --[[ line: 374 ]]
	-- upvalues: var30 (ref), roact (ref), playerContextualMenuModule (ref), pageModule (ref), default (ref), constantsModule (ref), var8 (ref), withFoundationOrUIBloxStyle (ref), barOnTopScrollingFrameModule (ref), pageNavigationWatcherModule (ref), playersService (ref)
	local var46 = 0
	local var47 = 0
	local t = {}
	
	if p15.state.selectedPlayer ~= nil then
		t = p15:getMoreActions(p16)
		local var49 = #t * 56
		local x = p15.props.screenSize.X
		local y = p15.props.screenSize.Y
		var46 = if p15.state.selectedPlayerPosition.Y + var49 + var30 < y then p15.state.selectedPlayerPosition.Y else y - var49 - var30
		var47 = if p15.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= x then p15.state.selectedPlayerPosition.X + 400 + 20 else x - 352 - 24
	end
	local _ = nil
	local isCurrentZoneActive = p15.props.isGamepadLastInput and (not p15.props.isRespawnDialogOpen and p15.props.isCurrentZoneActive)
	local var51 = p15.state.selectedPlayer and roact.createElement(playerContextualMenuModule, {
		actionWidth = 352,
		moreActions = t,
		xOffset = var47,
		yOffset = var46,
		canCaptureFocus = isCurrentZoneActive,
		onClose = function() --[[ line: 418 ]]
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
			[roact.Event.Activated] = function() --[[ line: 433 ]]
				-- upvalues: default (copy), p15 (ref), constantsModule (copy)
				default:MuteAll(not p15.state.allMuted, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				p15:setState({ allMuted = not p15.state.allMuted })
			end,
			SelectionImageObject = p17(var8.RoundedRect)
		})
	}, {
		PlayerListContent = withFoundationOrUIBloxStyle(function(_) --[[ line: 442 ]]
			return {}
		end, function(_) --[[ line: 444 ]]
			-- upvalues: roact (copy), p15 (ref), barOnTopScrollingFrameModule (copy), var51 (write)
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[roact.Change.AbsoluteSize] = function(p18) --[[ line: 449 ]]
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
				MoreActionsMenu = var51
			})
		end),
		FocusHandler = p15:renderFocusHandler(isCurrentZoneActive),
		Watcher = roact.createElement(pageNavigationWatcherModule, {
			desiredPage = "Players",
			onNavigateTo = function() --[[ line: 468 ]]
				-- upvalues: p15 (ref), playersService (copy)
				p15:setState({ players = playersService:GetPlayers() })
			end,
			onNavigateAway = function() --[[ line: 473 ]]
				-- upvalues: p15 (ref), roact (copy)
				p15:setState({ selectedPlayer = roact.None })
			end
		})
	})
end

function playersPage.renderWithLocalized(p19, p20) --[[ line: 482 ]]
	-- upvalues: var7 (ref)
	return var7(function(p21) --[[ line: 483 ]]
		-- upvalues: p19 (ref), p20 (ref)
		return p19:renderWithLocalizedAndSelectionCursor(p20, p21)
	end)
end

function playersPage.render(p22) --[[ line: 488 ]]
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
	})(function(p23) --[[ line: 498 ]]
		-- upvalues: p22 (ref)
		return p22:renderWithLocalized(p23)
	end)
end

function playersPage.didUpdate(p24, p25, _) --[[ line: 503 ]]
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

return roactRodux.UNSTABLE_connect2(function(p26, _) --[[ line: 521 ]]
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
end, function(p27) --[[ line: 534 ]]
	-- upvalues: closeMenuModule (ref), unblockPlayerModule (ref)
	return {
		closeMenu = function() --[[ line: 536 ]]
			-- upvalues: p27 (ref), closeMenuModule (copy)
			p27(closeMenuModule)
		end,
		unblockPlayer = function(p28) --[[ line: 540 ]]
			-- upvalues: p27 (ref), unblockPlayerModule (copy)
			return p27(unblockPlayerModule(p28))
		end
	}
end)(playersPage)