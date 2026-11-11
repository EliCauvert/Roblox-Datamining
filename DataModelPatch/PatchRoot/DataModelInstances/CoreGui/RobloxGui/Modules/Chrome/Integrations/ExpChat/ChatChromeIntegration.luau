local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local TextChatService = game:GetService("TextChatService")
local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local ChromeIntegrationUtilsModule = require(Chrome.Integrations.ChromeIntegrationUtils)
local ServiceModule = require(Chrome.Service)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local FFlagChatIntegrationFixShortcutModule = require(Chrome.Flags.FFlagChatIntegrationFixShortcut)
local FocusSelectExpChatModule = require(Chrome.ChromeShared.Utility.FocusSelectExpChat)
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local MappedSignal = ChromeUtilsModule.MappedSignal
local GameSettings = UserSettings().GameSettings
local GuiService = game:GetService("GuiService")
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local Default = require(script.Parent.ChatIconVisibleSignals).default
local SignalsRobloxModule = require(CorePackages.Packages.SignalsRoblox)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local FocusNavigationStore = ExpChatModule.Stores.GetFocusNavigationStore(false)
local ShouldSuppressUnreadForTabMetadataFunction = ExpChatModule.shouldSuppressUnreadForTabMetadata
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagExpChatWindowSyncUnibar = SharedFlagsModule.FFlagExpChatWindowSyncUnibar
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local FFlagRemoveFriendsChatUnibarEntrypoints = SharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local ChatSelectorModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ChatSelector)
local GetExperienceChatVisualConfigFunction = require(CorePackages.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(CorePackages.Workspace.Packages.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local ExpChatSuppressWelcomeMessageUnibarUnread = game:DefineFastFlag("ExpChatSuppressWelcomeMessageUnibarUnread", false)
local ExpChatUnibarThumbstickNavigate = game:DefineFastFlag("ExpChatUnibarThumbstickNavigate", false)
local ExpChatUnibarAvailabilityRefactor = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local FFlagExpChatPerfTracking = SharedFlagsModule.FFlagExpChatPerfTracking
local ExpChatPerfTracker = ExpChatModule.ExpChatPerfTracker
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local Count = 0
local UnreadCount = 0
local Visibility = ChatSelectorModule:GetVisibility()
local RegisterResult = nil
local VisibilityStateChanged = ChatSelectorModule.VisibilityStateChanged

local function _()
	-- upvalues: RegisterResult (ref), FFlagExpChatEnableFriendsTab (copy), Count (ref), UnreadCount (ref), Visibility (ref)
	if not RegisterResult.notification then return end
	if not FFlagExpChatEnableFriendsTab then
		RegisterResult.notification:fireCount(Count)
		
		return
	end
	local NewCount = Count + UnreadCount
	
	if Visibility or NewCount == 0 then
		RegisterResult.notification:clear()
		
		return
	else
		RegisterResult.notification:fireCount(NewCount)
	end
end

local _ = function()
	-- upvalues: RunService (copy), Chat (copy), Players (copy)
	if RunService:IsStudio() then
		return true
	else
		local Success, Result = pcall(function()
			-- upvalues: Chat (upval), Players (upval)
			return Chat:CanUserChatAsync(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
		end)
		
		return Success and Result
	end
end

if not FFlagExpChatWindowSyncUnibar then
	VisibilityStateChanged:connect(function(p1)
		-- upvalues: ExpChatUnibarAvailabilityRefactor (copy), Default (copy), RegisterResult (ref)
		if ExpChatUnibarAvailabilityRefactor then
			Default.setVisibleViaChatSelector(p1)
			
			return
		end
		if p1 then
			RegisterResult.availability:pinned()
		end
	end)
	ChatSelectorModule.ChatWindowToggled:connect(function(p1)
		-- upvalues: ExpChatUnibarAvailabilityRefactor (copy), Default (copy), RegisterResult (ref)
		if ExpChatUnibarAvailabilityRefactor then
			Default.setVisibleViaChatSelector(p1)
			
			return
		end
		if p1 then
			RegisterResult.availability:pinned()
		end
	end)
end
if FFlagExpChatWindowSyncUnibar then
	GameSettings:GetPropertyChangedSignal("ChatVisible"):Connect(function()
		-- upvalues: Default (copy), GameSettings (copy)
		Default.setGameSettingsChatVisible(GameSettings.ChatVisible)
	end)
	Default.setGameSettingsChatVisible(GameSettings.ChatVisible)
end
local NewMappedSignal = MappedSignal.new(VisibilityStateChanged, function()
	-- upvalues: Visibility (ref)
	return Visibility
end, function()
	-- upvalues: ChatSelectorModule (copy), ExpChatUnibarAvailabilityRefactor (copy), RunService (copy), Chat (copy), Players (copy), RegisterResult (ref), GuiService (copy), GameSettings (copy), Visibility (ref), FFlagExpChatEnableFriendsTab (copy), Count (ref), UnreadCount (ref)
	local Visibility1 = ChatSelectorModule.GetVisibility()
	
	if not ExpChatUnibarAvailabilityRefactor and not Visibility1 then
		local Result1 = nil
		if RunService:IsStudio() then
			Result1 = true
		else
			local Success, Result = pcall(function()
				-- upvalues: Chat (upval), Players (upval)
				return Chat:CanUserChatAsync(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
			end)
			Result1 = Success and Result
		end
		if not Result1 then
			RegisterResult.availability:unavailable()
		end
	end
	if not GuiService.MenuIsOpen then
		GameSettings.ChatVisible = Visibility1
	end
	Visibility = Visibility1
	
	if FFlagExpChatEnableFriendsTab then
		if Visibility1 then
			Count = 0
		end
		if not RegisterResult.notification then return end
		if not FFlagExpChatEnableFriendsTab then
			RegisterResult.notification:fireCount(Count)
			
			return
		end
		local NewCount = Count + UnreadCount
		
		if Visibility or NewCount == 0 then
			RegisterResult.notification:clear()
			
			return
		else
			RegisterResult.notification:fireCount(NewCount)
			
			return
		end
	elseif Visibility1 and Count and RegisterResult.notification then
		Count = 0
		RegisterResult.notification:clear()
	end
end)

local _ = function()
	-- upvalues: InExperienceAppChatModalModule (copy), ChatSelectorModule (copy), FFlagEnableConsoleExpControls (copy), FocusSelectExpChatModule (copy), RegisterResult (ref)
	if InExperienceAppChatModalModule:getVisible() then
		InExperienceAppChatModalModule.default:setVisible(false)
	end
	ChatSelectorModule:SetVisible(true)
	
	if FFlagEnableConsoleExpControls then
		FocusSelectExpChatModule(RegisterResult.id)
	end
end

RegisterResult = ServiceModule:register({
	id = "chat",
	label = "CoreScripts.TopBar.Chat",
	sideSheetPlacement = if ArgoPartyExperimentation.getIsRenameEnabled() and (not FFlagRemoveFriendsChatUnibarEntrypoints or not FFlagExpChatEnableFriendsTab) then SideSheetPlacement.None else SideSheetPlacement.Unibar,
	activated = function(_)
		-- upvalues: Visibility (ref), ChatSelectorModule (copy), FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtilsModule (copy), InExperienceAppChatModalModule (copy), FFlagEnableConsoleExpControls (copy), FocusSelectExpChatModule (copy), RegisterResult (ref)
		if Visibility then
			ChatSelectorModule:SetVisible(false)
			
			return
		end
		if FFlagExpChatPerfTracking then
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.ChatWindowMountTTI, {})
		end
		if IsInExperienceUIVREnabled and IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter() then
			ChatSelectorModule:SetVisible(true)
			
			return
		else
			ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: InExperienceAppChatModalModule (upval), ChatSelectorModule (upval), FFlagEnableConsoleExpControls (upval), FocusSelectExpChatModule (upval), RegisterResult (upval)
				if InExperienceAppChatModalModule:getVisible() then
					InExperienceAppChatModalModule.default:setVisible(false)
				end
				ChatSelectorModule:SetVisible(true)
				
				if FFlagEnableConsoleExpControls then
					FocusSelectExpChatModule(RegisterResult.id)
				end
			end)
		end
	end,
	isActivated = if FFlagChromeActivatedMappedSignal then NewMappedSignal else function()
		-- upvalues: NewMappedSignal (copy)
		return NewMappedSignal:get()
	end,
	selected = if FFlagEnableConsoleExpControls then function(p1)
		-- upvalues: ExpChatUnibarThumbstickNavigate (copy), ServiceModule (copy), UserInputService (copy), GamepadUtils (copy), FocusSelectExpChatModule (copy), RegisterResult (ref)
		if ExpChatUnibarThumbstickNavigate then
			local Connection = nil
			local Connection1 = nil
			local Connection2 = nil
			Connection = ServiceModule:selectedItem():connect(function(Id)
				-- upvalues: p1 (copy), Connection (ref), Connection1 (ref), Connection2 (ref)
				assert(Id ~= p1.id, "Expected selectedId to not be self.id on selection")
				Connection:disconnect()
				Connection1:Disconnect()
				Connection2:Disconnect()
			end)
			Connection1 = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: GamepadUtils (upval), FocusSelectExpChatModule (upval), RegisterResult (upval)
				if Input.KeyCode == Enum.KeyCode.Thumbstick1 and GamepadUtils.mapPositionToDirection(Vector2.new(Input.Position.X, Input.Position.Y)) == Enum.KeyCode.Down then
					FocusSelectExpChatModule(RegisterResult.id)
				end
			end)
			Connection2 = UserInputService.InputBegan:Connect(function(Input)
				-- upvalues: FocusSelectExpChatModule (upval), RegisterResult (upval)
				local KeyCode = Input.KeyCode
				
				if KeyCode == Enum.KeyCode.DPadDown or KeyCode == Enum.KeyCode.Down then
					FocusSelectExpChatModule(RegisterResult.id)
				end
			end)
			
			return
		else
			local Connection = nil
			local Connection1 = UserInputService
			Connection1 = Connection1.InputEnded
			Connection1 = Connection1:Connect(function(Input)
				-- upvalues: FocusSelectExpChatModule (upval), RegisterResult (upval), Connection (ref), ServiceModule (upval), p1 (copy)
				if Input.KeyCode == Enum.KeyCode.DPadDown then
					FocusSelectExpChatModule(RegisterResult.id)
				end
				if Connection and ServiceModule:selectedItem():get() ~= p1.id then
					Connection:Disconnect()
				end
			end)
			Connection = Connection1
		end
	end else nil,
	components = {
		Icon = function(_)
			-- upvalues: GetExperienceChatVisualConfigFunction (copy), CommonIconModule (copy), NewMappedSignal (copy)
			local ExperienceChatVisualConfig = GetExperienceChatVisualConfigFunction()
			
			return CommonIconModule(ExperienceChatVisualConfig.icon.off, ExperienceChatVisualConfig.icon.on, NewMappedSignal)
		end
	}
})

if ExpChatUnibarAvailabilityRefactor then
	SignalsRobloxModule.createDetachedEffect(function(p1)
		-- upvalues: Default (copy), RegisterResult (ref), FFlagExpChatWindowSyncUnibar (copy), ExpChatModule (copy)
		if Default.getIsChatIconVisible(p1) then
			RegisterResult.availability:available()
		else
			RegisterResult.availability:unavailable()
		end
		if FFlagExpChatWindowSyncUnibar then
			ExpChatModule.Events.ChatTopBarButtonActivated((Default.getIsChatWindowVisible(p1)))
		end
	end)
	ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.Chat, function(p1)
		-- upvalues: Default (copy)
		Default.setCoreGuiEnabled(p1)
	end)
