local chrome = script:FindFirstAncestor("Chrome")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local textChatService = game:GetService("TextChatService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local chromeIntegrationUtilsModule = require(chrome.Integrations.ChromeIntegrationUtils)
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local fFlagChatIntegrationFixShortcutModule = require(chrome.Flags.FFlagChatIntegrationFixShortcut)
local focusSelectExpChatModule = require(chrome.ChromeShared.Utility.FocusSelectExpChat)
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local mappedSignal = chromeUtilsModule.MappedSignal
local gameSettings = UserSettings().GameSettings
local guiService = game:GetService("GuiService")
local gamepadUtils = require(corePackagesService.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local default = require(script.Parent.ChatIconVisibleSignals).default
local signalsUtilsModule = require(corePackagesService.Workspace.Packages.SignalsUtils)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement

if require(robloxGui.Modules.Flags.FFlagDebugDisableExperienceChatMain) then
	return nil
end
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local focusNavigationStore = expChatModule.Stores.GetFocusNavigationStore(false)
local shouldSuppressUnreadForTabMetadata = expChatModule.shouldSuppressUnreadForTabMetadata
local getFriendsChatIconUnreadStoreModule = require(corePackagesService.Workspace.Packages.FriendsChat.GetFriendsChatIconUnreadStore)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagExpChatWindowSyncUnibar = sharedFlagsModule.FFlagExpChatWindowSyncUnibar
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local getExperienceChatVisualConfig = require(corePackagesService.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local getFFlagTextChatEnableUniverseChatTabs = require(corePackagesService.Workspace.Packages.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local expChatSuppressWelcomeMessageUnibarUnread = game:DefineFastFlag("ExpChatSuppressWelcomeMessageUnibarUnread", false)
local expChatUnibarThumbstickNavigate = game:DefineFastFlag("ExpChatUnibarThumbstickNavigate", false)
local expChatUnibarAvailabilityRefactor = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local expChatPerfTracker = expChatModule.ExpChatPerfTracker
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local var1 = 0
local visibility = chatSelectorModule:GetVisibility()
local var2 = nil
local visibilityStateChanged = chatSelectorModule.VisibilityStateChanged

local function updateUnreadNotification()
	-- upvalues: var2 (write), fFlagExpChatEnableFriendsTab (ref), var1 (write), getFriendsChatIconUnreadStoreModule (ref), visibility (write)
	if not var2.notification then return end
	if not fFlagExpChatEnableFriendsTab then
		var2.notification:fireCount(var1)
		
		return
	end
	local var3 = var1 + getFriendsChatIconUnreadStoreModule(false).getUnreadCountToDisplay(false)
	
	if visibility or var3 == 0 then
		var2.notification:clear()
		
		return
	end
	var2.notification:fireCount(var3)
end

local function _()
	-- upvalues: runService (ref), chatService (ref), playersService (ref)
	if runService:IsStudio() then
		return true
	end
	local ok, status = pcall(function()
		-- upvalues: chatService (copy), playersService (copy)
		return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	end)
	
	return ok and status
end

if not fFlagExpChatWindowSyncUnibar then
	visibilityStateChanged:connect(function(p1)
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var2 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p1)
			
			return
		elseif p1 then
			var2.availability:pinned()
		end
	end)
	chatSelectorModule.ChatWindowToggled:connect(function(p1)
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var2 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p1)
			
			return
		elseif p1 then
			var2.availability:pinned()
		end
	end)
end
if fFlagExpChatWindowSyncUnibar then
	gameSettings:GetPropertyChangedSignal("ChatVisible"):Connect(function()
		-- upvalues: default (ref), gameSettings (ref)
		default.setGameSettingsChatVisible(gameSettings.ChatVisible)
	end)
	default.setGameSettingsChatVisible(gameSettings.ChatVisible)
end
local var3 = mappedSignal.new(visibilityStateChanged, function()
	-- upvalues: visibility (write)
	return visibility
end, function()
	-- upvalues: chatSelectorModule (ref), expChatUnibarAvailabilityRefactor (ref), runService (ref), chatService (ref), playersService (ref), var2 (write), guiService (ref), gameSettings (ref), visibility (write), fFlagExpChatEnableFriendsTab (ref), var1 (write), getFriendsChatIconUnreadStoreModule (ref), updateUnreadNotification (ref)
	local visibility_1 = chatSelectorModule.GetVisibility()
	
	if not expChatUnibarAvailabilityRefactor and not visibility_1 then
		local status_1
		if runService:IsStudio() then
			status_1 = true
		else
			local ok, status = pcall(function()
				-- upvalues: chatService (copy), playersService (copy)
				return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
			end)
			status_1 = ok and status
		end
		if not status_1 then
			var2.availability:unavailable()
		end
	end
	if not guiService.MenuIsOpen then
		gameSettings.ChatVisible = visibility_1
	end
	visibility = visibility_1
	
	if fFlagExpChatEnableFriendsTab then
		if visibility_1 then
			var1 = 0
			getFriendsChatIconUnreadStoreModule(false).clearDisplayCount()
		end
		updateUnreadNotification()
		
		return
	elseif visibility_1 and var1 and var2.notification then
		var1 = 0
		var2.notification:clear()
	end
end)

local _ = function()
	-- upvalues: inExperienceAppChatModalModule (ref)
	if inExperienceAppChatModalModule:getVisible() then
		inExperienceAppChatModalModule.default:setVisible(false)
		
		return
	end
end

local _ = function()
	-- upvalues: inExperienceAppChatModalModule (ref), chatSelectorModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var2 (write)
	if inExperienceAppChatModalModule:getVisible() then
		inExperienceAppChatModalModule.default:setVisible(false)
	end
	chatSelectorModule:SetVisible(true)
	
	if fFlagEnableConsoleExpControls then
		focusSelectExpChatModule(var2.id)
	end
end

local function isChatOpenAvailable()
	-- upvalues: var2 (write), serviceModule (ref)
	return var2.availability:get() ~= serviceModule.AvailabilitySignal.Unavailable
end

local _ = function()
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref)
	return isInExperienceUIVREnabled and (isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter())
end

local function ensureOpenChat(p1)
	-- upvalues: visibility (write), inExperienceAppChatModalModule (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chatSelectorModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var2 (write), chromeIntegrationUtilsModule (ref), serviceModule (ref)
	if visibility then
		if inExperienceAppChatModalModule:getVisible() then
			inExperienceAppChatModalModule.default:setVisible(false)
			
			return
		end
		return
	elseif isInExperienceUIVREnabled and (isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter()) then
		if inExperienceAppChatModalModule:getVisible() then
			inExperienceAppChatModalModule.default:setVisible(false)
		end
		chatSelectorModule:SetVisible(true)
		
		if fFlagEnableConsoleExpControls then
			focusSelectExpChatModule(var2.id)
			
			return
		end
	else
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
			-- upvalues: p1 (ref), var2 (copy), serviceModule (copy), inExperienceAppChatModalModule (copy), chatSelectorModule (copy), fFlagEnableConsoleExpControls (copy), focusSelectExpChatModule (copy)
			if p1() and var2.availability:get() ~= serviceModule.AvailabilitySignal.Unavailable then
				if inExperienceAppChatModalModule:getVisible() then
					inExperienceAppChatModalModule.default:setVisible(false)
				end
				chatSelectorModule:SetVisible(true)
				
				if fFlagEnableConsoleExpControls then
					focusSelectExpChatModule(var2.id)
				end
			end
		end)
	end
end

local t = {
	id = "chat",
	label = "CoreScripts.TopBar.Chat",
	sideSheetPlacement = if argoPartyExperimentation.getIsRenameEnabled() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not fFlagExpChatCanShowFriendsTab) then sideSheetPlacement.None else sideSheetPlacement.Unibar
}

