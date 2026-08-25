local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local runService = game:GetService("RunService")
local localizationService = game:GetService("LocalizationService")
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local formatUsername = userProfilesModule.Formatters.formatUsername
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local openTypeSupport = require(corePackagesService.Packages.UIBlox).Utility.OpenTypeSupport
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local reportAbuseMenuNewContainerPageModule = require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage)
local socialUtilModule = require(robloxGui.Modules:WaitForChild("SocialUtil"))
local diag = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.Diag
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local gameInviteAnalytics = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalytics
local onBlockButtonActivatedModule = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local voiceAnalyticsModule = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics)
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local blockingAnalyticsModule = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local menuButtonsContainerModule = require(robloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(robloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local var25 = if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalyticsManager else nil
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagLuaAppEnableOpenTypeSupport = sharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport
local fFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagRelocateMobileMenuButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local fIntRelocateMobileMenuButtonsVariantModule = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local fFlagMenuButtonsMountWithIEMModule = require(robloxGui.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagHidePeoplePageInviteFriends = sharedFlagsModule.FFlagHidePeoplePageInviteFriends
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local userProfileStore = userProfilesModule.Stores.UserProfileStore
local _, status = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local themeModule = require(script.Parent.Parent.Theme)
local constantsModule_1 = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local uDim2 = UDim2.new(0.5, -10, 0, 52)
local _ = nil
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local getFFlagVoiceChatUILoggingModule = require(robloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
local getFFlagDefaultFriendingLabelTextNonEmptyModule = require(robloxGui.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty)
local getFFlagEnableLeaveGameUpsellEntrypointModule = require(robloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint)
local getFFlagDestroyPlayerCardOnLeaveModule = require(robloxGui.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave)
local getFFlagEnableConsoleJoinVoiceModule = require(robloxGui.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice)
local enableConsoleJoinVoiceTranslation = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false)
local checkButtonFrameBeforeDestroy = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false)
local isEngineTruncationEnabledForIngameSettingsModule = require(robloxGui.Modules.Flags.isEngineTruncationEnabledForIngameSettings)
local voiceChatMultistreamSubscriptionsEnabledEngineFeature = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local luaFlagVoiceChatDisableSubscribeRetryForMultistream = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local playerListRefactorUsernameFormatting = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false)
local checkShareGameButtonInMuteAllLayout = game:DefineFastFlag("CheckShareGameButtonInMuteAllLayout", false)
local onlyCaptureFocusIfOnPlayerPage = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false)
local settingsHubPlayersButtonsResponsiveThreshold = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200)
local getFFlagCleanupMuteSelfButtonModule = require(robloxGui.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton)
local checkForNilUserIdOnPlayerList = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false)
local var50 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local muteStatusIcons = default.MuteStatusIcons
local playerMuteStatusIcons = default.PlayerMuteStatusIcons

