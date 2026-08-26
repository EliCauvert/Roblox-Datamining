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
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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
local var3 = settings():GetFVariable("InGameGlobalGuiInset") + 24
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

function playersPage.init(p1)
	-- upvalues: playersService (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), fFlagLuaMenuPerfImprovementsModule (ref)
	p1:setState({
		selectedPlayer = nil,
		pageSizeY = 0,
		voiceChatEnabled = false,
		allMuted = false,
		selectedPlayerRef = nil,
		firstPlayerRef = nil,
		players = playersService:GetPlayers(),
		selectedPlayerPosition = Vector2.new(0, 0)
	})
	
	function p0.setSelectedPlayerRef(p2)
		-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (copy), p1 (ref), roact (copy)
		if getFFlagIGMGamepadSelectionHistoryModule() then
			p1:setState({ selectedPlayerRef = p2 })
			
			return
		end
		p1:setState({ selectedPlayerRef = p2, firstPlayerRef = roact.None })
	end
	
	function p0.setFirstPlayerRef(p2)
		-- upvalues: p1 (ref)
		p1:setState({ firstPlayerRef = p2 })
	end
	
	if fFlagLuaMenuPerfImprovementsModule then
		function p0.positionChanged(p2)
			-- upvalues: p1 (ref)
			p1:setState({ selectedPlayerPosition = p2.AbsolutePosition })
		end
		
		function p0.toggleMoreActions(p2)
			-- upvalues: playersService (copy), p1 (ref), roact (copy)
			local var4 = playersService:GetPlayerByUserId(p2)
			
			if p1.state.selectedPlayer == var4 then
				p1:setState({ selectedPlayer = roact.None })
				
				return
			end
			p1:setState({ selectedPlayer = var4 })
		end
	end
end

local function sortPlayers(p1, p2)
	return p1.Name:lower() < p2.Name:lower()
end

function playersPage.renderListEntries(p1, p2)
	-- upvalues: cryo (ref), sortPlayers (ref), roact (ref), fFlagLuaMenuPerfImprovementsModule (ref), playersService (ref), playerLabelV2Module (ref), voiceIndicatorModule (ref), dividerModule (ref)
	local var4 = cryo.List.sort(p2, sortPlayers)
	local var5 = 0
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	for i, v in pairs(var4) do
		local var6 = if fFlagLuaMenuPerfImprovementsModule then v.UserId else i
		local var7 = if fFlagLuaMenuPerfImprovementsModule then p1.positionChanged else function(p3)
			-- upvalues: p1 (ref)
			p1:setState({ selectedPlayerPosition = p3.AbsolutePosition })
		end
		local var8 = if fFlagLuaMenuPerfImprovementsModule then p1.toggleMoreActions else function()
			-- upvalues: p1 (ref), v (ref), roact (copy)
			if p1.state.selectedPlayer == v then
				p1:setState({ selectedPlayer = roact.None })
				
				return
			end
			p1:setState({ selectedPlayer = v })
		end
		local setSelectedPlayerRef = nil
		
		if i == 1 and not p1.state.selectedPlayer then
			setSelectedPlayerRef = p1.setFirstPlayerRef
		elseif p1.state.selectedPlayer == v then
			setSelectedPlayerRef = p1.setSelectedPlayerRef
		end
		t["player_" .. var37] = roact.createElement(playerLabelV2Module, {
			username = v.Name,
			displayName = v.DisplayName,
			userId = v.UserId,
			isOnline = true,
			isSelected = p1.state.selectedPlayer == v,
			LayoutOrder = var5,
			onActivated = var8,
			[roact.Change.AbsolutePosition] = if p1.state.selectedPlayer == v then var7 else nil,
			[roact.Ref] = setSelectedPlayerRef
		}, {
			Icon = p1.props.voiceEnabled and (v ~= playersService.LocalPlayer and roact.createElement(voiceIndicatorModule, {
				hideOnError = true,
				userId = tostring(v.UserId),
				iconStyle = if v ~= playersService.LocalPlayer then "MicLight" else "SpeakerLight",
				onClicked = var8
			}))
		})
		var5 += 1
		
		if i < #var4 then
			t["divider_" .. var37] = roact.createElement(dividerModule, { LayoutOrder = var5, Size = UDim2.new(1, -104, 0, 1) })
			var5 += 1
		end
	end
	return t
