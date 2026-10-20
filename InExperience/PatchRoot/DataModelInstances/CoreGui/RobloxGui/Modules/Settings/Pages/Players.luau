local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local FormatUsernameFunction = UserProfilesModule.Formatters.formatUsername
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local OpenTypeSupport = require(CorePackages.Packages.UIBlox).Utility.OpenTypeSupport
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ReportAbuseMenuContainerPageModule = require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuContainerPage)
local SocialUtilModule = require(RobloxGui.Modules:WaitForChild("SocialUtil"))
local Diag = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.Diag
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GameInviteAnalytics = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalytics
local OnBlockButtonActivatedModule = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local VoiceAnalyticsModule = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local BlockingAnalyticsModule = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local MenuButtonsContainerModule = require(RobloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(RobloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local GameInviteAnalyticsManager = if GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalyticsManager else nil
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUserProfilePlatformProfile = SharedFlagsModule.FFlagUserProfilePlatformProfile
local GetFFlagLuaAppEnableOpenTypeSupportFunction = SharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport
local FFlagIEMTabFocusNav = SharedFlagsModule.FFlagIEMTabFocusNav
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagRelocateMobileMenuButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local FIntRelocateMobileMenuButtonsVariantModule = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local FFlagMenuButtonsMountWithIEMModule = require(RobloxGui.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local FFlagHidePeoplePageInviteFriends = SharedFlagsModule.FFlagHidePeoplePageInviteFriends
local FFlagAddInviteFriendsIntegration = SharedFlagsModule.FFlagAddInviteFriendsIntegration
local UserProfileStore = UserProfilesModule.Stores.UserProfileStore
local _, Result = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local ThemeModule = require(script.Parent.Parent.Theme)
local ConstantsModule1 = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local _UDim2 = UDim2.new(0.5, -10, 0, 52)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local GetFFlagVoiceChatUILoggingModule = require(RobloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
local GetFFlagDefaultFriendingLabelTextNonEmptyModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty)
local GetFFlagEnableLeaveGameUpsellEntrypointModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint)
local GetFFlagDestroyPlayerCardOnLeaveModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave)
local GetFFlagEnableConsoleJoinVoiceModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice)
local EnableConsoleJoinVoiceTranslation = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false)
local CheckButtonFrameBeforeDestroy = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false)
local IsEngineTruncationEnabledForIngameSettingsModule = require(RobloxGui.Modules.Flags.isEngineTruncationEnabledForIngameSettings)
local VoiceChatMultistreamSubscriptionsEnabledEngineFeature = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local LuaFlagVoiceChatDisableSubscribeRetryForMultistream = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local PlayerListRefactorUsernameFormatting = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false)
local CheckShareGameButtonInMuteAllLayout = game:DefineFastFlag("CheckShareGameButtonInMuteAllLayout", false)
local OnlyCaptureFocusIfOnPlayerPage = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false)
local SettingsHubPlayersButtonsResponsiveThreshold = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200)
local GetFFlagCleanupMuteSelfButtonModule = require(RobloxGui.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton)
local CheckForNilUserIdOnPlayerList = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local MuteStatusIcons = Default.MuteStatusIcons
local PlayerMuteStatusIcons = Default.PlayerMuteStatusIcons