end
if FFlagChatIntegrationFixShortcutModule and FFlagEnableConsoleExpControls then
	SignalsRobloxModule.createDetachedEffect(function(p1)
		-- upvalues: FocusNavigationStore (copy), ServiceModule (copy), ConstantsModule (copy)
		if FocusNavigationStore.getChatInputBarFocused(p1) then
			ServiceModule:setShortcutBar(ConstantsModule.UNIBAR_SHORTCUTBAR_ID)
			
			return
		else
			ServiceModule:setShortcutBar(nil)
		end
	end)
end
if FFlagExpChatEnableFriendsTab then
	local function updateFriendsChatUnreadMessages(p1)
		-- upvalues: UnreadCount (ref), RegisterResult (ref), FFlagExpChatEnableFriendsTab (copy), Count (ref), Visibility (ref)
		UnreadCount = p1 or 0
		
		if not RegisterResult.notification then return end
		if not FFlagExpChatEnableFriendsTab then
			RegisterResult.notification:fireCount(Count)
			
			return
		end
		local NewCount = Count + UnreadCount
		
		if Visibility or NewCount == 0 then
			RegisterResult.notification:clear()
			
			return
		else
			RegisterResult.notification:fireCount(NewCount)
		end
	end
	
	UnreadCount = InExperienceAppChatModalModule.default.unreadCount or 0
	
	if RegisterResult.notification then
		if FFlagExpChatEnableFriendsTab then
			local NewCount = Count + UnreadCount
			
			if Visibility or NewCount == 0 then
				RegisterResult.notification:clear()
			else
				RegisterResult.notification:fireCount(NewCount)
			end
		else
			RegisterResult.notification:fireCount(Count)
		end
	end
	InExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(updateFriendsChatUnreadMessages)