end

function playersPage.getMoreActions(p3, p4)
	-- upvalues: playersService (ref), images (ref), rbxAnalyticsService (ref), sendAnalyticsModule (ref), constantsModule_1 (ref), roact (ref), assetsModule (ref), guiService (ref), trustAndSafetyModule (ref), default (ref), name (ref), constantsModule (ref), blockingUtilityModule (ref), onBlockButtonActivatedModule (ref)
	local t = {}
	
	if p3.state.selectedPlayer ~= nil then
		local var9
		if p3.state.selectedPlayer ~= playersService.LocalPlayer then
			var9 = if p3.props.friends[p3.state.selectedPlayer.UserId] then p3.props.friends[p3.state.selectedPlayer.UserId] else Enum.FriendStatus.Unknown
			local addFriend = p4.addFriend
			local friendAdd = images["icons/actions/friends/friendAdd"]
			
			if var9 == Enum.FriendStatus.Friend then
				addFriend = p4.unfriend
				friendAdd = images["icons/actions/friends/friendRemove"]
			elseif var9 == Enum.FriendStatus.FriendRequestSent then
				addFriend = p4.cancelFriend
				friendAdd = images["icons/actions/friends/friendRemove"]
			elseif var9 == Enum.FriendStatus.FriendRequestReceived then
				addFriend = p4.acceptFriend
			end
			table.insert(t, {
				text = addFriend,
				icon = friendAdd,
				onActivated = function()
					-- upvalues: p3 (ref), var9 (write), playersService (copy), rbxAnalyticsService (copy), sendAnalyticsModule (copy), constantsModule_1 (copy), roact (copy)
					local selectedPlayer = p3.state.selectedPlayer
					
					if var9 == Enum.FriendStatus.Friend or var9 == Enum.FriendStatus.FriendRequestSent then
						playersService.LocalPlayer:RevokeFriendship(selectedPlayer)
					else
						playersService.LocalPlayer:RequestFriendship(selectedPlayer)
						rbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						sendAnalyticsModule(constantsModule_1.AnalyticsMenuActionName, constantsModule_1.AnalyticsRequestFriendName, {})
					end
					p3:setState({ selectedPlayer = roact.None })
				end
			})
		end
		table.insert(t, {
			text = p4.viewAvatar,
			icon = assetsModule.Images.ViewAvatar,
			onActivated = function()
				-- upvalues: guiService (copy), p3 (ref), roact (copy), sendAnalyticsModule (copy), constantsModule_1 (copy)
				guiService:InspectPlayerFromUserIdWithCtx(p3.state.selectedPlayer.UserId, "escapeMenu")
				p3:setState({ selectedPlayer = roact.None })
				p3.props.closeMenu()
				sendAnalyticsModule(constantsModule_1.AnalyticsMenuActionName, constantsModule_1.AnalyticsExamineAvatarName, {})
			end
		})
		
		if p3.state.selectedPlayer ~= playersService.LocalPlayer then
			table.insert(t, {
				text = p4.reportAbuse,
				icon = images["icons/actions/feedback"],
				onActivated = function()
					-- upvalues: p3 (ref), trustAndSafetyModule (copy), constantsModule_1 (copy), roact (copy)
					trustAndSafetyModule.openReportDialogForPlayer(p3.state.selectedPlayer, constantsModule_1.AnalyticsMenuActionName)
					p3:setState({ selectedPlayer = roact.None })
				end
			})
			
			if p3.props.voiceEnabled then
				var9 = default.participants[tostring(p3.state.selectedPlayer.UserId)]
				
				if var9 then
					local isMutedLocally = var9.isMutedLocally
					table.insert(t, {
						text = if isMutedLocally then "Unmute Player" else "Mute Player",
						icon = default:GetIcon(if isMutedLocally then "Unmute" else "Mute", "Misc"),
						onActivated = function()
							-- upvalues: p3 (ref), name (copy), default (copy), constantsModule (copy), roact (copy)
							local selectedPlayer = p3.state.selectedPlayer
							name:debug("Muting Player {}", selectedPlayer.UserId)
							default:ToggleMutePlayer(selectedPlayer.UserId, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
							p3:setState({ selectedPlayer = roact.None })
						end
					})
				end
			end
			var9 = p3.state.selectedPlayer
			local userId = blockingUtilityModule:IsPlayerBlockedByUserId(var9.UserId)
			table.insert(t, {
				text = if userId then p4.unblockPlayer else p4.blockPlayer,
				icon = images["icons/actions/block"],
				onActivated = function()
					-- upvalues: userId (ref), p3 (ref), var9 (ref), onBlockButtonActivatedModule (copy), roact (copy)
					if userId then
						p3.props.unblockPlayer(var9)
					else
						onBlockButtonActivatedModule(var9, nil, p3.__componentName)
					end
					p3:setState({ selectedPlayer = roact.None })
				end
			})
		end
	end
	return t
end

function playersPage.renderFocusHandler(p3, p4)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule_1 (ref), roact (ref), focusHandlerModule (ref), guiService (ref)
	local var9 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var9 = if p3.props.currentPage ~= constantsModule_1.MainPagePageKey then not p3.props.isCurrentZoneActive else true
	end
	local createElement = roact.createElement
	local t = {}
	local var10 = p4
	
	if var10 then
		var10 = false
		
		if p3.props.currentPage == "Players" then
			var10 = p3.props.isMenuOpen
			
			if var10 then
				var10 = not p3.props.isReportDialogOpen
				
				if var10 then
					var10 = not p3.state.selectedPlayer
					
					if var10 then
						var10 = (p3.state.selectedPlayerRef or p3.state.firstPlayerRef) ~= nil
					end
				end
			end
		end
	end
	t.isFocused = var10
	t.shouldForgetPreviousSelection = var9
	t.didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p5)
		-- upvalues: guiService (copy), p3 (ref)
		guiService.SelectedCoreObject = p5 or p3.state.firstPlayerRef
	end else function()
		-- upvalues: guiService (copy), p3 (ref)
		guiService.SelectedCoreObject = p3.state.selectedPlayerRef or p3.state.firstPlayerRef
	end
	
	return createElement(focusHandlerModule, t)