return (function()
	-- upvalues: robloxGui (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), localizationService (ref), localization (ref), uiblox (ref), builderIconsModule (ref), localPlayer (write), utilityModule (ref), blockingUtilityModule (ref), themeModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule_1 (ref), getFFlagDefaultFriendingLabelTextNonEmptyModule (ref), voiceAnalyticsModule (ref), settingsHubPlayersButtonsResponsiveThreshold (ref), getFFlagEnableConsoleJoinVoiceModule (ref), getFFlagCleanupMuteSelfButtonModule (ref), checkButtonFrameBeforeDestroy (ref), guiService (ref), blockingAnalyticsModule (ref), onBlockButtonActivatedModule (ref), robloxTranslatorModule (ref), muteStatusIcons (ref), luaFlagVoiceChatDisableSubscribeRetryForMultistream (ref), voiceChatMultistreamSubscriptionsEnabledEngineFeature (ref), default (ref), constantsModule (ref), create (ref), fFlagEnableSideSheet (ref), fFlagRelocateMobileMenuButtonsModule (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), getFFlagEnableLeaveGameUpsellEntrypointModule (ref), fFlagIEMTabFocusNav (ref), playerMuteStatusIcons (ref), reportAbuseMenuNewContainerPageModule (ref), var50 (ref), uDim2 (ref), enableConsoleJoinVoiceTranslation (ref), status (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), checkForNilUserIdOnPlayerList (ref), userProfileStore (ref), isEngineTruncationEnabledForIngameSettingsModule (ref), playerListRefactorUsernameFormatting (ref), formatUsername (ref), playersService (ref), userInputService (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), runService (ref), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (ref), var25 (write), gameInviteAnalytics (ref), eventStream (ref), diag (ref), socialUtilModule (ref), getFFlagVoiceChatUILoggingModule (ref), name (ref), checkShareGameButtonInMuteAllLayout (ref), cryoModule (ref), onlyCaptureFocusIfOnPlayerPage (ref), getFFlagDestroyPlayerCardOnLeaveModule (ref), reactRobloxModule (ref), reactModule (ref), menuButtonsContainerModule (ref), fFlagMenuButtonsMountWithIEMModule (ref)
	local players = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	players.PageListLayout.Padding = UDim.new(0, 16)
	players.playSessionId = ""
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		players.playSessionId = rbxAnalyticsService:GetPlaySessionId()
	end
	local t = {}
	local robloxLocaleId = localizationService.RobloxLocaleId
	
	if not t[robloxLocaleId] then
		t[robloxLocaleId] = localization.new(robloxLocaleId)
	end
	players.TabHeader.Name = "PlayersTab"
	local friends = uiblox["icons/menu/friends"]
	players.TabHeader.TabLabel.Icon.Text = friends.name
	players.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[friends.variant]
	players.TabHeader.TabLabel.Title.Text = "People"
	
	local function _(p0)
		-- upvalues: localPlayer (copy)
		local ok, status = pcall(function()
			-- upvalues: localPlayer (copy), p0 (ref)
			return localPlayer:GetFriendStatus(p0)
		end)
		
		return if ok then status else Enum.FriendStatus.NotFriend
	end
	
	players.Page.Name = "Players"
	
	local _ = function(p1)
		-- upvalues: localPlayer (copy)
		return p1 and (p1 ~= localPlayer and (p1.UserId > 0 and localPlayer.UserId > 0))
	end
	
	local _ = function()
		-- upvalues: utilityModule (copy)
		return utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait()
	end
	
	local _ = function(p2)
		-- upvalues: blockingUtilityModule (copy)
		return blockingUtilityModule:IsPlayerBlockedByUserId(p2.UserId)
	end
	
	local function createFriendStatusTextLabel(p3, p4)
		-- upvalues: themeModule (copy), fFlagConnectionsToFriendsRename (copy), t (ref), robloxLocaleId (ref), constantsModule_1 (copy), getFFlagDefaultFriendingLabelTextNonEmptyModule (copy), localPlayer (copy), rbxAnalyticsService (copy), utilityModule (copy)
		if p3 == nil then
			return nil
		end
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		local friendStatus = nil
		local var109 = nil
		
		if p3 == Enum.FriendStatus.Friend or p3 == Enum.FriendStatus.FriendRequestSent then
			friendStatus = Instance.new("TextButton")
			friendStatus.BackgroundTransparency = 1
			friendStatus.FontSize = themeModule.fontSize(Enum.FontSize.Size24)
			friendStatus.Font = themeModule.font(Enum.Font.SourceSans)
			friendStatus.TextColor3 = Color3.new(1, 1, 1)
			friendStatus.SelectionImageObject = frame
			
			if p3 == Enum.FriendStatus.Friend then
				friendStatus.Text = if fFlagConnectionsToFriendsRename then t[robloxLocaleId]:Format(constantsModule_1.FriendLocalizedKey) else t[robloxLocaleId]:Format(constantsModule_1.ConnectionLocalizedKey)
			else
				friendStatus.Text = "Request Sent"
			end
		elseif p3 == Enum.FriendStatus.Unknown or p3 == Enum.FriendStatus.NotFriend or p3 == Enum.FriendStatus.FriendRequestReceived then
			local friendStatus, friendStatus_1 = utilityModule:MakeStyledButton("FriendStatus", if fFlagConnectionsToFriendsRename then t[robloxLocaleId]:Format(constantsModule_1.AddFriendLocalizedKey) else t[robloxLocaleId]:Format(constantsModule_1.AddConnectionLocalizedKey), UDim2.new(0, 182, 0, themeModule.ButtonHeight), function()
				-- upvalues: friendStatus (write), var109 (write), getFFlagDefaultFriendingLabelTextNonEmptyModule (copy), fFlagConnectionsToFriendsRename (copy), t (copy), robloxLocaleId (copy), constantsModule_1 (copy), localPlayer (copy), p4 (ref), rbxAnalyticsService (copy)
				if friendStatus and var109 and var109.Text ~= "" then
					friendStatus.ImageTransparency = 1
					var109.Text = ""
					
					if getFFlagDefaultFriendingLabelTextNonEmptyModule() then
						var109.Text = if fFlagConnectionsToFriendsRename then t[robloxLocaleId]:Format(constantsModule_1.AddFriendLocalizedKey) else t[robloxLocaleId]:Format(constantsModule_1.AddConnectionLocalizedKey)
					end
					if localPlayer and p4 then
						rbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsRequestFriendContext, constantsModule_1.AnalyticsRequestFriendName, { category = "Game" })
						localPlayer:RequestFriendship(p4)
					end
				end
			end)
			friendStatus = friendStatus
			var109 = friendStatus_1
			var109.ZIndex = 3
			var109.Position += UDim2.new(0, 0, 0, 1)
		end
		if friendStatus then
			friendStatus.Name = "FriendStatus"
			friendStatus.ZIndex = 3
			friendStatus.Size = UDim2.new(0, 150, 0, themeModule.ButtonHeight)
			friendStatus.Position = UDim2.new(1, -198, 0, 7)
			
			if var109 then
				var109.Position = UDim2.new(0, 0, 0, 0)
			end
		end
		return friendStatus
	end
	
	local function createFriendStatusImageLabel(p5, p6)
		-- upvalues: utilityModule (copy), themeModule (copy), localPlayer (copy), rbxAnalyticsService (copy), constantsModule_1 (copy)
		if p5 == Enum.FriendStatus.Friend or p5 == Enum.FriendStatus.FriendRequestSent then
			local var112 = "icons/menu/friends"
			local var113 = 0
			
			if p5 ~= Enum.FriendStatus.Friend then
				var112 = "icons/actions/friends/friendAdd"
				var113 = 0.5
			end
			local friendStatus_1, _ = utilityModule:MakeStyledImageButton("FriendStatus", var112, UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28))
			friendStatus_1.Name = "FriendStatus"
			friendStatus_1.Selectable = false
			friendStatus_1.FriendStatusTextLabel.TextTransparency = var113
			
			return friendStatus_1
		elseif p5 == Enum.FriendStatus.Unknown or p5 == Enum.FriendStatus.NotFriend or p5 == Enum.FriendStatus.FriendRequestReceived then
			local friendStatus_3 = nil
			local var116 = nil
			local friendStatus, friendStatus_2 = utilityModule:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
				-- upvalues: friendStatus_3 (write), var116 (write), localPlayer (copy), p6 (ref), rbxAnalyticsService (copy), constantsModule_1 (copy)
				if friendStatus_3 and var116 and friendStatus_3.ImageTransparency ~= 1 then
					friendStatus_3.ImageTransparency = 1
					var116.TextTransparency = 1
					
					if localPlayer and p6 then
						rbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsRequestFriendContext, constantsModule_1.AnalyticsRequestFriendName, { category = "Game" })
						localPlayer:RequestFriendship(p6)
					end
				end
			end)
			friendStatus_3 = friendStatus
			var116 = friendStatus_2
			friendStatus_3.Name = "FriendStatus"
			friendStatus_3.Selectable = true
			
			return friendStatus_3
		end
		return nil
	end
	
	local var55 = nil
	local var56 = nil
	local var57 = nil
	local var58 = nil
	local t_1 = {}
	local players_1 = voiceAnalyticsModule.new(rbxAnalyticsService, "Players")
	local _ = nil
	local var61 = false
	local _ = nil
	local t_2 = {}
	local var63 = nil
	local var64 = nil
	
	local var65 = function()
		-- upvalues: players (ref), settingsHubPlayersButtonsResponsiveThreshold (copy), t_2 (write)
		return players.Page.AbsoluteSize.X < settingsHubPlayersButtonsResponsiveThreshold * #t_2
	end
	
	local var66 = function()
		-- upvalues: t_2 (write), var55 (write), var56 (write), var57 (write), getFFlagEnableConsoleJoinVoiceModule (copy), var58 (write), var61 (write), var65 (write), var63 (write), getFFlagCleanupMuteSelfButtonModule (copy), var64 (write), checkButtonFrameBeforeDestroy (copy)
		t_2 = {}
		
		if var55 then
			table.insert(t_2, var55)
		end
		if var56 then
			table.insert(t_2, var56)
		end
		if var57 then
			table.insert(t_2, var57)
		end
		if getFFlagEnableConsoleJoinVoiceModule() and var58 then
			table.insert(t_2, var58)
		end
		var61 = var65()
		
		if #t_2 > 0 then
			local uDim2 = UDim2.new(1 / #t_2, 0, 0, 52)
			local t = {
				Size = UDim2.new(1, (#t_2 - 1) * -20, 0, 52),
				AutomaticSize = Enum.AutomaticSize.None
			}
			local t_1 = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20)
			}
			
			if var61 then
				uDim2 = UDim2.new(1, 0, 0, 52)
				t = {
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}
				t_1 = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16)
				}
			end
			local var122 = 1
			
			for i, v in t_2 do
				v.Size = uDim2
				v.Parent = var63
				v.LayoutOrder = var122
				var122 += 1
			end
			for i_1, v_1 in t_1 do
				if not getFFlagCleanupMuteSelfButtonModule() then
					var64[i_1] = v_1
				elseif var64 then
					var64[i_1] = v_1
				end
			end
			for i_2, v_2 in t do
				if not getFFlagCleanupMuteSelfButtonModule() then
					var63[i_2] = v_2
				elseif var63 then
					var63[i_2] = v_2
				end
			end
			return
		elseif checkButtonFrameBeforeDestroy then
			if var63 then
				var63:Destroy()
				var63 = nil
				
				return
			end
		else
			var63:Destroy()
			var63 = nil
		end
	end
	
	local _ = function(p7)
		return if p7 and p7.Parent then p7:FindFirstChild("DisplayNameLabel") else nil
	end
	
	local _ = function(p8)
		if #p8 == 0 then
			return ""
		end
		local var123 = p8[1]
		
		if var123 == nil then
			return ""
		end
		local names = var123.names
		
		return if names == nil then "" else names.getInExperienceCombinedName(false)
	end
	
	local function resizeFriendButton(p9, p10, p11, p12)
		-- upvalues: localPlayer (copy), blockingUtilityModule (copy), createFriendStatusImageLabel (ref), createFriendStatusTextLabel (ref), utilityModule (copy)
		local friendStatus_1 = p9:FindFirstChild("FriendStatus")
		
		if friendStatus_1 and p11 == p12 then return end
		if friendStatus_1 then
			friendStatus_1:Destroy()
			friendStatus_1 = nil
		end
		local var125 = nil
		local ok = p10 and (p10 ~= localPlayer and (p10.UserId > 0 and localPlayer.UserId > 0))
		
		if ok then
			ok, status = pcall(function()
				-- upvalues: localPlayer (copy), p10 (ref)
				return localPlayer:GetFriendStatus(p10)
			end)
			var125 = if ok then status else Enum.FriendStatus.NotFriend
		end
		if blockingUtilityModule:IsPlayerBlockedByUserId(p10.UserId) == false then
			friendStatus_1 = if p11 then createFriendStatusImageLabel(var125, p10) else createFriendStatusTextLabel(var125, p10)
		end
		if friendStatus_1 then
			friendStatus_1.Name = "FriendStatus"
			friendStatus_1.LayoutOrder = 5
			friendStatus_1.Selectable = true
			utilityModule:MakeFocusState(friendStatus_1, "utility-focus-state" .. "-friendstatuslabel-" .. p10.Name)
			friendStatus_1.Parent = p9
		end
	end
	
	local function friendStatusCreate(p13, p14)
		-- upvalues: guiService (copy), var55 (write), resizeFriendButton (ref), utilityModule (copy)
		local var127 = if p13 then p13:FindFirstChild("RightSideButtons") else nil
		
		if var127 then
			for i, v in pairs(var127:GetChildren()) do
				if v and v.Name == "FriendStatus" then
					if guiService.SelectedCoreObject == v then
						guiService.SelectedCoreObject = var55
					end
					v:Destroy()
				end
			end
			resizeFriendButton(var127, p14, utilityModule:IsPortrait(), nil)
		end
	end
	
	localPlayer.FriendStatusChanged:connect(function(p15, _)
		-- upvalues: players (ref), friendStatusCreate (ref)
		if p15 then
			local var128 = players.Page:FindFirstChild("PlayerLabel" .. p15.Name)
			
			if var128 then
				friendStatusCreate(var128, p15)
			end
		end
	end)
	local resizeBlockButton = nil
	local trySelection = nil
	local var71 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
	
	local function createBlockButton(p16, p17, p18, _)
		-- upvalues: blockingUtilityModule (copy), resizeBlockButton (write), resizeFriendButton (ref), trySelection (write), guiService (copy), onBlockButtonActivatedModule (copy), var71 (ref), constantsModule_1 (copy), utilityModule (copy), robloxTranslatorModule (copy), themeModule (copy)
		local function _(p19)
			-- upvalues: resizeBlockButton (copy), p16 (ref), p17 (ref), p18 (ref), resizeFriendButton (copy), trySelection (copy)
			local var129 = resizeBlockButton(p16, p17, p18, not p18)
			resizeFriendButton(p16, p17, p18, not p18)
			
			if p19 then
				trySelection(var129)
			end
		end
		
		return if blockingUtilityModule:IsPlayerBlockedByUserId(p17.UserId) then utilityModule:MakeStyledButton("BlockButton", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, themeModule.ButtonHeight), function()
			-- upvalues: blockingUtilityModule (copy), p17 (ref), var71 (copy), resizeBlockButton (copy), p16 (ref), p18 (ref), resizeFriendButton (copy)
			if blockingUtilityModule:UnblockPlayerAsync(p17) then
				var71:action("SettingsHub", "unblockUser", { blockeeUserId = p17.UserId })
				local _ = resizeBlockButton(p16, p17, p18, not p18)
				resizeFriendButton(p16, p17, p18, not p18)
			end
		end) else utilityModule:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
			-- upvalues: guiService (copy), onBlockButtonActivatedModule (copy), p17 (ref), var71 (copy), constantsModule_1 (copy), resizeBlockButton (copy), p16 (ref), p18 (ref), resizeFriendButton (copy), trySelection (copy)
			local var130 = if guiService.SelectedCoreObject == nil then guiService.SelectedObject ~= nil else true
			onBlockButtonActivatedModule(p17, var71, constantsModule_1.AnalyticsInGameMenuName):andThen(function()
				-- upvalues: var130 (ref), resizeBlockButton (copy), p16 (copy), p17 (copy), p18 (copy), resizeFriendButton (copy), trySelection (copy)
				local var131 = resizeBlockButton(p16, p17, p18, not p18)
				resizeFriendButton(p16, p17, p18, not p18)
				
				if var130 then
					trySelection(var131)
				end
			end)
		end)
	end
	
	trySelection = function(p20)
		-- upvalues: guiService (copy)
		if p20 and not p20.Selectable then
			guiService:Select(p20)
			
			return
		end
		guiService.SelectedCoreObject = p20
	end
	
	resizeBlockButton = function(p21, p22, p23, p24)
		-- upvalues: localPlayer (copy), createBlockButton (ref), utilityModule (copy)
		local blockButton_1 = p21:FindFirstChild("BlockButton")
		
		if blockButton_1 and p23 == p24 then
			return blockButton_1
		elseif blockButton_1 then
			blockButton_1:Destroy()
			blockButton_1 = nil
		end
		if p22 and (p22 ~= localPlayer and (p22.UserId > 0 and localPlayer.UserId > 0)) then
			blockButton_1 = createBlockButton(p21, p22, p23, p24)
		end
		if blockButton_1 then
			blockButton_1.Name = "BlockButton"
			blockButton_1.LayoutOrder = 4
			blockButton_1.Selectable = true
			utilityModule:MakeFocusState(blockButton_1, "utility-focus-state" .. "-blockbutton-" .. p22.Name)
			blockButton_1.Parent = p21
		end
		return blockButton_1
	end
	
	local var73 = false
	local var74 = false
	
	local function muteButtonUpdate(p25, p26)
		-- upvalues: muteStatusIcons (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy), default (copy), t_1 (ref), utilityModule (copy), themeModule (copy), players_1 (ref), constantsModule (copy)
		local var133 = if p25 then p25:FindFirstChild("RightSideButtons") else nil
		
		if not var133 then return end
		local muteStatusButton = var133:FindFirstChild("MuteStatusButton")
		
		if p26 == nil then
			if muteStatusButton then
				muteStatusButton:Destroy()
			end
			return
		else
			local uDim2 = UDim2.fromOffset(36, 36)
			local uDim2_1 = UDim2.fromOffset(0, 0)
			local var137 = 0
			local var138 = if p26.isMuted then muteStatusIcons.MicOff else muteStatusIcons.MicOn
			
			if p26.subscriptionFailed then
				var138 = muteStatusIcons.Error
				uDim2 = UDim2.fromOffset(36, 36)
				uDim2_1 = UDim2.fromOffset(2, -2)
				
				if luaFlagVoiceChatDisableSubscribeRetryForMultistream and voiceChatMultistreamSubscriptionsEnabledEngineFeature then
					var137 = 0.5
				end
			elseif p26.isMutedLocally then
				var138 = muteStatusIcons.MicDisabled
				var137 = 0.5
			elseif not p26.subscriptionCompleted then
				var138 = muteStatusIcons.Loading
			elseif p26.isSignalActive then
				var138 = default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * math.random()) * 20), "SpeakerLight")
			end
			if muteStatusButton then
				local userId = t_1[p26.userId] or var133:FindFirstChild("MuteStatusImageLabel", true)
				userId.Image = var138
				userId.Size = uDim2
				userId.ImageTransparency = var137
				
				return
			elseif default.voiceUIVisible then
				local muteStatus, muteStatus_1 = utilityModule:MakeStyledImageButton("MuteStatus", var138, UDim2.fromOffset(themeModule.ButtonHeight, themeModule.ButtonHeight), uDim2, function()
					-- upvalues: default (copy), p26 (ref), players_1 (copy), constantsModule (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy)
					local userId = default.participants[tostring(p26.userId)]
					
					if userId.subscriptionCompleted then
						if players_1 then
							players_1:onToggleMutePlayer(p26.userId, not userId.isMutedLocally)
						end
						default:ToggleMutePlayer(p26.userId, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
						
						return
					elseif userId.subscriptionFailed then
						if luaFlagVoiceChatDisableSubscribeRetryForMultistream then
							if voiceChatMultistreamSubscriptionsEnabledEngineFeature then
								return
							else
								default:SubscribeRetry(p26.userId)
								
								return
							end
						else
							default:SubscribeRetry(p26.userId)
						end
					end
				end)
				t_1[p26.userId] = muteStatus_1
				muteStatus_1.ZIndex = 3
				muteStatus_1.Position += uDim2_1
				muteStatus_1.ImageTransparency = var137
				utilityModule:MakeFocusState(muteStatus, "utility-focus-state" .. "-mutestatusbutton-" .. p26.userId)
				muteStatus.Parent = var133
			end
		end
	end
	
	local var76 = create("Frame")({
		Name = "ButtonsContainer",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(1, 0, 0, themeModule.ButtonHeight),
		Parent = players.Page
	})
	players.ButtonsContainer = var76
	
	if fFlagEnableSideSheet or fFlagRelocateMobileMenuButtonsModule and (fIntRelocateMobileMenuButtonsVariantModule == 1 or fIntRelocateMobileMenuButtonsVariantModule == 3) then
		var76.Parent = nil
	end
	create("UIPadding")({
		PaddingBottom = UDim.new(0, 1),
		PaddingTop = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 1),
		PaddingRight = UDim.new(0, 1),
		Parent = var76
	})
	local leaveButton, leaveButton_1 = utilityModule:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.333333333333, -12, 1, 0), function()
		-- upvalues: getFFlagEnableLeaveGameUpsellEntrypointModule (copy), players (ref), constantsModule (copy)
		if getFFlagEnableLeaveGameUpsellEntrypointModule() and players.HubRef.leaveGameUpsellProp ~= constantsModule.PHONE_UPSELL_VALUE_PROP.None then
			players.HubRef:SwitchToPage(players.HubRef.LeaveGameUpsellPage, nil, 1, true)
			
			return
		end
		players.HubRef:SwitchToPage(players.HubRef.LeaveGamePage, false, 1)
	end)
	leaveButton.AnchorPoint = Vector2.new(0, 0)
	leaveButton.Position = UDim2.new(0, 0, 0, 0)
	leaveButton_1.Size = UDim2.new(1, -4, 1, 0)
	leaveButton_1.Position = UDim2.new(0, 2, 0, 0)
	create("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Parent = leaveButton
	})
	create("UIPadding")({ PaddingLeft = UDim.new(0.025, 0), Parent = leaveButton })
	leaveButton_1.Size = UDim2.new(0, 0, 1, 0)
	create("UIFlexItem")({ FlexMode = Enum.UIFlexMode.Grow, Parent = leaveButton_1 })
	
	if not fFlagRelocateMobileMenuButtonsModule or fIntRelocateMobileMenuButtonsVariantModule == 0 then
		leaveButton.Parent = var76
	end
	local resetButton, resetButton_1 = utilityModule:MakeStyledButton("ResetButton", t[robloxLocaleId]:Format(constantsModule_1.RespawnLocalizedKey), UDim2.new(0.333333333333, -12, 1, 0), function()
		-- upvalues: players (ref)
		players.HubRef:SwitchToPage(players.HubRef.ResetCharacterPage, false, 1)
	end)
	resetButton.AnchorPoint = Vector2.new(0.5, 0)
	resetButton.Position = UDim2.new(0.5, 0, 0, 0)
	resetButton_1.Size = UDim2.new(1, -4, 1, 0)
	resetButton_1.Position = UDim2.new(0, 2, 0, 0)
	
	if not fFlagRelocateMobileMenuButtonsModule or fIntRelocateMobileMenuButtonsVariantModule == 0 then
		resetButton.Parent = var76
	end
	local resumeButton, resumeButton_1 = utilityModule:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.333333333333, -12, 1, 0), function()
		-- upvalues: players (ref), rbxAnalyticsService (copy), constantsModule_1 (copy)
		players.HubRef:SetVisibility(false)
		rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsResumeGameName, constantsModule_1.AnalyticsMenuActionName, {
			source = constantsModule_1.AnalyticsResumeButtonSource,
			playsessionid = players.playSessionId,
			universeid = tostring(game.GameId)
		})
	end)
	resumeButton.AnchorPoint = Vector2.new(1, 0)
	resumeButton.Position = UDim2.new(1, 0, 0, 0)
	resumeButton_1.Size = UDim2.new(1, -4, 1, 0)
	resumeButton_1.Position = UDim2.new(0, 2, 0, 0)
	
	if not fFlagRelocateMobileMenuButtonsModule or fIntRelocateMobileMenuButtonsVariantModule == 0 then
		resumeButton.Parent = var76
		
		if fFlagIEMTabFocusNav then
			players.FirstSelectableObjects = { resumeButton, resetButton, leaveButton }
			players.FirstSelectableObjectsUpdated:fire()
		end
	end
	local function pollImage()
		-- upvalues: default (copy), playerMuteStatusIcons (copy)
		local localMuted = default.localMuted
		local _ = nil
		
		return if localMuted == nil then playerMuteStatusIcons.Loading elseif localMuted then playerMuteStatusIcons.MicOff elseif default.isTalking then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * math.random()) * 20), "MicLight") else playerMuteStatusIcons.MicOn
	end
	
	local _ = function(p27, p28, p29, p30)
		-- upvalues: var76 (ref)
		local var142 = var76:FindFirstChild(p27 .. "Button", true)
		
		if var142 then
			var142.Position = p28
			var142.Size = p29
			var142.AnchorPoint = p30
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var76 (ref)
		local playerMuteButtonButton = var76:FindFirstChild("PlayerMuteButtonButton", true)
		
		if playerMuteButtonButton then
			playerMuteButtonButton:Destroy()
		end
	end
	
	local function resetButtonRow()
		-- upvalues: fFlagRelocateMobileMenuButtonsModule (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), var76 (ref)
		if not fFlagRelocateMobileMenuButtonsModule or fIntRelocateMobileMenuButtonsVariantModule == 0 then
			local uDim2 = UDim2.new(1, 0, 0, 0)
			local uDim2_1 = UDim2.new(0.333333333333, -12, 1, 0)
			local vector2 = Vector2.new(1, 0)
			local resumeButtonButton = var76:FindFirstChild("ResumeButtonButton", true)
			
			if resumeButtonButton then
				resumeButtonButton.Position = uDim2
				resumeButtonButton.Size = uDim2_1
				resumeButtonButton.AnchorPoint = vector2
			end
			local uDim2_2 = UDim2.new(0.5, 0, 0, 0)
			local uDim2_3 = UDim2.new(0.333333333333, -12, 1, 0)
			local vector2_1 = Vector2.new(0.5, 0)
			local resetButtonButton = var76:FindFirstChild("ResetButtonButton", true)
			
			if resetButtonButton then
				resetButtonButton.Position = uDim2_2
				resetButtonButton.Size = uDim2_3
				resetButtonButton.AnchorPoint = vector2_1
			end
			local uDim2_4 = UDim2.new(0, 0, 0, 0)
			local uDim2_5 = UDim2.new(0.333333333333, -12, 1, 0)
			local vector2_2 = Vector2.new(0, 0)
			local leaveButtonButton = var76:FindFirstChild("LeaveButtonButton", true)
			
			if leaveButtonButton then
				leaveButtonButton.Position = uDim2_4
				leaveButtonButton.Size = uDim2_5
				leaveButtonButton.AnchorPoint = vector2_2
			end
		end
		local playerMuteButtonButton = var76:FindFirstChild("PlayerMuteButtonButton", true)
		
		if playerMuteButtonButton then
			playerMuteButtonButton:Destroy()
		end
	end
	
	local _ = function()
		-- upvalues: getFFlagCleanupMuteSelfButtonModule (copy), var63 (write), pollImage (ref)
		local muteSelfButtonImageLabel = nil
		
		if not getFFlagCleanupMuteSelfButtonModule() then
			muteSelfButtonImageLabel = var63:FindFirstChild("MuteSelfButtonImageLabel", true)
		elseif var63 then
			muteSelfButtonImageLabel = var63:FindFirstChild("MuteSelfButtonImageLabel", true)
		end
		if muteSelfButtonImageLabel then
			muteSelfButtonImageLabel.Image = pollImage()
			
			return
		end
	end
	
	utilityModule:OnResized(var76, function(_, p31)
		-- upvalues: utilityModule (copy), themeModule (copy), var76 (ref), fFlagRelocateMobileMenuButtonsModule (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), resetButton_1 (ref), leaveButton_1 (ref), resumeButton_1 (ref)
		if (p31 or utilityModule:IsSmallTouchScreen()) and not themeModule.AlwaysShowBottomBar() then
			local var158 = p31 and themeModule.textSize(18) or themeModule.textSize(24)
			var76.Visible = true
			var76.Size = UDim2.new(1, 0, 0, themeModule.ButtonHeight)
			
			if fFlagRelocateMobileMenuButtonsModule and fIntRelocateMobileMenuButtonsVariantModule ~= 0 then
				return
			else
				resetButton_1.TextSize = var158
				leaveButton_1.TextSize = var158
				resumeButton_1.TextSize = var158
				
				return
			end
		else
			var76.Visible = false
			var76.Size = UDim2.new(1, 0, 0, 0)
		end
	end)
	
	local function reportAbuseButtonCreate(p32, p33)
		-- upvalues: localPlayer (copy), reportAbuseMenuNewContainerPageModule (copy), utilityModule (copy), themeModule (copy)
		local rightSideButtons = p32:FindFirstChild("RightSideButtons")
		
		if rightSideButtons then
			local reportPlayer = rightSideButtons:FindFirstChild("ReportPlayer")
			
			if reportPlayer then
				reportPlayer:Destroy()
			end
			if p33 and (p33 ~= localPlayer and (p33.UserId > 0 and localPlayer.UserId > 0)) then
				local reportPlayer_2 = utilityModule:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
					-- upvalues: reportAbuseMenuNewContainerPageModule (copy), p33 (ref)
					reportAbuseMenuNewContainerPageModule:ReportPlayer(p33, "MenuPlayerList")
				end)
				reportPlayer_2.Name = "ReportPlayer"
				reportPlayer_2.Position = UDim2.new(1, -260, 0, 7)
				reportPlayer_2.LayoutOrder = 3
				reportPlayer_2.Selectable = true
				utilityModule:MakeFocusState(reportPlayer_2, "utility-focus-state" .. "-reportplayer-" .. p33.Name)
				reportPlayer_2.Parent = rightSideButtons
			end
		end
	end
	
	local _ = nil
	local _ = nil
	local _ = nil
	local var86 = nil
	local _ = nil
	local var87 = false
	local var88 = nil
	
	local _ = function()
		-- upvalues: var56 (write), var66 (write)
		if var56 then
			var56.Visible = false
			var56:Destroy()
			var56 = nil
		end
		var66()
	end
	
	local _ = function()
		-- upvalues: var57 (write), var88 (write), var66 (write)
		if var57 then
			var57.Visible = false
			var57:Destroy()
			var57 = nil
		end
		if var88 then
			var88:Disconnect()
			var88 = nil
		end
		var66()
	end
	
	local _ = function()
		-- upvalues: var58 (write), var66 (write)
		if var58 then
			var58.Visible = false
			var58:Destroy()
			var58 = nil
		end
		var66()
	end
	
	local function shouldShowJoinVoiceButton()
		-- upvalues: getFFlagEnableConsoleJoinVoiceModule (copy), var87 (write), var50 (copy), default (copy)
		return getFFlagEnableConsoleJoinVoiceModule() and (game:GetEngineFeature("VoiceChatSupported") and (not var87 and (not var50 and (default:verifyUniverseAndPlaceCanUseVoice() and (default:ShouldShowJoinVoiceOnDisconnect() and (default:GetVoiceConnectCookie() == "" and default:HasSeamlessVoiceFeature("InitialJoinVoice")))))))
	end
	
	local function createRow(p34, p35, p36)
		-- upvalues: themeModule (copy), create (copy)
		local icon
		local var162 = Instance.new(p34)
		var162.Size = UDim2.new(1, 0, 0, 62)
		var162.Position = UDim2.new(0, 0, 0, 0)
		var162.ZIndex = 2
		var162.BackgroundColor3 = themeModule.color("PlayerRowFrame")
		var162.BackgroundTransparency = themeModule.transparency("PlayerRowFrame")
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var162
		})
		local _ = nil
		
		if p36 then
			icon = Instance.new("TextLabel")
			icon.TextColor3 = Color3.new(1, 1, 1)
			icon.TextSize = 24
		else
			icon = Instance.new("ImageLabel")
		end
		icon.Name = "Icon"
		icon.BackgroundTransparency = 1
		icon.Size = UDim2.new(0, 36, 0, 36)
		icon.Position = UDim2.new(0, 12, 0, 12)
		icon.ZIndex = 3
		icon.Parent = var162
		local textLabel_1 = Instance.new("TextLabel")
		textLabel_1.Text = ""
		textLabel_1.TextXAlignment = Enum.TextXAlignment.Left
		textLabel_1.Font = themeModule.font(Enum.Font.SourceSans, "DisplayName")
		textLabel_1.FontSize = p35 and themeModule.fontSize(Enum.FontSize.Size36, "DisplayName") or themeModule.fontSize(Enum.FontSize.Size24, "DisplayName")
		textLabel_1.TextColor3 = Color3.new(1, 1, 1)
		textLabel_1.BackgroundTransparency = 1
		textLabel_1.Position = p35 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0)
		textLabel_1.Size = UDim2.new(0, 0, 0, 0)
		textLabel_1.ZIndex = 3
		textLabel_1.Parent = var162
		
		if p35 then
			local secondRow = Instance.new("TextLabel")
			secondRow.Text = ""
			secondRow.Name = "SecondRow"
			secondRow.TextXAlignment = Enum.TextXAlignment.Left
			secondRow.Font = themeModule.font(Enum.Font.SourceSans)
			secondRow.FontSize = themeModule.fontSize(Enum.FontSize.Size24, "Username")
			secondRow.TextColor3 = Color3.fromRGB(162, 162, 162)
			secondRow.BackgroundTransparency = 1
			secondRow.Position = UDim2.new(0, 60, 0.5, 12)
			secondRow.Size = UDim2.new(0, 0, 0, 0)
			secondRow.ZIndex = 3
			secondRow.Parent = var162
		end
		return var162
	end
	
	local var91 = function()
		-- upvalues: createRow (ref), var87 (write), getFFlagEnableConsoleJoinVoiceModule (copy), shouldShowJoinVoiceButton (ref), uDim2 (copy), themeModule (copy), t (ref), robloxLocaleId (ref), fFlagConnectionsToFriendsRename (copy), constantsModule_1 (copy), uiblox (copy), builderIconsModule (copy), utilityModule (copy)
		local var166 = createRow("ImageButton", nil, true)
		var166.Size = UDim2.new(1, 0, 0, 52)
		local textLabel = var166.TextLabel
		local icon = var166.Icon
		
		if var87 or getFFlagEnableConsoleJoinVoiceModule() and shouldShowJoinVoiceButton() then
			var166.Size = uDim2
			textLabel.Size = UDim2.new(1, -60, 0, 0)
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			var166.AnchorPoint = Vector2.new(0, 0)
		end
		textLabel.Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		textLabel.AutoLocalize = false
		textLabel.Text = t[robloxLocaleId]:Format(if fFlagConnectionsToFriendsRename then constantsModule_1.InviteFriendsLocalizedKey else constantsModule_1.InviteConnectionsLocalizedKey)
		icon.AnchorPoint = Vector2.new(0, 0.5)
		icon.Position = UDim2.new(0, 18, 0.5, 0)
		local friendInvite = uiblox["icons/actions/friends/friendInvite"]
		local var167 = if friendInvite then uiblox["icons/actions/friends/friendInvite"] else themeModule.Images["icons/actions/friends/friendInvite"]
		
		if var167 then
			if friendInvite then
				icon.Text = var167.name
				icon.FontFace = builderIconsModule.Font[var167.variant]
			else
				icon.Image = var167.Image
				icon.ImageRectOffset = var167.ImageRectOffset
				icon.ImageRectSize = var167.ImageRectSize
			end
		end
		local function _(value)
			-- upvalues: var166 (ref)
			if value then
				var166.ImageTransparency = 0.65
				
				return
			end
			var166.ImageTransparency = 0.85
		end
		
		var166.InputBegan:Connect(function()
			-- upvalues: var166 (ref)
			var166.ImageTransparency = 0.65
		end)
		var166.InputEnded:Connect(function()
			-- upvalues: var166 (ref)
			var166.ImageTransparency = 0.85
		end)
		var166.Activated:Connect(function()
			-- upvalues: var166 (ref)
			var166.ImageTransparency = 0.85
		end)
		var166.TouchPan:Connect(function(_, p37)
			-- upvalues: var166 (ref)
			if math.abs(p37.Y) > 20 then
				var166.ImageTransparency = 0.85
			end
		end)
		var166.SelectionGained:connect(function()
			-- upvalues: var166 (ref)
			var166.ImageTransparency = 0.65
		end)
		var166.SelectionLost:connect(function()
			-- upvalues: var166 (ref)
			var166.ImageTransparency = 0.85
		end)
		var166.SelectionImageObject = var166:Clone()
		utilityModule:MakeFocusState(var166, "utility-focus-state-sharegame")
		
		return var166
	end
	
	local var92 = function()
		-- upvalues: createRow (ref), var55 (write), themeModule (copy), robloxTranslatorModule (copy), default (copy), utilityModule (copy)
		local var168 = createRow("ImageButton")
		var168.Size = UDim2.new(if var55 then 0.5 else 1, -10, 0, 52)
		var168.Position = UDim2.new(1, 0, 0, 0)
		var168.AnchorPoint = Vector2.new(1, 0)
		local textLabel = var168.TextLabel
		local icon = var168.Icon
		textLabel.Size = UDim2.new(1, -60, 0, 0)
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		textLabel.AutoLocalize = false
		textLabel.Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		icon.Size = UDim2.new(0, 32, 0, 32)
		icon.Position = UDim2.new(0, 18, 0, 16)
		icon.Image = default:GetIcon("UnmuteAll", "Misc")
		icon.AnchorPoint = Vector2.new(0, 0.5)
		icon.Position = UDim2.new(0, 18, 0.5, 0)
		
		local function _(value)
			-- upvalues: var168 (ref)
			if value then
				var168.ImageTransparency = 0.65
				
				return
			end
			var168.ImageTransparency = 0.85
		end
		
		var168.InputBegan:Connect(function()
			-- upvalues: var168 (ref)
			var168.ImageTransparency = 0.65
		end)
		var168.InputEnded:Connect(function()
			-- upvalues: var168 (ref)
			var168.ImageTransparency = 0.85
		end)
		var168.Activated:Connect(function()
			-- upvalues: var168 (ref)
			var168.ImageTransparency = 0.85
		end)
		var168.TouchPan:Connect(function(_, p38)
			-- upvalues: var168 (ref)
			if math.abs(p38.Y) > 20 then
				var168.ImageTransparency = 0.85
			end
		end)
		var168.SelectionGained:connect(function()
			-- upvalues: var168 (ref)
			var168.ImageTransparency = 0.65
		end)
		var168.SelectionLost:connect(function()
			-- upvalues: var168 (ref)
			var168.ImageTransparency = 0.85
		end)
		var168.SelectionImageObject = var168:Clone()
		utilityModule:MakeFocusState(var168, "utility-focus-state-muteall")
		
		return var168
	end
	
	local var93 = function()
		-- upvalues: createRow (ref), themeModule (copy), pollImage (ref), utilityModule (copy), t (ref), robloxLocaleId (ref), default (copy), var88 (write), var73 (write), getFFlagCleanupMuteSelfButtonModule (copy), var63 (write), players_1 (ref), var57 (write)
		local muteSelfButton = createRow("ImageButton")
		muteSelfButton.Name = "MuteSelfButton"
		muteSelfButton.Size = UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight)
		muteSelfButton.Position = UDim2.new(1, 0, 0, 0)
		muteSelfButton.AnchorPoint = Vector2.new(1, 0)
		local textLabel = muteSelfButton.TextLabel
		local muteSelfButtonImageLabel = muteSelfButton.Icon
		textLabel.Size = UDim2.new(1, -60, 0, 0)
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		textLabel.AutoLocalize = false
		muteSelfButtonImageLabel.Name = "MuteSelfButtonImageLabel"
		muteSelfButtonImageLabel.Size = UDim2.new(0, 32, 0, 32)
		muteSelfButtonImageLabel.Position = UDim2.new(0, 18, 0, 16)
		muteSelfButtonImageLabel.Image = pollImage()
		muteSelfButtonImageLabel.AnchorPoint = Vector2.new(0, 0.5)
		muteSelfButtonImageLabel.Position = UDim2.new(0, 18, 0.5, 0)
		
		local function _(value)
			-- upvalues: muteSelfButton (ref)
			if value then
				muteSelfButton.ImageTransparency = 0.65
				
				return
			end
			muteSelfButton.ImageTransparency = 0.85
		end
		
		muteSelfButton.InputBegan:Connect(function()
			-- upvalues: muteSelfButton (ref)
			muteSelfButton.ImageTransparency = 0.65
		end)
		muteSelfButton.InputEnded:Connect(function()
			-- upvalues: muteSelfButton (ref)
			muteSelfButton.ImageTransparency = 0.85
		end)
		muteSelfButton.Activated:Connect(function()
			-- upvalues: muteSelfButton (ref)
			muteSelfButton.ImageTransparency = 0.85
		end)
		muteSelfButton.TouchPan:Connect(function(_, p39)
			-- upvalues: muteSelfButton (ref)
			if math.abs(p39.Y) > 20 then
				muteSelfButton.ImageTransparency = 0.85
			end
		end)
		muteSelfButton.SelectionGained:connect(function()
			-- upvalues: muteSelfButton (ref)
			muteSelfButton.ImageTransparency = 0.65
		end)
		muteSelfButton.SelectionLost:connect(function()
			-- upvalues: muteSelfButton (ref)
			muteSelfButton.ImageTransparency = 0.85
		end)
		muteSelfButton.SelectionImageObject = muteSelfButton:Clone()
		utilityModule:MakeFocusState(muteSelfButton, "utility-focus-state-playermute")
		
		local _ = function(p40)
			-- upvalues: textLabel (ref), t (copy), robloxLocaleId (copy)
			textLabel.Text = t[robloxLocaleId]:Format(if p40 then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end
		
		textLabel.Text = t[robloxLocaleId]:Format(if default.localMuted then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		var88 = default.muteChanged.Event:Connect(function(p41)
			-- upvalues: var73 (copy), getFFlagCleanupMuteSelfButtonModule (copy), var63 (copy), pollImage (copy), textLabel (ref), t (copy), robloxLocaleId (copy)
			var73 = p41
			local muteSelfButtonImageLabel = nil
			
			if not getFFlagCleanupMuteSelfButtonModule() then
				muteSelfButtonImageLabel = var63:FindFirstChild("MuteSelfButtonImageLabel", true)
			elseif var63 then
				muteSelfButtonImageLabel = var63:FindFirstChild("MuteSelfButtonImageLabel", true)
			end
			if muteSelfButtonImageLabel then
				muteSelfButtonImageLabel.Image = pollImage()
			end
			textLabel.Text = t[robloxLocaleId]:Format(if p41 then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end)
		muteSelfButton.Activated:Connect(function()
			-- upvalues: default (copy), players_1 (copy), var73 (copy)
			default:ToggleMic("InGameMenuPlayers")
			
			if players_1 then
				players_1:onToggleMuteSelf(var73)
			end
		end)
		
		if getFFlagCleanupMuteSelfButtonModule() then
			return muteSelfButton
		end
		var57 = muteSelfButton
	end
	
	local _ = function()
		-- upvalues: var50 (copy), getFFlagCleanupMuteSelfButtonModule (copy), var57 (write), var93 (write)
		if var50 then return end
		if getFFlagCleanupMuteSelfButtonModule() then
			var57 = var93()
			
			return
		end
		var93()
	end
	
	if getFFlagEnableConsoleJoinVoiceModule() then
		var86 = function()
			-- upvalues: createRow (ref), uDim2 (copy), themeModule (copy), enableConsoleJoinVoiceTranslation (copy), t (ref), robloxLocaleId (ref), uiblox (copy), builderIconsModule (copy), utilityModule (copy), default (copy), constantsModule (copy)
			local var171 = createRow("ImageButton", nil, true)
			var171.Size = UDim2.new(1, 0, 0, 52)
			var171.Size = uDim2
			var171.AnchorPoint = Vector2.new(0, 0)
			local textLabel = var171.TextLabel
			textLabel.Size = UDim2.new(1, -60, 0, 0)
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
			textLabel.AutoLocalize = false
			
			if enableConsoleJoinVoiceTranslation then
				textLabel.Text = t[robloxLocaleId]:Format("Feature.SettingsHub.Action.ConnectVoiceChat")
			else
				textLabel.Text = "Connect Voice Chat"
			end
			local icon = var171.Icon
			icon.AnchorPoint = Vector2.new(0, 0.5)
			icon.Position = UDim2.new(0, 18, 0.5, 0)
			local publicAudioJoin = uiblox["icons/controls/publicAudioJoin"]
			local var172 = if publicAudioJoin then uiblox["icons/controls/publicAudioJoin"] else themeModule.Images["icons/controls/publicAudioJoin"]
			
			if var172 then
				if publicAudioJoin then
					icon.Text = var172.name
					icon.FontFace = builderIconsModule.Font[var172.variant]
				else
					icon.Image = var172.Image
					icon.ImageRectOffset = var172.ImageRectOffset
					icon.ImageRectSize = var172.ImageRectSize
				end
			end
			local function _(value)
				-- upvalues: var171 (ref)
				if value then
					var171.ImageTransparency = 0.65
					
					return
				end
				var171.ImageTransparency = 0.85
			end
			
			var171.InputBegan:Connect(function()
				-- upvalues: var171 (ref)
				var171.ImageTransparency = 0.65
			end)
			var171.InputEnded:Connect(function()
				-- upvalues: var171 (ref)
				var171.ImageTransparency = 0.85
			end)
			var171.Activated:Connect(function()
				-- upvalues: var171 (ref)
				var171.ImageTransparency = 0.85
			end)
			var171.TouchPan:Connect(function(_, p42)
				-- upvalues: var171 (ref)
				if math.abs(p42.Y) > 20 then
					var171.ImageTransparency = 0.85
				end
			end)
			var171.SelectionGained:connect(function()
				-- upvalues: var171 (ref)
				var171.ImageTransparency = 0.65
			end)
			var171.SelectionLost:connect(function()
				-- upvalues: var171 (ref)
				var171.ImageTransparency = 0.85
			end)
			var171.SelectionImageObject = var171:Clone()
			utilityModule:MakeFocusState(var171, "utility-focus-state-joinVoice")
			var171.Activated:Connect(function()
				-- upvalues: default (copy), constantsModule (copy)
				default.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default:JoinVoice()
			end)
			
			return var171
		end
	end
	local _ = function()
		-- upvalues: shouldShowJoinVoiceButton (ref), var58 (write), var86 (write)
		if shouldShowJoinVoiceButton() and not var58 then
			var58 = var86()
			
			return
		end
	end
	
	local _ = function(p43)
		-- upvalues: utilityModule (copy), themeModule (copy)
		return utilityModule:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), p43)
	end
	
	local function resizeInspectButton(p44, p45, p46, p47)
		-- upvalues: rbxAnalyticsService (copy), constantsModule_1 (copy), players (ref), guiService (copy), utilityModule (copy), themeModule (copy)
		local inspect = p44:FindFirstChild("Inspect")
		
		if inspect and p46 == p47 then return end
		if inspect then
			inspect:Destroy()
		end
		local inspect_1 = utilityModule:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
			-- upvalues: rbxAnalyticsService (copy), constantsModule_1 (copy), players (copy), guiService (copy), p45 (ref)
			rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsExamineAvatarName, constantsModule_1.AnalyticsMenuActionName, {
				playsessionid = players.playSessionId,
				universeid = tostring(game.GameId)
			})
			guiService:InspectPlayerFromUserIdWithCtx(p45.UserId, "escapeMenu")
			players.HubRef:SetVisibility(false)
		end)
		inspect_1.Name = "Inspect"
		inspect_1.LayoutOrder = 2
		inspect_1.Selectable = true
		inspect_1.Parent = p44
		utilityModule:MakeFocusState(inspect_1, "utility-focus-state" .. "-inspect-" .. p45.Name)
	end
	
	local function resizePlatformName(p48, p49, p50)
		-- upvalues: status (copy), utilityModule (copy), themeModule (copy), create (copy)
		local platformNameContainer = p48:FindFirstChild("PlatformNameContainer")
		
		if platformNameContainer then
			platformNameContainer:Destroy()
			platformNameContainer = nil
		end
		if p49 == nil then return end
		local platformNameContainer_1 = Instance.new("Frame")
		platformNameContainer_1.Name = "PlatformNameContainer"
		platformNameContainer_1.BackgroundTransparency = 1
		platformNameContainer_1.ZIndex = 3
		platformNameContainer_1.Position = UDim2.new(0, 0, 0, 0)
		platformNameContainer_1.Size = UDim2.new(0, 0, 1, 0)
		platformNameContainer_1.AutomaticSize = Enum.AutomaticSize.X
		platformNameContainer_1.Selectable = false
		platformNameContainer_1.LayoutOrder = -1
		platformNameContainer_1.Parent = p48
		local consoleNameContainer, consoleNameContainer_1 = utilityModule:MakeStyledButton("consoleNameContainer", p49, UDim2.new(0, 0, 0, themeModule.ButtonHeight), if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and (status and status:IsProfileEnabled()) and (p50 and p50 ~= "") then function()
			-- upvalues: status (copy), p50 (ref)
			status:ShowProfile(p50)
		end else nil)
		consoleNameContainer.AnchorPoint = Vector2.new(0, 0.5)
		consoleNameContainer.Position = UDim2.fromScale(0, 0.5)
		consoleNameContainer.AutomaticSize = Enum.AutomaticSize.X
		consoleNameContainer.Parent = platformNameContainer_1
		consoleNameContainer_1.Size = UDim2.fromScale(0, 1)
		consoleNameContainer_1.AutoLocalize = false
		consoleNameContainer_1.TextSize = themeModule.platformNameTextSize
		consoleNameContainer_1.TextScaled = false
		consoleNameContainer_1.TextWrapped = false
		consoleNameContainer_1.AutomaticSize = Enum.AutomaticSize.X
		local var179 = create("ImageLabel")({
			Name = "iconLabel",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = themeModule.platformNameIconSize,
			ImageColor3 = Color3.new(1, 1, 1)
		})
		var179.Parent = consoleNameContainer
		create("UIListLayout")({
			Name = "PLatformNameUIListLayout",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}).Parent = consoleNameContainer
		var179.LayoutOrder = 1
		consoleNameContainer_1.LayoutOrder = 2
		create("UIPadding")({
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			Parent = consoleNameContainer
		})
		
		return platformNameContainer_1
	end
	
	local var96 = function()
		-- upvalues: createRow (ref), getFFlagLuaAppEnableOpenTypeSupport (copy), openTypeSupport (copy), guiService (copy)
		local nameLabel = createRow("ImageLabel", true)
		nameLabel.TextLabel.Name = "DisplayNameLabel"
		nameLabel.SecondRow.Name = "NameLabel"
		nameLabel.Selectable = false
		nameLabel.SelectionGroup = true
		
		if getFFlagLuaAppEnableOpenTypeSupport() then
			nameLabel.NameLabel.OpenTypeFeatures = openTypeSupport:getUserNameStylisticAlternative()
		end
		local rightSideButtons = Instance.new("Frame")
		rightSideButtons.Name = "RightSideButtons"
		rightSideButtons.BackgroundTransparency = 1
		rightSideButtons.ZIndex = 2
		rightSideButtons.Position = UDim2.new(0, 0, 0, 0)
		rightSideButtons.Size = UDim2.new(1, -12, 1, 0)
		rightSideButtons.Parent = nameLabel
		
		local _ = function(p51)
			-- upvalues: nameLabel (ref), guiService (copy), rightSideButtons (ref)
			if nameLabel then
				if guiService.SelectedCoreObject and guiService.SelectedCoreObject ~= p51 and guiService.SelectedCoreObject.Parent == rightSideButtons then
					nameLabel.ImageTransparency = 0.65
					
					return
				end
				nameLabel.ImageTransparency = 0.85
			end
		end
		
		local frame_1 = nil
		rightSideButtons.ChildAdded:connect(function(p52)
			-- upvalues: frame_1 (write), nameLabel (ref), guiService (copy), rightSideButtons (ref)
			if p52:IsA("GuiObject") then
				if frame_1 and p52 ~= frame_1 then
					frame_1:Destroy()
					frame_1 = nil
				end
				p52.SelectionGained:connect(function()
					-- upvalues: nameLabel (copy), guiService (copy), rightSideButtons (copy)
					if nameLabel then
						if guiService.SelectedCoreObject and guiService.SelectedCoreObject ~= nil and guiService.SelectedCoreObject.Parent == rightSideButtons then
							nameLabel.ImageTransparency = 0.65
							
							return
						end
						nameLabel.ImageTransparency = 0.85
					end
				end)
				p52.SelectionLost:connect(function()
					-- upvalues: p52 (ref), nameLabel (copy), guiService (copy), rightSideButtons (copy)
					if nameLabel then
						if guiService.SelectedCoreObject and guiService.SelectedCoreObject ~= p52 and guiService.SelectedCoreObject.Parent == rightSideButtons then
							nameLabel.ImageTransparency = 0.65
							
							return
						end
						nameLabel.ImageTransparency = 0.85
					end
				end)
			end
		end)
		frame_1 = Instance.new("Frame")
		frame_1.Selectable = true
		frame_1.Size = UDim2.new(1, 0, 1, 0)
		frame_1.BackgroundTransparency = 1
		frame_1.SelectionImageObject = frame_1:Clone()
		frame_1.Parent = rightSideButtons
		local rightSideListLayout = Instance.new("UIListLayout")
		rightSideListLayout.Name = "RightSideListLayout"
		rightSideListLayout.FillDirection = Enum.FillDirection.Horizontal
		rightSideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		rightSideListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		rightSideListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		rightSideListLayout.Padding = UDim.new(0, 12)
		rightSideListLayout.Parent = rightSideButtons
		pcall(function()
			-- upvalues: nameLabel (ref)
			nameLabel.NameLabel.Localize = false
			nameLabel.DisplayNameLabel.Localize = false
		end)
		
		return nameLabel
	end
	
	local function managePlayerNameCutoff(p53, p54)
		-- upvalues: checkForNilUserIdOnPlayerList (copy), userProfileStore (copy), isEngineTruncationEnabledForIngameSettingsModule (copy), utilityModule (copy), playerListRefactorUsernameFormatting (copy), formatUsername (copy)
		local var184 = nil
		local childAddedConnection = nil
		
		local function reportFlagChanged(p55, p56, p57)
			-- upvalues: var184 (write), p53 (ref), p54 (ref)
			if p56 == "AbsolutePosition" and var184 then
				local var191 = p55.AbsolutePosition.X - 20 - p53.NameLabel.AbsolutePosition.X
				p53.NameLabel.Text = "@" .. p54.Name
				p53.DisplayNameLabel.Text = p54.DisplayName
				
				if p57 then
					p53.DisplayNameLabel.Text = p57
				end
				local var192 = if p57 then utf8.len(p57) else utf8.len(p54.DisplayName)
				while var191 < p53.NameLabel.TextBounds.X and var192 > 0 do
					if p57 then
						p53.NameLabel.Text = string.sub(p57, 1, utf8.offset(p57, var192)) .. "..."
					else
						p53.NameLabel.Text = string.sub(p54.DisplayName, 1, utf8.offset(p54.DisplayName, var192)) .. "..."
					end
					var192 -= 1
				end
				local text = "@" .. p54.Name
				local var194 = string.len(text)
				while var191 < p53.NameLabel.TextBounds.X and var194 > 0 do
					p53.NameLabel.Text = string.sub(text, 1, var194) .. "..."
					var194 -= 1
				end
			end
		end
		
		local function reportFlagChangedWithCombinedName(p58, _, _)
			-- upvalues: checkForNilUserIdOnPlayerList (copy), p54 (ref), reportFlagChanged (ref), userProfileStore (copy), p53 (ref)
			if checkForNilUserIdOnPlayerList and not p54.UserId then
				reportFlagChanged(p58, "AbsolutePosition")
				
				return
			end
			userProfileStore.get().fetchNamesByUserIds({ tostring(p54.UserId) }, function(p59)
				-- upvalues: p53 (copy), reportFlagChanged (copy), p58 (ref), p54 (copy)
				local var195 = if p53 and p53.Parent then p53:FindFirstChild("DisplayNameLabel") else nil
				
				if var195 == nil then return end
				local var196
				local data = p59.data
				
				if #data == 0 then
					var196 = ""
				else
					local var197 = data[1]
					
					if var197 == nil then
						var196 = ""
					else
						local names = var197.names
						var196 = if names == nil then "" else names.getInExperienceCombinedName(false)
					end
				end
				if string.len(var196) > 0 and var196 ~= var195.Text then
					reportFlagChanged(p58, "AbsolutePosition", var196)
					
					return
				elseif p54.DisplayName ~= var195.Text then
					reportFlagChanged(p58, "AbsolutePosition")
				end
			end)
		end
		
		if not isEngineTruncationEnabledForIngameSettingsModule() then
			utilityModule:OnResized(p53.NameLabel, function(_, p60)
				-- upvalues: var184 (write), utilityModule (copy), childAddedConnection (write), p53 (ref), reportFlagChangedWithCombinedName (ref), p54 (ref), checkForNilUserIdOnPlayerList (copy), userProfileStore (copy)
				if var184 ~= nil and var184 == p60 then return end
				local var198 = p60
				
				if var198 then
					var198 = not (utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait())
				end
				var184 = var198
				
				if var198 then
					if childAddedConnection == nil then
						childAddedConnection = p53.RightSideButtons.ChildAdded:connect(function(p61)
							-- upvalues: reportFlagChangedWithCombinedName (copy)
							if p61.Name == "Inspect" then
								p61.Changed:connect(function(_)
									-- upvalues: reportFlagChangedWithCombinedName (copy), p61 (ref)
									reportFlagChangedWithCombinedName(p61, "AbsolutePosition")
								end)
								reportFlagChangedWithCombinedName(p61, "AbsolutePosition")
							end
						end)
					end
					var198 = p53.RightSideButtons:FindFirstChild("Inspect")
					
					if var198 then
						var198.Changed:connect(function(p62)
							-- upvalues: reportFlagChangedWithCombinedName (copy), var198 (ref)
							reportFlagChangedWithCombinedName(var198, p62)
						end)
						reportFlagChangedWithCombinedName(var198, "AbsolutePosition")
						
						return
					end
				elseif not p53:FindFirstChild("NameLabel") then return end
				p53.NameLabel.Text = "@" .. p54.Name
				
				if checkForNilUserIdOnPlayerList and not p54.UserId then
					p53.DisplayNameLabel.Text = p54.DisplayName
					
					return
				end
				userProfileStore.get().fetchNamesByUserIds({ tostring(p54.UserId) }, function(p63)
					-- upvalues: p53 (copy), p54 (copy)
					local var199 = if p53 and p53.Parent then p53:FindFirstChild("DisplayNameLabel") else nil
					
					if var199 == nil then return end
					local var200
					local data = p63.data
					
					if #data == 0 then
						var200 = ""
					else
						local var201 = data[1]
						
						if var201 == nil then
							var200 = ""
						else
							local names = var201.names
							var200 = if names == nil then "" else names.getInExperienceCombinedName(false)
						end
					end
					if string.len(var200) > 0 and var200 ~= var199.Text then
						var199.Text = var200
						
						return
					end
					local displayName = p54.DisplayName
					
					if displayName ~= var199.Text then
						var199.Text = displayName
					end
				end)
			end)
		end
		local function getNearestRightSideButtonXPosition()
			-- upvalues: p53 (ref)
			local x = nil
			
			for i, v in pairs(p53.RightSideButtons:GetChildren()) do
				if v:IsA("ImageButton") and (not x or v.AbsolutePosition.X < x) then
					x = v.AbsolutePosition.X
				end
			end
			return x
		end
		
		local var189 = nil
		
		local function rightSideButtonsChanged()
			-- upvalues: getNearestRightSideButtonXPosition (ref), var189 (write), p53 (ref), playerListRefactorUsernameFormatting (copy), formatUsername (copy), p54 (ref), checkForNilUserIdOnPlayerList (copy), userProfileStore (copy)
			local var202 = getNearestRightSideButtonXPosition()
			
			if var202 == var189 then return end
			var189 = var202
			local var203 = if var202 then UDim2.new(0, var202 - p53.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0)
			p53.NameLabel.Size = var203
			p53.DisplayNameLabel.Size = var203
			p53.NameLabel.Text = if playerListRefactorUsernameFormatting then formatUsername(p54.Name) else "@" .. p54.Name
			
			if checkForNilUserIdOnPlayerList and not p54.UserId then
				p53.DisplayNameLabel.Text = p54.DisplayName
				
				return
			end
			userProfileStore.get().fetchNamesByUserIds({ tostring(p54.UserId) }, function(p64)
				-- upvalues: p53 (copy), p54 (copy)
				local var204 = if p53 and p53.Parent then p53:FindFirstChild("DisplayNameLabel") else nil
				
				if var204 == nil then return end
				local var205
				local data = p64.data
				
				if #data == 0 then
					var205 = ""
				else
					local var206 = data[1]
					
					if var206 == nil then
						var205 = ""
					else
						local names = var206.names
						var205 = if names == nil then "" else names.getInExperienceCombinedName(false)
					end
				end
				if string.len(var205) > 0 and var205 ~= var204.Text then
					var204.Text = var205
					
					return
				end
				local displayName = p54.DisplayName
				
				if displayName ~= var204.Text then
					var204.Text = displayName
				end
			end)
		end
		
		if isEngineTruncationEnabledForIngameSettingsModule() then
			childAddedConnection = p53.RightSideButtons.ChildAdded:connect(function(p65)
				-- upvalues: rightSideButtonsChanged (ref)
				rightSideButtonsChanged()
				p65:GetPropertyChangedSignal("AbsolutePosition"):Connect(rightSideButtonsChanged)
			end)
			rightSideButtonsChanged()
		end
	end
	
	local _ = function()
		-- upvalues: localPlayer (copy)
		return localPlayer.UserId > 0
	end
	
	local var98 = nil
	local t_3 = {}
	local t_4 = {}
	local var101 = false
	
	local function updateAllMuteButtons()
		-- upvalues: var56 (write), default (copy), playersService (copy), t_3 (ref), muteButtonUpdate (ref), var74 (write), robloxTranslatorModule (copy)
		if not var56 then return end
		if not default.voiceUIVisible then return end
		local var207 = true
		
		for i, v in ipairs(playersService:GetPlayers()) do
			local name = t_3[v.Name]
			
			if v and name then
				local userId = default.participants[tostring(v.UserId)]
				
				if userId and not userId.isMutedLocally then
					var207 = false
				end
				muteButtonUpdate(name, userId)
			end
		end
		var74 = if var207 then true else false
		local var208 = var74 and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		
		if var56 and var56:FindFirstChild("TextLabel") then
			var56.TextLabel.Text = var208
			var56.Icon.Image = default:GetIcon(if var74 then "MuteAll" else "UnmuteAll", "Misc")
			
			return
		end
	end
	
	local function destroyAllUserMuteButtons()
		-- upvalues: playersService (copy), t_3 (ref), guiService (copy), userInputService (copy), var55 (write)
		for i, v in playersService:GetPlayers() do
			local name = t_3[v.Name]
			
			if name then
				local rightSideButtons = name:FindFirstChild("RightSideButtons")
				
				if rightSideButtons then
					local muteStatusButton = rightSideButtons:FindFirstChild("MuteStatusButton")
					
					if muteStatusButton then
						if guiService.SelectedCoreObject == muteStatusButton then
							if userInputService.GamepadEnabled then
								guiService.SelectedCoreObject = var55
							else
								guiService.SelectedCoreObject = nil
							end
						end
						muteStatusButton:Destroy()
					end
				end
			end
		end
	end
	
	local var104 = function(_)
		-- upvalues: players (ref), fFlagIEMTabFocusNav (copy), var98 (write), playersService (copy), var50 (copy), localPlayer (copy), utilityModule (copy), var87 (write), var56 (write), default (copy), fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var55 (write), runService (copy), var63 (write), create (copy), var64 (write), uDim2 (copy), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (copy), var25 (copy), gameInviteAnalytics (copy), eventStream (copy), rbxAnalyticsService (copy), diag (copy), var91 (write), getFFlagEnableConsoleJoinVoiceModule (copy), shouldShowJoinVoiceButton (ref), var58 (write), var86 (write), var66 (write), guiService (copy), t_3 (ref), t_4 (ref), var96 (write), muteButtonUpdate (ref), socialUtilModule (copy), playerListRefactorUsernameFormatting (copy), formatUsername (copy), isEngineTruncationEnabledForIngameSettingsModule (copy), managePlayerNameCutoff (ref), friendStatusCreate (ref), resizeFriendButton (ref), resizeBlockButton (write), resizeInspectButton (ref), reportAbuseButtonCreate (ref), var92 (write), var74 (write), robloxTranslatorModule (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy), players_1 (ref), constantsModule (copy), updateAllMuteButtons (ref), checkShareGameButtonInMuteAllLayout (copy), checkForNilUserIdOnPlayerList (copy), cryoModule (copy), userProfileStore (copy), resizePlatformName (ref), var101 (write), getFFlagCleanupMuteSelfButtonModule (copy), pollImage (ref), userInputService (copy), onlyCaptureFocusIfOnPlayerPage (copy)
		players.LastSelectableObjects = {}
		
		if fFlagIEMTabFocusNav and not players.ButtonsContainer.Visible then
			players.FirstSelectableObjects = {}
		end
		var98 = playersService:GetPlayers()
		
		if var50 then
			table.sort(var98, function(p66, p67)
				-- upvalues: localPlayer (copy)
				local var225 = p66.Name:lower()
				local var226 = p67.Name:lower()
				
				if p66 == localPlayer then
					var225 = " "
				end
				if p67 == localPlayer then
					var226 = " "
				end
				return var225 < var226
			end)
		else
			table.sort(var98, function(p68, p69)
				return p68.Name:lower() < p69.Name:lower()
			end)
		end
		local var211 = if utilityModule:IsSmallTouchScreen() or utilityModule:IsPortrait() then 85 else 20
		local voiceUIVisible = var87 and (not var56 and default.voiceUIVisible)
		local fFlagEnableSideSheet_1 = fFlagHidePeoplePageInviteFriends and (fFlagAddInviteFriendsIntegration and fFlagEnableSideSheet)
		local var214 = localPlayer.UserId > 0 and (not var55 and (not runService:IsStudio() and not fFlagEnableSideSheet_1))
		
		if (var214 or voiceUIVisible) and not var63 then
			var63 = create("Frame")({
				Name = "Holder",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = players.Page
			})
			var64 = create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20),
				Parent = var63
			})
		end
		local var216
		local function layoutMuteAll()
			-- upvalues: var63 (copy), create (copy), players (copy), var55 (copy), uDim2 (copy), var56 (copy)
			if not var63 then
				var63 = create("Frame")({
					Name = "Holder",
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 52),
					Parent = players.Page
				})
			end
			var55.Parent = var63
			var55.Size = uDim2
			var56.Parent = var63
		end
		
		if localPlayer.UserId > 0 and not var55 and (not runService:IsStudio() and not fFlagEnableSideSheet_1) then
			var216 = if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then var25:withButtonName(var25.ButtonName.SettingsHub) else gameInviteAnalytics.new():withEventStream(eventStream.new(rbxAnalyticsService)):withDiag(diag.new(rbxAnalyticsService)):withButtonName(gameInviteAnalytics.ButtonName.SettingsHub)
			var55 = var91()
			var55.Activated:connect(function()
				-- upvalues: var216 (write), players (copy)
				var216:inputShareGameEntryPoint()
				players.HubRef:InviteToGame()
			end)
			var55.LayoutOrder = 1
			
			if voiceUIVisible then
				var55.Parent = var63
			else
				var55.Parent = players.Page
			end
		end
		if getFFlagEnableConsoleJoinVoiceModule() and shouldShowJoinVoiceButton() then
			if shouldShowJoinVoiceButton() and not var58 then
				var58 = var86()
			end
			var66()
		end
		if fFlagIEMTabFocusNav then
			if voiceUIVisible then
				table.insert(players.FirstSelectableObjects, var56)
			end
			if var214 then
				table.insert(players.FirstSelectableObjects, var55)
			end
			if voiceUIVisible or var214 then
				players.FirstSelectableObjectsUpdated:fire()
			end
		end
		local var219
		var216 = guiService:GetInspectMenuEnabled()
		
		for i_1 = 1, #var98 do
			local var217 = var98[i_1]
			local var218 = nil
			var218 = t_3[var217.Name]
			
			if not var217 then
				continue
			end
			t_4[var217.Name] = true
			
			if not var218 or not var218.Parent then
				var218 = var96((i_1 - 1) * 80 + var211)
				var218.Parent = players.Page
				t_3[var217.Name] = var218
			end
			var218.Name = "PlayerLabel" .. var217.Name
			
			if var87 then
				muteButtonUpdate(var218, default.participants[tostring(var217.UserId)])
			end
			var218.Icon.Image = socialUtilModule.GetPlayerImage(math.max(1, var217.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail)
			var218.NameLabel.Text = if playerListRefactorUsernameFormatting then formatUsername(var217.Name) else "@" .. var217.Name
			var218.ImageTransparency = 0.85
			var218.LayoutOrder = i_1 + 1
			
			if isEngineTruncationEnabledForIngameSettingsModule() then
				var218.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
				var218.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
			end
			managePlayerNameCutoff(var218, var217)
			friendStatusCreate(var218, var217)
			var219 = nil
			utilityModule:OnResized(var218, function(_, p70)
				-- upvalues: var218 (write), utilityModule (copy), resizeFriendButton (copy), var217 (ref), var219 (write), resizeBlockButton (copy), var216 (ref), resizeInspectButton (copy)
				local rightSideButtons = var218:FindFirstChild("RightSideButtons")
				local displayNameLabel = var218:FindFirstChild("DisplayNameLabel")
				local nameLabel = var218:FindFirstChild("NameLabel")
				local rightSideListLayout = rightSideButtons and rightSideButtons:FindFirstChild("RightSideListLayout")
				
				if utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait() then
					var218.Size = UDim2.new(1, 0, 0, 105)
					
					if displayNameLabel then
						if nameLabel then
							displayNameLabel.Position = UDim2.new(0, 60, 0.275, -10)
							nameLabel.Position = UDim2.new(0, 60, 0.275, 12)
						else
							displayNameLabel.Position = UDim2.new(0, 60, 0.275, 0)
						end
					end
					if rightSideButtons then
						rightSideButtons.Position = UDim2.new(0, 57, 0, -2)
						rightSideButtons.Size = UDim2.new(1, -12, 0.99, -8)
					end
					if rightSideListLayout then
						rightSideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
						rightSideListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
					end
				else
					var218.Size = UDim2.new(1, 0, 0, 62)
					
					if displayNameLabel then
						if nameLabel then
							displayNameLabel.Position = UDim2.new(0, 60, 0.5, -10)
							nameLabel.Position = UDim2.new(0, 60, 0.5, 12)
						else
							displayNameLabel.Position = UDim2.new(0, 60, 0.5, 0)
						end
					end
					if rightSideButtons then
						rightSideButtons.Position = UDim2.new(0, 0, 0, 0)
						rightSideButtons.Size = UDim2.new(1, -12, 1, 0)
					end
					if rightSideListLayout then
						rightSideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
						rightSideListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
					end
				end
				if rightSideButtons then
					resizeFriendButton(rightSideButtons, var217, p70, var219)
					resizeBlockButton(rightSideButtons, var217, p70, var219)
					
					if var216 then
						resizeInspectButton(rightSideButtons, var217, p70, var219)
					end
					var219 = p70
				end
			end)
			reportAbuseButtonCreate(var218, var217)
			
			if i_1 == #var98 then
				local rightSideButtons = var218:FindFirstChild("RightSideButtons")
				
				if rightSideButtons then
					for i, v in rightSideButtons:GetChildren() do
						if v:IsA("ImageButton") then
							table.insert(players.LastSelectableObjects, v)
						end
					end
					players.LastSelectableObjectsUpdated:fire()
				end
			end
			if fFlagIEMTabFocusNav and i_1 == 1 and #players.FirstSelectableObjects == 0 then
				local rightSideButtons = var218:FindFirstChild("RightSideButtons")
				
				if rightSideButtons then
					for i, v in rightSideButtons:GetChildren() do
						if v:IsA("ImageButton") then
							table.insert(players.FirstSelectableObjects, v)
						end
					end
					players.FirstSelectableObjectsUpdated:fire()
				end
			end
		end
		if voiceUIVisible then
			local var222
			var56 = var92()
			var56.Activated:connect(function()
				-- upvalues: var74 (copy), robloxTranslatorModule (copy), var56 (copy), default (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy), players_1 (copy), constantsModule (copy), updateAllMuteButtons (copy)
				var74 = not var74
				var56.TextLabel.Text = var74 and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
				var56.Icon.Image = default:GetIcon(if var74 then "MuteAll" else "UnmuteAll", "Misc")
				
				if getFFlagVoiceChatUILoggingModule() then
					name:debug("{} all players", if var74 then "Muting" else "Unmuting")
				end
				if players_1 then
					players_1:onToggleMuteAll(var74)
				end
				default:MuteAll(var74, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				updateAllMuteButtons()
			end)
			var56.LayoutOrder = 1
			
			if checkShareGameButtonInMuteAllLayout then
				var222 = var55 ~= nil
				var222 = nil
			else
				var222 = true
			end
			if var222 then
				layoutMuteAll()
			else
				var56.Parent = var63
			end
			var66()
		end
		local var223 = if checkForNilUserIdOnPlayerList then cryoModule.List.filterMap(var98, function(p72)
			return if p72.UserId then tostring(p72.UserId) else nil
		end) else cryoModule.List.filter(var98, function(p71)
			return tostring(p71.UserId)
		end)
		
		for var218, v_2 in ipairs(var98) do
			t_3[v_2.Name].DisplayNameLabel.Text = v_2.DisplayName
		end
		userProfileStore.get().fetchNamesByUserIds(var223, function(p73)
			-- upvalues: t_3 (copy), resizePlatformName (copy)
			for i, v in p73.data do
				local var231 = t_3[v.names.getUsername(false)]
				
				if var231 then
					local inExperienceCombinedName = v.names.getInExperienceCombinedName(false)
					
					if string.len(inExperienceCombinedName) > 0 and inExperienceCombinedName ~= var231.DisplayNameLabel.Text then
						var231.DisplayNameLabel.Text = inExperienceCombinedName
					end
					local rightSideButtons = var231:FindFirstChild("RightSideButtons")
					local var234 = if v.names.getPlatformName(false) ~= "" then v.names.getPlatformName(false) else nil
					
					if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
						resizePlatformName(rightSideButtons, var234, v.getPlatformProfileId(false))
					else
						resizePlatformName(rightSideButtons, var234)
					end
				end
			end
		end)
		local var224 = 0
		
		if var87 and not var101 then
			name:debug("Setting Up Playerlist Mic Update Renderstep Hook")
			runService:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function()
				-- upvalues: var224 (write), updateAllMuteButtons (copy), getFFlagCleanupMuteSelfButtonModule (copy), var63 (copy), pollImage (copy)
				var224 += 1
				
				if var224 % 3 == 0 then
					updateAllMuteButtons()
					local muteSelfButtonImageLabel = nil
					
					if not getFFlagCleanupMuteSelfButtonModule() then
						muteSelfButtonImageLabel = var63:FindFirstChild("MuteSelfButtonImageLabel", true)
					elseif var63 then
						muteSelfButtonImageLabel = var63:FindFirstChild("MuteSelfButtonImageLabel", true)
					end
					if not muteSelfButtonImageLabel then return end
					muteSelfButtonImageLabel.Image = pollImage()
				end
			end)
			var101 = true
		end
		for i_3, var219 in pairs(t_3) do
			if not t_4[i_3] then
				var219:Destroy()
				t_3[i_3] = nil
			end
		end
		if userInputService.GamepadEnabled and (not fFlagIEMTabFocusNav or not guiService.SelectedCoreObject) then
			if getFFlagCleanupMuteSelfButtonModule() then
				pcall(function()
					-- upvalues: onlyCaptureFocusIfOnPlayerPage (copy), players (copy), guiService (copy), var55 (copy)
					if onlyCaptureFocusIfOnPlayerPage then
						if players.Active then
							guiService.SelectedCoreObject = var55
							
							return
						end
					else
						guiService.SelectedCoreObject = var55
					end
				end)
			else
				guiService.SelectedCoreObject = var55
			end
		end
		utilityModule:OnResized("MenuPlayerListExtraPageSize", function(_, _)
			-- upvalues: utilityModule (copy), var98 (copy), players (copy)
			local var236 = if utilityModule:IsSmallTouchScreen() or utilityModule:IsPortrait() then 85 else 20
			local var237 = #var98 + 1
			
			if utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait() then
				players.Page.Size = UDim2.new(1, 0, 0, var236 + var237 * 123 - 5)
				
				return
			end
			players.Page.Size = UDim2.new(1, 0, 0, var236 + var237 * 80 - 5)
		end)
	end
	
	local var105 = function()
		-- upvalues: var101 (write), name (copy), runService (copy)
		if var101 then
			name:debug("Unbinding Playerlist Mic Update Renderstep Hook")
			var101 = false
			runService:UnbindFromRenderStep("player-list-mute-update")
		end
	end
	
	if game:GetEngineFeature("VoiceChatSupported") then
		default:asyncInit():andThen(function()
			-- upvalues: var87 (write), default (copy), var50 (copy), getFFlagCleanupMuteSelfButtonModule (copy), var57 (write), var93 (write), updateAllMuteButtons (ref), t_1 (ref), var56 (write), var66 (write), var88 (write), getFFlagEnableConsoleJoinVoiceModule (copy), var58 (write), var104 (ref), var76 (ref), destroyAllUserMuteButtons (ref), resetButtonRow (ref)
			var87 = true
			default:SetupParticipantListeners()
			
			if not var50 then
				if getFFlagCleanupMuteSelfButtonModule() then
					var57 = var93()
				else
					var93()
				end
			end
			default.participantsUpdate.Event:Connect(function()
				-- upvalues: updateAllMuteButtons (copy)
				updateAllMuteButtons()
			end)
			default.participantLeft.Event:Connect(function(_, p74)
				-- upvalues: updateAllMuteButtons (copy), t_1 (copy)
				updateAllMuteButtons()
				t_1[p74] = nil
			end)
			default:getService().StateChanged:Connect(function(_, p75)
				-- upvalues: var56 (copy), var66 (copy), var57 (copy), var88 (copy), getFFlagEnableConsoleJoinVoiceModule (copy), var58 (copy), var87 (copy), var104 (copy)
				if p75 == Enum.VoiceChatState.Ended then
					if var56 then
						var56.Visible = false
						var56:Destroy()
						var56 = nil
					end
					var66()
					
					if var57 then
						var57.Visible = false
						var57:Destroy()
						var57 = nil
					end
					if var88 then
						var88:Disconnect()
						var88 = nil
					end
					var66()
					
					if getFFlagEnableConsoleJoinVoiceModule() then
						if var58 then
							var58.Visible = false
							var58:Destroy()
							var58 = nil
						end
						var66()
					end
					var87 = false
					
					return
				elseif p75 == Enum.VoiceChatState.Joined and var87 == false then
					var87 = true
					
					if getFFlagEnableConsoleJoinVoiceModule() then
						if var58 then
							var58.Visible = false
							var58:Destroy()
							var58 = nil
						end
						var66()
					end
					var104()
				end
			end)
			
			if not getFFlagCleanupMuteSelfButtonModule() then
				var104()
			end
			default.showVoiceUI.Event:Connect(function()
				-- upvalues: getFFlagCleanupMuteSelfButtonModule (copy), var57 (copy), var50 (copy), var93 (copy), var76 (copy), getFFlagEnableConsoleJoinVoiceModule (copy), var58 (copy), var66 (copy), var104 (copy)
				if getFFlagCleanupMuteSelfButtonModule() then
					if not var57 and not var50 then
						if getFFlagCleanupMuteSelfButtonModule() then
							var57 = var93()
						else
							var93()
						end
					end
				elseif not var76:FindFirstChild("MuteSelfButton", true) and not var50 then
					if getFFlagCleanupMuteSelfButtonModule() then
						var57 = var93()
					else
						var93()
					end
				end
				if getFFlagEnableConsoleJoinVoiceModule() then
					if var58 then
						var58.Visible = false
						var58:Destroy()
						var58 = nil
					end
					var66()
				end
				var104()
			end)
			default.hideVoiceUI.Event:Connect(function()
				-- upvalues: var56 (copy), var66 (copy), var57 (copy), var88 (copy), destroyAllUserMuteButtons (copy), var104 (copy), resetButtonRow (copy)
				if var56 then
					if var56 then
						var56.Visible = false
						var56:Destroy()
						var56 = nil
					end
					var66()
				end
				if var57 then
					var57.Visible = false
					var57:Destroy()
					var57 = nil
				end
				if var88 then
					var88:Disconnect()
					var88 = nil
				end
				var66()
				destroyAllUserMuteButtons()
				var104()
				resetButtonRow()
			end)
			default.muteAllChanged.Event:Connect(function()
				-- upvalues: updateAllMuteButtons (copy)
				updateAllMuteButtons()
			end)
		end):catch(function(_)
			-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy)
			if getFFlagVoiceChatUILoggingModule() then
				name:warning("Failed to init VoiceChatServiceManager")
			end
		end)
	end
	players.Displayed.Event:connect(var104)
	players.Hidden.Event:connect(var105)
	playersService.PlayerRemoving:Connect(function(p76)
		-- upvalues: t_4 (ref), t_3 (ref), guiService (copy), userInputService (copy), var55 (write), getFFlagDestroyPlayerCardOnLeaveModule (copy)
		t_4[p76.Name] = nil
		local name = t_3[p76.Name]
		
		if not name then return end
		local rightSideButtons = name:FindFirstChild("RightSideButtons")
		
		if not rightSideButtons then return end
		local friendStatus = rightSideButtons:FindFirstChild("FriendStatus")
		
		if friendStatus then
			if guiService.SelectedCoreObject == friendStatus then
				if userInputService.GamepadEnabled then
					guiService.SelectedCoreObject = var55
				else
					guiService.SelectedCoreObject = nil
				end
			end
			friendStatus:Destroy()
		end
		local reportPlayer = rightSideButtons:FindFirstChild("ReportPlayer")
		
		if reportPlayer then
			if guiService.SelectedCoreObject == reportPlayer then
				if userInputService.GamepadEnabled then
					guiService.SelectedCoreObject = var55
				else
					guiService.SelectedCoreObject = nil
				end
			end
			reportPlayer:Destroy()
		end
		local muteStatusButton = rightSideButtons:FindFirstChild("MuteStatusButton")
		
		if muteStatusButton then
			if guiService.SelectedCoreObject == muteStatusButton then
				if userInputService.GamepadEnabled then
					guiService.SelectedCoreObject = var55
				else
					guiService.SelectedCoreObject = nil
				end
			end
			muteStatusButton:Destroy()
		end
		local blockButton = rightSideButtons:FindFirstChild("BlockButton")
		
		if blockButton then
			if guiService.SelectedCoreObject == blockButton then
				if userInputService.GamepadEnabled then
					guiService.SelectedCoreObject = var55
				else
					guiService.SelectedCoreObject = nil
				end
			end
			blockButton:Destroy()
		end
		local inspect = rightSideButtons:FindFirstChild("Inspect")
		
		if inspect then
			if guiService.SelectedCoreObject == inspect then
				guiService.SelectedCoreObject = nil
			end
			inspect:Destroy()
		end
		if getFFlagDestroyPlayerCardOnLeaveModule() then
			t_3[p76.Name] = nil
			name:Destroy()
		end
	end)
	
	local function removeInspectButtons()
		-- upvalues: t_3 (ref), guiService (copy)
		for i, v in pairs(t_3) do
			local rightSideButtons = v:FindFirstChild("RightSideButtons")
			
			if rightSideButtons then
				local inspect = rightSideButtons:FindFirstChild("Inspect")
				
				if inspect then
					if guiService.SelectedCoreObject == inspect then
						guiService.SelectedCoreObject = nil
					end
					inspect:Destroy()
				end
			end
		end
	end
	
	guiService.InspectMenuEnabledChangedSignal:Connect(function(p77)
		-- upvalues: removeInspectButtons (ref)
		if not p77 then
			removeInspectButtons()
		end
	end)
	
	function players.CreateMenuButtonsContainer(_)
		-- upvalues: fIntRelocateMobileMenuButtonsVariantModule (copy), players (ref), reactRobloxModule (copy), var76 (ref), reactModule (copy), menuButtonsContainerModule (copy)
		if fIntRelocateMobileMenuButtonsVariantModule == 2 then
			if players.buttonsContainerRoot then return end
			players.buttonsContainerRoot = reactRobloxModule.createRoot(var76)
			local experienceControlStore = players.HubRef:GetExperienceControlStore()
			players.buttonsContainerRoot:render(reactModule.createElement(menuButtonsContainerModule, {
				onLeaveGame = experienceControlStore.onLeaveGame,
				onRespawn = experienceControlStore.onRespawn,
				onResume = experienceControlStore.onResume,
				setAddMenuKeyBindings = function() end,
				setRemoveMenuKeyBindings = function() end,
				getVisibility = function()
					return true
				end,
				getCanRespawn = experienceControlStore.getCanRespawn
			}))
		end
	end
	
	function players.UnmountMenuButtonsContainer(_)
		-- upvalues: fFlagMenuButtonsMountWithIEMModule (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), players (ref)
		if fFlagMenuButtonsMountWithIEMModule and fIntRelocateMobileMenuButtonsVariantModule == 2 and players.buttonsContainerRoot then
			players.buttonsContainerRoot:unmount()
			players.buttonsContainerRoot = nil
		end
	end
	
	return players
end)()