end
local _ = function(p1)
	-- upvalues: ExpChatSuppressWelcomeMessageUnibarUnread (copy), ShouldSuppressUnreadForTabMetadataFunction (copy)
	return ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(p1 and p1.Metadata)
end

TextChatService.MessageReceived:Connect(function(TextChatMessage)
	-- upvalues: ExpChatSuppressWelcomeMessageUnibarUnread (copy), ShouldSuppressUnreadForTabMetadataFunction (copy), Visibility (ref), Count (ref), RegisterResult (ref), FFlagExpChatEnableFriendsTab (copy), UnreadCount (ref)
	if ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(TextChatMessage and TextChatMessage.Metadata) then return end
	if not Visibility then
		Count += 1
		
		if not RegisterResult.notification then return end
		if not FFlagExpChatEnableFriendsTab then
			RegisterResult.notification:fireCount(Count)
			
			return
		end
		local NewCount = Count + UnreadCount
		
		if Visibility or NewCount == 0 then
			RegisterResult.notification:clear()
			
			return
		end
		RegisterResult.notification:fireCount(NewCount)
	end
end)

if GetFFlagTextChatEnableUniverseChatTabsFunction() then
	TextChatService.UniverseChatMessageReceived:Connect(function(TextChatMessage)
		-- upvalues: ExpChatSuppressWelcomeMessageUnibarUnread (copy), ShouldSuppressUnreadForTabMetadataFunction (copy), Visibility (ref), Count (ref), RegisterResult (ref), FFlagExpChatEnableFriendsTab (copy), UnreadCount (ref)
		if ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(TextChatMessage and TextChatMessage.Metadata) then return end
		if not Visibility then
			Count += 1
			
			if not RegisterResult.notification then return end
			if not FFlagExpChatEnableFriendsTab then
				RegisterResult.notification:fireCount(Count)
				
				return
			end
			local NewCount = Count + UnreadCount
			
			if Visibility or NewCount == 0 then
				RegisterResult.notification:clear()
				
				return
			end
			RegisterResult.notification:fireCount(NewCount)
		end
	end)