function t.activated(_)
	-- upvalues: visibility (write), chatSelectorModule (ref), expChatPerfTracker (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), inExperienceAppChatModalModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var2 (write)
	if visibility then
		chatSelectorModule:SetVisible(false)
		
		return
	end
	expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowMountTTI, {})
	
	if isInExperienceUIVREnabled and (isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter()) then
		chatSelectorModule:SetVisible(true)
		
		return
	end
	chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
		-- upvalues: inExperienceAppChatModalModule (copy), chatSelectorModule (copy), fFlagEnableConsoleExpControls (copy), focusSelectExpChatModule (copy), var2 (copy)
		if inExperienceAppChatModalModule:getVisible() then
			inExperienceAppChatModalModule.default:setVisible(false)
		end
		chatSelectorModule:SetVisible(true)
		
		if fFlagEnableConsoleExpControls then
			focusSelectExpChatModule(var2.id)
		end
	end)
end

t.isActivated = var3
t.selected = if fFlagEnableConsoleExpControls then function(p1)
	-- upvalues: expChatUnibarThumbstickNavigate (ref), serviceModule (ref), userInputService (ref), gamepadUtils (ref), focusSelectExpChatModule (ref), var2 (write)
	local inputEndedConnection
	if expChatUnibarThumbstickNavigate then
		inputEndedConnection = nil
		local inputChangedConnection = nil
		local inputBeganConnection = nil
		inputEndedConnection = serviceModule:selectedItem():connect(function(p2)
			-- upvalues: p1 (ref), inputEndedConnection (write), inputChangedConnection (write), inputBeganConnection (write)
			assert(p2 ~= p1.id, "Expected selectedId to not be self.id on selection")
			inputEndedConnection:disconnect()
			inputChangedConnection:Disconnect()
			inputBeganConnection:Disconnect()
		end)
		inputChangedConnection = userInputService.InputChanged:Connect(function(p2)
			-- upvalues: gamepadUtils (copy), focusSelectExpChatModule (copy), var2 (copy)
			if p2.KeyCode == Enum.KeyCode.Thumbstick1 and gamepadUtils.mapPositionToDirection(Vector2.new(p2.Position.X, p2.Position.Y)) == Enum.KeyCode.Down then
				focusSelectExpChatModule(var2.id)
			end
		end)
		inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: focusSelectExpChatModule (copy), var2 (copy)
			local keyCode = p2.KeyCode
			
			if keyCode == Enum.KeyCode.DPadDown or keyCode == Enum.KeyCode.Down then
				focusSelectExpChatModule(var2.id)
			end
		end)
		
		return
	end
	inputEndedConnection = nil
	inputEndedConnection = userInputService.InputEnded:Connect(function(p2)
		-- upvalues: focusSelectExpChatModule (copy), var2 (copy), inputEndedConnection (write), serviceModule (copy), p1 (ref)
		if p2.KeyCode == Enum.KeyCode.DPadDown then
			focusSelectExpChatModule(var2.id)
		end
		if inputEndedConnection and serviceModule:selectedItem():get() ~= p1.id then
			inputEndedConnection:Disconnect()
		end
	end)
