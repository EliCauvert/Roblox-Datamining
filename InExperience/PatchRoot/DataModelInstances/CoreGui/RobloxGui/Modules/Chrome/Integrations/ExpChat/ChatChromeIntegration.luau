local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local TextChatService = game:GetService("TextChatService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local ChromeIntegrationUtilsModule = require(Chrome.Integrations.ChromeIntegrationUtils)
local ServiceModule = require(Chrome.Service)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local FocusSelectExpChatModule = require(Chrome.ChromeShared.Utility.FocusSelectExpChat)
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local MappedSignal = ChromeUtilsModule.MappedSignal
local GameSettings = UserSettings().GameSettings
local GuiService = game:GetService("GuiService")
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local Default = require(script.Parent.ChatIconVisibleSignals).default
local SignalsUtilsModule = require(CorePackages.Workspace.Packages.SignalsUtils)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement

if require(RobloxGui.Modules.Flags.FFlagDebugDisableExperienceChatMain) then
	return nil
end
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local FocusNavigationStore = ExpChatModule.Stores.GetFocusNavigationStore(false)
local GetMessagesStoreFunction = ExpChatModule.Stores.GetMessagesStore
local ShouldSkipHistoricalMessageFunction = ExpChatModule.shouldSkipHistoricalMessage
local IsHistoricalMessageFunction = ExpChatModule.isHistoricalMessage
local ShouldSuppressUnreadForTabMetadataFunction = ExpChatModule.shouldSuppressUnreadForTabMetadata
local GetFriendsChatIconUnreadStoreModule = require(CorePackages.Workspace.Packages.FriendsChat.GetFriendsChatIconUnreadStore)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagExpChatWindowSyncUnibar = SharedFlagsModule.FFlagExpChatWindowSyncUnibar
local FFlagRemoveFriendsChatUnibarEntrypoints = SharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatCanShowFriendsTab = SharedFlagsModule.FFlagExpChatCanShowFriendsTab
local FFlagExpChatHistoricalMessagesUnibarUnread = SharedFlagsModule.FFlagExpChatHistoricalMessagesUnibarUnread
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
local GetExperienceChatVisualConfigFunction = require(CorePackages.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local ExpChatSharedModule = require(CorePackages.Workspace.Packages.ExpChatShared)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local ShouldRenderTextChannelInDefaultWindowFunction = ExpChatSharedModule.shouldRenderTextChannelInDefaultWindow
local GetTextChannelDisplayModeFunction = ExpChatSharedModule.getTextChannelDisplayMode
local ExpChatSuppressWelcomeMessageUnibarUnread = game:DefineFastFlag("ExpChatSuppressWelcomeMessageUnibarUnread", false)
local ExpChatUnibarAvailabilityRefactor = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local ExpChatPerfTracker = ExpChatModule.ExpChatPerfTracker
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local Count = 0
local ChatVisible = nil

if SharedFlagsModule.FFlagExpChatInitializeWindowFromGameSettings then
	ChatVisible = GameSettings.ChatVisible
	ChatSelectorModule:SetVisible(ChatVisible)
else
	ChatVisible = ChatSelectorModule:GetVisibility()
end
local RegisterResult = nil
local VisibilityStateChanged = ChatSelectorModule.VisibilityStateChanged
local Smallest = 0
local Flag = false

local function _(p1)
	-- upvalues: GetMessagesStoreFunction (copy)
	local GetHistoricalWindowMessageCountFunction = GetMessagesStoreFunction(p1).getHistoricalWindowMessageCount
	
	return if GetHistoricalWindowMessageCountFunction then GetHistoricalWindowMessageCountFunction(p1) else 0
end

local _ = function(): number
	-- upvalues: GetMessagesStoreFunction (copy), Smallest (ref)
	local GetHistoricalWindowMessageCountFunction = GetMessagesStoreFunction(false).getHistoricalWindowMessageCount
	local HistoricalWindowMessageCount = if GetHistoricalWindowMessageCountFunction then GetHistoricalWindowMessageCountFunction(false) else 0
	Smallest = math.min(Smallest, HistoricalWindowMessageCount)
	
	return HistoricalWindowMessageCount - Smallest
end

local _ = function()
	-- upvalues: Smallest (ref), GetMessagesStoreFunction (copy)
	local GetHistoricalWindowMessageCountFunction = GetMessagesStoreFunction(false).getHistoricalWindowMessageCount
	Smallest = if GetHistoricalWindowMessageCountFunction then GetHistoricalWindowMessageCountFunction(false) else 0
end

local function updateUnreadNotification()
	-- upvalues: RegisterResult (ref), FFlagExpChatHistoricalMessagesUnibarUnread (copy), GetMessagesStoreFunction (copy), Smallest (ref), FFlagExpChatEnableFriendsTab (copy), Count (ref), GetFriendsChatIconUnreadStoreModule (copy), ChatVisible (ref)
	if not RegisterResult.notification then return end
	local HistoricalWindowMessageCountDelta = nil
	if FFlagExpChatHistoricalMessagesUnibarUnread then
		local GetHistoricalWindowMessageCountFunction = GetMessagesStoreFunction(false).getHistoricalWindowMessageCount
		local HistoricalWindowMessageCount = if GetHistoricalWindowMessageCountFunction then GetHistoricalWindowMessageCountFunction(false) else 0
		Smallest = math.min(Smallest, HistoricalWindowMessageCount)
		HistoricalWindowMessageCountDelta = HistoricalWindowMessageCount - Smallest
	else
		HistoricalWindowMessageCountDelta = 0
	end
	if not FFlagExpChatEnableFriendsTab then
		RegisterResult.notification:fireCount(Count + HistoricalWindowMessageCountDelta)
		
		return
	end
	local NewCount = Count + GetFriendsChatIconUnreadStoreModule(false).getUnreadCountToDisplay(false) + HistoricalWindowMessageCountDelta
	
	if ChatVisible or NewCount == 0 then
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
	-- upvalues: ChatVisible (ref)
	return ChatVisible
end, function()
	-- upvalues: ChatSelectorModule (copy), ExpChatUnibarAvailabilityRefactor (copy), RunService (copy), Chat (copy), Players (copy), RegisterResult (ref), GuiService (copy), GameSettings (copy), ChatVisible (ref), Flag (ref), FFlagExpChatEnableFriendsTab (copy), Count (ref), FFlagExpChatHistoricalMessagesUnibarUnread (copy), Smallest (ref), GetMessagesStoreFunction (copy), GetFriendsChatIconUnreadStoreModule (copy), updateUnreadNotification (copy)
	local Visibility = ChatSelectorModule.GetVisibility()
	
	if not ExpChatUnibarAvailabilityRefactor and not Visibility then
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
		GameSettings.ChatVisible = Visibility
	end
	ChatVisible = Visibility
	Flag = true
	
	if FFlagExpChatEnableFriendsTab then
		if Visibility then
			Count = 0
			
			if FFlagExpChatHistoricalMessagesUnibarUnread then
				local GetHistoricalWindowMessageCountFunction = GetMessagesStoreFunction(false).getHistoricalWindowMessageCount
				Smallest = if GetHistoricalWindowMessageCountFunction then GetHistoricalWindowMessageCountFunction(false) else 0
			end
			GetFriendsChatIconUnreadStoreModule(false).clearDisplayCount()
		end
		updateUnreadNotification()
		
		return
	else
		if Visibility and Count and RegisterResult.notification then
			Count = 0
			
			if FFlagExpChatHistoricalMessagesUnibarUnread then
				local GetHistoricalWindowMessageCountFunction1 = GetMessagesStoreFunction(false).getHistoricalWindowMessageCount
				Smallest = if GetHistoricalWindowMessageCountFunction1 then GetHistoricalWindowMessageCountFunction1(false) else 0
			end
			RegisterResult.notification:clear()
		end
	end
end)

local _ = function()
	-- upvalues: InExperienceAppChatModalModule (copy)
	if InExperienceAppChatModalModule:getVisible() then
		InExperienceAppChatModalModule.default:setVisible(false)
		
		return
	end
end

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

local function isChatOpenAvailable(): boolean
	-- upvalues: RegisterResult (ref), ServiceModule (copy)
	return RegisterResult.availability:get() ~= ServiceModule.AvailabilitySignal.Unavailable
end

local _ = function(): boolean
	-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy)
	return IsInExperienceUIVREnabled and (IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter())