return ((function()
	-- upvalues: RobloxGui (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), LocalizationService (copy), Localization (copy), Uiblox (copy), BuilderIconsModule (copy), LocalPlayer (ref), UtilityModule (copy), BlockingUtilityModule (copy), ThemeModule (copy), ConstantsModule1 (copy), GetFFlagDefaultFriendingLabelTextNonEmptyModule (copy), VoiceAnalyticsModule (copy), SettingsHubPlayersButtonsResponsiveThreshold (copy), GetFFlagEnableConsoleJoinVoiceModule (copy), GetFFlagCleanupMuteSelfButtonModule (copy), CheckButtonFrameBeforeDestroy (copy), GuiService (copy), BlockingAnalyticsModule (copy), OnBlockButtonActivatedModule (copy), RobloxTranslatorModule (copy), MuteStatusIcons (copy), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (copy), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (copy), Default (copy), ConstantsModule (copy), CreateFunction (copy), IsSideSheetEnabledModule (copy), FFlagRelocateMobileMenuButtonsModule (copy), FIntRelocateMobileMenuButtonsVariantModule (copy), GetFFlagEnableLeaveGameUpsellEntrypointModule (copy), FFlagIEMTabFocusNav (copy), PlayerMuteStatusIcons (copy), ReportAbuseMenuContainerPageModule (copy), EnabledResult (copy), _UDim2 (copy), EnableConsoleJoinVoiceTranslation (copy), Result (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), CheckForNilUserIdOnPlayerList (copy), UserProfileStore (copy), IsEngineTruncationEnabledForIngameSettingsModule (copy), PlayerListRefactorUsernameFormatting (copy), FormatUsernameFunction (copy), Players (copy), UserInputService (copy), FFlagHidePeoplePageInviteFriends (copy), FFlagAddInviteFriendsIntegration (copy), RunService (copy), GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (copy), GameInviteAnalyticsManager (ref), GameInviteAnalytics (copy), EventStream (copy), Diag (copy), SocialUtilModule (copy), GetFFlagVoiceChatUILoggingModule (copy), NewResult (copy), CheckShareGameButtonInMuteAllLayout (copy), CryoModule (copy), FFlagUserProfilePlatformProfile (copy), OnlyCaptureFocusIfOnPlayerPage (copy), GetFFlagDestroyPlayerCardOnLeaveModule (copy), ReactRobloxModule (copy), ReactModule (copy), MenuButtonsContainerModule (copy), FFlagMenuButtonsMountWithIEMModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	NewPage.PageListLayout.Padding = UDim.new(0, 16)
	NewPage.playSessionId = ""
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		NewPage.playSessionId = RbxAnalyticsService:GetPlaySessionId()
	end
	local NewResults = {}
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	
	if not NewResults[RobloxLocaleId] then
		NewResults[RobloxLocaleId] = Localization.new(RobloxLocaleId)
	end
	NewPage.TabHeader.Name = "PlayersTab"
	local IconsMenuFriends = Uiblox["icons/menu/friends"]
	NewPage.TabHeader.TabLabel.Icon.Text = IconsMenuFriends.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[IconsMenuFriends.variant]
	NewPage.TabHeader.TabLabel.Title.Text = "People"
	
	local function _(Player: Player)
		-- upvalues: LocalPlayer (upval)
		local Success, Result = pcall(function()
			-- upvalues: LocalPlayer (upval), Player (copy)
			return LocalPlayer:GetFriendStatus(Player)
		end)
		
		return if Success then Result else Enum.FriendStatus.NotFriend
	end
	
	NewPage.Page.Name = "Players"
	
	local _ = function(Player): boolean
		-- upvalues: LocalPlayer (upval)
		return Player and (Player ~= LocalPlayer and (Player.UserId > 0 and LocalPlayer.UserId > 0))
	end
	
	local _ = function()
		-- upvalues: UtilityModule (upval)
		return UtilityModule:IsSmallTouchScreen() and UtilityModule:IsPortrait()
	end
	
	local _ = function(Player)
		-- upvalues: BlockingUtilityModule (upval)
		return BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId)
	end
	
	local function createFriendStatusTextLabel(FriendStatus, Player)
		-- upvalues: ThemeModule (upval), NewResults (copy), RobloxLocaleId (copy), ConstantsModule1 (upval), GetFFlagDefaultFriendingLabelTextNonEmptyModule (upval), LocalPlayer (upval), RbxAnalyticsService (upval), UtilityModule (upval)
		if FriendStatus == nil then
			return nil
		end
		local Frame = Instance.new("Frame")
		Frame.BackgroundTransparency = 1
		local FriendStatus1 = nil
		local v1 = nil
		
		if FriendStatus == Enum.FriendStatus.Friend or FriendStatus == Enum.FriendStatus.FriendRequestSent then
			FriendStatus1 = Instance.new("TextButton")
			FriendStatus1.BackgroundTransparency = 1
			FriendStatus1.FontSize = ThemeModule.fontSize(Enum.FontSize.Size24)
			FriendStatus1.Font = ThemeModule.font(Enum.Font.SourceSans)
			FriendStatus1.TextColor3 = Color3.new(1, 1, 1)
			FriendStatus1.SelectionImageObject = Frame
			
			if FriendStatus == Enum.FriendStatus.Friend then
				FriendStatus1.Text = NewResults[RobloxLocaleId]:Format(ConstantsModule1.FriendLocalizedKey)
			else
				FriendStatus1.Text = "Request Sent"
			end
		elseif FriendStatus == Enum.FriendStatus.Unknown or FriendStatus == Enum.FriendStatus.NotFriend or FriendStatus == Enum.FriendStatus.FriendRequestReceived then
			FriendStatus1, v149 = UtilityModule:MakeStyledButton("FriendStatus", NewResults[RobloxLocaleId]:Format(ConstantsModule1.AddFriendLocalizedKey), UDim2.new(0, 182, 0, ThemeModule.ButtonHeight), function()
				-- upvalues: FriendStatus1 (ref), v1 (ref), GetFFlagDefaultFriendingLabelTextNonEmptyModule (upval), NewResults (upval), RobloxLocaleId (upval), ConstantsModule1 (upval), LocalPlayer (upval), Player (copy), RbxAnalyticsService (upval)
				if FriendStatus1 and v1 and v1.Text ~= "" then
					FriendStatus1.ImageTransparency = 1
					v1.Text = ""
					
					if GetFFlagDefaultFriendingLabelTextNonEmptyModule() then
						v1.Text = NewResults[RobloxLocaleId]:Format(ConstantsModule1.AddFriendLocalizedKey)
					end
					if LocalPlayer and Player then
						RbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsRequestFriendContext, ConstantsModule1.AnalyticsRequestFriendName, { category = "Game" })
						LocalPlayer:RequestFriendship(Player)
					end
				end
			end)
			v1.ZIndex = 3
			v1.Position += UDim2.new(0, 0, 0, 1)
		end
		if FriendStatus1 then
			FriendStatus1.Name = "FriendStatus"
			FriendStatus1.ZIndex = 3
			FriendStatus1.Size = UDim2.new(0, 150, 0, ThemeModule.ButtonHeight)
			FriendStatus1.Position = UDim2.new(1, -198, 0, 7)
			
			if v1 then
				v1.Position = UDim2.new(0, 0, 0, 0)
			end
		end
		return FriendStatus1
	end
	
	local function createFriendStatusImageLabel(FriendStatus, Player)
		-- upvalues: UtilityModule (upval), ThemeModule (upval), LocalPlayer (upval), RbxAnalyticsService (upval), ConstantsModule1 (upval)
		if FriendStatus == Enum.FriendStatus.Friend or FriendStatus == Enum.FriendStatus.FriendRequestSent then
			local v1 = "icons/menu/friends"
			local TextTransparency = 0
			
			if FriendStatus ~= Enum.FriendStatus.Friend then
				v1 = "icons/actions/friends/friendAdd"
				TextTransparency = 0.5
			end
			local FriendStatus1, _ = UtilityModule:MakeStyledImageButton("FriendStatus", v1, UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight), UDim2.new(0, 28, 0, 28))
			FriendStatus1.Name = "FriendStatus"
			FriendStatus1.Selectable = false
			FriendStatus1.FriendStatusTextLabel.TextTransparency = TextTransparency
			
			return FriendStatus1
		elseif FriendStatus == Enum.FriendStatus.Unknown or FriendStatus == Enum.FriendStatus.NotFriend or FriendStatus == Enum.FriendStatus.FriendRequestReceived then
			local Image = nil
			local Label = nil
			local FriendStatus2, _ = UtilityModule:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
				-- upvalues: Image (ref), Label (ref), LocalPlayer (upval), Player (copy), RbxAnalyticsService (upval), ConstantsModule1 (upval)
				if Image and Label and Image.ImageTransparency ~= 1 then
					Image.ImageTransparency = 1
					Label.TextTransparency = 1
					
					if LocalPlayer and Player then
						RbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsRequestFriendContext, ConstantsModule1.AnalyticsRequestFriendName, { category = "Game" })
						LocalPlayer:RequestFriendship(Player)
					end
				end
			end)
			FriendStatus2.Name = "FriendStatus"
			FriendStatus2.Selectable = true
			
			return FriendStatus2
		else
			local Image = nil
			
			return Image
		end
	end
	
	local SelectedCoreObject = nil
	local Object = nil
	local Object1 = nil
	local Object2 = nil
	local Images = {}
	local Players1 = VoiceAnalyticsModule.new(RbxAnalyticsService, "Players")
	local v1 = nil
	local v2 = false
	local v3 = nil
	local List = {}
	local Parent = nil
	local v4 = nil
	
	v3 = function(): boolean
		-- upvalues: NewPage (copy), SettingsHubPlayersButtonsResponsiveThreshold (upval), List (ref)
		return NewPage.Page.AbsoluteSize.X < SettingsHubPlayersButtonsResponsiveThreshold * #List
	end
	
	v1 = function()
		-- upvalues: List (ref), SelectedCoreObject (ref), Object (ref), Object1 (ref), GetFFlagEnableConsoleJoinVoiceModule (upval), Object2 (ref), v2 (ref), v3 (ref), Parent (ref), GetFFlagCleanupMuteSelfButtonModule (upval), v4 (ref), CheckButtonFrameBeforeDestroy (upval)
		List = {}
		
		if SelectedCoreObject then
			table.insert(List, SelectedCoreObject)
		end
		if Object then
			table.insert(List, Object)
		end
		if Object1 then
			table.insert(List, Object1)
		end
		if GetFFlagEnableConsoleJoinVoiceModule() and Object2 then
			table.insert(List, Object2)
		end
		v2 = v3()
		
		if #List > 0 then
			local _UDim2 = UDim2.new(1 / #List, 0, 0, 52)
			local config = {
				Size = UDim2.new(1, (#List - 1) * -20, 0, 52),
				AutomaticSize = Enum.AutomaticSize.None
			}
			local config1 = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20)
			}
			
			if v2 then
				_UDim2 = UDim2.new(1, 0, 0, 52)
				config = {
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}
				config1 = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16)
				}
			end
			local LayoutOrder = 1
			
			for _, value in List do
				value.Size = _UDim2
				value.Parent = Parent
				value.LayoutOrder = LayoutOrder
				LayoutOrder += 1
			end
			for i, value1 in config1 do
				if not GetFFlagCleanupMuteSelfButtonModule() then
					v4[i] = value1
				elseif v4 then
					v4[i] = value1
				end
			end
			for i1, value2 in config do
				if not GetFFlagCleanupMuteSelfButtonModule() then
					Parent[i1] = value2
				elseif Parent then
					Parent[i1] = value2
				end
			end
			return
		elseif not CheckButtonFrameBeforeDestroy then
			Parent:Destroy()
			Parent = nil
		elseif Parent then
			Parent:Destroy()
			Parent = nil
			
			return
		end
	end
	
	local _ = function(Object)
		return if Object and Object.Parent then Object:FindFirstChild("DisplayNameLabel") else nil
	end
	
	local _ = function(Entry)
		if #Entry == 0 then
			return ""
		end
		local Entry1 = Entry[1]
		
		if Entry1 == nil then
			return ""
		else
			local Names = Entry1.names
			
			return if Names == nil then "" else Names.getInExperienceCombinedName(false)
		end
	end
	
	local function resizeFriendButton(Parent, Player: Player, IsPortrait, p1)
		-- upvalues: LocalPlayer (upval), BlockingUtilityModule (upval), createFriendStatusImageLabel (copy), createFriendStatusTextLabel (copy), UtilityModule (upval)
		local FriendStatus = Parent:FindFirstChild("FriendStatus")
		
		if FriendStatus and IsPortrait == p1 then return end
		if FriendStatus then
			FriendStatus:Destroy()
			FriendStatus = nil
		end
		local FriendStatus1 = nil
		
		if Player and (Player ~= LocalPlayer and (Player.UserId > 0 and LocalPlayer.UserId > 0)) then
			local Success, Result = pcall(function()
				-- upvalues: LocalPlayer (upval), Player (copy)
				return LocalPlayer:GetFriendStatus(Player)
			end)
			FriendStatus1 = if Success then Result else Enum.FriendStatus.NotFriend
		end
		if BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId) == false then
			FriendStatus = if IsPortrait then createFriendStatusImageLabel(FriendStatus1, Player) else createFriendStatusTextLabel(FriendStatus1, Player)
		end
		if FriendStatus then
			FriendStatus.Name = "FriendStatus"
			FriendStatus.LayoutOrder = 5
			FriendStatus.Selectable = true
			UtilityModule:MakeFocusState(FriendStatus, "utility-focus-state" .. "-friendstatuslabel-" .. Player.Name)
			FriendStatus.Parent = Parent
		end
	end
	
	local function friendStatusCreate(Child, Player)
		-- upvalues: GuiService (upval), SelectedCoreObject (ref), resizeFriendButton (copy), UtilityModule (upval)
		local RightSideButtons = if Child then Child:FindFirstChild("RightSideButtons") else nil
		
		if RightSideButtons then
			for _, child in pairs(RightSideButtons:GetChildren()) do
				if child and child.Name == "FriendStatus" then
					if GuiService.SelectedCoreObject == child then
						GuiService.SelectedCoreObject = SelectedCoreObject
					end
					child:Destroy()
				end
			end
			resizeFriendButton(RightSideButtons, Player, UtilityModule:IsPortrait(), nil)
		end
	end
	
	LocalPlayer.FriendStatusChanged:connect(function(Player, _)
		-- upvalues: NewPage (copy), friendStatusCreate (copy)
		if Player then
			local Child = NewPage.Page:FindFirstChild("PlayerLabel" .. Player.Name)
			
			if Child then
				friendStatusCreate(Child, Player)
			end
		end
	end)
	local Callback = nil
	local Callback1 = nil
	local NewBlockingAnalytics = BlockingAnalyticsModule.new(LocalPlayer.UserId, { EventStream = RbxAnalyticsService })
	
	local function createBlockButton(Parent, Player: Player, p1, _)
		-- upvalues: BlockingUtilityModule (upval), Callback (ref), resizeFriendButton (copy), Callback1 (ref), GuiService (upval), OnBlockButtonActivatedModule (upval), NewBlockingAnalytics (copy), ConstantsModule1 (upval), UtilityModule (upval), RobloxTranslatorModule (upval), ThemeModule (upval)
		local function _(p2)
			-- upvalues: Callback (upval), Parent (copy), Player (copy), p1 (copy), resizeFriendButton (upval), Callback1 (upval)
			local CallbackResult = Callback(Parent, Player, p1, not p1)
			resizeFriendButton(Parent, Player, p1, not p1)
			
			if p2 then
				Callback1(CallbackResult)
			end
		end
		
		local function blockUser()
			-- upvalues: GuiService (upval), OnBlockButtonActivatedModule (upval), Player (copy), NewBlockingAnalytics (upval), ConstantsModule1 (upval), Callback (upval), Parent (copy), p1 (copy), resizeFriendButton (upval), Callback1 (upval)
			local HasSelectedCoreObject: boolean = GuiService.SelectedCoreObject ~= nil or GuiService.SelectedObject ~= nil
			OnBlockButtonActivatedModule(Player, NewBlockingAnalytics, ConstantsModule1.AnalyticsInGameMenuName):andThen(function()
				-- upvalues: HasSelectedCoreObject (copy), Callback (upval), Parent (upval), Player (upval), p1 (upval), resizeFriendButton (upval), Callback1 (upval)
				local CallbackResult = Callback(Parent, Player, p1, not p1)
				resizeFriendButton(Parent, Player, p1, not p1)
				
				if HasSelectedCoreObject then
					Callback1(CallbackResult)
				end
			end)
		end
		
		local function unBlockUser()
			-- upvalues: BlockingUtilityModule (upval), Player (copy), NewBlockingAnalytics (upval), Callback (upval), Parent (copy), p1 (copy), resizeFriendButton (upval)
			if BlockingUtilityModule:UnblockPlayerAsync(Player) then
				NewBlockingAnalytics:action("SettingsHub", "unblockUser", { blockeeUserId = Player.UserId })
				local _ = Callback(Parent, Player, p1, not p1)
				resizeFriendButton(Parent, Player, p1, not p1)
			end
		end
		
		return if BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId) then UtilityModule:MakeStyledButton("BlockButton", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, ThemeModule.ButtonHeight), unBlockUser) else UtilityModule:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), blockUser)
	end
	
	Callback1 = function(SelectedCoreObject)
		-- upvalues: GuiService (upval)
		if SelectedCoreObject and not SelectedCoreObject.Selectable then
			GuiService:Select(SelectedCoreObject)
			
			return
		else
			GuiService.SelectedCoreObject = SelectedCoreObject
		end
	end
	
	Callback = function(Parent, Player: Player, p1, p2)
		-- upvalues: LocalPlayer (upval), createBlockButton (copy), UtilityModule (upval)
		local BlockButton = Parent:FindFirstChild("BlockButton")
		
		if BlockButton and p1 == p2 then
			return BlockButton
		end
		if BlockButton then
			BlockButton:Destroy()
			BlockButton = nil
		end
		if Player and (Player ~= LocalPlayer and (Player.UserId > 0 and LocalPlayer.UserId > 0)) then
			BlockButton = createBlockButton(Parent, Player, p1, p2)
		end
		if BlockButton then
			BlockButton.Name = "BlockButton"
			BlockButton.LayoutOrder = 4
			BlockButton.Selectable = true
			UtilityModule:MakeFocusState(BlockButton, "utility-focus-state" .. "-blockbutton-" .. Player.Name)
			BlockButton.Parent = Parent
		end
		return BlockButton
	end
	
	local v5 = false
	local v6 = false
	
	local function muteButtonUpdate(Object, Participant)
		-- upvalues: MuteStatusIcons (upval), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (upval), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (upval), Default (upval), Images (copy), UtilityModule (upval), ThemeModule (upval), Players1 (copy), ConstantsModule (upval)
		local RightSideButtons = if Object then Object:FindFirstChild("RightSideButtons") else nil
		
		if not RightSideButtons then return end
		local MuteStatusButton = RightSideButtons:FindFirstChild("MuteStatusButton")
		
		if Participant ~= nil then
			local _UDim2 = UDim2.fromOffset(36, 36)
			local _UDim2_1 = UDim2.fromOffset(0, 0)
			local ImageTransparency = 0
			local MicOff = Participant.isMuted and MuteStatusIcons.MicOff or MuteStatusIcons.MicOn
			
			if Participant.subscriptionFailed then
				MicOff = MuteStatusIcons.Error
				_UDim2 = UDim2.fromOffset(36, 36)
				_UDim2_1 = UDim2.fromOffset(2, -2)
				
				if LuaFlagVoiceChatDisableSubscribeRetryForMultistream and VoiceChatMultistreamSubscriptionsEnabledEngineFeature then
					ImageTransparency = 0.5
				end
			elseif Participant.isMutedLocally then
				MicOff = MuteStatusIcons.MicDisabled
				ImageTransparency = 0.5
			elseif Participant.subscriptionCompleted then
				if Participant.isSignalActive then
					MicOff = Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * math.random()) * 20), "SpeakerLight")
				end
			else
				MicOff = MuteStatusIcons.Loading
			end
			if MuteStatusButton then
				local Image = Images[Participant.userId] or RightSideButtons:FindFirstChild("MuteStatusImageLabel", true)
				Image.Image = MicOff
				Image.Size = _UDim2
				Image.ImageTransparency = ImageTransparency
				
				return
			end
			if Default.voiceUIVisible then
				local MuteStatus, MuteStatus2 = UtilityModule:MakeStyledImageButton("MuteStatus", MicOff, UDim2.fromOffset(ThemeModule.ButtonHeight, ThemeModule.ButtonHeight), _UDim2, function()
					-- upvalues: Default (upval), Participant (copy), Players1 (upval), ConstantsModule (upval), LuaFlagVoiceChatDisableSubscribeRetryForMultistream (upval), VoiceChatMultistreamSubscriptionsEnabledEngineFeature (upval)
					local Participant1 = Default.participants[tostring(Participant.userId)]
					
					if Participant1.subscriptionCompleted then
						if Players1 then
							Players1:onToggleMutePlayer(Participant.userId, not Participant1.isMutedLocally)
						end
						Default:ToggleMutePlayer(Participant.userId, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
						
						return
					elseif Participant1.subscriptionFailed then
						if not LuaFlagVoiceChatDisableSubscribeRetryForMultistream then
							Default:SubscribeRetry(Participant.userId)
						elseif not VoiceChatMultistreamSubscriptionsEnabledEngineFeature then
							Default:SubscribeRetry(Participant.userId)
							
							return
						end
					end
				end)
				Images[Participant.userId] = MuteStatus2
				MuteStatus2.ZIndex = 3
				MuteStatus2.Position += _UDim2_1
				MuteStatus2.ImageTransparency = ImageTransparency
				UtilityModule:MakeFocusState(MuteStatus, "utility-focus-state" .. "-mutestatusbutton-" .. Participant.userId)
				MuteStatus.Parent = RightSideButtons
			end
			return
		elseif MuteStatusButton then
			MuteStatusButton:Destroy()
		end
	end
	
	local Parent1 = CreateFunction("Frame")({
		Name = "ButtonsContainer",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(1, 0, 0, ThemeModule.ButtonHeight),
		Parent = NewPage.Page
	})
	NewPage.ButtonsContainer = Parent1
	
	if IsSideSheetEnabledModule or FFlagRelocateMobileMenuButtonsModule and (FIntRelocateMobileMenuButtonsVariantModule == 1 or FIntRelocateMobileMenuButtonsVariantModule == 3) then
		Parent1.Parent = nil
	end
	CreateFunction("UIPadding")({
		PaddingBottom = UDim.new(0, 1),
		PaddingTop = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 1),
		PaddingRight = UDim.new(0, 1),
		Parent = Parent1
	})
	local LeaveButton, LeaveButton2 = UtilityModule:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -12, 1, 0), function()
		-- upvalues: GetFFlagEnableLeaveGameUpsellEntrypointModule (upval), NewPage (copy), ConstantsModule (upval)
		if GetFFlagEnableLeaveGameUpsellEntrypointModule() and NewPage.HubRef.leaveGameUpsellProp ~= ConstantsModule.PHONE_UPSELL_VALUE_PROP.None then
			NewPage.HubRef:SwitchToPage(NewPage.HubRef.LeaveGameUpsellPage, nil, 1, true)
			
			return
		else
			NewPage.HubRef:SwitchToPage(NewPage.HubRef.LeaveGamePage, false, 1)
		end
	end)
	LeaveButton.AnchorPoint = Vector2.new(0, 0)
	LeaveButton.Position = UDim2.new(0, 0, 0, 0)
	LeaveButton2.Size = UDim2.new(1, -4, 1, 0)
	LeaveButton2.Position = UDim2.new(0, 2, 0, 0)
	CreateFunction("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Parent = LeaveButton
	})
	CreateFunction("UIPadding")({ PaddingLeft = UDim.new(0.025, 0), Parent = LeaveButton })
	LeaveButton2.Size = UDim2.new(0, 0, 1, 0)
	CreateFunction("UIFlexItem")({ FlexMode = Enum.UIFlexMode.Grow, Parent = LeaveButton2 })
	
	if not FFlagRelocateMobileMenuButtonsModule or FIntRelocateMobileMenuButtonsVariantModule == 0 then
		LeaveButton.Parent = Parent1
	end
	local ResetButton, ResetButton2 = UtilityModule:MakeStyledButton("ResetButton", NewResults[RobloxLocaleId]:Format(ConstantsModule1.RespawnLocalizedKey), UDim2.new(0.3333333333333333, -12, 1, 0), function()
		-- upvalues: NewPage (copy)
		NewPage.HubRef:SwitchToPage(NewPage.HubRef.ResetCharacterPage, false, 1)
	end)
	ResetButton.AnchorPoint = Vector2.new(0.5, 0)
	ResetButton.Position = UDim2.new(0.5, 0, 0, 0)
	ResetButton2.Size = UDim2.new(1, -4, 1, 0)
	ResetButton2.Position = UDim2.new(0, 2, 0, 0)
	
	if not FFlagRelocateMobileMenuButtonsModule or FIntRelocateMobileMenuButtonsVariantModule == 0 then
		ResetButton.Parent = Parent1
	end
	local ResumeButton, ResumeButton2 = UtilityModule:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -12, 1, 0), function()
		-- upvalues: NewPage (copy), RbxAnalyticsService (upval), ConstantsModule1 (upval)
		NewPage.HubRef:SetVisibility(false)
		RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsResumeGameName, ConstantsModule1.AnalyticsMenuActionName, {
			source = ConstantsModule1.AnalyticsResumeButtonSource,
			playsessionid = NewPage.playSessionId,
			universeid = tostring(game.GameId)
		})
	end)
	ResumeButton.AnchorPoint = Vector2.new(1, 0)
	ResumeButton.Position = UDim2.new(1, 0, 0, 0)
	ResumeButton2.Size = UDim2.new(1, -4, 1, 0)
	ResumeButton2.Position = UDim2.new(0, 2, 0, 0)
	
	if not FFlagRelocateMobileMenuButtonsModule or FIntRelocateMobileMenuButtonsVariantModule == 0 then
		ResumeButton.Parent = Parent1
		
		if FFlagIEMTabFocusNav then
			NewPage.FirstSelectableObjects = { ResumeButton, ResetButton, LeaveButton }
			NewPage.FirstSelectableObjectsUpdated:fire()
		end
	end
	local function pollImage()
		-- upvalues: Default (upval), PlayerMuteStatusIcons (upval)
		local LocalMuted = Default.localMuted
		
		return if LocalMuted == nil then PlayerMuteStatusIcons.Loading elseif LocalMuted then PlayerMuteStatusIcons.MicOff elseif Default.isTalking then Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * math.random()) * 20), "MicLight") else PlayerMuteStatusIcons.MicOn
	end
	
	local _ = function(Text, Position, Size, AnchorPoint)
		-- upvalues: Parent1 (copy)
		local Child = Parent1:FindFirstChild(Text .. "Button", true)
		
		if Child then
			Child.Position = Position
			Child.Size = Size
			Child.AnchorPoint = AnchorPoint
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: Parent1 (copy)
		local PlayerMuteButtonButton = Parent1:FindFirstChild("PlayerMuteButtonButton", true)
		
		if PlayerMuteButtonButton then
			PlayerMuteButtonButton:Destroy()
		end
	end
	
	local function resetButtonRow()
		-- upvalues: FFlagRelocateMobileMenuButtonsModule (upval), FIntRelocateMobileMenuButtonsVariantModule (upval), Parent1 (copy)
		if not FFlagRelocateMobileMenuButtonsModule or FIntRelocateMobileMenuButtonsVariantModule == 0 then
			local _UDim2 = UDim2.new(1, 0, 0, 0)
			local _UDim2_1 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local _Vector2 = Vector2.new(1, 0)
			local ResumeButtonButton = Parent1:FindFirstChild("ResumeButtonButton", true)
			
			if ResumeButtonButton then
				ResumeButtonButton.Position = _UDim2
				ResumeButtonButton.Size = _UDim2_1
				ResumeButtonButton.AnchorPoint = _Vector2
			end
			local _UDim21 = UDim2.new(0.5, 0, 0, 0)
			local _UDim2_2 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local _Vector21 = Vector2.new(0.5, 0)
			local ResetButtonButton = Parent1:FindFirstChild("ResetButtonButton", true)
			
			if ResetButtonButton then
				ResetButtonButton.Position = _UDim21
				ResetButtonButton.Size = _UDim2_2
				ResetButtonButton.AnchorPoint = _Vector21
			end
			local _UDim22 = UDim2.new(0, 0, 0, 0)
			local _UDim2_3 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local _Vector22 = Vector2.new(0, 0)
			local LeaveButtonButton = Parent1:FindFirstChild("LeaveButtonButton", true)
			
			if LeaveButtonButton then
				LeaveButtonButton.Position = _UDim22
				LeaveButtonButton.Size = _UDim2_3
				LeaveButtonButton.AnchorPoint = _Vector22
			end
		end
		local PlayerMuteButtonButton = Parent1:FindFirstChild("PlayerMuteButtonButton", true)
		
		if PlayerMuteButtonButton then
			PlayerMuteButtonButton:Destroy()
		end
	end
	
	local _ = function()
		-- upvalues: GetFFlagCleanupMuteSelfButtonModule (upval), Parent (ref), pollImage (copy)
		local MuteSelfButtonImageLabel = nil
		
		if GetFFlagCleanupMuteSelfButtonModule() then
			if Parent then
				MuteSelfButtonImageLabel = Parent:FindFirstChild("MuteSelfButtonImageLabel", true)
			end
		else
			MuteSelfButtonImageLabel = Parent:FindFirstChild("MuteSelfButtonImageLabel", true)
		end
		if MuteSelfButtonImageLabel then
			MuteSelfButtonImageLabel.Image = pollImage()
			
			return
		end
	end
	
	UtilityModule:OnResized(Parent1, function(_, p1)
		-- upvalues: UtilityModule (upval), ThemeModule (upval), Parent1 (copy), FFlagRelocateMobileMenuButtonsModule (upval), FIntRelocateMobileMenuButtonsVariantModule (upval), ResetButton2 (copy), LeaveButton2 (copy), ResumeButton2 (copy)
		if (p1 or UtilityModule:IsSmallTouchScreen()) and not ThemeModule.AlwaysShowBottomBar() then
			local TextSizeResult = p1 and ThemeModule.textSize(18) or ThemeModule.textSize(24)
			Parent1.Visible = true
			Parent1.Size = UDim2.new(1, 0, 0, ThemeModule.ButtonHeight)
			
			if not FFlagRelocateMobileMenuButtonsModule or FIntRelocateMobileMenuButtonsVariantModule == 0 then
				ResetButton2.TextSize = TextSizeResult
				LeaveButton2.TextSize = TextSizeResult
				ResumeButton2.TextSize = TextSizeResult
				
				return
			end
		else
			Parent1.Visible = false
			Parent1.Size = UDim2.new(1, 0, 0, 0)
		end
	end)
	
	local function reportAbuseButtonCreate(Object, Player)
		-- upvalues: LocalPlayer (upval), ReportAbuseMenuContainerPageModule (upval), UtilityModule (upval), ThemeModule (upval)
		local RightSideButtons = Object:FindFirstChild("RightSideButtons")
		
		if RightSideButtons then
			local ReportPlayer = RightSideButtons:FindFirstChild("ReportPlayer")
			
			if ReportPlayer then
				ReportPlayer:Destroy()
			end
			if Player and (Player ~= LocalPlayer and (Player.UserId > 0 and LocalPlayer.UserId > 0)) then
				local ReportPlayer1 = UtilityModule:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
					-- upvalues: ReportAbuseMenuContainerPageModule (upval), Player (copy)
					ReportAbuseMenuContainerPageModule:ReportPlayer(Player, "MenuPlayerList")
				end)
				ReportPlayer1.Name = "ReportPlayer"
				ReportPlayer1.Position = UDim2.new(1, -260, 0, 7)
				ReportPlayer1.LayoutOrder = 3
				ReportPlayer1.Selectable = true
				UtilityModule:MakeFocusState(ReportPlayer1, "utility-focus-state" .. "-reportplayer-" .. Player.Name)
				ReportPlayer1.Parent = RightSideButtons
			end
		end
	end
	
	local v7 = nil
	local v8 = nil
	local v9 = nil
	local v10: (() -> any)? = nil
	local v11 = nil
	local Enabled = false
	local EventConnection = nil
	
	local _ = function()
		-- upvalues: Object (ref), v1 (ref)
		if Object then
			Object.Visible = false
			Object:Destroy()
			Object = nil
		end
		v1()
	end
	
	local _ = function()
		-- upvalues: Object1 (ref), EventConnection (ref), v1 (ref)
		if Object1 then
			Object1.Visible = false
			Object1:Destroy()
			Object1 = nil
		end
		if EventConnection then
			EventConnection:Disconnect()
			EventConnection = nil
		end
		v1()
	end
	
	local _ = function()
		-- upvalues: Object2 (ref), v1 (ref)
		if Object2 then
			Object2.Visible = false
			Object2:Destroy()
			Object2 = nil
		end
		v1()
	end
	
	local function shouldShowJoinVoiceButton()
		-- upvalues: GetFFlagEnableConsoleJoinVoiceModule (upval), Enabled (ref), EnabledResult (upval), Default (upval)
		return GetFFlagEnableConsoleJoinVoiceModule() and (game:GetEngineFeature("VoiceChatSupported") and (not Enabled and (not EnabledResult and (Default:verifyUniverseAndPlaceCanUseVoice() and (Default:ShouldShowJoinVoiceOnDisconnect() and (Default:GetVoiceConnectCookie() == "" and Default:HasSeamlessVoiceFeature("InitialJoinVoice")))))))
	end
	
	local function createRow(p1, p2, p3)
		-- upvalues: ThemeModule (upval), CreateFunction (upval)
		local NewInstance = Instance.new(p1)
		NewInstance.Size = UDim2.new(1, 0, 0, 62)
		NewInstance.Position = UDim2.new(0, 0, 0, 0)
		NewInstance.ZIndex = 2
		NewInstance.BackgroundColor3 = ThemeModule.color("PlayerRowFrame")
		NewInstance.BackgroundTransparency = ThemeModule.transparency("PlayerRowFrame")
		CreateFunction("UICorner")({
			CornerRadius = ThemeModule.DefaultCornerRadius,
			Parent = NewInstance
		})
		local Icon = nil
		
		if p3 then
			Icon = Instance.new("TextLabel")
			Icon.TextColor3 = Color3.new(1, 1, 1)
			Icon.TextSize = 24
		else
			Icon = Instance.new("ImageLabel")
		end
		Icon.Name = "Icon"
		Icon.BackgroundTransparency = 1
		Icon.Size = UDim2.new(0, 36, 0, 36)
		Icon.Position = UDim2.new(0, 12, 0, 12)
		Icon.ZIndex = 3
		Icon.Parent = NewInstance
		local Label = Instance.new("TextLabel")
		Label.Text = ""
		Label.TextXAlignment = Enum.TextXAlignment.Left
		Label.Font = ThemeModule.font(Enum.Font.SourceSans, "DisplayName")
		Label.FontSize = p2 and ThemeModule.fontSize(Enum.FontSize.Size36, "DisplayName") or ThemeModule.fontSize(Enum.FontSize.Size24, "DisplayName")
		Label.TextColor3 = Color3.new(1, 1, 1)
		Label.BackgroundTransparency = 1
		Label.Position = p2 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0)
		Label.Size = UDim2.new(0, 0, 0, 0)
		Label.ZIndex = 3
		Label.Parent = NewInstance
		
		if p2 then
			local SecondRow = Instance.new("TextLabel")
			SecondRow.Text = ""
			SecondRow.Name = "SecondRow"
			SecondRow.TextXAlignment = Enum.TextXAlignment.Left
			SecondRow.Font = ThemeModule.font(Enum.Font.SourceSans)
			SecondRow.FontSize = ThemeModule.fontSize(Enum.FontSize.Size24, "Username")
			SecondRow.TextColor3 = Color3.fromRGB(162, 162, 162)
			SecondRow.BackgroundTransparency = 1
			SecondRow.Position = UDim2.new(0, 60, 0.5, 12)
			SecondRow.Size = UDim2.new(0, 0, 0, 0)
			SecondRow.ZIndex = 3
			SecondRow.Parent = NewInstance
		end
		return NewInstance
	end
	
	v7 = function()
		-- upvalues: createRow (copy), Enabled (ref), GetFFlagEnableConsoleJoinVoiceModule (upval), shouldShowJoinVoiceButton (copy), _UDim2 (upval), ThemeModule (upval), NewResults (copy), RobloxLocaleId (copy), ConstantsModule1 (upval), Uiblox (upval), BuilderIconsModule (upval), UtilityModule (upval)
		local ImageButton = createRow("ImageButton", nil, true)
		ImageButton.Size = UDim2.new(1, 0, 0, 52)
		local TextLabel = ImageButton.TextLabel
		local Icon = ImageButton.Icon
		
		if Enabled or GetFFlagEnableConsoleJoinVoiceModule() and shouldShowJoinVoiceButton() then
			ImageButton.Size = _UDim2
			TextLabel.Size = UDim2.new(1, -60, 0, 0)
			TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
			ImageButton.AnchorPoint = Vector2.new(0, 0)
		end
		TextLabel.Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		TextLabel.AutoLocalize = false
		TextLabel.Text = NewResults[RobloxLocaleId]:Format(ConstantsModule1.InviteFriendsLocalizedKey)
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.Position = UDim2.new(0, 18, 0.5, 0)
		local IconsActionsFriendsFriendInvite = Uiblox["icons/actions/friends/friendInvite"]
		local IconsActionsFriendsFriendInvite1 = if IconsActionsFriendsFriendInvite then Uiblox["icons/actions/friends/friendInvite"] else ThemeModule.Images["icons/actions/friends/friendInvite"]
		
		if IconsActionsFriendsFriendInvite1 then
			if IconsActionsFriendsFriendInvite then
				Icon.Text = IconsActionsFriendsFriendInvite1.name
				Icon.FontFace = BuilderIconsModule.Font[IconsActionsFriendsFriendInvite1.variant]
			else
				Icon.Image = IconsActionsFriendsFriendInvite1.Image
				Icon.ImageRectOffset = IconsActionsFriendsFriendInvite1.ImageRectOffset
				Icon.ImageRectSize = IconsActionsFriendsFriendInvite1.ImageRectSize
			end
		end
		local function _(p1)
			-- upvalues: ImageButton (copy)
			if p1 then
				ImageButton.ImageTransparency = 0.65
				
				return
			else
				ImageButton.ImageTransparency = 0.85
			end
		end
		
		ImageButton.InputBegan:Connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.65
		end)
		ImageButton.InputEnded:Connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.85
		end)
		ImageButton.Activated:Connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.85
		end)
		ImageButton.TouchPan:Connect(function(_, TotalTranslation)
			-- upvalues: ImageButton (copy)
			if math.abs(TotalTranslation.Y) > 20 then
				ImageButton.ImageTransparency = 0.85
			end
		end)
		ImageButton.SelectionGained:connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.65
		end)
		ImageButton.SelectionLost:connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.85
		end)
		ImageButton.SelectionImageObject = ImageButton:Clone()
		UtilityModule:MakeFocusState(ImageButton, "utility-focus-state-sharegame")
		
		return ImageButton
	end
	
	v8 = function()
		-- upvalues: createRow (copy), SelectedCoreObject (ref), ThemeModule (upval), RobloxTranslatorModule (upval), Default (upval), UtilityModule (upval)
		local ImageButton = createRow("ImageButton")
		ImageButton.Size = UDim2.new(if SelectedCoreObject then 0.5 else 1, -10, 0, 52)
		ImageButton.Position = UDim2.new(1, 0, 0, 0)
		ImageButton.AnchorPoint = Vector2.new(1, 0)
		local TextLabel = ImageButton.TextLabel
		local Icon = ImageButton.Icon
		TextLabel.Size = UDim2.new(1, -60, 0, 0)
		TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
		TextLabel.Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		TextLabel.AutoLocalize = false
		TextLabel.Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		Icon.Size = UDim2.new(0, 32, 0, 32)
		Icon.Position = UDim2.new(0, 18, 0, 16)
		Icon.Image = Default:GetIcon("UnmuteAll", "Misc")
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.Position = UDim2.new(0, 18, 0.5, 0)
		
		local function _(p1)
			-- upvalues: ImageButton (copy)
			if p1 then
				ImageButton.ImageTransparency = 0.65
				
				return
			else
				ImageButton.ImageTransparency = 0.85
			end
		end
		
		ImageButton.InputBegan:Connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.65
		end)
		ImageButton.InputEnded:Connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.85
		end)
		ImageButton.Activated:Connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.85
		end)
		ImageButton.TouchPan:Connect(function(_, TotalTranslation)
			-- upvalues: ImageButton (copy)
			if math.abs(TotalTranslation.Y) > 20 then
				ImageButton.ImageTransparency = 0.85
			end
		end)
		ImageButton.SelectionGained:connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.65
		end)
		ImageButton.SelectionLost:connect(function()
			-- upvalues: ImageButton (copy)
			ImageButton.ImageTransparency = 0.85
		end)
		ImageButton.SelectionImageObject = ImageButton:Clone()
		UtilityModule:MakeFocusState(ImageButton, "utility-focus-state-muteall")
		
		return ImageButton
	end
	
	v9 = function()
		-- upvalues: createRow (copy), ThemeModule (upval), pollImage (copy), UtilityModule (upval), NewResults (copy), RobloxLocaleId (copy), Default (upval), EventConnection (ref), v5 (ref), GetFFlagCleanupMuteSelfButtonModule (upval), Parent (ref), Players1 (copy), Object1 (ref)
		local MuteSelfButton = createRow("ImageButton")
		MuteSelfButton.Name = "MuteSelfButton"
		MuteSelfButton.Size = UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight)
		MuteSelfButton.Position = UDim2.new(1, 0, 0, 0)
		MuteSelfButton.AnchorPoint = Vector2.new(1, 0)
		local TextLabel = MuteSelfButton.TextLabel
		local MuteSelfButtonImageLabel = MuteSelfButton.Icon
		TextLabel.Size = UDim2.new(1, -60, 0, 0)
		TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
		TextLabel.Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		TextLabel.AutoLocalize = false
		MuteSelfButtonImageLabel.Name = "MuteSelfButtonImageLabel"
		MuteSelfButtonImageLabel.Size = UDim2.new(0, 32, 0, 32)
		MuteSelfButtonImageLabel.Position = UDim2.new(0, 18, 0, 16)
		MuteSelfButtonImageLabel.Image = pollImage()
		MuteSelfButtonImageLabel.AnchorPoint = Vector2.new(0, 0.5)
		MuteSelfButtonImageLabel.Position = UDim2.new(0, 18, 0.5, 0)
		
		local function _(p1)
			-- upvalues: MuteSelfButton (copy)
			if p1 then
				MuteSelfButton.ImageTransparency = 0.65
				
				return
			else
				MuteSelfButton.ImageTransparency = 0.85
			end
		end
		
		MuteSelfButton.InputBegan:Connect(function()
			-- upvalues: MuteSelfButton (copy)
			MuteSelfButton.ImageTransparency = 0.65
		end)
		MuteSelfButton.InputEnded:Connect(function()
			-- upvalues: MuteSelfButton (copy)
			MuteSelfButton.ImageTransparency = 0.85
		end)
		MuteSelfButton.Activated:Connect(function()
			-- upvalues: MuteSelfButton (copy)
			MuteSelfButton.ImageTransparency = 0.85
		end)
		MuteSelfButton.TouchPan:Connect(function(_, TotalTranslation)
			-- upvalues: MuteSelfButton (copy)
			if math.abs(TotalTranslation.Y) > 20 then
				MuteSelfButton.ImageTransparency = 0.85
			end
		end)
		MuteSelfButton.SelectionGained:connect(function()
			-- upvalues: MuteSelfButton (copy)
			MuteSelfButton.ImageTransparency = 0.65
		end)
		MuteSelfButton.SelectionLost:connect(function()
			-- upvalues: MuteSelfButton (copy)
			MuteSelfButton.ImageTransparency = 0.85
		end)
		MuteSelfButton.SelectionImageObject = MuteSelfButton:Clone()
		UtilityModule:MakeFocusState(MuteSelfButton, "utility-focus-state-playermute")
		
		local _ = function(p1)
			-- upvalues: TextLabel (copy), NewResults (upval), RobloxLocaleId (upval)
			TextLabel.Text = NewResults[RobloxLocaleId]:Format(if p1 then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end
		
		TextLabel.Text = NewResults[RobloxLocaleId]:Format(if Default.localMuted then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		EventConnection = Default.muteChanged.Event:Connect(function(p1)
			-- upvalues: v5 (upval), GetFFlagCleanupMuteSelfButtonModule (upval), Parent (upval), pollImage (upval), TextLabel (copy), NewResults (upval), RobloxLocaleId (upval)
			v5 = p1
			local MuteSelfButtonImageLabel = nil
			
			if GetFFlagCleanupMuteSelfButtonModule() then
				if Parent then
					MuteSelfButtonImageLabel = Parent:FindFirstChild("MuteSelfButtonImageLabel", true)
				end
			else
				MuteSelfButtonImageLabel = Parent:FindFirstChild("MuteSelfButtonImageLabel", true)
			end
			if MuteSelfButtonImageLabel then
				MuteSelfButtonImageLabel.Image = pollImage()
			end
			TextLabel.Text = NewResults[RobloxLocaleId]:Format(if p1 then "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" else "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end)
		MuteSelfButton.Activated:Connect(function()
			-- upvalues: Default (upval), Players1 (upval), v5 (upval)
			Default:ToggleMic("InGameMenuPlayers")
			
			if Players1 then
				Players1:onToggleMuteSelf(v5)
			end
		end)
		
		if GetFFlagCleanupMuteSelfButtonModule() then
			return MuteSelfButton
		else
			Object1 = MuteSelfButton
		end
	end
	
	local _ = function()
		-- upvalues: EnabledResult (upval), GetFFlagCleanupMuteSelfButtonModule (upval), Object1 (ref), v9 (ref)
		if EnabledResult then return end
		if GetFFlagCleanupMuteSelfButtonModule() then
			Object1 = v9()
			
			return
		else
			v9()
		end
	end
	
	if GetFFlagEnableConsoleJoinVoiceModule() then
		v10 = function()
			-- upvalues: createRow (copy), _UDim2 (upval), ThemeModule (upval), EnableConsoleJoinVoiceTranslation (upval), NewResults (copy), RobloxLocaleId (copy), Uiblox (upval), BuilderIconsModule (upval), UtilityModule (upval), Default (upval), ConstantsModule (upval)
			local ImageButton = createRow("ImageButton", nil, true)
			ImageButton.Size = UDim2.new(1, 0, 0, 52)
			ImageButton.Size = _UDim2
			ImageButton.AnchorPoint = Vector2.new(0, 0)
			local TextLabel = ImageButton.TextLabel
			TextLabel.Size = UDim2.new(1, -60, 0, 0)
			TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
			TextLabel.Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
			TextLabel.AutoLocalize = false
			
			if EnableConsoleJoinVoiceTranslation then
				TextLabel.Text = NewResults[RobloxLocaleId]:Format("Feature.SettingsHub.Action.ConnectVoiceChat")
			else
				TextLabel.Text = "Connect Voice Chat"
			end
			local Icon = ImageButton.Icon
			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.Position = UDim2.new(0, 18, 0.5, 0)
			local IconsControlsPublicAudioJoin = Uiblox["icons/controls/publicAudioJoin"]
			local IconsControlsPublicAudioJoin1 = if IconsControlsPublicAudioJoin then Uiblox["icons/controls/publicAudioJoin"] else ThemeModule.Images["icons/controls/publicAudioJoin"]
			
			if IconsControlsPublicAudioJoin1 then
				if IconsControlsPublicAudioJoin then
					Icon.Text = IconsControlsPublicAudioJoin1.name
					Icon.FontFace = BuilderIconsModule.Font[IconsControlsPublicAudioJoin1.variant]
				else
					Icon.Image = IconsControlsPublicAudioJoin1.Image
					Icon.ImageRectOffset = IconsControlsPublicAudioJoin1.ImageRectOffset
					Icon.ImageRectSize = IconsControlsPublicAudioJoin1.ImageRectSize
				end
			end
			local function _(p1)
				-- upvalues: ImageButton (copy)
				if p1 then
					ImageButton.ImageTransparency = 0.65
					
					return
				else
					ImageButton.ImageTransparency = 0.85
				end
			end
			
			ImageButton.InputBegan:Connect(function()
				-- upvalues: ImageButton (copy)
				ImageButton.ImageTransparency = 0.65
			end)
			ImageButton.InputEnded:Connect(function()
				-- upvalues: ImageButton (copy)
				ImageButton.ImageTransparency = 0.85
			end)
			ImageButton.Activated:Connect(function()
				-- upvalues: ImageButton (copy)
				ImageButton.ImageTransparency = 0.85
			end)
			ImageButton.TouchPan:Connect(function(_, TotalTranslation)
				-- upvalues: ImageButton (copy)
				if math.abs(TotalTranslation.Y) > 20 then
					ImageButton.ImageTransparency = 0.85
				end
			end)
			ImageButton.SelectionGained:connect(function()
				-- upvalues: ImageButton (copy)
				ImageButton.ImageTransparency = 0.65
			end)
			ImageButton.SelectionLost:connect(function()
				-- upvalues: ImageButton (copy)
				ImageButton.ImageTransparency = 0.85
			end)
			ImageButton.SelectionImageObject = ImageButton:Clone()
			UtilityModule:MakeFocusState(ImageButton, "utility-focus-state-joinVoice")
			ImageButton.Activated:Connect(function()
				-- upvalues: Default (upval), ConstantsModule (upval)
				Default.pendingConnectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
				Default:JoinVoice()
			end)
			
			return ImageButton
		end
	end
	local _ = function()
		-- upvalues: shouldShowJoinVoiceButton (copy), Object2 (ref), v10 (ref)
		if shouldShowJoinVoiceButton() and not Object2 then
			Object2 = v10()
			
			return
		end
	end
	
	local _ = function(p1)
		-- upvalues: UtilityModule (upval), ThemeModule (upval)
		return (UtilityModule:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), p1))
	end
	
	local function resizeInspectButton(Parent, Player, p1, p2)
		-- upvalues: RbxAnalyticsService (upval), ConstantsModule1 (upval), NewPage (copy), GuiService (upval), UtilityModule (upval), ThemeModule (upval)
		local Inspect = Parent:FindFirstChild("Inspect")
		
		if Inspect and p1 == p2 then return end
		if Inspect then
			Inspect:Destroy()
		end
		local Inspect1 = UtilityModule:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, ThemeModule.ButtonHeight, 0, ThemeModule.ButtonHeight), UDim2.new(0, 28, 0, 28), function()
			-- upvalues: RbxAnalyticsService (upval), ConstantsModule1 (upval), NewPage (upval), GuiService (upval), Player (copy)
			RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsExamineAvatarName, ConstantsModule1.AnalyticsMenuActionName, {
				playsessionid = NewPage.playSessionId,
				universeid = tostring(game.GameId)
			})
			GuiService:InspectPlayerFromUserIdWithCtx(Player.UserId, "escapeMenu")
			NewPage.HubRef:SetVisibility(false)
		end)
		Inspect1.Name = "Inspect"
		Inspect1.LayoutOrder = 2
		Inspect1.Selectable = true
		Inspect1.Parent = Parent
		UtilityModule:MakeFocusState(Inspect1, "utility-focus-state" .. "-inspect-" .. Player.Name)
	end
	
	local function resizePlatformName(RightSideButtons, PlatformName, PlatformProfileId)
		-- upvalues: Result (upval), UtilityModule (upval), ThemeModule (upval), CreateFunction (upval)
		local PlatformNameContainer = RightSideButtons:FindFirstChild("PlatformNameContainer")
		
		if PlatformNameContainer then
			PlatformNameContainer:Destroy()
		end
		if PlatformName == nil then return end
		local PlatformNameContainer1 = Instance.new("Frame")
		PlatformNameContainer1.Name = "PlatformNameContainer"
		PlatformNameContainer1.BackgroundTransparency = 1
		PlatformNameContainer1.ZIndex = 3
		PlatformNameContainer1.Position = UDim2.new(0, 0, 0, 0)
		PlatformNameContainer1.Size = UDim2.new(0, 0, 1, 0)
		PlatformNameContainer1.AutomaticSize = Enum.AutomaticSize.X
		PlatformNameContainer1.Selectable = false
		PlatformNameContainer1.LayoutOrder = -1
		PlatformNameContainer1.Parent = RightSideButtons
		local ConsoleNameContainer, ConsoleNameContainer2 = UtilityModule:MakeStyledButton("consoleNameContainer", PlatformName, UDim2.new(0, 0, 0, ThemeModule.ButtonHeight), if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and Result and Result:IsProfileEnabled() and PlatformProfileId and PlatformProfileId ~= "" then function()
			-- upvalues: Result (upval), PlatformProfileId (copy)
			Result:ShowProfile(PlatformProfileId)
		end else nil)
		ConsoleNameContainer.AnchorPoint = Vector2.new(0, 0.5)
		ConsoleNameContainer.Position = UDim2.fromScale(0, 0.5)
		ConsoleNameContainer.AutomaticSize = Enum.AutomaticSize.X
		ConsoleNameContainer.Parent = PlatformNameContainer1
		ConsoleNameContainer2.Size = UDim2.fromScale(0, 1)
		ConsoleNameContainer2.AutoLocalize = false
		ConsoleNameContainer2.TextSize = ThemeModule.platformNameTextSize
		ConsoleNameContainer2.TextScaled = false
		ConsoleNameContainer2.TextWrapped = false
		ConsoleNameContainer2.AutomaticSize = Enum.AutomaticSize.X
		local v12 = CreateFunction("ImageLabel")({
			Name = "iconLabel",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = ThemeModule.platformNameIconSize,
			ImageColor3 = Color3.new(1, 1, 1)
		})
		v12.Parent = ConsoleNameContainer
		CreateFunction("UIListLayout")({
			Name = "PLatformNameUIListLayout",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}).Parent = ConsoleNameContainer
		v12.LayoutOrder = 1
		ConsoleNameContainer2.LayoutOrder = 2
		CreateFunction("UIPadding")({
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			Parent = ConsoleNameContainer
		})
		
		return PlatformNameContainer1
	end
	
	v11 = function()
		-- upvalues: createRow (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), OpenTypeSupport (upval), GuiService (upval)
		local ImageLabel = createRow("ImageLabel", true)
		ImageLabel.TextLabel.Name = "DisplayNameLabel"
		ImageLabel.SecondRow.Name = "NameLabel"
		ImageLabel.Selectable = false
		ImageLabel.SelectionGroup = true
		
		if GetFFlagLuaAppEnableOpenTypeSupportFunction() then
			ImageLabel.NameLabel.OpenTypeFeatures = OpenTypeSupport:getUserNameStylisticAlternative()
		end
		local RightSideButtons = Instance.new("Frame")
		RightSideButtons.Name = "RightSideButtons"
		RightSideButtons.BackgroundTransparency = 1
		RightSideButtons.ZIndex = 2
		RightSideButtons.Position = UDim2.new(0, 0, 0, 0)
		RightSideButtons.Size = UDim2.new(1, -12, 1, 0)
		RightSideButtons.Parent = ImageLabel
		
		local function _(SelectedCoreObject)
			-- upvalues: ImageLabel (copy), GuiService (upval), RightSideButtons (copy)
			if ImageLabel then
				if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject ~= SelectedCoreObject and GuiService.SelectedCoreObject.Parent == RightSideButtons then
					ImageLabel.ImageTransparency = 0.65
					
					return
				end
				ImageLabel.ImageTransparency = 0.85
			end
		end
		
		local Frame = nil
		RightSideButtons.ChildAdded:connect(function(Child)
			-- upvalues: Frame (ref), ImageLabel (copy), GuiService (upval), RightSideButtons (copy)
			if Child:IsA("GuiObject") then
				if Frame and Child ~= Frame then
					Frame:Destroy()
					Frame = nil
				end
				Child.SelectionGained:connect(function()
					-- upvalues: ImageLabel (upval), GuiService (upval), RightSideButtons (upval)
					if ImageLabel then
						if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject ~= nil and GuiService.SelectedCoreObject.Parent == RightSideButtons then
							ImageLabel.ImageTransparency = 0.65
							
							return
						end
						ImageLabel.ImageTransparency = 0.85
					end
				end)
				Child.SelectionLost:connect(function()
					-- upvalues: Child (copy), ImageLabel (upval), GuiService (upval), RightSideButtons (upval)
					if ImageLabel then
						if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject ~= Child and GuiService.SelectedCoreObject.Parent == RightSideButtons then
							ImageLabel.ImageTransparency = 0.65
							
							return
						end
						ImageLabel.ImageTransparency = 0.85
					end
				end)
			end
		end)
		Frame = Instance.new("Frame")
		Frame.Selectable = true
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.BackgroundTransparency = 1
		Frame.SelectionImageObject = Frame:Clone()
		Frame.Parent = RightSideButtons
		local RightSideListLayout = Instance.new("UIListLayout")
		RightSideListLayout.Name = "RightSideListLayout"
		RightSideListLayout.FillDirection = Enum.FillDirection.Horizontal
		RightSideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		RightSideListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		RightSideListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		RightSideListLayout.Padding = UDim.new(0, 12)
		RightSideListLayout.Parent = RightSideButtons
		pcall(function()
			-- upvalues: ImageLabel (copy)
			ImageLabel.NameLabel.Localize = false
			ImageLabel.DisplayNameLabel.Localize = false
		end)
		
		return ImageLabel
	end
	
	local function managePlayerNameCutoff(Object, Player: Player)
		-- upvalues: CheckForNilUserIdOnPlayerList (upval), UserProfileStore (upval), IsEngineTruncationEnabledForIngameSettingsModule (upval), UtilityModule (upval), PlayerListRefactorUsernameFormatting (upval), FormatUsernameFunction (upval)
		local v12 = nil
		local ChildAddedConnection = nil
		
		local function reportFlagChanged(Frame, p1, Text: string)
			-- upvalues: v12 (ref), Object (copy), Player (copy)
			if p1 == "AbsolutePosition" and v12 then
				local XDelta = Frame.AbsolutePosition.X - 20 - Object.NameLabel.AbsolutePosition.X
				Object.NameLabel.Text = "@" .. Player.Name
				Object.DisplayNameLabel.Text = Player.DisplayName
				
				if Text then
					Object.DisplayNameLabel.Text = Text
				end
				local Length: number = if Text then utf8.len(Text) else utf8.len(Player.DisplayName)
				while XDelta < Object.NameLabel.TextBounds.X and Length > 0 do
					if Text then
						Object.NameLabel.Text = string.sub(Text, 1, (utf8.offset(Text, Length))) .. "..."
					else
						Object.NameLabel.Text = string.sub(Player.DisplayName, 1, (utf8.offset(Player.DisplayName, Length))) .. "..."
					end
					Length -= 1
				end
				local Text1 = "@" .. Player.Name
				local Length1 = string.len(Text1)
				while XDelta < Object.NameLabel.TextBounds.X and Length1 > 0 do
					Object.NameLabel.Text = string.sub(Text1, 1, Length1) .. "..."
					Length1 -= 1
				end
			end
		end
		
		local function reportFlagChangedWithCombinedName(Frame: Frame, _, _)
			-- upvalues: CheckForNilUserIdOnPlayerList (upval), Player (copy), reportFlagChanged (copy), UserProfileStore (upval), Object (copy)
			if CheckForNilUserIdOnPlayerList and not Player.UserId then
				reportFlagChanged(Frame, "AbsolutePosition")
				
				return
			else
				UserProfileStore.get().fetchNamesByUserIds({ (tostring(Player.UserId)) }, function(p2)
					-- upvalues: Object (upval), reportFlagChanged (upval), Frame (copy), Player (upval)
					local DisplayNameLabel = if Object and Object.Parent then Object:FindFirstChild("DisplayNameLabel") else nil
					
					if DisplayNameLabel == nil then return end
					local Data = p2.data
					local Text = nil
					
					if #Data == 0 then
						Text = ""
					else
						local Entry = Data[1]
						
						if Entry == nil then
							Text = ""
						else
							local Names = Entry.names
							Text = if Names == nil then "" else Names.getInExperienceCombinedName(false)
						end
					end
					if string.len(Text) > 0 and Text ~= DisplayNameLabel.Text then
						reportFlagChanged(Frame, "AbsolutePosition", Text)
						
						return
					end
					if Player.DisplayName ~= DisplayNameLabel.Text then
						reportFlagChanged(Frame, "AbsolutePosition")
					end
				end)
			end
		end
		
		if not IsEngineTruncationEnabledForIngameSettingsModule() then
			UtilityModule:OnResized(Object.NameLabel, function(_, p2)
				-- upvalues: v12 (ref), UtilityModule (upval), ChildAddedConnection (ref), Object (copy), reportFlagChangedWithCombinedName (copy), Player (copy), CheckForNilUserIdOnPlayerList (upval), UserProfileStore (upval)
				if v12 ~= nil and v12 == p2 then return end
				local Inverted: boolean = p2 and not (UtilityModule:IsSmallTouchScreen() and UtilityModule:IsPortrait())
				v12 = Inverted
				
				if Inverted then
					if ChildAddedConnection == nil then
						ChildAddedConnection = Object.RightSideButtons.ChildAdded:connect(function(Child: Frame)
							-- upvalues: reportFlagChangedWithCombinedName (upval)
							if Child.Name == "Inspect" then
								Child.Changed:connect(function(_)
									-- upvalues: reportFlagChangedWithCombinedName (upval), Child (copy)
									reportFlagChangedWithCombinedName(Child, "AbsolutePosition")
								end)
								reportFlagChangedWithCombinedName(Child, "AbsolutePosition")
							end
						end)
					end
					local Inspect = Object.RightSideButtons:FindFirstChild("Inspect")
					
					if Inspect then
						Inspect.Changed:connect(function(p3)
							-- upvalues: reportFlagChangedWithCombinedName (upval), Inspect (copy)
							reportFlagChangedWithCombinedName(Inspect, p3)
						end)
						reportFlagChangedWithCombinedName(Inspect, "AbsolutePosition")
						
						return
					end
				elseif not Object:FindFirstChild("NameLabel") then return end
				Object.NameLabel.Text = "@" .. Player.Name
				
				if CheckForNilUserIdOnPlayerList and not Player.UserId then
					Object.DisplayNameLabel.Text = Player.DisplayName
					
					return
				end
				UserProfileStore.get().fetchNamesByUserIds({ (tostring(Player.UserId)) }, function(p3)
					-- upvalues: Object (upval), Player (upval)
					local DisplayNameLabel = if Object and Object.Parent then Object:FindFirstChild("DisplayNameLabel") else nil
					
					if DisplayNameLabel == nil then return end
					local Data = p3.data
					local Text = nil
					
					if #Data == 0 then
						Text = ""
					else
						local Entry = Data[1]
						
						if Entry == nil then
							Text = ""
						else
							local Names = Entry.names
							Text = if Names == nil then "" else Names.getInExperienceCombinedName(false)
						end
					end
					if string.len(Text) > 0 and Text ~= DisplayNameLabel.Text then
						DisplayNameLabel.Text = Text
						
						return
					end
					local DisplayName = Player.DisplayName
					
					if DisplayName ~= DisplayNameLabel.Text then
						DisplayNameLabel.Text = DisplayName
					end
				end)
			end)
		end
		local function getNearestRightSideButtonXPosition()
			-- upvalues: Object (copy)
			local X = nil
			
			for _, Button in pairs(Object.RightSideButtons:GetChildren()) do
				if Button:IsA("ImageButton") and (not X or Button.AbsolutePosition.X < X) then
					X = Button.AbsolutePosition.X
				end
			end
			return X
		end
		
		local v13 = nil
		
		local function rightSideButtonsChanged()
			-- upvalues: getNearestRightSideButtonXPosition (copy), v13 (ref), Object (copy), PlayerListRefactorUsernameFormatting (upval), FormatUsernameFunction (upval), Player (copy), CheckForNilUserIdOnPlayerList (upval), UserProfileStore (upval)
			local NearestRightSideButtonXPosition = getNearestRightSideButtonXPosition()
			
			if NearestRightSideButtonXPosition == v13 then return end
			v13 = NearestRightSideButtonXPosition
			local _UDim2: UDim2 = if NearestRightSideButtonXPosition then UDim2.new(0, NearestRightSideButtonXPosition - Object.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0)
			Object.NameLabel.Size = _UDim2
			Object.DisplayNameLabel.Size = _UDim2
			Object.NameLabel.Text = if PlayerListRefactorUsernameFormatting then FormatUsernameFunction(Player.Name) else "@" .. Player.Name
			
			if CheckForNilUserIdOnPlayerList and not Player.UserId then
				Object.DisplayNameLabel.Text = Player.DisplayName
				
				return
			else
				UserProfileStore.get().fetchNamesByUserIds({ (tostring(Player.UserId)) }, function(p2)
					-- upvalues: Object (upval), Player (upval)
					local DisplayNameLabel = if Object and Object.Parent then Object:FindFirstChild("DisplayNameLabel") else nil
					
					if DisplayNameLabel == nil then return end
					local Data = p2.data
					local Text = nil
					
					if #Data == 0 then
						Text = ""
					else
						local Entry = Data[1]
						
						if Entry == nil then
							Text = ""
						else
							local Names = Entry.names
							Text = if Names == nil then "" else Names.getInExperienceCombinedName(false)
						end
					end
					if string.len(Text) > 0 and Text ~= DisplayNameLabel.Text then
						DisplayNameLabel.Text = Text
						
						return
					end
					local DisplayName = Player.DisplayName
					
					if DisplayName ~= DisplayNameLabel.Text then
						DisplayNameLabel.Text = DisplayName
					end
				end)
			end
		end
		
		if IsEngineTruncationEnabledForIngameSettingsModule() then
			ChildAddedConnection = Object.RightSideButtons.ChildAdded:connect(function(Child)
				-- upvalues: rightSideButtonsChanged (copy)
				rightSideButtonsChanged()
				Child:GetPropertyChangedSignal("AbsolutePosition"):Connect(rightSideButtonsChanged)
			end)
			rightSideButtonsChanged()
		end
	end
	
	local _ = function(): boolean
		-- upvalues: LocalPlayer (upval)
		return LocalPlayer.UserId > 0
	end
	
	local Players2 = nil
	local t = {}
	local t1 = {}
	local Flag = false
	
	local function updateAllMuteButtons()
		-- upvalues: Object (ref), Default (upval), Players (upval), t (copy), muteButtonUpdate (copy), v6 (ref), RobloxTranslatorModule (upval)
		if not Object then return end
		if not Default.voiceUIVisible then return end
		local Flag = true
		
		for _, player in ipairs((Players:GetPlayers())) do
			local Entry = t[player.Name]
			
			if player and Entry then
				local Participant = Default.participants[tostring(player.UserId)]
				
				if Participant and not Participant.isMutedLocally then
					Flag = false
				end
				muteButtonUpdate(Entry, Participant)
			end
		end
		v6 = if Flag then true else false
		local FeatureSettingsHubActionUnmuteAll = v6 and RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		
		if Object and Object:FindFirstChild("TextLabel") then
			Object.TextLabel.Text = FeatureSettingsHubActionUnmuteAll
			Object.Icon.Image = Default:GetIcon(if v6 then "MuteAll" else "UnmuteAll", "Misc")
			
			return
		end
	end
	
	local function destroyAllUserMuteButtons()
		-- upvalues: Players (upval), t (copy), GuiService (upval), UserInputService (upval), SelectedCoreObject (ref)
		for _, player in Players:GetPlayers() do
			local Entry = t[player.Name]
			
			if Entry then
				local RightSideButtons = Entry:FindFirstChild("RightSideButtons")
				
				if RightSideButtons then
					local MuteStatusButton = RightSideButtons:FindFirstChild("MuteStatusButton")
					
					if MuteStatusButton then
						if GuiService.SelectedCoreObject == MuteStatusButton then
							if UserInputService.GamepadEnabled then
								GuiService.SelectedCoreObject = SelectedCoreObject
							else
								GuiService.SelectedCoreObject = nil
							end
						end
						MuteStatusButton:Destroy()
					end
				end
			end
		end
	end
	
	local function v123(_)
		-- upvalues: NewPage (copy), FFlagIEMTabFocusNav (upval), Players2 (ref), Players (upval), EnabledResult (upval), LocalPlayer (upval), UtilityModule (upval), Enabled (ref), Object (ref), Default (upval), FFlagHidePeoplePageInviteFriends (upval), FFlagAddInviteFriendsIntegration (upval), IsSideSheetEnabledModule (upval), SelectedCoreObject (ref), RunService (upval), Parent (ref), CreateFunction (upval), v4 (ref), _UDim2 (upval), GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (upval), GameInviteAnalyticsManager (upval), GameInviteAnalytics (upval), EventStream (upval), RbxAnalyticsService (upval), Diag (upval), v7 (ref), GetFFlagEnableConsoleJoinVoiceModule (upval), shouldShowJoinVoiceButton (copy), Object2 (ref), v10 (ref), v1 (ref), GuiService (upval), t (copy), t1 (copy), v11 (ref), muteButtonUpdate (copy), SocialUtilModule (upval), PlayerListRefactorUsernameFormatting (upval), FormatUsernameFunction (upval), IsEngineTruncationEnabledForIngameSettingsModule (upval), managePlayerNameCutoff (copy), friendStatusCreate (copy), resizeFriendButton (copy), Callback (ref), resizeInspectButton (copy), reportAbuseButtonCreate (copy), v8 (ref), v6 (ref), RobloxTranslatorModule (upval), GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval), Players1 (copy), ConstantsModule (upval), updateAllMuteButtons (copy), CheckShareGameButtonInMuteAllLayout (upval), CheckForNilUserIdOnPlayerList (upval), CryoModule (upval), UserProfileStore (upval), resizePlatformName (copy), FFlagUserProfilePlatformProfile (upval), Flag (ref), GetFFlagCleanupMuteSelfButtonModule (upval), pollImage (copy), UserInputService (upval), OnlyCaptureFocusIfOnPlayerPage (upval)
		NewPage.LastSelectableObjects = {}
		
		if FFlagIEMTabFocusNav and not NewPage.ButtonsContainer.Visible then
			NewPage.FirstSelectableObjects = {}
		end
		Players2 = Players:GetPlayers()
		
		if EnabledResult then
			table.sort(Players2, function(A, B): boolean
				-- upvalues: LocalPlayer (upval)
				local Lowered = A.Name:lower()
				local Lowered1 = B.Name:lower()
				
				if A == LocalPlayer then
					Lowered = " "
				end
				if B == LocalPlayer then
					Lowered1 = " "
				end
				return Lowered < Lowered1
			end)
		else
			table.sort(Players2, function(A, B): boolean
				return A.Name:lower() < B.Name:lower()
			end)
		end
		local v13: number = if UtilityModule:IsSmallTouchScreen() or UtilityModule:IsPortrait() then 85 else 20
		local VoiceUIVisible = Enabled and (not Object and Default.voiceUIVisible)
		local IsSideSheetEnabledModule1 = FFlagHidePeoplePageInviteFriends and (FFlagAddInviteFriendsIntegration and IsSideSheetEnabledModule)
		local NoIsSideSheetEnabledModule1: boolean = LocalPlayer.UserId > 0 and (not SelectedCoreObject and (not RunService:IsStudio() and not IsSideSheetEnabledModule1))
		
		if (NoIsSideSheetEnabledModule1 or VoiceUIVisible) and not Parent then
			Parent = CreateFunction("Frame")({
				Name = "Holder",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = NewPage.Page
			})
			v4 = CreateFunction("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20),
				Parent = Parent
			})
		end
		local function layoutMuteAll()
			-- upvalues: Parent (upval), CreateFunction (upval), NewPage (upval), SelectedCoreObject (upval), _UDim2 (upval), Object (upval)
			if not Parent then
				Parent = CreateFunction("Frame")({
					Name = "Holder",
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 52),
					Parent = NewPage.Page
				})
			end
			SelectedCoreObject.Parent = Parent
			SelectedCoreObject.Size = _UDim2
			Object.Parent = Parent
		end
		
		local Inverted = not RunService:IsStudio()
		
		if LocalPlayer.UserId > 0 and not SelectedCoreObject and Inverted and not IsSideSheetEnabledModule1 then
			local WithButtonNameResult = nil
			WithButtonNameResult = if GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.SettingsHub) else GameInviteAnalytics.new():withEventStream(EventStream.new(RbxAnalyticsService)):withDiag(Diag.new(RbxAnalyticsService)):withButtonName(GameInviteAnalytics.ButtonName.SettingsHub)
			SelectedCoreObject = v7()
			SelectedCoreObject.Activated:connect(function()
				-- upvalues: WithButtonNameResult (ref), NewPage (upval)
				WithButtonNameResult:inputShareGameEntryPoint()
				NewPage.HubRef:InviteToGame()
			end)
			SelectedCoreObject.LayoutOrder = 1
			
			if VoiceUIVisible then
				SelectedCoreObject.Parent = Parent
			else
				SelectedCoreObject.Parent = NewPage.Page
			end
		end
		if GetFFlagEnableConsoleJoinVoiceModule() and shouldShowJoinVoiceButton() then
			if shouldShowJoinVoiceButton() and not Object2 then
				Object2 = v10()
			end
			v1()
		end
		if FFlagIEMTabFocusNav then
			if VoiceUIVisible then
				table.insert(NewPage.FirstSelectableObjects, Object)
			end
			if NoIsSideSheetEnabledModule1 then
				table.insert(NewPage.FirstSelectableObjects, SelectedCoreObject)
			end
			if VoiceUIVisible or NoIsSideSheetEnabledModule1 then
				NewPage.FirstSelectableObjectsUpdated:fire()
			end
		end
		local InspectMenuEnabled = GuiService:GetInspectMenuEnabled()
		
		for i = 1, #Players2 do
			local Player = Players2[i]
			local Entry = nil
			Entry = t[Player.Name]
			
			if Player then
				t1[Player.Name] = true
				
				if not Entry or not Entry.Parent then
					Entry = v11((i - 1) * 80 + v13)
					Entry.Parent = NewPage.Page
					t[Player.Name] = Entry
				end
				Entry.Name = "PlayerLabel" .. Player.Name
				
				if Enabled then
					muteButtonUpdate(Entry, Default.participants[tostring(Player.UserId)])
				end
				Entry.Icon.Image = SocialUtilModule.GetPlayerImage(math.max(1, Player.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail)
				Entry.NameLabel.Text = if PlayerListRefactorUsernameFormatting then FormatUsernameFunction(Player.Name) else "@" .. Player.Name
				Entry.ImageTransparency = 0.85
				Entry.LayoutOrder = i + 1
				
				if IsEngineTruncationEnabledForIngameSettingsModule() then
					Entry.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
					Entry.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
				end
				managePlayerNameCutoff(Entry, Player)
				friendStatusCreate(Entry, Player)
				local v14 = nil
				UtilityModule:OnResized(Entry, function(_, p2)
					-- upvalues: Entry (ref), UtilityModule (upval), resizeFriendButton (upval), Player (copy), v14 (ref), Callback (upval), InspectMenuEnabled (copy), resizeInspectButton (upval)
					local RightSideButtons = Entry:FindFirstChild("RightSideButtons")
					local DisplayNameLabel = Entry:FindFirstChild("DisplayNameLabel")
					local NameLabel = Entry:FindFirstChild("NameLabel")
					local RightSideListLayout = RightSideButtons and RightSideButtons:FindFirstChild("RightSideListLayout")
					
					if UtilityModule:IsSmallTouchScreen() and UtilityModule:IsPortrait() then
						Entry.Size = UDim2.new(1, 0, 0, 105)
						
						if DisplayNameLabel then
							if NameLabel then
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.275, -10)
								NameLabel.Position = UDim2.new(0, 60, 0.275, 12)
							else
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.275, 0)
							end
						end
						if RightSideButtons then
							RightSideButtons.Position = UDim2.new(0, 57, 0, -2)
							RightSideButtons.Size = UDim2.new(1, -12, 0.99, -8)
						end
						if RightSideListLayout then
							RightSideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
							RightSideListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
						end
					else
						Entry.Size = UDim2.new(1, 0, 0, 62)
						
						if DisplayNameLabel then
							if NameLabel then
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.5, -10)
								NameLabel.Position = UDim2.new(0, 60, 0.5, 12)
							else
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.5, 0)
							end
						end
						if RightSideButtons then
							RightSideButtons.Position = UDim2.new(0, 0, 0, 0)
							RightSideButtons.Size = UDim2.new(1, -12, 1, 0)
						end
						if RightSideListLayout then
							RightSideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
							RightSideListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
						end
					end
					if RightSideButtons then
						resizeFriendButton(RightSideButtons, Player, p2, v14)
						Callback(RightSideButtons, Player, p2, v14)
						
						if InspectMenuEnabled then
							resizeInspectButton(RightSideButtons, Player, p2, v14)
						end
						v14 = p2
					end
				end)
				reportAbuseButtonCreate(Entry, Player)
				
				if i == #Players2 then
					local RightSideButtons = Entry:FindFirstChild("RightSideButtons")
					
					if RightSideButtons then
						for _, Button in RightSideButtons:GetChildren() do
							if Button:IsA("ImageButton") then
								table.insert(NewPage.LastSelectableObjects, Button)
							end
						end
						NewPage.LastSelectableObjectsUpdated:fire()
					end
				end
				if FFlagIEMTabFocusNav and i == 1 and #NewPage.FirstSelectableObjects == 0 then
					local RightSideButtons = Entry:FindFirstChild("RightSideButtons")
					
					if RightSideButtons then
						for _, Button1 in RightSideButtons:GetChildren() do
							if Button1:IsA("ImageButton") then
								table.insert(NewPage.FirstSelectableObjects, Button1)
							end
						end
						NewPage.FirstSelectableObjectsUpdated:fire()
					end
				end
			end
		end
		if VoiceUIVisible then
			Object = v8()
			Object.Activated:connect(function()
				-- upvalues: v6 (upval), RobloxTranslatorModule (upval), Object (upval), Default (upval), GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval), Players1 (upval), ConstantsModule (upval), updateAllMuteButtons (upval)
				v6 = not v6
				Object.TextLabel.Text = v6 and RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.MuteAll")
				Object.Icon.Image = Default:GetIcon(if v6 then "MuteAll" else "UnmuteAll", "Misc")
				
				if GetFFlagVoiceChatUILoggingModule() then
					NewResult:debug("{} all players", if v6 then "Muting" else "Unmuting")
				end
				if Players1 then
					Players1:onToggleMuteAll(v6)
				end
				Default:MuteAll(v6, ConstantsModule.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				updateAllMuteButtons()
			end)
			Object.LayoutOrder = 1
			
			if not CheckShareGameButtonInMuteAllLayout or SelectedCoreObject ~= nil then
				layoutMuteAll()
			else
				Object.Parent = Parent
			end
			v1()
		end
		local FilterMapResult = if CheckForNilUserIdOnPlayerList then CryoModule.List.filterMap(Players2, function(Player: Player)
			return if Player.UserId then tostring(Player.UserId) else nil
		end) else CryoModule.List.filter(Players2, function(Player): string
			return (tostring(Player.UserId))
		end)
		for _, Player1 in ipairs(Players2) do
			t[Player1.Name].DisplayNameLabel.Text = Player1.DisplayName
		end
		UserProfileStore.get().fetchNamesByUserIds(FilterMapResult, function(p2)
			-- upvalues: t (upval), resizePlatformName (upval)
			for _, entry in p2.data do
				local Entry = t[entry.names.getUsername(false)]
				
				if Entry then
					local InExperienceCombinedName: string = entry.names.getInExperienceCombinedName(false)
					
					if string.len(InExperienceCombinedName) > 0 and InExperienceCombinedName ~= Entry.DisplayNameLabel.Text then
						Entry.DisplayNameLabel.Text = InExperienceCombinedName
					end
					local RightSideButtons = Entry:FindFirstChild("RightSideButtons")
					local PlatformName = if entry.names.getPlatformName(false) ~= "" then entry.names.getPlatformName(false) else nil
					
					if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
						resizePlatformName(RightSideButtons, PlatformName, entry.getPlatformProfileId(false))
					else
						resizePlatformName(RightSideButtons, PlatformName)
					end
				end
			end
		end, FFlagUserProfilePlatformProfile)
		local Count = 0
		
		if Enabled and not Flag then
			NewResult:debug("Setting Up Playerlist Mic Update Renderstep Hook")
			RunService:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function()
				-- upvalues: Count (ref), updateAllMuteButtons (upval), GetFFlagCleanupMuteSelfButtonModule (upval), Parent (upval), pollImage (upval)
				Count += 1
				
				if Count % 3 == 0 then
					updateAllMuteButtons()
					local MuteSelfButtonImageLabel = nil
					
					if GetFFlagCleanupMuteSelfButtonModule() then
						if Parent then
							MuteSelfButtonImageLabel = Parent:FindFirstChild("MuteSelfButtonImageLabel", true)
						end
					else
						MuteSelfButtonImageLabel = Parent:FindFirstChild("MuteSelfButtonImageLabel", true)
					end
					if not MuteSelfButtonImageLabel then return end
					MuteSelfButtonImageLabel.Image = pollImage()
				end
			end)
			Flag = true
		end
		for i1, value in pairs(t) do
			if not t1[i1] then
				value:Destroy()
				t[i1] = nil
			end
		end
		if UserInputService.GamepadEnabled and (not FFlagIEMTabFocusNav or not GuiService.SelectedCoreObject) then
			if GetFFlagCleanupMuteSelfButtonModule() then
				pcall(function()
					-- upvalues: OnlyCaptureFocusIfOnPlayerPage (upval), NewPage (upval), GuiService (upval), SelectedCoreObject (upval)
					if not OnlyCaptureFocusIfOnPlayerPage then
						GuiService.SelectedCoreObject = SelectedCoreObject
					elseif NewPage.Active then
						GuiService.SelectedCoreObject = SelectedCoreObject
						
						return
					end
				end)
			else
				GuiService.SelectedCoreObject = SelectedCoreObject
			end
		end
		UtilityModule:OnResized("MenuPlayerListExtraPageSize", function(_, _)
			-- upvalues: UtilityModule (upval), Players2 (upval), NewPage (upval)
			local v15: number = if UtilityModule:IsSmallTouchScreen() or UtilityModule:IsPortrait() then 85 else 20
			local v16 = #Players2 + 1
			
			if UtilityModule:IsSmallTouchScreen() and UtilityModule:IsPortrait() then
				NewPage.Page.Size = UDim2.new(1, 0, 0, v15 + v16 * 123 - 5)
				
				return
			else
				NewPage.Page.Size = UDim2.new(1, 0, 0, v15 + v16 * 80 - 5)
			end
		end)
	end
	
	local function v124()
		-- upvalues: Flag (ref), NewResult (upval), RunService (upval)
		if Flag then
			NewResult:debug("Unbinding Playerlist Mic Update Renderstep Hook")
			Flag = false
			RunService:UnbindFromRenderStep("player-list-mute-update")
		end
	end
	
	if game:GetEngineFeature("VoiceChatSupported") and not Enabled then
		Default:asyncInit():andThen(function()
			-- upvalues: Enabled (ref), Default (upval), EnabledResult (upval), GetFFlagCleanupMuteSelfButtonModule (upval), Object1 (ref), v9 (ref), updateAllMuteButtons (copy), Images (copy), Object (ref), v1 (ref), EventConnection (ref), GetFFlagEnableConsoleJoinVoiceModule (upval), Object2 (ref), v123 (copy), Parent1 (copy), destroyAllUserMuteButtons (copy), resetButtonRow (copy)
			Enabled = true
			Default:SetupParticipantListeners()
			
			if not EnabledResult then
				if GetFFlagCleanupMuteSelfButtonModule() then
					Object1 = v9()
				else
					v9()
				end
			end
			Default.participantsUpdate.Event:Connect(function()
				-- upvalues: updateAllMuteButtons (upval)
				updateAllMuteButtons()
			end)
			Default.participantLeft.Event:Connect(function(_, Key)
				-- upvalues: updateAllMuteButtons (upval), Images (upval)
				updateAllMuteButtons()
				Images[Key] = nil
			end)
			Default:getService().StateChanged:Connect(function(_, NewState)
				-- upvalues: Object (upval), v1 (upval), Object1 (upval), EventConnection (upval), GetFFlagEnableConsoleJoinVoiceModule (upval), Object2 (upval), Enabled (upval), v123 (upval)
				if NewState == Enum.VoiceChatState.Ended then
					if Object then
						Object.Visible = false
						Object:Destroy()
						Object = nil
					end
					v1()
					
					if Object1 then
						Object1.Visible = false
						Object1:Destroy()
						Object1 = nil
					end
					if EventConnection then
						EventConnection:Disconnect()
						EventConnection = nil
					end
					v1()
					
					if GetFFlagEnableConsoleJoinVoiceModule() then
						if Object2 then
							Object2.Visible = false
							Object2:Destroy()
							Object2 = nil
						end
						v1()
					end
					Enabled = false
					
					return
				else
					if NewState == Enum.VoiceChatState.Joined and Enabled == false then
						Enabled = true
						
						if GetFFlagEnableConsoleJoinVoiceModule() then
							if Object2 then
								Object2.Visible = false
								Object2:Destroy()
								Object2 = nil
							end
							v1()
						end
						v123()
					end
				end
			end)
			
			if not GetFFlagCleanupMuteSelfButtonModule() then
				v123()
			end
			Default.showVoiceUI.Event:Connect(function()
				-- upvalues: GetFFlagCleanupMuteSelfButtonModule (upval), Object1 (upval), EnabledResult (upval), v9 (upval), Parent1 (upval), GetFFlagEnableConsoleJoinVoiceModule (upval), Object2 (upval), v1 (upval), v123 (upval)
				if GetFFlagCleanupMuteSelfButtonModule() then
					if not Object1 and not EnabledResult then
						if GetFFlagCleanupMuteSelfButtonModule() then
							Object1 = v9()
						else
							v9()
						end
					end
				elseif not Parent1:FindFirstChild("MuteSelfButton", true) and not EnabledResult then
					if GetFFlagCleanupMuteSelfButtonModule() then
						Object1 = v9()
					else
						v9()
					end
				end
				if GetFFlagEnableConsoleJoinVoiceModule() then
					if Object2 then
						Object2.Visible = false
						Object2:Destroy()
						Object2 = nil
					end
					v1()
				end
				v123()
			end)
			Default.hideVoiceUI.Event:Connect(function()
				-- upvalues: Object (upval), v1 (upval), Object1 (upval), EventConnection (upval), destroyAllUserMuteButtons (upval), v123 (upval), resetButtonRow (upval)
				if Object then
					if Object then
						Object.Visible = false
						Object:Destroy()
						Object = nil
					end
					v1()
				end
				if Object1 then
					Object1.Visible = false
					Object1:Destroy()
					Object1 = nil
				end
				if EventConnection then
					EventConnection:Disconnect()
					EventConnection = nil
				end
				v1()
				destroyAllUserMuteButtons()
				v123()
				resetButtonRow()
			end)
			Default.muteAllChanged.Event:Connect(function()
				-- upvalues: updateAllMuteButtons (upval)
				updateAllMuteButtons()
			end)
		end):catch(function(_)
			-- upvalues: GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval)
			if GetFFlagVoiceChatUILoggingModule() then
				NewResult:warning("Failed to init VoiceChatServiceManager")
			end
		end)
	end
	NewPage.Displayed.Event:connect(v123)
	NewPage.Hidden.Event:connect(v124)
	Players.PlayerRemoving:Connect(function(Player)
		-- upvalues: t1 (copy), t (copy), GuiService (upval), UserInputService (upval), SelectedCoreObject (ref), GetFFlagDestroyPlayerCardOnLeaveModule (upval)
		t1[Player.Name] = nil
		local Entry = t[Player.Name]
		
		if not Entry then return end
		local RightSideButtons = Entry:FindFirstChild("RightSideButtons")
		
		if not RightSideButtons then return end
		local FriendStatus = RightSideButtons:FindFirstChild("FriendStatus")
		
		if FriendStatus then
			if GuiService.SelectedCoreObject == FriendStatus then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = SelectedCoreObject
				else
					GuiService.SelectedCoreObject = nil
				end
			end
			FriendStatus:Destroy()
		end
		local ReportPlayer = RightSideButtons:FindFirstChild("ReportPlayer")
		
		if ReportPlayer then
			if GuiService.SelectedCoreObject == ReportPlayer then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = SelectedCoreObject
				else
					GuiService.SelectedCoreObject = nil
				end
			end
			ReportPlayer:Destroy()
		end
		local MuteStatusButton = RightSideButtons:FindFirstChild("MuteStatusButton")
		
		if MuteStatusButton then
			if GuiService.SelectedCoreObject == MuteStatusButton then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = SelectedCoreObject
				else
					GuiService.SelectedCoreObject = nil
				end
			end
			MuteStatusButton:Destroy()
		end
		local BlockButton = RightSideButtons:FindFirstChild("BlockButton")
		
		if BlockButton then
			if GuiService.SelectedCoreObject == BlockButton then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = SelectedCoreObject
				else
					GuiService.SelectedCoreObject = nil
				end
			end
			BlockButton:Destroy()
		end
		local Inspect = RightSideButtons:FindFirstChild("Inspect")
		
		if Inspect then
			if GuiService.SelectedCoreObject == Inspect then
				GuiService.SelectedCoreObject = nil
			end
			Inspect:Destroy()
		end
		if GetFFlagDestroyPlayerCardOnLeaveModule() then
			t[Player.Name] = nil
			Entry:Destroy()
		end
	end)
	
	local function removeInspectButtons()
		-- upvalues: t (copy), GuiService (upval)
		for _, value in pairs(t) do
			local RightSideButtons = value:FindFirstChild("RightSideButtons")
			
			if RightSideButtons then
				local Inspect = RightSideButtons:FindFirstChild("Inspect")
				
				if Inspect then
					if GuiService.SelectedCoreObject == Inspect then
						GuiService.SelectedCoreObject = nil
					end
					Inspect:Destroy()
				end
			end
		end
	end
	
	GuiService.InspectMenuEnabledChangedSignal:Connect(function(Enabled)
		-- upvalues: removeInspectButtons (copy)
		if not Enabled then
			removeInspectButtons()
		end
	end)
	
	function NewPage:CreateMenuButtonsContainer()
		-- upvalues: FIntRelocateMobileMenuButtonsVariantModule (upval), NewPage (copy), ReactRobloxModule (upval), Parent1 (copy), ReactModule (upval), MenuButtonsContainerModule (upval)
		if FIntRelocateMobileMenuButtonsVariantModule == 2 then
			if NewPage.buttonsContainerRoot then return end
			NewPage.buttonsContainerRoot = ReactRobloxModule.createRoot(Parent1)
			local ExperienceControlStore = NewPage.HubRef:GetExperienceControlStore()
			NewPage.buttonsContainerRoot:render(ReactModule.createElement(MenuButtonsContainerModule, {
				onLeaveGame = ExperienceControlStore.onLeaveGame,
				onRespawn = ExperienceControlStore.onRespawn,
				onResume = ExperienceControlStore.onResume,
				setAddMenuKeyBindings = function() end,
				setRemoveMenuKeyBindings = function() end,
				getVisibility = function(): boolean
					return true
				end,
				getCanRespawn = ExperienceControlStore.getCanRespawn
			}))
		end
	end
	
	function NewPage:UnmountMenuButtonsContainer()
		-- upvalues: FFlagMenuButtonsMountWithIEMModule (upval), FIntRelocateMobileMenuButtonsVariantModule (upval), NewPage (copy)
		if FFlagMenuButtonsMountWithIEMModule and FIntRelocateMobileMenuButtonsVariantModule == 2 and NewPage.buttonsContainerRoot then
			NewPage.buttonsContainerRoot:unmount()
			NewPage.buttonsContainerRoot = nil
		end
	end
	
	return NewPage
end)())