end else nil
t.components = {
	Icon = function(_)
		-- upvalues: getExperienceChatVisualConfig (ref), commonIconModule (ref), var3 (ref)
		local var4 = getExperienceChatVisualConfig()
		
		return commonIconModule(var4.icon.off, var4.icon.on, var3)
	end
}
var2 = serviceModule:register(t)
var2.chatOpenCapability = if fFlagExpChatEnableFriendsTab then {
	isAvailable = isChatOpenAvailable,
	ensureOpenChat = ensureOpenChat
} else nil

if expChatUnibarAvailabilityRefactor then
	signalsUtilsModule.createDetachedEffect(function(p1)
		-- upvalues: default (ref), var2 (write), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref)
		if default.getIsChatIconVisible(p1) then
			var2.availability:available()
		else
			var2.availability:unavailable()
		end
		if fFlagExpChatWindowSyncUnibar then
			expChatModule.Events.ChatTopBarButtonActivated(default.getIsChatWindowVisible(p1))
		end
	end)
	chromeUtilsModule.setCoreGuiAvailability(var2, Enum.CoreGuiType.Chat, function(p1)
		-- upvalues: default (ref)
		default.setCoreGuiEnabled(p1)
	end)
end
if fFlagChatIntegrationFixShortcutModule and fFlagEnableConsoleExpControls then
	signalsUtilsModule.createDetachedEffect(function(p1)
		-- upvalues: focusNavigationStore (ref), serviceModule (ref), constantsModule (ref)
		if focusNavigationStore.getChatInputBarFocused(p1) then
			serviceModule:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
			
			return
		end
		serviceModule:setShortcutBar(nil)
	end)