end

function playersPage.renderWithLocalizedAndSelectionCursor(p3, p4, p5)
	-- upvalues: var3 (ref), roact (ref), playerContextualMenuModule (ref), pageModule (ref), default (ref), constantsModule (ref), var2 (ref), withFoundationOrUIBloxStyle (ref), barOnTopScrollingFrameModule (ref), pageNavigationWatcherModule (ref), playersService (ref)
	local var9 = 0
	local var10 = 0
	local t = {}
	
	if p3.state.selectedPlayer ~= nil then
		t = p3:getMoreActions(p4)
		local var11 = #t * 56
		local x = p3.props.screenSize.X
		local y = p3.props.screenSize.Y
		var9 = if p3.state.selectedPlayerPosition.Y + var11 + var3 < y then p3.state.selectedPlayerPosition.Y else y - var11 - var3
		var10 = if p3.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= x then p3.state.selectedPlayerPosition.X + 400 + 20 else x - 352 - 24
	end
	local _ = nil
	local isCurrentZoneActive = p3.props.isGamepadLastInput and (not p3.props.isRespawnDialogOpen and p3.props.isCurrentZoneActive)
	local var12 = p3.state.selectedPlayer and roact.createElement(playerContextualMenuModule, {
		actionWidth = 352,
		moreActions = t,
		xOffset = var10,
		yOffset = var9,
		canCaptureFocus = isCurrentZoneActive,
		onClose = function()
			-- upvalues: p3 (ref), roact (copy)
			p3:setState({ selectedPlayer = roact.None })
		end
	}) or nil
	
	return roact.createElement(pageModule, {
		pageTitle = p3.props.pageTitle,
		titleChildren = p3.props.voiceEnabled and roact.createElement("ImageButton", {
			Size = UDim2.fromOffset(36, 36),
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			BorderSizePixel = 0,
			Position = UDim2.new(1, 4, 0.5, 0),
			Image = default:GetIcon(if p3.state.allMuted then "UnmuteAll" else "MuteAll", "Misc"),
			[roact.Event.Activated] = function()
				-- upvalues: default (copy), p3 (ref), constantsModule (copy)
				default:MuteAll(not p3.state.allMuted, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				p3:setState({ allMuted = not p3.state.allMuted })
			end,
			SelectionImageObject = p5(var2.RoundedRect)
		})
	}, {
		PlayerListContent = withFoundationOrUIBloxStyle(function(_)
			return {}
		end, function(_)
			-- upvalues: roact (copy), p3 (ref), barOnTopScrollingFrameModule (copy), var12 (write)
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[roact.Change.AbsoluteSize] = function(p6)
					-- upvalues: p3 (copy)
					p3:setState({ pageSizeY = p6.AbsoluteSize.Y })
				end
			}, {
				PlayerList = roact.createElement(barOnTopScrollingFrameModule, {
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					CanvasSize = UDim2.new(1, 0, 0, #p3.state.players * 72),
					ScrollingEnabled = p3.state.selectedPlayer == nil
				}, p3:renderListEntries(p3.state.players)),
				MoreActionsMenu = var12
			})
		end),
		FocusHandler = p3:renderFocusHandler(isCurrentZoneActive),
		Watcher = roact.createElement(pageNavigationWatcherModule, {
			desiredPage = "Players",
			onNavigateTo = function()
				-- upvalues: p3 (ref), playersService (copy)
				p3:setState({ players = playersService:GetPlayers() })
			end,
			onNavigateAway = function()
				-- upvalues: p3 (ref), roact (copy)
				p3:setState({ selectedPlayer = roact.None })
			end
		})
	})