end

local function ensureOpenChat(Callback)
	-- upvalues: ChatVisible (ref), InExperienceAppChatModalModule (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), ChatSelectorModule (copy), FFlagEnableConsoleExpControls (copy), FocusSelectExpChatModule (copy), RegisterResult (ref), ChromeIntegrationUtilsModule (copy), ServiceModule (copy)
	if not ChatVisible then
		if IsInExperienceUIVREnabled and (IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter()) then
			if InExperienceAppChatModalModule:getVisible() then
				InExperienceAppChatModalModule.default:setVisible(false)
			end
			ChatSelectorModule:SetVisible(true)
			
			if FFlagEnableConsoleExpControls then
				FocusSelectExpChatModule(RegisterResult.id)
				
				return
			end
		else
			ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: Callback (copy), RegisterResult (upval), ServiceModule (upval), InExperienceAppChatModalModule (upval), ChatSelectorModule (upval), FFlagEnableConsoleExpControls (upval), FocusSelectExpChatModule (upval)
				if Callback() and RegisterResult.availability:get() ~= ServiceModule.AvailabilitySignal.Unavailable then
					if InExperienceAppChatModalModule:getVisible() then
						InExperienceAppChatModalModule.default:setVisible(false)
					end
					ChatSelectorModule:SetVisible(true)
					
					if FFlagEnableConsoleExpControls then
						FocusSelectExpChatModule(RegisterResult.id)
					end
				end
			end)
		end
		return
	elseif InExperienceAppChatModalModule:getVisible() then
		InExperienceAppChatModalModule.default:setVisible(false)
		
		return
	else
	end