end
if fFlagExpChatEnableFriendsTab then
	signalsUtilsModule.createDetachedEffect(function(p1)
		-- upvalues: getFriendsChatIconUnreadStoreModule (ref), updateUnreadNotification (ref)
		getFriendsChatIconUnreadStoreModule(p1).getUnreadCountToDisplay(p1)
		updateUnreadNotification()
	end)
end
local _ = function(p1)
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref)
	local var4 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var4 then
		var4 = shouldSuppressUnreadForTabMetadata(p1 and p1.Metadata)
	end
	return var4
end

textChatService.MessageReceived:Connect(function(p1)
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var1 (write), updateUnreadNotification (ref)
	local var4 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var4 then
		var4 = shouldSuppressUnreadForTabMetadata(p1 and p1.Metadata)
	end
	if var4 then return end
	if not visibility then
		var1 += 1
		updateUnreadNotification()
	end
end)

if getFFlagTextChatEnableUniverseChatTabs() then
	textChatService.UniverseChatMessageReceived:Connect(function(p1)
		-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var1 (write), updateUnreadNotification (ref)
		local var4 = expChatSuppressWelcomeMessageUnibarUnread
		
		if var4 then
			var4 = shouldSuppressUnreadForTabMetadata(p1 and p1.Metadata)
		end
		if var4 then return end
		if not visibility then
			var1 += 1
			updateUnreadNotification()
		end
	end)
end
local var4 = 0
chatSelectorModule.MessagesChanged:connect(function(p1)
	-- upvalues: visibility (write), var1 (write), var4 (write), updateUnreadNotification (ref)
	if not visibility then
		var1 += p1 - var4
		updateUnreadNotification()
	end
	var4 = p1
end)

if not fFlagExpChatWindowSyncUnibar then
	chatSelectorModule.ChatActiveChanged:connect(function(p1)
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), runService (ref), chatService (ref), playersService (ref), var2 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setChatActiveCalledByDeveloper(p1)
			
			return
		elseif p1 then
			local status_1
			if runService:IsStudio() then
				status_1 = true
			else
				local ok, status = pcall(function()
					-- upvalues: chatService (copy), playersService (copy)
					return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
				end)
				status_1 = ok and status
			end
			if not status_1 then
				var2.availability:available()
			end
		end
	end)
end
local _ = function()
	-- upvalues: gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref)
	local var5 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
	visibility = var5
	chatSelectorModule:SetVisible(var5)
end

coroutine.wrap(function()
	-- upvalues: playersService (ref), runService (ref), chatService (ref), expChatUnibarAvailabilityRefactor (ref), default (ref), gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref), var2 (write), chromeUtilsModule (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local status_1
	if runService:IsStudio() then
		status_1 = true
	else
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), playersService (copy)
			return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
		end)
		status_1 = ok and status
	end
	if expChatUnibarAvailabilityRefactor then
		default.setLocalUserChat(status_1)
		
		if status_1 then
			local var5 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
			visibility = var5
			chatSelectorModule:SetVisible(var5)
			
			return
		end
	elseif status_1 and var2.availability then
		chromeUtilsModule.setCoreGuiAvailability(var2, Enum.CoreGuiType.Chat, function(p1)
			-- upvalues: var2 (copy)
			if p1 then
				var2.availability:pinned()
				
				return
			end
			var2.availability:unavailable()
		end)
		local var6 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
		visibility = var6
		chatSelectorModule:SetVisible(var6)
	end
end)()

function _simulateChat()
	-- upvalues: visibility (write), var1 (write), updateUnreadNotification (ref)
	while true do
		task.wait(math.random(1, 15))
		if visibility then continue end
		var1 += 1
		updateUnreadNotification()
	end
end

return var2