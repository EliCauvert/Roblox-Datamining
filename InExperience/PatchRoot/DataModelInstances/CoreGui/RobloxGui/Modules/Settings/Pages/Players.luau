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
local var1 = if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then require(corePackagesService.Workspace.Packages.GameInvite).GameInviteAnalyticsManager else nil
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
local var2 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local muteStatusIcons = default.MuteStatusIcons
local playerMuteStatusIcons = default.PlayerMuteStatusIcons

return (function()
	-- upvalues: robloxGui (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), localizationService (ref), localization (ref), uiblox (ref), builderIconsModule (ref), localPlayer (write), utilityModule (ref), blockingUtilityModule (ref), themeModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule_1 (ref), getFFlagDefaultFriendingLabelTextNonEmptyModule (ref), voiceAnalyticsModule (ref), settingsHubPlayersButtonsResponsiveThreshold (ref), getFFlagEnableConsoleJoinVoiceModule (ref), getFFlagCleanupMuteSelfButtonModule (ref), checkButtonFrameBeforeDestroy (ref), guiService (ref), blockingAnalyticsModule (ref), onBlockButtonActivatedModule (ref), robloxTranslatorModule (ref), muteStatusIcons (ref), luaFlagVoiceChatDisableSubscribeRetryForMultistream (ref), voiceChatMultistreamSubscriptionsEnabledEngineFeature (ref), default (ref), constantsModule (ref), create (ref), fFlagEnableSideSheet (ref), fFlagRelocateMobileMenuButtonsModule (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), getFFlagEnableLeaveGameUpsellEntrypointModule (ref), fFlagIEMTabFocusNav (ref), playerMuteStatusIcons (ref), reportAbuseMenuNewContainerPageModule (ref), var2 (ref), uDim2 (ref), enableConsoleJoinVoiceTranslation (ref), status (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), checkForNilUserIdOnPlayerList (ref), userProfileStore (ref), isEngineTruncationEnabledForIngameSettingsModule (ref), playerListRefactorUsernameFormatting (ref), formatUsername (ref), playersService (ref), userInputService (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), runService (ref), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (ref), var1 (write), gameInviteAnalytics (ref), eventStream (ref), diag (ref), socialUtilModule (ref), getFFlagVoiceChatUILoggingModule (ref), name (ref), checkShareGameButtonInMuteAllLayout (ref), cryoModule (ref), onlyCaptureFocusIfOnPlayerPage (ref), getFFlagDestroyPlayerCardOnLeaveModule (ref), reactRobloxModule (ref), reactModule (ref), menuButtonsContainerModule (ref), fFlagMenuButtonsMountWithIEMModule (ref)
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
	
	local function _(p1)
		-- upvalues: localPlayer (copy)
		local ok, status = pcall(function()
			-- upvalues: localPlayer (copy), p1 (ref)
			return localPlayer:GetFriendStatus(p1)
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
	
	local _ = function(p1)
		-- upvalues: blockingUtilityModule (copy)
		return blockingUtilityModule:IsPlayerBlockedByUserId(p1.UserId)
	end
	
	local function createFriendStatusTextLabel(p1, p2)
		-- upvalues: themeModule (copy), fFlagConnectionsToFriendsRename (copy), t (ref), robloxLocaleId (ref), constantsModule_1 (copy), getFFlagDefaultFriendingLabelTextNonEmptyModule (copy), localPlayer (copy), rbxAnalyticsService (copy), utilityModule (copy)
		if p1 == nil then
			return nil
		end
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		local friendStatus = nil
		local var3 = nil
		
		if p1 == Enum.FriendStatus.Friend or p1 == Enum.FriendStatus.FriendRequestSent then
			friendStatus = Instance.new("TextButton")
			friendStatus.BackgroundTransparency = 1
			friendStatus.FontSize = themeModule.fontSize(Enum.FontSize.Size24)
			friendStatus.Font = themeModule.font(Enum.Font.SourceSans)
			friendStatus.TextColor3 = Color3.new(1, 1, 1)
			friendStatus.SelectionImageObject = frame
			
			if p1 == Enum.FriendStatus.Friend then
				friendStatus.Text = if fFlagConnectionsToFriendsRename then t[robloxLocaleId]:Format(constantsModule_1.FriendLocalizedKey) else t[robloxLocaleId]:Format(constantsModule_1.ConnectionLocalizedKey)
			else
				friendStatus.Text = "Request Sent"
			end
		elseif p1 == Enum.FriendStatus.Unknown or p1 == Enum.FriendStatus.NotFriend or p1 == Enum.FriendStatus.FriendRequestReceived then
			local friendStatus, friendStatus_1 = utilityModule:MakeStyledButton("FriendStatus", if fFlagConnectionsToFriendsRename then t[robloxLocaleId]:Format(constantsModule_1.AddFriendLocalizedKey) else t[robloxLocaleId]:Format(constantsModule_1.AddConnectionLocalizedKey), UDim2.new(0, 182, 0, themeModule.ButtonHeight), function()
				-- upvalues: friendStatus (write), var3 (write), getFFlagDefaultFriendingLabelTextNonEmptyModule (copy), fFlagConnectionsToFriendsRename (copy), t (copy), robloxLocaleId (copy), constantsModule_1 (copy), localPlayer (copy), p2 (ref), rbxAnalyticsService (copy)
				if friendStatus and var3 and var3.Text ~= "" then
					friendStatus.ImageTransparency = 1
					var3.Text = ""
					
					if getFFlagDefaultFriendingLabelTextNonEmptyModule() then
						var3.Text = if fFlagConnectionsToFriendsRename then t[robloxLocaleId]:Format(constantsModule_1.AddFriendLocalizedKey) else t[robloxLocaleId]:Format(constantsModule_1.AddConnectionLocalizedKey)
					end
					if localPlayer and p2 then
						rbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsRequestFriendContext, constantsModule_1.AnalyticsRequestFriendName, { category = "Game" })
						localPlayer:RequestFriendship(p2)
					end
				end
			end)
			friendStatus = friendStatus
			var3 = friendStatus_1
			var3.ZIndex = 3
			var3.Position += UDim2.new(0, 0, 0, 1)
		end
		if friendStatus then
			friendStatus.Name = "FriendStatus"
			friendStatus.ZIndex = 3
			friendStatus.Size = UDim2.new(0, 150, 0, themeModule.ButtonHeight)
			friendStatus.Position = UDim2.new(1, -198, 0, 7)
			
			if var3 then
				var3.Position = UDim2.new(0, 0, 0, 0)
			end
		end
		return friendStatus
	end
	
	local function createFriendStatusImageLabel(p1, p2)
		-- upvalues: utilityModule (copy), themeModule (copy), localPlayer (copy), rbxAnalyticsService (copy), constantsModule_1 (copy)
		if p1 == Enum.FriendStatus.Friend or p1 == Enum.FriendStatus.FriendRequestSent then
			local var3 = "icons/menu/friends"
			local var4 = 0
			
			if p1 ~= Enum.FriendStatus.Friend then
				var3 = "icons/actions/friends/friendAdd"
				var4 = 0.5
			end
			local friendStatus_1, _ = utilityModule:MakeStyledImageButton("FriendStatus", var3, UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28))
			friendStatus_1.Name = "FriendStatus"
			friendStatus_1.Selectable = false
			friendStatus_1.FriendStatusTextLabel.TextTransparency = var4
			
			return friendStatus_1
		elseif p1 == Enum.FriendStatus.Unknown or p1 == Enum.FriendStatus.NotFriend or p1 == Enum.FriendStatus.FriendRequestReceived then
			local friendStatus_3 = nil
			local var5 = nil
			local friendStatus, friendStatus_2 = utilityModule:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
				-- upvalues: friendStatus_3 (write), var5 (write), localPlayer (copy), p2 (ref), rbxAnalyticsService (copy), constantsModule_1 (copy)
				if friendStatus_3 and var5 and friendStatus_3.ImageTransparency ~= 1 then
					friendStatus_3.ImageTransparency = 1
					var5.TextTransparency = 1
					
					if localPlayer and p2 then
						rbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsRequestFriendContext, constantsModule_1.AnalyticsRequestFriendName, { category = "Game" })
						localPlayer:RequestFriendship(p2)
					end
				end
			end)
			friendStatus_3 = friendStatus
			var5 = friendStatus_2
			friendStatus_3.Name = "FriendStatus"
			friendStatus_3.Selectable = true
			
			return friendStatus_3
		end
		return nil
	end
	
	local var3 = nil
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local t_1 = {}
	local players_1 = voiceAnalyticsModule.new(rbxAnalyticsService, "Players")
	local _ = nil
	local var7 = false
	local _ = nil
	local t_2 = {}
	local var8 = nil
	local var9 = nil
	
	local var10 = function()
		-- upvalues: players (ref), settingsHubPlayersButtonsResponsiveThreshold (copy), t_2 (write)
		return players.Page.AbsoluteSize.X < settingsHubPlayersButtonsResponsiveThreshold * #t_2
	end
	
	local var11 = function()
		-- upvalues: t_2 (write), var3 (write), var4 (write), var5 (write), getFFlagEnableConsoleJoinVoiceModule (copy), var6 (write), var7 (write), var10 (write), var8 (write), getFFlagCleanupMuteSelfButtonModule (copy), var9 (write), checkButtonFrameBeforeDestroy (copy)
		t_2 = {}
		
		if var3 then
			table.insert(t_2, var3)
		end
		if var4 then
			table.insert(t_2, var4)
		end
		if var5 then
			table.insert(t_2, var5)
		end
		if getFFlagEnableConsoleJoinVoiceModule() and var6 then
			table.insert(t_2, var6)
		end
		var7 = var10()
		
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
			
			if var7 then
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
			local var12 = 1
			
			for i, v in t_2 do
				v.Size = uDim2
				v.Parent = var8
				v.LayoutOrder = var12
				var12 += 1
			end
			for i_1, v_1 in t_1 do
				if not getFFlagCleanupMuteSelfButtonModule() then
					var9[i_1] = v_1
				elseif var9 then
					var9[i_1] = v_1
				end
			end
			for i_2, v_2 in t do
				if not getFFlagCleanupMuteSelfButtonModule() then
					var8[i_2] = v_2
				elseif var8 then
					var8[i_2] = v_2
				end
			end
			return
		elseif checkButtonFrameBeforeDestroy then
			if var8 then
				var8:Destroy()
				var8 = nil
				
				return
			end
		else
			var8:Destroy()
			var8 = nil
		end
	end
	
	local _ = function(p1)
		return if p1 and p1.Parent then p1:FindFirstChild("DisplayNameLabel") else nil
	end
	
	local _ = function(p1)
		if #p1 == 0 then
			return ""
		end
		local var13 = p1[1]
		
		if var13 == nil then
			return ""
		end
		local names = var13.names
		
		return if names == nil then "" else names.getInExperienceCombinedName(false)
	end
	
	local function resizeFriendButton(p1, p2, p3, p4)
		-- upvalues: localPlayer (copy), blockingUtilityModule (copy), createFriendStatusImageLabel (ref), createFriendStatusTextLabel (ref), utilityModule (copy)
		local friendStatus_1 = p1:FindFirstChild("FriendStatus")
		
		if friendStatus_1 and p3 == p4 then return end
		if friendStatus_1 then
			friendStatus_1:Destroy()
			friendStatus_1 = nil
		end
		local var13 = nil
		local ok = p2 and (p2 ~= localPlayer and (p2.UserId > 0 and localPlayer.UserId > 0))
		
		if ok then
			ok, status = pcall(function()
				-- upvalues: localPlayer (copy), p2 (ref)
				return localPlayer:GetFriendStatus(p2)
			end)
			var13 = if ok then status else Enum.FriendStatus.NotFriend
		end
		if blockingUtilityModule:IsPlayerBlockedByUserId(p2.UserId) == false then
			friendStatus_1 = if p3 then createFriendStatusImageLabel(var13, p2) else createFriendStatusTextLabel(var13, p2)
		end
		if friendStatus_1 then
			friendStatus_1.Name = "FriendStatus"
			friendStatus_1.LayoutOrder = 5
			friendStatus_1.Selectable = true
			utilityModule:MakeFocusState(friendStatus_1, "utility-focus-state" .. "-friendstatuslabel-" .. p10.Name)
			friendStatus_1.Parent = p1
		end
	end
	
	local function friendStatusCreate(p1, p2)
		-- upvalues: guiService (copy), var3 (write), resizeFriendButton (ref), utilityModule (copy)
		local var13 = if p1 then p1:FindFirstChild("RightSideButtons") else nil
		
		if var13 then
			for i, v in pairs(var13:GetChildren()) do
				if v and v.Name == "FriendStatus" then
					if guiService.SelectedCoreObject == v then
						guiService.SelectedCoreObject = var3
					end
					v:Destroy()
				end
			end
			resizeFriendButton(var13, p2, utilityModule:IsPortrait(), nil)
		end
	end
	
	localPlayer.FriendStatusChanged:connect(function(p3, _)
		-- upvalues: players (ref), friendStatusCreate (ref)
		if p3 then
			local var14 = players.Page:FindFirstChild("PlayerLabel" .. p15.Name)
			
			if var14 then
				friendStatusCreate(var14, p3)
			end
		end
	end)
	local resizeBlockButton = nil
	local trySelection = nil
	local var14 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
	
	local function createBlockButton(p3, p4, p5, _)
		-- upvalues: blockingUtilityModule (copy), resizeBlockButton (write), resizeFriendButton (ref), trySelection (write), guiService (copy), onBlockButtonActivatedModule (copy), var14 (ref), constantsModule_1 (copy), utilityModule (copy), robloxTranslatorModule (copy), themeModule (copy)
		local function _(p6)
			-- upvalues: resizeBlockButton (copy), p3 (ref), p4 (ref), p5 (ref), resizeFriendButton (copy), trySelection (copy)
			local var15 = resizeBlockButton(p3, p4, p5, not p5)
			resizeFriendButton(p3, p4, p5, not p5)
			
			if p6 then
				trySelection(var15)
			end
		end
		
		return if blockingUtilityModule:IsPlayerBlockedByUserId(p4.UserId) then utilityModule:MakeStyledButton("BlockButton", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, themeModule.ButtonHeight), function()
			-- upvalues: blockingUtilityModule (copy), p4 (ref), var14 (copy), resizeBlockButton (copy), p3 (ref), p5 (ref), resizeFriendButton (copy)
			if blockingUtilityModule:UnblockPlayerAsync(p4) then
				var14:action("SettingsHub", "unblockUser", { blockeeUserId = p4.UserId })
				local _ = resizeBlockButton(p3, p4, p5, not p5)
				resizeFriendButton(p3, p4, p5, not p5)
			end
		end) else utilityModule:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
			-- upvalues: guiService (copy), onBlockButtonActivatedModule (copy), p4 (ref), var14 (copy), constantsModule_1 (copy), resizeBlockButton (copy), p3 (ref), p5 (ref), resizeFriendButton (copy), trySelection (copy)
			local var15 = if guiService.SelectedCoreObject == nil then guiService.SelectedObject ~= nil else true
			onBlockButtonActivatedModule(p4, var14, constantsModule_1.AnalyticsInGameMenuName):andThen(function()
				-- upvalues: var15 (ref), resizeBlockButton (copy), p3 (copy), p4 (copy), p5 (copy), resizeFriendButton (copy), trySelection (copy)
				local var16 = resizeBlockButton(p3, p4, p5, not p5)
				resizeFriendButton(p3, p4, p5, not p5)
				
				if var15 then
					trySelection(var16)
				end
			end)
		end)
	end
	
	trySelection = function(p3)
		-- upvalues: guiService (copy)
		if p3 and not p3.Selectable then
			guiService:Select(p3)
			
			return
		end
		guiService.SelectedCoreObject = p3
	end
	
	resizeBlockButton = function(p3, p4, p5, p6)
		-- upvalues: localPlayer (copy), createBlockButton (ref), utilityModule (copy)
		local blockButton_1 = p3:FindFirstChild("BlockButton")
		
		if blockButton_1 and p5 == p6 then
			return blockButton_1
		elseif blockButton_1 then
			blockButton_1:Destroy()
			blockButton_1 = nil
		end
		if p4 and (p4 ~= localPlayer and (p4.UserId > 0 and localPlayer.UserId > 0)) then
			blockButton_1 = createBlockButton(p3, p4, p5, p6)
		end
		if blockButton_1 then
			blockButton_1.Name = "BlockButton"
			blockButton_1.LayoutOrder = 4
			blockButton_1.Selectable = true
			utilityModule:MakeFocusState(blockButton_1, "utility-focus-state" .. "-blockbutton-" .. p22.Name)
			blockButton_1.Parent = p3
		end
		return blockButton_1
	end
	
	local var15 = false
	local var16 = false
	
	local function muteButtonUpdate(p3, p4)
		-- upvalues: muteStatusIcons (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy), default (copy), t_1 (ref), utilityModule (copy), themeModule (copy), players_1 (ref), constantsModule (copy)
		local var17 = if p3 then p3:FindFirstChild("RightSideButtons") else nil
		
		if not var17 then return end
		local muteStatusButton = var17:FindFirstChild("MuteStatusButton")
		
		if p4 == nil then
			if muteStatusButton then
				muteStatusButton:Destroy()
			end
			return
		else
			local uDim2 = UDim2.fromOffset(36, 36)
			local uDim2_1 = UDim2.fromOffset(0, 0)
			local var18 = 0
			local var19 = if p4.isMuted then muteStatusIcons.MicOff else muteStatusIcons.MicOn
			
			if p4.subscriptionFailed then
				var19 = muteStatusIcons.Error
				uDim2 = UDim2.fromOffset(36, 36)
				uDim2_1 = UDim2.fromOffset(2, -2)
				
				if luaFlagVoiceChatDisableSubscribeRetryForMultistream and voiceChatMultistreamSubscriptionsEnabledEngineFeature then
					var18 = 0.5
				end
			elseif p4.isMutedLocally then
				var19 = muteStatusIcons.MicDisabled
				var18 = 0.5
			elseif not p4.subscriptionCompleted then
				var19 = muteStatusIcons.Loading
			elseif p4.isSignalActive then
				var19 = default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * math.random()) * 20), "SpeakerLight")
			end
			if muteStatusButton then
				local userId = t_1[p4.userId] or var17:FindFirstChild("MuteStatusImageLabel", true)
				userId.Image = var19
				userId.Size = uDim2
				userId.ImageTransparency = var18
				
				return
			elseif default.voiceUIVisible then
				local muteStatus, muteStatus_1 = utilityModule:MakeStyledImageButton("MuteStatus", var19, UDim2.fromOffset(themeModule.ButtonHeight, themeModule.ButtonHeight), uDim2, function()
					-- upvalues: default (copy), p4 (ref), players_1 (copy), constantsModule (copy), luaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), voiceChatMultistreamSubscriptionsEnabledEngineFeature (copy)
					local userId = default.participants[tostring(p4.userId)]
					
					if userId.subscriptionCompleted then
						if players_1 then
							players_1:onToggleMutePlayer(p4.userId, not userId.isMutedLocally)
						end
						default:ToggleMutePlayer(p4.userId, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
						
						return
					elseif userId.subscriptionFailed then
						if luaFlagVoiceChatDisableSubscribeRetryForMultistream then
							if voiceChatMultistreamSubscriptionsEnabledEngineFeature then
								return
							else
								default:SubscribeRetry(p4.userId)
								
								return
							end
						else
							default:SubscribeRetry(p4.userId)
						end
					end
				end)
				t_1[p4.userId] = muteStatus_1
				muteStatus_1.ZIndex = 3
				muteStatus_1.Position += uDim2_1
				muteStatus_1.ImageTransparency = var18
				utilityModule:MakeFocusState(muteStatus, "utility-focus-state" .. "-mutestatusbutton-" .. p26.userId)
				muteStatus.Parent = var17
			end
		end
	end
	
	local var17 = create("Frame")({
		Name = "ButtonsContainer",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(1, 0, 0, themeModule.ButtonHeight),
		Parent = players.Page
	})
	players.ButtonsContainer = var17
	
	if fFlagEnableSideSheet or fFlagRelocateMobileMenuButtonsModule and (fIntRelocateMobileMenuButtonsVariantModule == 1 or fIntRelocateMobileMenuButtonsVariantModule == 3) then
		var17.Parent = nil
	end
	create("UIPadding")({
		PaddingBottom = UDim.new(0, 1),
		PaddingTop = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 1),
		PaddingRight = UDim.new(0, 1),
		Parent = var17
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
		leaveButton.Parent = var17
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
		resetButton.Parent = var17
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
		resumeButton.Parent = var17
		
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
	
	local _ = function(p3, p4, p5, p6)
		-- upvalues: var17 (ref)
		local var18 = var17:FindFirstChild(p3 .. "Button", true)
		
		if var18 then
			var18.Position = p4
			var18.Size = p5
			var18.AnchorPoint = p6
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var17 (ref)
		local playerMuteButtonButton = var17:FindFirstChild("PlayerMuteButtonButton", true)
		
		if playerMuteButtonButton then
			playerMuteButtonButton:Destroy()
		end
	end
	
	local function resetButtonRow()
		-- upvalues: fFlagRelocateMobileMenuButtonsModule (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), var17 (ref)
		if not fFlagRelocateMobileMenuButtonsModule or fIntRelocateMobileMenuButtonsVariantModule == 0 then
			local uDim2 = UDim2.new(1, 0, 0, 0)
			local uDim2_1 = UDim2.new(0.333333333333, -12, 1, 0)
			local vector2 = Vector2.new(1, 0)
			local resumeButtonButton = var17:FindFirstChild("ResumeButtonButton", true)
			
			if resumeButtonButton then
				resumeButtonButton.Position = uDim2
				resumeButtonButton.Size = uDim2_1
				resumeButtonButton.AnchorPoint = vector2
			end
			local uDim2_2 = UDim2.new(0.5, 0, 0, 0)
			local uDim2_3 = UDim2.new(0.333333333333, -12, 1, 0)
			local vector2_1 = Vector2.new(0.5, 0)
			local resetButtonButton = var17:FindFirstChild("ResetButtonButton", true)
			
			if resetButtonButton then
				resetButtonButton.Position = uDim2_2
				resetButtonButton.Size = uDim2_3
				resetButtonButton.AnchorPoint = vector2_1
			end
			local uDim2_4 = UDim2.new(0, 0, 0, 0)
			local uDim2_5 = UDim2.new(0.333333333333, -12, 1, 0)
			local vector2_2 = Vector2.new(0, 0)
			local leaveButtonButton = var17:FindFirstChild("LeaveButtonButton", true)
			
			if leaveButtonButton then
				leaveButtonButton.Position = uDim2_4
				leaveButtonButton.Size = uDim2_5
				leaveButtonButton.AnchorPoint = vector2_2
			end
		end
		local playerMuteButtonButton = var17:FindFirstChild("PlayerMuteButtonButton", true)
		
		if playerMuteButtonButton then
			playerMuteButtonButton:Destroy()
		end
	end
	
	local _ = function()
		-- upvalues: getFFlagCleanupMuteSelfButtonModule (copy), var8 (write), pollImage (ref)
		local muteSelfButtonImageLabel = nil
		
		if not getFFlagCleanupMuteSelfButtonModule() then
			muteSelfButtonImageLabel = var8:FindFirstChild("MuteSelfButtonImageLabel", true)
		elseif var8 then
			muteSelfButtonImageLabel = var8:FindFirstChild("MuteSelfButtonImageLabel", true)
		end
		if muteSelfButtonImageLabel then
			muteSelfButtonImageLabel.Image = pollImage()
			
			return
		end
	end
	
	utilityModule:OnResized(var17, function(_, p3)
		-- upvalues: utilityModule (copy), themeModule (copy), var17 (ref), fFlagRelocateMobileMenuButtonsModule (copy), fIntRelocateMobileMenuButtonsVariantModule (copy), resetButton_1 (ref), leaveButton_1 (ref), resumeButton_1 (ref)
		if (p3 or utilityModule:IsSmallTouchScreen()) and not themeModule.AlwaysShowBottomBar() then
			local var18 = p3 and themeModule.textSize(18) or themeModule.textSize(24)
			var17.Visible = true
			var17.Size = UDim2.new(1, 0, 0, themeModule.ButtonHeight)
			
			if fFlagRelocateMobileMenuButtonsModule and fIntRelocateMobileMenuButtonsVariantModule ~= 0 then
				return
			else
				resetButton_1.TextSize = var18
				leaveButton_1.TextSize = var18
				resumeButton_1.TextSize = var18
				
				return
			end
		else
			var17.Visible = false
			var17.Size = UDim2.new(1, 0, 0, 0)
		end
	end)
	
	local function reportAbuseButtonCreate(p3, p4)
		-- upvalues: localPlayer (copy), reportAbuseMenuNewContainerPageModule (copy), utilityModule (copy), themeModule (copy)
		local rightSideButtons = p3:FindFirstChild("RightSideButtons")
		
		if rightSideButtons then
			local reportPlayer = rightSideButtons:FindFirstChild("ReportPlayer")
			
			if reportPlayer then
				reportPlayer:Destroy()
			end
			if p4 and (p4 ~= localPlayer and (p4.UserId > 0 and localPlayer.UserId > 0)) then
				local reportPlayer_2 = utilityModule:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
					-- upvalues: reportAbuseMenuNewContainerPageModule (copy), p4 (ref)
					reportAbuseMenuNewContainerPageModule:ReportPlayer(p4, "MenuPlayerList")
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
	local var18 = nil
	local _ = nil
	local var19 = false
	local var20 = nil
	
	local _ = function()
		-- upvalues: var4 (write), var11 (write)
		if var4 then
			var4.Visible = false
			var4:Destroy()
			var4 = nil
		end
		var11()
	end
	
	local _ = function()
		-- upvalues: var5 (write), var20 (write), var11 (write)
		if var5 then
			var5.Visible = false
			var5:Destroy()
			var5 = nil
		end
		if var20 then
			var20:Disconnect()
			var20 = nil
		end
		var11()
	end
	
	local _ = function()
		-- upvalues: var6 (write), var11 (write)
		if var6 then
			var6.Visible = false
			var6:Destroy()
			var6 = nil
		end
		var11()
	end
	
	local function shouldShowJoinVoiceButton()
		-- upvalues: getFFlagEnableConsoleJoinVoiceModule (copy), var19 (write), var2 (copy), default (copy)
		return getFFlagEnableConsoleJoinVoiceModule() and (game:GetEngineFeature("VoiceChatSupported") and (not var19 and (not var2 and (default:verifyUniverseAndPlaceCanUseVoice() and (default:ShouldShowJoinVoiceOnDisconnect() and (default:GetVoiceConnectCookie() == "" and default:HasSeamlessVoiceFeature("InitialJoinVoice")))))))
	end
	
	local function createRow(p3, p4, p5)
		-- upvalues: themeModule (copy), create (copy)
		local icon
		local var21 = Instance.new(p3)
		var21.Size = UDim2.new(1, 0, 0, 62)
		var21.Position = UDim2.new(0, 0, 0, 0)
		var21.ZIndex = 2
		var21.BackgroundColor3 = themeModule.color("PlayerRowFrame")
		var21.BackgroundTransparency = themeModule.transparency("PlayerRowFrame")
		create("UICorner")({
			CornerRadius = themeModule.DefaultCornerRadius,
			Parent = var21
		})
		local _ = nil
		
		if p5 then
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
		icon.Parent = var21
		local textLabel_1 = Instance.new("TextLabel")
		textLabel_1.Text = ""
		textLabel_1.TextXAlignment = Enum.TextXAlignment.Left
		textLabel_1.Font = themeModule.font(Enum.Font.SourceSans, "DisplayName")
		textLabel_1.FontSize = p4 and themeModule.fontSize(Enum.FontSize.Size36, "DisplayName") or themeModule.fontSize(Enum.FontSize.Size24, "DisplayName")
		textLabel_1.TextColor3 = Color3.new(1, 1, 1)
		textLabel_1.BackgroundTransparency = 1
		textLabel_1.Position = p4 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0)
		textLabel_1.Size = UDim2.new(0, 0, 0, 0)
		textLabel_1.ZIndex = 3
		textLabel_1.Parent = var21
		
		if p4 then
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
			secondRow.Parent = var21
		end
		return var21
	end
	
	local var21 = function()
		-- upvalues: createRow (ref), var19 (write), getFFlagEnableConsoleJoinVoiceModule (copy), shouldShowJoinVoiceButton (ref), uDim2 (copy), themeModule (copy), t (ref), robloxLocaleId (ref), fFlagConnectionsToFriendsRename (copy), constantsModule_1 (copy), uiblox (copy), builderIconsModule (copy), utilityModule (copy)
		local var22 = createRow("ImageButton", nil, true)
		var22.Size = UDim2.new(1, 0, 0, 52)
		local textLabel = var22.TextLabel
		local icon = var22.Icon
		
		if var19 or getFFlagEnableConsoleJoinVoiceModule() and shouldShowJoinVoiceButton() then
			var22.Size = uDim2
			textLabel.Size = UDim2.new(1, -60, 0, 0)
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			var22.AnchorPoint = Vector2.new(0, 0)
		end
		textLabel.Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		textLabel.AutoLocalize = false
		textLabel.Text = t[robloxLocaleId]:Format(if fFlagConnectionsToFriendsRename then constantsModule_1.InviteFriendsLocalizedKey else constantsModule_1.InviteConnectionsLocalizedKey)
		icon.AnchorPoint = Vector2.new(0, 0.5)
		icon.Position = UDim2.new(0, 18, 0.5, 0)
		local friendInvite = uiblox["icons/actions/friends/friendInvite"]
		local var23 = if friendInvite then uiblox["icons/actions/friends/friendInvite"] else themeModule.Images["icons/actions/friends/friendInvite"]
		
		if var23 then
			if friendInvite then
				icon.Text = var23.name
				icon.FontFace = builderIconsModule.Font[var23.variant]
			else
				icon.Image = var23.Image
				icon.ImageRectOffset = var23.ImageRectOffset
				icon.ImageRectSize = var23.ImageRectSize
			end
		end
		local function _(value)
			-- upvalues: var22 (ref)
			if value then
				var22.ImageTransparency = 0.65
				
				return
			end
			var22.ImageTransparency = 0.85
		end
		
		var22.InputBegan:Connect(function()
			-- upvalues: var22 (ref)
			var22.ImageTransparency = 0.65
		end)
		var22.InputEnded:Connect(function()
			-- upvalues: var22 (ref)
			var22.ImageTransparency = 0.85
		end)
		var22.Activated:Connect(function()
			-- upvalues: var22 (ref)
			var22.ImageTransparency = 0.85
		end)
		var22.TouchPan:Connect(function(_, p3)
			-- upvalues: var22 (ref)
			if math.abs(p3.Y) > 20 then
				var22.ImageTransparency = 0.85
			end
		end)
		var22.SelectionGained:connect(function()
			-- upvalues: var22 (ref)
			var22.ImageTransparency = 0.65
		end)
		var22.SelectionLost:connect(function()
			-- upvalues: var22 (ref)
			var22.ImageTransparency = 0.85
		end)
		var22.SelectionImageObject = var22:Clone()
		utilityModule:MakeFocusState(var22, "utility-focus-state-sharegame")
		
		return var22
	end
	
	local var22 = function()
		-- upvalues: createRow (ref), var3 (write), themeModule (copy), robloxTranslatorModule (copy), default (copy), utilityModule (copy)
		local var23 = createRow("ImageButton")
		var23.Size = UDim2.new(if var3 then 0.5 else 1, -10, 0, 52)
		var23.Position = UDim2.new(1, 0, 0, 0)
		var23.AnchorPoint = Vector2.new(1, 0)
		local textLabel = var23.TextLabel
		local icon = var23.Icon
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
			-- upvalues: var23 (ref)
			if value then
				var23.ImageTransparency = 0.65
				
				return
			end
			var23.ImageTransparency = 0.85
		end
		
		var23.InputBegan:Connect(function()
			-- upvalues: var23 (ref)
			var23.ImageTransparency = 0.65
		end)
		var23.InputEnded:Connect(function()
			-- upvalues: var23 (ref)
			var23.ImageTransparency = 0.85
		end)
		var23.Activated:Connect(function()
			-- upvalues: var23 (ref)
			var23.ImageTransparency = 0.85
		end)
		var23.TouchPan:Connect(function(_, p3)
			-- upvalues: var23 (ref)
			if math.abs(p3.Y) > 20 then
				var23.ImageTransparency = 0.85
			end
		end)
		var23.SelectionGained:connect(function()
			-- upvalues: var23 (ref)
			var23.ImageTransparency = 0.65
		end)
		var23.SelectionLost:connect(function()
			-- upvalues: var23 (ref)
			var23.ImageTransparency = 0.85
		end)
		var23.SelectionImageObject = var23:Clone()
		utilityModule:MakeFocusState(var23, "utility-focus-state-muteall")
		
		return var23
	end
	
	local var23 = function()
		-- upvalues: createRow (ref), themeModule (copy), pollImage (ref), utilityModule (copy), t (ref), robloxLocaleId (ref), default (copy), var20 (write), var15 (write), getFFlagCleanupMuteSelfButtonModule (copy), var8 (write), players_1 (ref), var5 (write)
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
		muteSelfButton.TouchPan:Connect(function(_, p3)
			-- upvalues: muteSelfButton (ref)
			if math.abs(p3.Y) > 20 then
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
		
		local _ = function(p3)
			-- upvalues: textLabel (ref), t (copy), robloxLocaleId (copy)
			textLabel.Text = t[robloxLocaleId]:Format(if p3 then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end
		
		textLabel.Text = t[robloxLocaleId]:Format(if default.localMuted then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		var20 = default.muteChanged.Event:Connect(function(p3)
			-- upvalues: var15 (copy), getFFlagCleanupMuteSelfButtonModule (copy), var8 (copy), pollImage (copy), textLabel (ref), t (copy), robloxLocaleId (copy)
			var15 = p3
			local muteSelfButtonImageLabel = nil
			
			if not getFFlagCleanupMuteSelfButtonModule() then
				muteSelfButtonImageLabel = var8:FindFirstChild("MuteSelfButtonImageLabel", true)
			elseif var8 then
				muteSelfButtonImageLabel = var8:FindFirstChild("MuteSelfButtonImageLabel", true)
			end
			if muteSelfButtonImageLabel then
				muteSelfButtonImageLabel.Image = pollImage()
			end
			textLabel.Text = t[robloxLocaleId]:Format(if p3 then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end)
		muteSelfButton.Activated:Connect(function()
			-- upvalues: default (copy), players_1 (copy), var15 (copy)
			default:ToggleMic("InGameMenuPlayers")
			
			if players_1 then
				players_1:onToggleMuteSelf(var15)
			end
		end)
		
		if getFFlagCleanupMuteSelfButtonModule() then
			return muteSelfButton
		end
		var5 = muteSelfButton
	end
	
	local _ = function()
		-- upvalues: var2 (copy), getFFlagCleanupMuteSelfButtonModule (copy), var5 (write), var23 (write)
		if var2 then return end
		if getFFlagCleanupMuteSelfButtonModule() then
			var5 = var23()
			
			return
		end
		var23()
	end
	
	if getFFlagEnableConsoleJoinVoiceModule() then
		var18 = function()
			-- upvalues: createRow (ref), uDim2 (copy), themeModule (copy), enableConsoleJoinVoiceTranslation (copy), t (ref), robloxLocaleId (ref), uiblox (copy), builderIconsModule (copy), utilityModule (copy), default (copy), constantsModule (copy)
			local var24 = createRow("ImageButton", nil, true)
			var24.Size = UDim2.new(1, 0, 0, 52)
			var24.Size = uDim2
			var24.AnchorPoint = Vector2.new(0, 0)
			local textLabel = var24.TextLabel
			textLabel.Size = UDim2.new(1, -60, 0, 0)
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
			textLabel.AutoLocalize = false
			
			if enableConsoleJoinVoiceTranslation then
				textLabel.Text = t[robloxLocaleId]:Format("Feature.SettingsHub.Action.ConnectVoiceChat")
			else
				textLabel.Text = "Connect Voice Chat"
			end
			local icon = var24.Icon
			icon.AnchorPoint = Vector2.new(0, 0.5)
			icon.Position = UDim2.new(0, 18, 0.5, 0)
			local publicAudioJoin = uiblox["icons/controls/publicAudioJoin"]
			local var25 = if publicAudioJoin then uiblox["icons/controls/publicAudioJoin"] else themeModule.Images["icons/controls/publicAudioJoin"]
			
			if var25 then
				if publicAudioJoin then
					icon.Text = var25.name
					icon.FontFace = builderIconsModule.Font[var25.variant]
				else
					icon.Image = var25.Image
					icon.ImageRectOffset = var25.ImageRectOffset
					icon.ImageRectSize = var25.ImageRectSize
				end
			end
			local function _(value)
				-- upvalues: var24 (ref)
				if value then
					var24.ImageTransparency = 0.65
					
					return
				end
				var24.ImageTransparency = 0.85
			end
			
			var24.InputBegan:Connect(function()
				-- upvalues: var24 (ref)
				var24.ImageTransparency = 0.65
			end)
			var24.InputEnded:Connect(function()
				-- upvalues: var24 (ref)
				var24.ImageTransparency = 0.85
			end)
			var24.Activated:Connect(function()
				-- upvalues: var24 (ref)
				var24.ImageTransparency = 0.85
			end)
			var24.TouchPan:Connect(function(_, p3)
				-- upvalues: var24 (ref)
				if math.abs(p3.Y) > 20 then
					var24.ImageTransparency = 0.85
				end
			end)
			var24.SelectionGained:connect(function()
				-- upvalues: var24 (ref)
				var24.ImageTransparency = 0.65
			end)
			var24.SelectionLost:connect(function()
				-- upvalues: var24 (ref)
				var24.ImageTransparency = 0.85
			end)
			var24.SelectionImageObject = var24:Clone()
			utilityModule:MakeFocusState(var24, "utility-focus-state-joinVoice")
			var24.Activated:Connect(function()
				-- upvalues: default (copy), constantsModule (copy)
				default.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				default:JoinVoice()
			end)
			
			return var24
		end
	end
	local _ = function()
		-- upvalues: shouldShowJoinVoiceButton (ref), var6 (write), var18 (write)
		if shouldShowJoinVoiceButton() and not var6 then
			var6 = var18()
			
			return
		end
	end
	
	local _ = function(p3)
		-- upvalues: utilityModule (copy), themeModule (copy)
		return utilityModule:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), p3)
	end
	
	local function resizeInspectButton(p3, p4, p5, p6)
		-- upvalues: rbxAnalyticsService (copy), constantsModule_1 (copy), players (ref), guiService (copy), utilityModule (copy), themeModule (copy)
		local inspect = p3:FindFirstChild("Inspect")
		
		if inspect and p5 == p6 then return end
		if inspect then
			inspect:Destroy()
		end
		local inspect_1 = utilityModule:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, themeModule.ButtonHeight, 0, themeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
			-- upvalues: rbxAnalyticsService (copy), constantsModule_1 (copy), players (copy), guiService (copy), p4 (ref)
			rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsExamineAvatarName, constantsModule_1.AnalyticsMenuActionName, {
				playsessionid = players.playSessionId,
				universeid = tostring(game.GameId)
			})
			guiService:InspectPlayerFromUserIdWithCtx(p4.UserId, "escapeMenu")
			players.HubRef:SetVisibility(false)
		end)
		inspect_1.Name = "Inspect"
		inspect_1.LayoutOrder = 2
		inspect_1.Selectable = true
		inspect_1.Parent = p3
		utilityModule:MakeFocusState(inspect_1, "utility-focus-state" .. "-inspect-" .. p45.Name)
	end
	
	local function resizePlatformName(p3, p4, p5)
		-- upvalues: status (copy), utilityModule (copy), themeModule (copy), create (copy)
		local platformNameContainer = p3:FindFirstChild("PlatformNameContainer")
		
		if platformNameContainer then
			platformNameContainer:Destroy()
			platformNameContainer = nil
		end
		if p4 == nil then return end
		local platformNameContainer_1 = Instance.new("Frame")
		platformNameContainer_1.Name = "PlatformNameContainer"
		platformNameContainer_1.BackgroundTransparency = 1
		platformNameContainer_1.ZIndex = 3
		platformNameContainer_1.Position = UDim2.new(0, 0, 0, 0)
		platformNameContainer_1.Size = UDim2.new(0, 0, 1, 0)
		platformNameContainer_1.AutomaticSize = Enum.AutomaticSize.X
		platformNameContainer_1.Selectable = false
		platformNameContainer_1.LayoutOrder = -1
		platformNameContainer_1.Parent = p3
		local consoleNameContainer, consoleNameContainer_1 = utilityModule:MakeStyledButton("consoleNameContainer", p4, UDim2.new(0, 0, 0, themeModule.ButtonHeight), if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and (status and status:IsProfileEnabled()) and (p5 and p5 ~= "") then function()
			-- upvalues: status (copy), p5 (ref)
			status:ShowProfile(p5)
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
		local var24 = create("ImageLabel")({
			Name = "iconLabel",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = themeModule.platformNameIconSize,
			ImageColor3 = Color3.new(1, 1, 1)
		})
		var24.Parent = consoleNameContainer
		create("UIListLayout")({
			Name = "PLatformNameUIListLayout",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}).Parent = consoleNameContainer
		var24.LayoutOrder = 1
		consoleNameContainer_1.LayoutOrder = 2
		create("UIPadding")({
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			Parent = consoleNameContainer
		})
		
		return platformNameContainer_1
	end
	
	local var24 = function()
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
		
		local _ = function(p3)
			-- upvalues: nameLabel (ref), guiService (copy), rightSideButtons (ref)
			if nameLabel then
				if guiService.SelectedCoreObject and guiService.SelectedCoreObject ~= p3 and guiService.SelectedCoreObject.Parent == rightSideButtons then
					nameLabel.ImageTransparency = 0.65
					
					return
				end
				nameLabel.ImageTransparency = 0.85
			end
		end
		
		local frame_1 = nil
		rightSideButtons.ChildAdded:connect(function(p3)
			-- upvalues: frame_1 (write), nameLabel (ref), guiService (copy), rightSideButtons (ref)
			if p3:IsA("GuiObject") then
				if frame_1 and p3 ~= frame_1 then
					frame_1:Destroy()
					frame_1 = nil
				end
				p3.SelectionGained:connect(function()
					-- upvalues: nameLabel (copy), guiService (copy), rightSideButtons (copy)
					if nameLabel then
						if guiService.SelectedCoreObject and guiService.SelectedCoreObject ~= nil and guiService.SelectedCoreObject.Parent == rightSideButtons then
							nameLabel.ImageTransparency = 0.65
							
							return
						end
						nameLabel.ImageTransparency = 0.85
					end
				end)
				p3.SelectionLost:connect(function()
					-- upvalues: p3 (ref), nameLabel (copy), guiService (copy), rightSideButtons (copy)
					if nameLabel then
						if guiService.SelectedCoreObject and guiService.SelectedCoreObject ~= p3 and guiService.SelectedCoreObject.Parent == rightSideButtons then
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
	
	local function managePlayerNameCutoff(p3, p4)
		-- upvalues: checkForNilUserIdOnPlayerList (copy), userProfileStore (copy), isEngineTruncationEnabledForIngameSettingsModule (copy), utilityModule (copy), playerListRefactorUsernameFormatting (copy), formatUsername (copy)
		local var25 = nil
		local childAddedConnection = nil
		
		local function reportFlagChanged(p5, p6, p7)
			-- upvalues: var25 (write), p3 (ref), p4 (ref)
			if p6 == "AbsolutePosition" and var25 then
				local var26 = p5.AbsolutePosition.X - 20 - p3.NameLabel.AbsolutePosition.X
				p3.NameLabel.Text = "@" .. p54.Name
				p3.DisplayNameLabel.Text = p4.DisplayName
				
				if p7 then
					p3.DisplayNameLabel.Text = p7
				end
				local var27 = if p7 then utf8.len(p7) else utf8.len(p4.DisplayName)
				while var26 < p3.NameLabel.TextBounds.X and var27 > 0 do
					if p7 then
						p3.NameLabel.Text = string.sub(p7, 1, utf8.offset(p7, var27)) .. "..."
					else
						p3.NameLabel.Text = string.sub(p4.DisplayName, 1, utf8.offset(p4.DisplayName, var27)) .. "..."
					end
					var27 -= 1
				end
				local text = "@" .. p54.Name
				local var28 = string.len(text)
				while var26 < p3.NameLabel.TextBounds.X and var28 > 0 do
					p3.NameLabel.Text = string.sub(text, 1, var28) .. "..."
					var28 -= 1
				end
			end
		end
		
		local function reportFlagChangedWithCombinedName(p8, _, _)
			-- upvalues: checkForNilUserIdOnPlayerList (copy), p4 (ref), reportFlagChanged (ref), userProfileStore (copy), p3 (ref)
			if checkForNilUserIdOnPlayerList and not p4.UserId then
				reportFlagChanged(p8, "AbsolutePosition")
				
				return
			end
			userProfileStore.get().fetchNamesByUserIds({ tostring(p4.UserId) }, function(p9)
				-- upvalues: p3 (copy), reportFlagChanged (copy), p8 (ref), p4 (copy)
				local var29 = if p3 and p3.Parent then p3:FindFirstChild("DisplayNameLabel") else nil
				
				if var29 == nil then return end
				local var30
				local data = p9.data
				
				if #data == 0 then
					var30 = ""
				else
					local var31 = data[1]
					
					if var31 == nil then
						var30 = ""
					else
						local names = var31.names
						var30 = if names == nil then "" else names.getInExperienceCombinedName(false)
					end
				end
				if string.len(var30) > 0 and var30 ~= var29.Text then
					reportFlagChanged(p8, "AbsolutePosition", var30)
					
					return
				elseif p4.DisplayName ~= var29.Text then
					reportFlagChanged(p8, "AbsolutePosition")
				end
			end)
		end
		
		if not isEngineTruncationEnabledForIngameSettingsModule() then
			utilityModule:OnResized(p3.NameLabel, function(_, p8)
				-- upvalues: var25 (write), utilityModule (copy), childAddedConnection (write), p3 (ref), reportFlagChangedWithCombinedName (ref), p4 (ref), checkForNilUserIdOnPlayerList (copy), userProfileStore (copy)
				if var25 ~= nil and var25 == p8 then return end
				local var29 = p8
				
				if var29 then
					var29 = not (utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait())
				end
				var25 = var29
				
				if var29 then
					if childAddedConnection == nil then
						childAddedConnection = p3.RightSideButtons.ChildAdded:connect(function(p9)
							-- upvalues: reportFlagChangedWithCombinedName (copy)
							if p9.Name == "Inspect" then
								p9.Changed:connect(function(_)
									-- upvalues: reportFlagChangedWithCombinedName (copy), p9 (ref)
									reportFlagChangedWithCombinedName(p9, "AbsolutePosition")
								end)
								reportFlagChangedWithCombinedName(p9, "AbsolutePosition")
							end
						end)
					end
					var29 = p3.RightSideButtons:FindFirstChild("Inspect")
					
					if var29 then
						var29.Changed:connect(function(p9)
							-- upvalues: reportFlagChangedWithCombinedName (copy), var29 (ref)
							reportFlagChangedWithCombinedName(var29, p9)
						end)
						reportFlagChangedWithCombinedName(var29, "AbsolutePosition")
						
						return
					end
				elseif not p3:FindFirstChild("NameLabel") then return end
				p3.NameLabel.Text = "@" .. p54.Name
				
				if checkForNilUserIdOnPlayerList and not p4.UserId then
					p3.DisplayNameLabel.Text = p4.DisplayName
					
					return
				end
				userProfileStore.get().fetchNamesByUserIds({ tostring(p4.UserId) }, function(p9)
					-- upvalues: p3 (copy), p4 (copy)
					local var30 = if p3 and p3.Parent then p3:FindFirstChild("DisplayNameLabel") else nil
					
					if var30 == nil then return end
					local var31
					local data = p9.data
					
					if #data == 0 then
						var31 = ""
					else
						local var32 = data[1]
						
						if var32 == nil then
							var31 = ""
						else
							local names = var32.names
							var31 = if names == nil then "" else names.getInExperienceCombinedName(false)
						end
					end
					if string.len(var31) > 0 and var31 ~= var30.Text then
						var30.Text = var31
						
						return
					end
					local displayName = p4.DisplayName
					
					if displayName ~= var30.Text then
						var30.Text = displayName
					end
				end)
			end)
		end
		local function getNearestRightSideButtonXPosition()
			-- upvalues: p3 (ref)
			local x = nil
			
			for i, v in pairs(p3.RightSideButtons:GetChildren()) do
				if v:IsA("ImageButton") and (not x or v.AbsolutePosition.X < x) then
					x = v.AbsolutePosition.X
				end
			end
			return x
		end
		
		local var29 = nil
		
		local function rightSideButtonsChanged()
			-- upvalues: getNearestRightSideButtonXPosition (ref), var29 (write), p3 (ref), playerListRefactorUsernameFormatting (copy), formatUsername (copy), p4 (ref), checkForNilUserIdOnPlayerList (copy), userProfileStore (copy)
			local var30 = getNearestRightSideButtonXPosition()
			
			if var30 == var29 then return end
			var29 = var30
			local var31 = if var30 then UDim2.new(0, var30 - p3.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0)
			p3.NameLabel.Size = var31
			p3.DisplayNameLabel.Size = var31
			p3.NameLabel.Text = if playerListRefactorUsernameFormatting then formatUsername(p4.Name) else "@" .. p54.Name
			
			if checkForNilUserIdOnPlayerList and not p4.UserId then
				p3.DisplayNameLabel.Text = p4.DisplayName
				
				return
			end
			userProfileStore.get().fetchNamesByUserIds({ tostring(p4.UserId) }, function(p8)
				-- upvalues: p3 (copy), p4 (copy)
				local var32 = if p3 and p3.Parent then p3:FindFirstChild("DisplayNameLabel") else nil
				
				if var32 == nil then return end
				local var33
				local data = p8.data
				
				if #data == 0 then
					var33 = ""
				else
					local var34 = data[1]
					
					if var34 == nil then
						var33 = ""
					else
						local names = var34.names
						var33 = if names == nil then "" else names.getInExperienceCombinedName(false)
					end
				end
				if string.len(var33) > 0 and var33 ~= var32.Text then
					var32.Text = var33
					
					return
				end
				local displayName = p4.DisplayName
				
				if displayName ~= var32.Text then
					var32.Text = displayName
				end
			end)
		end
		
		if isEngineTruncationEnabledForIngameSettingsModule() then
			childAddedConnection = p3.RightSideButtons.ChildAdded:connect(function(p8)
				-- upvalues: rightSideButtonsChanged (ref)
				rightSideButtonsChanged()
				p8:GetPropertyChangedSignal("AbsolutePosition"):Connect(rightSideButtonsChanged)
			end)
			rightSideButtonsChanged()
		end
	end
	
	local _ = function()
		-- upvalues: localPlayer (copy)
		return localPlayer.UserId > 0
	end
	
	local var29 = nil
	local t_3 = {}
	local t_4 = {}
	local var30 = false
	
	local function updateAllMuteButtons()
		-- upvalues: var4 (write), default (copy), playersService (copy), t_3 (ref), muteButtonUpdate (ref), var16 (write), robloxTranslatorModule (copy)
		if not var4 then return end
		if not default.voiceUIVisible then return end
		local var31 = true
		
		for i, v in ipairs(playersService:GetPlayers()) do
			local name = t_3[v.Name]
			
			if v and name then
				local userId = default.participants[tostring(v.UserId)]
				
				if userId and not userId.isMutedLocally then
					var31 = false
				end
				muteButtonUpdate(name, userId)
			end
		end
		var16 = if var31 then true else false
		local var32 = var16 and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		
		if var4 and var4:FindFirstChild("TextLabel") then
			var4.TextLabel.Text = var32
			var4.Icon.Image = default:GetIcon(if var16 then "MuteAll" else "UnmuteAll", "Misc")
			
			return
		end
	end
	
	local function destroyAllUserMuteButtons()
		-- upvalues: playersService (copy), t_3 (ref), guiService (copy), userInputService (copy), var3 (write)
		for i, v in playersService:GetPlayers() do
			local name = t_3[v.Name]
			
			if name then
				local rightSideButtons = name:FindFirstChild("RightSideButtons")
				
				if rightSideButtons then
					local muteStatusButton = rightSideButtons:FindFirstChild("MuteStatusButton")
					
					if muteStatusButton then
						if guiService.SelectedCoreObject == muteStatusButton then
							if userInputService.GamepadEnabled then
								guiService.SelectedCoreObject = var3
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
	
	local var33 = function(_)
		-- upvalues: players (ref), fFlagIEMTabFocusNav (copy), var29 (write), playersService (copy), var2 (copy), localPlayer (copy), utilityModule (copy), var19 (write), var4 (write), default (copy), fFlagHidePeoplePageInviteFriends (copy), fFlagAddInviteFriendsIntegration (copy), fFlagEnableSideSheet (copy), var3 (write), runService (copy), var8 (write), create (copy), var9 (write), uDim2 (copy), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (copy), var1 (copy), gameInviteAnalytics (copy), eventStream (copy), rbxAnalyticsService (copy), diag (copy), var21 (write), getFFlagEnableConsoleJoinVoiceModule (copy), shouldShowJoinVoiceButton (ref), var6 (write), var18 (write), var11 (write), guiService (copy), t_3 (ref), t_4 (ref), var24 (write), muteButtonUpdate (ref), socialUtilModule (copy), playerListRefactorUsernameFormatting (copy), formatUsername (copy), isEngineTruncationEnabledForIngameSettingsModule (copy), managePlayerNameCutoff (ref), friendStatusCreate (ref), resizeFriendButton (ref), resizeBlockButton (write), resizeInspectButton (ref), reportAbuseButtonCreate (ref), var22 (write), var16 (write), robloxTranslatorModule (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy), players_1 (ref), constantsModule (copy), updateAllMuteButtons (ref), checkShareGameButtonInMuteAllLayout (copy), checkForNilUserIdOnPlayerList (copy), cryoModule (copy), userProfileStore (copy), resizePlatformName (ref), var30 (write), getFFlagCleanupMuteSelfButtonModule (copy), pollImage (ref), userInputService (copy), onlyCaptureFocusIfOnPlayerPage (copy)
		players.LastSelectableObjects = {}
		
		if fFlagIEMTabFocusNav and not players.ButtonsContainer.Visible then
			players.FirstSelectableObjects = {}
		end
		var29 = playersService:GetPlayers()
		
		if var2 then
			table.sort(var29, function(p8, p9)
				-- upvalues: localPlayer (copy)
				local var34 = p8.Name:lower()
				local var35 = p9.Name:lower()
				
				if p8 == localPlayer then
					var34 = " "
				end
				if p9 == localPlayer then
					var35 = " "
				end
				return var34 < var35
			end)
		else
			table.sort(var29, function(p8, p9)
				return p8.Name:lower() < p9.Name:lower()
			end)
		end
		local var34 = if utilityModule:IsSmallTouchScreen() or utilityModule:IsPortrait() then 85 else 20
		local voiceUIVisible = var19 and (not var4 and default.voiceUIVisible)
		local fFlagEnableSideSheet_1 = fFlagHidePeoplePageInviteFriends and (fFlagAddInviteFriendsIntegration and fFlagEnableSideSheet)
		local var35 = localPlayer.UserId > 0 and (not var3 and (not runService:IsStudio() and not fFlagEnableSideSheet_1))
		
		if (var35 or voiceUIVisible) and not var8 then
			var8 = create("Frame")({
				Name = "Holder",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = players.Page
			})
			var9 = create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20),
				Parent = var8
			})
		end
		local var36
		local function layoutMuteAll()
			-- upvalues: var8 (copy), create (copy), players (copy), var3 (copy), uDim2 (copy), var4 (copy)
			if not var8 then
				var8 = create("Frame")({
					Name = "Holder",
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 52),
					Parent = players.Page
				})
			end
			var3.Parent = var8
			var3.Size = uDim2
			var4.Parent = var8
		end
		
		if localPlayer.UserId > 0 and not var3 and (not runService:IsStudio() and not fFlagEnableSideSheet_1) then
			var36 = if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then var1:withButtonName(var1.ButtonName.SettingsHub) else gameInviteAnalytics.new():withEventStream(eventStream.new(rbxAnalyticsService)):withDiag(diag.new(rbxAnalyticsService)):withButtonName(gameInviteAnalytics.ButtonName.SettingsHub)
			var3 = var21()
			var3.Activated:connect(function()
				-- upvalues: var36 (write), players (copy)
				var36:inputShareGameEntryPoint()
				players.HubRef:InviteToGame()
			end)
			var3.LayoutOrder = 1
			
			if voiceUIVisible then
				var3.Parent = var8
			else
				var3.Parent = players.Page
			end
		end
		if getFFlagEnableConsoleJoinVoiceModule() and shouldShowJoinVoiceButton() then
			if shouldShowJoinVoiceButton() and not var6 then
				var6 = var18()
			end
			var11()
		end
		if fFlagIEMTabFocusNav then
			if voiceUIVisible then
				table.insert(players.FirstSelectableObjects, var4)
			end
			if var35 then
				table.insert(players.FirstSelectableObjects, var3)
			end
			if voiceUIVisible or var35 then
				players.FirstSelectableObjectsUpdated:fire()
			end
		end
		local var37
		var36 = guiService:GetInspectMenuEnabled()
		
		for i_1 = 1, #var29 do
			local var38 = var29[i_1]
			local var39 = nil
			var39 = t_3[var38.Name]
			
			if not var38 then
				continue
			end
			t_4[var38.Name] = true
			
			if not var39 or not var39.Parent then
				var39 = var24((i_1 - 1) * 80 + var34)
				var39.Parent = players.Page
				t_3[var38.Name] = var39
			end
			var39.Name = "PlayerLabel" .. var217.Name
			
			if var19 then
				muteButtonUpdate(var39, default.participants[tostring(var38.UserId)])
			end
			var39.Icon.Image = socialUtilModule.GetPlayerImage(math.max(1, var38.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail)
			var39.NameLabel.Text = if playerListRefactorUsernameFormatting then formatUsername(var38.Name) else "@" .. var217.Name
			var39.ImageTransparency = 0.85
			var39.LayoutOrder = i_1 + 1
			
			if isEngineTruncationEnabledForIngameSettingsModule() then
				var39.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
				var39.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
			end
			managePlayerNameCutoff(var39, var38)
			friendStatusCreate(var39, var38)
			var37 = nil
			utilityModule:OnResized(var39, function(_, p8)
				-- upvalues: var39 (write), utilityModule (copy), resizeFriendButton (copy), var38 (ref), var37 (write), resizeBlockButton (copy), var36 (ref), resizeInspectButton (copy)
				local rightSideButtons = var39:FindFirstChild("RightSideButtons")
				local displayNameLabel = var39:FindFirstChild("DisplayNameLabel")
				local nameLabel = var39:FindFirstChild("NameLabel")
				local rightSideListLayout = rightSideButtons and rightSideButtons:FindFirstChild("RightSideListLayout")
				
				if utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait() then
					var39.Size = UDim2.new(1, 0, 0, 105)
					
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
					var39.Size = UDim2.new(1, 0, 0, 62)
					
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
					resizeFriendButton(rightSideButtons, var38, p8, var37)
					resizeBlockButton(rightSideButtons, var38, p8, var37)
					
					if var36 then
						resizeInspectButton(rightSideButtons, var38, p8, var37)
					end
					var37 = p8
				end
			end)
			reportAbuseButtonCreate(var39, var38)
			
			if i_1 == #var29 then
				local rightSideButtons = var39:FindFirstChild("RightSideButtons")
				
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
				local rightSideButtons = var39:FindFirstChild("RightSideButtons")
				
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
			local var40
			var4 = var22()
			var4.Activated:connect(function()
				-- upvalues: var16 (copy), robloxTranslatorModule (copy), var4 (copy), default (copy), getFFlagVoiceChatUILoggingModule (copy), name (copy), players_1 (copy), constantsModule (copy), updateAllMuteButtons (copy)
				var16 = not var16
				var4.TextLabel.Text = var16 and robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
				var4.Icon.Image = default:GetIcon(if var16 then "MuteAll" else "UnmuteAll", "Misc")
				
				if getFFlagVoiceChatUILoggingModule() then
					name:debug("{} all players", if var16 then "Muting" else "Unmuting")
				end
				if players_1 then
					players_1:onToggleMuteAll(var16)
				end
				default:MuteAll(var16, constantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				updateAllMuteButtons()
			end)
			var4.LayoutOrder = 1
			
			if checkShareGameButtonInMuteAllLayout then
				var40 = var3 ~= nil
				var40 = nil
			else
				var40 = true
			end
			if var40 then
				layoutMuteAll()
			else
				var4.Parent = var8
			end
			var11()
		end
		local var41 = if checkForNilUserIdOnPlayerList then cryoModule.List.filterMap(var29, function(p8)
			return if p8.UserId then tostring(p8.UserId) else nil
		end) else cryoModule.List.filter(var29, function(p8)
			return tostring(p8.UserId)
		end)
		
		for var39, v_2 in ipairs(var29) do
			t_3[v_2.Name].DisplayNameLabel.Text = v_2.DisplayName
		end
		userProfileStore.get().fetchNamesByUserIds(var41, function(p8)
			-- upvalues: t_3 (copy), resizePlatformName (copy)
			for i, v in p8.data do
				local var42 = t_3[v.names.getUsername(false)]
				
				if var42 then
					local inExperienceCombinedName = v.names.getInExperienceCombinedName(false)
					
					if string.len(inExperienceCombinedName) > 0 and inExperienceCombinedName ~= var42.DisplayNameLabel.Text then
						var42.DisplayNameLabel.Text = inExperienceCombinedName
					end
					local rightSideButtons = var42:FindFirstChild("RightSideButtons")
					local var43 = if v.names.getPlatformName(false) ~= "" then v.names.getPlatformName(false) else nil
					
					if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
						resizePlatformName(rightSideButtons, var43, v.getPlatformProfileId(false))
					else
						resizePlatformName(rightSideButtons, var43)
					end
				end
			end
		end)
		local var44 = 0
		
		if var19 and not var30 then
			name:debug("Setting Up Playerlist Mic Update Renderstep Hook")
			runService:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function()
				-- upvalues: var44 (write), updateAllMuteButtons (copy), getFFlagCleanupMuteSelfButtonModule (copy), var8 (copy), pollImage (copy)
				var44 += 1
				
				if var44 % 3 == 0 then
					updateAllMuteButtons()
					local muteSelfButtonImageLabel = nil
					
					if not getFFlagCleanupMuteSelfButtonModule() then
						muteSelfButtonImageLabel = var8:FindFirstChild("MuteSelfButtonImageLabel", true)
					elseif var8 then
						muteSelfButtonImageLabel = var8:FindFirstChild("MuteSelfButtonImageLabel", true)
					end
					if not muteSelfButtonImageLabel then return end
					muteSelfButtonImageLabel.Image = pollImage()
				end
			end)
			var30 = true
		end
		for i_3, var37 in pairs(t_3) do
			if not t_4[i_3] then
				var37:Destroy()
				t_3[i_3] = nil
			end
		end
		if userInputService.GamepadEnabled and (not fFlagIEMTabFocusNav or not guiService.SelectedCoreObject) then
			if getFFlagCleanupMuteSelfButtonModule() then
				pcall(function()
					-- upvalues: onlyCaptureFocusIfOnPlayerPage (copy), players (copy), guiService (copy), var3 (copy)
					if onlyCaptureFocusIfOnPlayerPage then
						if players.Active then
							guiService.SelectedCoreObject = var3
							
							return
						end
					else
						guiService.SelectedCoreObject = var3
					end
				end)
			else
				guiService.SelectedCoreObject = var3
			end
		end
		utilityModule:OnResized("MenuPlayerListExtraPageSize", function(_, _)
			-- upvalues: utilityModule (copy), var29 (copy), players (copy)
			local var45 = if utilityModule:IsSmallTouchScreen() or utilityModule:IsPortrait() then 85 else 20
			local var46 = #var29 + 1
			
			if utilityModule:IsSmallTouchScreen() and utilityModule:IsPortrait() then
				players.Page.Size = UDim2.new(1, 0, 0, var45 + var46 * 123 - 5)
				
				return
			end
			players.Page.Size = UDim2.new(1, 0, 0, var45 + var46 * 80 - 5)
		end)
	end
	
	local var45 = function()
		-- upvalues: var30 (write), name (copy), runService (copy)
		if var30 then
			name:debug("Unbinding Playerlist Mic Update Renderstep Hook")
			var30 = false
			runService:UnbindFromRenderStep("player-list-mute-update")
		end
	end
	
	if game:GetEngineFeature("VoiceChatSupported") then
		default:asyncInit():andThen(function()
			-- upvalues: var19 (write), default (copy), var2 (copy), getFFlagCleanupMuteSelfButtonModule (copy), var5 (write), var23 (write), updateAllMuteButtons (ref), t_1 (ref), var4 (write), var11 (write), var20 (write), getFFlagEnableConsoleJoinVoiceModule (copy), var6 (write), var33 (ref), var17 (ref), destroyAllUserMuteButtons (ref), resetButtonRow (ref)
			var19 = true
			default:SetupParticipantListeners()
			
			if not var2 then
				if getFFlagCleanupMuteSelfButtonModule() then
					var5 = var23()
				else
					var23()
				end
			end
			default.participantsUpdate.Event:Connect(function()
				-- upvalues: updateAllMuteButtons (copy)
				updateAllMuteButtons()
			end)
			default.participantLeft.Event:Connect(function(_, p9)
				-- upvalues: updateAllMuteButtons (copy), t_1 (copy)
				updateAllMuteButtons()
				t_1[p9] = nil
			end)
			default:getService().StateChanged:Connect(function(_, p9)
				-- upvalues: var4 (copy), var11 (copy), var5 (copy), var20 (copy), getFFlagEnableConsoleJoinVoiceModule (copy), var6 (copy), var19 (copy), var33 (copy)
				if p9 == Enum.VoiceChatState.Ended then
					if var4 then
						var4.Visible = false
						var4:Destroy()
						var4 = nil
					end
					var11()
					
					if var5 then
						var5.Visible = false
						var5:Destroy()
						var5 = nil
					end
					if var20 then
						var20:Disconnect()
						var20 = nil
					end
					var11()
					
					if getFFlagEnableConsoleJoinVoiceModule() then
						if var6 then
							var6.Visible = false
							var6:Destroy()
							var6 = nil
						end
						var11()
					end
					var19 = false
					
					return
				elseif p9 == Enum.VoiceChatState.Joined and var19 == false then
					var19 = true
					
					if getFFlagEnableConsoleJoinVoiceModule() then
						if var6 then
							var6.Visible = false
							var6:Destroy()
							var6 = nil
						end
						var11()
					end
					var33()
				end
			end)
			
			if not getFFlagCleanupMuteSelfButtonModule() then
				var33()
			end
			default.showVoiceUI.Event:Connect(function()
				-- upvalues: getFFlagCleanupMuteSelfButtonModule (copy), var5 (copy), var2 (copy), var23 (copy), var17 (copy), getFFlagEnableConsoleJoinVoiceModule (copy), var6 (copy), var11 (copy), var33 (copy)
				if getFFlagCleanupMuteSelfButtonModule() then
					if not var5 and not var2 then
						if getFFlagCleanupMuteSelfButtonModule() then
							var5 = var23()
						else
							var23()
						end
					end
				elseif not var17:FindFirstChild("MuteSelfButton", true) and not var2 then
					if getFFlagCleanupMuteSelfButtonModule() then
						var5 = var23()
					else
						var23()
					end
				end
				if getFFlagEnableConsoleJoinVoiceModule() then
					if var6 then
						var6.Visible = false
						var6:Destroy()
						var6 = nil
					end
					var11()
				end
				var33()
			end)
			default.hideVoiceUI.Event:Connect(function()
				-- upvalues: var4 (copy), var11 (copy), var5 (copy), var20 (copy), destroyAllUserMuteButtons (copy), var33 (copy), resetButtonRow (copy)
				if var4 then
					if var4 then
						var4.Visible = false
						var4:Destroy()
						var4 = nil
					end
					var11()
				end
				if var5 then
					var5.Visible = false
					var5:Destroy()
					var5 = nil
				end
				if var20 then
					var20:Disconnect()
					var20 = nil
				end
				var11()
				destroyAllUserMuteButtons()
				var33()
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
	players.Displayed.Event:connect(var33)
	players.Hidden.Event:connect(var45)
	playersService.PlayerRemoving:Connect(function(p9)
		-- upvalues: t_4 (ref), t_3 (ref), guiService (copy), userInputService (copy), var3 (write), getFFlagDestroyPlayerCardOnLeaveModule (copy)
		t_4[p9.Name] = nil
		local name = t_3[p9.Name]
		
		if not name then return end
		local rightSideButtons = name:FindFirstChild("RightSideButtons")
		
		if not rightSideButtons then return end
		local friendStatus = rightSideButtons:FindFirstChild("FriendStatus")
		
		if friendStatus then
			if guiService.SelectedCoreObject == friendStatus then
				if userInputService.GamepadEnabled then
					guiService.SelectedCoreObject = var3
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
					guiService.SelectedCoreObject = var3
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
					guiService.SelectedCoreObject = var3
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
					guiService.SelectedCoreObject = var3
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
			t_3[p9.Name] = nil
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
	
	guiService.InspectMenuEnabledChangedSignal:Connect(function(p9)
		-- upvalues: removeInspectButtons (ref)
		if not p9 then
			removeInspectButtons()
		end
	end)
	
	function players.CreateMenuButtonsContainer(_)
		-- upvalues: fIntRelocateMobileMenuButtonsVariantModule (copy), players (ref), reactRobloxModule (copy), var17 (ref), reactModule (copy), menuButtonsContainerModule (copy)
		if fIntRelocateMobileMenuButtonsVariantModule == 2 then
			if players.buttonsContainerRoot then return end
			players.buttonsContainerRoot = reactRobloxModule.createRoot(var17)
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