end

function playersPage.renderWithLocalized(p3, p4)
	-- upvalues: var1 (ref)
	return var1(function(p5)
		-- upvalues: p3 (ref), p4 (ref)
		return p3:renderWithLocalizedAndSelectionCursor(p4, p5)
	end)
end

function playersPage.render(p3)
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
	})(function(p4)
		-- upvalues: p3 (ref)
		return p3:renderWithLocalized(p4)
	end)
end

function playersPage.didUpdate(p3, p4, _)
	-- upvalues: playersService (ref), roact (ref)
	if p3.props.isMenuOpen and not p4.isMenuOpen then
		p3:setState({
			players = playersService:GetPlayers(),
			selectedPlayer = roact.None
		})
	end
	local selectedPlayerRef = p3.state.selectedPlayerRef
	
	if selectedPlayerRef and p3.state.selectedPlayerPosition ~= selectedPlayerRef.AbsolutePosition then
		p3:setState({
			selectedPlayerPosition = selectedPlayerRef.AbsolutePosition
		})
	end
end

return roactRodux.UNSTABLE_connect2(function(p3, _)
	-- upvalues: constantsModule_1 (ref)
	return {
		isMenuOpen = p3.isMenuOpen,
		voiceEnabled = p3.voiceState.voiceEnabled,
		friends = p3.friends,
		inspectMenuEnabled = p3.displayOptions.inspectMenuEnabled,
		screenSize = p3.screenSize,
		currentPage = p3.menuPage,
		isRespawnDialogOpen = p3.respawn.dialogOpen,
		isReportDialogOpen = p3.report.dialogOpen or p3.report.reportSentOpen,
		isGamepadLastInput = p3.displayOptions.inputType == constantsModule_1.InputType.Gamepad,
		isCurrentZoneActive = p3.currentZone == 1
	}
end, function(p3)
	-- upvalues: closeMenuModule (ref), unblockPlayerModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p3 (ref), closeMenuModule (copy)
			p3(closeMenuModule)
		end,
		unblockPlayer = function(p4)
			-- upvalues: p3 (ref), unblockPlayerModule (copy)
			return p3(unblockPlayerModule(p4))
		end
	}
end)(playersPage)