end
local v1 = 0
ChatSelectorModule.MessagesChanged:connect(function(p1)
	-- upvalues: Visibility (ref), Count (ref), v1 (ref), RegisterResult (ref), FFlagExpChatEnableFriendsTab (copy), UnreadCount (ref)
	if not Visibility then
		Count += p1 - v1
		
		if RegisterResult.notification then
			if FFlagExpChatEnableFriendsTab then
				local NewCount = Count + UnreadCount
				
				if Visibility or NewCount == 0 then
					RegisterResult.notification:clear()
				else
					RegisterResult.notification:fireCount(NewCount)
				end
			else
				RegisterResult.notification:fireCount(Count)
			end
		end
	end
	v1 = p1
end)

if not FFlagExpChatWindowSyncUnibar then
	ChatSelectorModule.ChatActiveChanged:connect(function(p1)
		-- upvalues: ExpChatUnibarAvailabilityRefactor (copy), Default (copy), RunService (copy), Chat (copy), Players (copy), RegisterResult (ref)
		if ExpChatUnibarAvailabilityRefactor then
			Default.setChatActiveCalledByDeveloper(p1)
			
			return
		end
		if p1 then
			local Result1 = nil
			if RunService:IsStudio() then
				Result1 = true
			else
				local Success, Result = pcall(function()
					-- upvalues: Chat (upval), Players (upval)
					return Chat:CanUserChatAsync(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
				end)
				Result1 = Success and Result
			end
			if not Result1 then
				RegisterResult.availability:available()
			end
		end
	end)
end
local _ = function()
	-- upvalues: GameSettings (copy), ViewportUtilModule (copy), Visibility (ref), ChatSelectorModule (copy)
	local ChatVisible = not ViewportUtilModule.isSmallTouchScreen() and GameSettings.ChatVisible
	Visibility = ChatVisible
	ChatSelectorModule:SetVisible(ChatVisible)
end

coroutine.wrap(function()
	-- upvalues: Players (copy), RunService (copy), Chat (copy), ExpChatUnibarAvailabilityRefactor (copy), Default (copy), GameSettings (copy), ViewportUtilModule (copy), Visibility (ref), ChatSelectorModule (copy), RegisterResult (ref), ChromeUtilsModule (copy)
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer = Players.LocalPlayer
	end
	local Result1 = nil
	if RunService:IsStudio() then
		Result1 = true
	else
		local Success, Result = pcall(function()
			-- upvalues: Chat (upval), Players (upval)
			return Chat:CanUserChatAsync(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
		end)
		Result1 = Success and Result
	end
	if ExpChatUnibarAvailabilityRefactor then
		Default.setLocalUserChat(Result1)
		
		if Result1 then
			local ChatVisible = not ViewportUtilModule.isSmallTouchScreen() and GameSettings.ChatVisible
			Visibility = ChatVisible
			ChatSelectorModule:SetVisible(ChatVisible)
			
			return
		end
	elseif Result1 and RegisterResult.availability then
		ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.Chat, function(p1)
			-- upvalues: RegisterResult (upval)
			if p1 then
				RegisterResult.availability:pinned()
				
				return
			else
				RegisterResult.availability:unavailable()
			end
		end)
		local ChatVisible = not ViewportUtilModule.isSmallTouchScreen() and GameSettings.ChatVisible
		Visibility = ChatVisible
		ChatSelectorModule:SetVisible(ChatVisible)
	end
end)()

function _simulateChat()
	-- upvalues: Visibility (ref), Count (ref), RegisterResult (ref), FFlagExpChatEnableFriendsTab (copy), UnreadCount (ref)
	while true do
		task.wait(math.random(1, 15))
		if Visibility then
			continue
		end
		Count += 1
		
		if RegisterResult.notification then
			if FFlagExpChatEnableFriendsTab then
				local NewCount = Count + UnreadCount
				
				if Visibility or NewCount == 0 then
					RegisterResult.notification:clear()
				else
					RegisterResult.notification:fireCount(NewCount)
				end
			else
				RegisterResult.notification:fireCount(Count)
			end
		end
	end
end

return RegisterResult