end

RegisterResult = ServiceModule:register({
	id = "chat",
	label = "CoreScripts.TopBar.Chat",
	sideSheetPlacement = if ArgoPartyExperimentation.getIsRenameEnabled() and (not FFlagRemoveFriendsChatUnibarEntrypoints or not FFlagExpChatCanShowFriendsTab) then SideSheetPlacement.None else SideSheetPlacement.Unibar,
	activated = function(_)
		-- upvalues: ChatVisible (ref), ChatSelectorModule (copy), ExpChatPerfTracker (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtilsModule (copy), InExperienceAppChatModalModule (copy), FFlagEnableConsoleExpControls (copy), FocusSelectExpChatModule (copy), RegisterResult (ref)
		if ChatVisible then
			ChatSelectorModule:SetVisible(false)
			
			return
		end
		ExpChatPerfTracker.start(ExpChatPerfTracker.Events.ChatWindowMountTTI, {})
		
		if IsInExperienceUIVREnabled and (IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter()) then
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
	isActivated = NewMappedSignal,
	selected = if FFlagEnableConsoleExpControls then function(p1)
		-- upvalues: ServiceModule (copy), UserInputService (copy), GamepadUtils (copy), FocusSelectExpChatModule (copy), RegisterResult (ref)
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
	end else nil,
	components = {
		Icon = function(_)
			-- upvalues: GetExperienceChatVisualConfigFunction (copy), CommonIconModule (copy), NewMappedSignal (copy)
			local ExperienceChatVisualConfig = GetExperienceChatVisualConfigFunction()
			
			return CommonIconModule(ExperienceChatVisualConfig.icon.off, ExperienceChatVisualConfig.icon.on, NewMappedSignal)
		end
	}
})
RegisterResult.chatOpenCapability = if FFlagExpChatEnableFriendsTab then {
	isAvailable = isChatOpenAvailable,
	ensureOpenChat = ensureOpenChat
} else nil

if ExpChatUnibarAvailabilityRefactor then
	SignalsUtilsModule.createDetachedEffect(function(p1)
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
if FFlagEnableConsoleExpControls then
	SignalsUtilsModule.createDetachedEffect(function(p1)
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
	SignalsUtilsModule.createDetachedEffect(function(p1)
		-- upvalues: GetFriendsChatIconUnreadStoreModule (copy), updateUnreadNotification (copy)
		GetFriendsChatIconUnreadStoreModule(p1).getUnreadCountToDisplay(p1)
		updateUnreadNotification()
	end)
end
if FFlagExpChatHistoricalMessagesUnibarUnread then
	SignalsUtilsModule.createDetachedEffect(function(p1)
		-- upvalues: GetMessagesStoreFunction (copy), Flag (ref), ChatVisible (ref), Smallest (ref), updateUnreadNotification (copy)
		local GetHistoricalWindowMessageCountFunction = GetMessagesStoreFunction(p1).getHistoricalWindowMessageCount
		
		if GetHistoricalWindowMessageCountFunction then
			local _ = GetHistoricalWindowMessageCountFunction(p1)
		end
		if Flag and ChatVisible then
			local GetHistoricalWindowMessageCountFunction1 = GetMessagesStoreFunction(false).getHistoricalWindowMessageCount
			Smallest = if GetHistoricalWindowMessageCountFunction1 then GetHistoricalWindowMessageCountFunction1(false) else 0
		end
		updateUnreadNotification()
	end)
end
local _ = function(p1)
	-- upvalues: FFlagExpChatHistoricalMessagesUnibarUnread (copy), IsHistoricalMessageFunction (copy), ShouldSkipHistoricalMessageFunction (copy), ExpChatSuppressWelcomeMessageUnibarUnread (copy), ShouldSuppressUnreadForTabMetadataFunction (copy)
	return if FFlagExpChatHistoricalMessagesUnibarUnread and IsHistoricalMessageFunction(p1) then true elseif p1 == nil then ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(p1 and p1.Metadata) else ShouldSkipHistoricalMessageFunction(p1) or ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(p1 and p1.Metadata)
end

TextChatService.MessageReceived:Connect(function(TextChatMessage)
	-- upvalues: GetTextChannelDisplayModeFunction (copy), ShouldRenderTextChannelInDefaultWindowFunction (copy), FFlagExpChatHistoricalMessagesUnibarUnread (copy), IsHistoricalMessageFunction (copy), ShouldSkipHistoricalMessageFunction (copy), ExpChatSuppressWelcomeMessageUnibarUnread (copy), ShouldSuppressUnreadForTabMetadataFunction (copy), ChatVisible (ref), Count (ref), updateUnreadNotification (copy)
	if not ShouldRenderTextChannelInDefaultWindowFunction(TextChatMessage.TextChannel, (GetTextChannelDisplayModeFunction())) then return end
	if if FFlagExpChatHistoricalMessagesUnibarUnread and IsHistoricalMessageFunction(TextChatMessage) then true elseif TextChatMessage == nil then ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(TextChatMessage and TextChatMessage.Metadata) else ShouldSkipHistoricalMessageFunction(TextChatMessage) or ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(TextChatMessage and TextChatMessage.Metadata) then return end
	if not ChatVisible then
		Count += 1
		updateUnreadNotification()
	end
end)

if GetFFlagTextChatEnableUniverseChatTabsFunction() then
	TextChatService.UniverseChatMessageReceived:Connect(function(TextChatMessage)
		-- upvalues: FFlagExpChatHistoricalMessagesUnibarUnread (copy), IsHistoricalMessageFunction (copy), ShouldSkipHistoricalMessageFunction (copy), ExpChatSuppressWelcomeMessageUnibarUnread (copy), ShouldSuppressUnreadForTabMetadataFunction (copy), ChatVisible (ref), Count (ref), updateUnreadNotification (copy)
		if if FFlagExpChatHistoricalMessagesUnibarUnread and IsHistoricalMessageFunction(TextChatMessage) then true elseif TextChatMessage == nil then ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(TextChatMessage and TextChatMessage.Metadata) else ShouldSkipHistoricalMessageFunction(TextChatMessage) or ExpChatSuppressWelcomeMessageUnibarUnread and ShouldSuppressUnreadForTabMetadataFunction(TextChatMessage and TextChatMessage.Metadata) then return end
		if not ChatVisible then
			Count += 1
			updateUnreadNotification()
		end
	end)
end
local v1 = 0
ChatSelectorModule.MessagesChanged:connect(function(p1)
	-- upvalues: ChatVisible (ref), Count (ref), v1 (ref), updateUnreadNotification (copy)
	if not ChatVisible then
		Count += p1 - v1
		updateUnreadNotification()
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
	-- upvalues: GameSettings (copy), ViewportUtilModule (copy), ChatVisible (ref), ChatSelectorModule (copy)
	local ChatVisible1 = not ViewportUtilModule.isSmallTouchScreen() and GameSettings.ChatVisible
	ChatVisible = ChatVisible1
	ChatSelectorModule:SetVisible(ChatVisible1)
end

coroutine.wrap(function()
	-- upvalues: Players (copy), RunService (copy), Chat (copy), ExpChatUnibarAvailabilityRefactor (copy), Default (copy), GameSettings (copy), ViewportUtilModule (copy), ChatVisible (ref), ChatSelectorModule (copy), RegisterResult (ref), ChromeUtilsModule (copy)
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
			local ChatVisible1 = not ViewportUtilModule.isSmallTouchScreen() and GameSettings.ChatVisible
			ChatVisible = ChatVisible1
			ChatSelectorModule:SetVisible(ChatVisible1)
			
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
		local ChatVisible2 = not ViewportUtilModule.isSmallTouchScreen() and GameSettings.ChatVisible
		ChatVisible = ChatVisible2
		ChatSelectorModule:SetVisible(ChatVisible2)
	end
end)()

function _simulateChat()
	-- upvalues: ChatVisible (ref), Count (ref), updateUnreadNotification (copy)
	while true do
		task.wait(math.random(1, 15))
		if ChatVisible then
			continue
		end
		Count += 1
		updateUnreadNotification()
	end
end

return RegisterResult