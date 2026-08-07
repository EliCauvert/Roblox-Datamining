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
local signalsRobloxModule = require(corePackagesService.Packages.SignalsRoblox)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local focusNavigationStore = expChatModule.Stores.GetFocusNavigationStore(false)
local shouldSuppressUnreadForTabMetadata = expChatModule.shouldSuppressUnreadForTabMetadata
local getFriendsChatIconUnreadStoreModule = require(corePackagesService.Workspace.Packages.FriendsChat.GetFriendsChatIconUnreadStore)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagExpChatWindowSyncUnibar = sharedFlagsModule.FFlagExpChatWindowSyncUnibar
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local getExperienceChatVisualConfig = require(corePackagesService.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local getFFlagTextChatEnableUniverseChatTabs = require(corePackagesService.Workspace.Packages.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local expChatSuppressWelcomeMessageUnibarUnread = game:DefineFastFlag("ExpChatSuppressWelcomeMessageUnibarUnread", false)
local expChatUnibarThumbstickNavigate = game:DefineFastFlag("ExpChatUnibarThumbstickNavigate", false)
local expChatUnibarAvailabilityRefactor = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local fFlagExpChatPerfTracking = sharedFlagsModule.FFlagExpChatPerfTracking
local expChatPerfTracker = expChatModule.ExpChatPerfTracker
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local var28 = 0
local visibility = chatSelectorModule:GetVisibility()
local var30 = nil
local visibilityStateChanged = chatSelectorModule.VisibilityStateChanged

local function updateUnreadNotification() --[[ line: 70 ]]
	-- upvalues: var30 (write), fFlagExpChatEnableFriendsTab (ref), var28 (write), getFriendsChatIconUnreadStoreModule (ref), visibility (write)
	if not var30.notification then return end
	if not fFlagExpChatEnableFriendsTab then
		var30.notification:fireCount(var28)
		
		return
	end
	local var35 = var28 + getFriendsChatIconUnreadStoreModule(false).getUnreadCountToDisplay(false)
	
	if visibility or var35 == 0 then
		var30.notification:clear()
		
		return
	end
	var30.notification:fireCount(var35)
end

local function _() --[[ line: 89 | named "localUserCanChat" ]]
	-- upvalues: runService (ref), chatService (ref), playersService (ref)
	if runService:IsStudio() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 91 ]]
		-- upvalues: chatService (copy), playersService (copy)
		return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	end)
	
	return ok and status
end

if not fFlagExpChatWindowSyncUnibar then
	visibilityStateChanged:connect(function(p0) --[[ line: 102 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var30 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p0)
			
			return
		elseif p0 then
			var30.availability:pinned()
		end
	end)
	chatSelectorModule.ChatWindowToggled:connect(function(p1) --[[ line: 113 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var30 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p1)
			
			return
		elseif p1 then
			var30.availability:pinned()
		end
	end)
end
if fFlagExpChatWindowSyncUnibar then
	gameSettings:GetPropertyChangedSignal("ChatVisible"):Connect(function() --[[ line: 127 ]]
		-- upvalues: default (ref), gameSettings (ref)
		default.setGameSettingsChatVisible(gameSettings.ChatVisible)
	end)
	default.setGameSettingsChatVisible(gameSettings.ChatVisible)
end
local var32 = mappedSignal.new(visibilityStateChanged, function() --[[ line: 133 ]]
	-- upvalues: visibility (write)
	return visibility
end, function() --[[ line: 135 ]]
	-- upvalues: chatSelectorModule (ref), expChatUnibarAvailabilityRefactor (ref), runService (ref), chatService (ref), playersService (ref), var30 (write), guiService (ref), gameSettings (ref), visibility (write), fFlagExpChatEnableFriendsTab (ref), var28 (write), getFriendsChatIconUnreadStoreModule (ref), updateUnreadNotification (ref)
	local visibility_1 = chatSelectorModule.GetVisibility()
	
	if not expChatUnibarAvailabilityRefactor and not visibility_1 then
		local status_1
		if runService:IsStudio() then
			status_1 = true
		else
			local ok, status = pcall(function() --[[ line: 91 ]]
				-- upvalues: chatService (copy), playersService (copy)
				return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
			end)
			status_1 = ok and status
		end
		if not status_1 then
			var30.availability:unavailable()
		end
	end
	if not guiService.MenuIsOpen then
		gameSettings.ChatVisible = visibility_1
	end
	visibility = visibility_1
	
	if fFlagExpChatEnableFriendsTab then
		if visibility_1 then
			var28 = 0
			getFriendsChatIconUnreadStoreModule(false).clearDisplayCount()
		end
		updateUnreadNotification()
		
		return
	elseif visibility_1 and var28 and var30.notification then
		var28 = 0
		var30.notification:clear()
	end
end)

local _ = function() --[[ line: 164 ]]
	-- upvalues: inExperienceAppChatModalModule (ref), chatSelectorModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var30 (write)
	if inExperienceAppChatModalModule:getVisible() then
		inExperienceAppChatModalModule.default:setVisible(false)
	end
	chatSelectorModule:SetVisible(true)
	
	if fFlagEnableConsoleExpControls then
		focusSelectExpChatModule(var30.id)
	end
end

local t = {
	id = "chat",
	label = "CoreScripts.TopBar.Chat",
	sideSheetPlacement = if argoPartyExperimentation.getIsRenameEnabled() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not fFlagExpChatEnableFriendsTab) then sideSheetPlacement.None else sideSheetPlacement.Unibar
}

function t.activated(_) --[[ line: 184 ]]
	-- upvalues: visibility (write), chatSelectorModule (ref), fFlagExpChatPerfTracking (ref), expChatPerfTracker (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), inExperienceAppChatModalModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var30 (write)
	if visibility then
		chatSelectorModule:SetVisible(false)
		
		return
	elseif fFlagExpChatPerfTracking then
		expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowMountTTI, {})
	end
	if isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
		chatSelectorModule:SetVisible(true)
		
		return
	end
	chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 194 ]]
		-- upvalues: inExperienceAppChatModalModule (copy), chatSelectorModule (copy), fFlagEnableConsoleExpControls (copy), focusSelectExpChatModule (copy), var30 (copy)
		if inExperienceAppChatModalModule:getVisible() then
			inExperienceAppChatModalModule.default:setVisible(false)
		end
		chatSelectorModule:SetVisible(true)
		
		if fFlagEnableConsoleExpControls then
			focusSelectExpChatModule(var30.id)
		end
	end)
end

t.isActivated = if fFlagChromeActivatedMappedSignal then var32 else function() --[[ line: 202 ]]
	-- upvalues: var32 (ref)
	return var32:get()
end
t.selected = if fFlagEnableConsoleExpControls then function(p2) --[[ line: 206 ]]
	-- upvalues: expChatUnibarThumbstickNavigate (ref), serviceModule (ref), userInputService (ref), gamepadUtils (ref), focusSelectExpChatModule (ref), var30 (write)
	local inputEndedConnection
	if expChatUnibarThumbstickNavigate then
		inputEndedConnection = nil
		local inputChangedConnection = nil
		local inputBeganConnection = nil
		inputEndedConnection = serviceModule:selectedItem():connect(function(p3) --[[ line: 212 ]]
			-- upvalues: p2 (ref), inputEndedConnection (write), inputChangedConnection (write), inputBeganConnection (write)
			assert(p3 ~= p2.id, "Expected selectedId to not be self.id on selection")
			inputEndedConnection:disconnect()
			inputChangedConnection:Disconnect()
			inputBeganConnection:Disconnect()
		end)
		inputChangedConnection = userInputService.InputChanged:Connect(function(p4) --[[ line: 222 ]]
			-- upvalues: gamepadUtils (copy), focusSelectExpChatModule (copy), var30 (copy)
			if p4.KeyCode == Enum.KeyCode.Thumbstick1 and gamepadUtils.mapPositionToDirection(Vector2.new(p4.Position.X, p4.Position.Y)) == Enum.KeyCode.Down then
				focusSelectExpChatModule(var30.id)
			end
		end)
		inputBeganConnection = userInputService.InputBegan:Connect(function(p5) --[[ line: 231 ]]
			-- upvalues: focusSelectExpChatModule (copy), var30 (copy)
			local keyCode = p5.KeyCode
			
			if keyCode == Enum.KeyCode.DPadDown or keyCode == Enum.KeyCode.Down then
				focusSelectExpChatModule(var30.id)
			end
		end)
		
		return
	end
	inputEndedConnection = nil
	inputEndedConnection = userInputService.InputEnded:Connect(function(p6) --[[ line: 239 ]]
		-- upvalues: focusSelectExpChatModule (copy), var30 (copy), inputEndedConnection (write), serviceModule (copy), p2 (ref)
		if p6.KeyCode == Enum.KeyCode.DPadDown then
			focusSelectExpChatModule(var30.id)
		end
		if inputEndedConnection and serviceModule:selectedItem():get() ~= p2.id then
			inputEndedConnection:Disconnect()
		end
	end)
end else nil
t.components = {
	Icon = function(_) --[[ line: 252 ]]
		-- upvalues: getExperienceChatVisualConfig (ref), commonIconModule (ref), var32 (ref)
		local var41 = getExperienceChatVisualConfig()
		
		return commonIconModule(var41.icon.off, var41.icon.on, var32)
	end
}
var30 = serviceModule:register(t)

if expChatUnibarAvailabilityRefactor then
	signalsRobloxModule.createDetachedEffect(function(p7) --[[ line: 263 ]]
		-- upvalues: default (ref), var30 (write), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref)
		if default.getIsChatIconVisible(p7) then
			var30.availability:available()
		else
			var30.availability:unavailable()
		end
		if fFlagExpChatWindowSyncUnibar then
			expChatModule.Events.ChatTopBarButtonActivated(default.getIsChatWindowVisible(p7))
		end
	end)
	chromeUtilsModule.setCoreGuiAvailability(var30, Enum.CoreGuiType.Chat, function(p8) --[[ line: 280 ]]
		-- upvalues: default (ref)
		default.setCoreGuiEnabled(p8)
	end)
end
if fFlagChatIntegrationFixShortcutModule and fFlagEnableConsoleExpControls then
	signalsRobloxModule.createDetachedEffect(function(p9) --[[ line: 286 ]]
		-- upvalues: focusNavigationStore (ref), serviceModule (ref), constantsModule (ref)
		if focusNavigationStore.getChatInputBarFocused(p9) then
			serviceModule:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
			
			return
		end
		serviceModule:setShortcutBar(nil)
	end)
end
if fFlagExpChatEnableFriendsTab then
	signalsRobloxModule.createDetachedEffect(function(p10) --[[ line: 298 ]]
		-- upvalues: getFriendsChatIconUnreadStoreModule (ref), updateUnreadNotification (ref)
		getFriendsChatIconUnreadStoreModule(p10).getUnreadCountToDisplay(p10)
		updateUnreadNotification()
	end)
end
local _ = function(p11) --[[ line: 306 | named "shouldIgnoreUnreadForMessage" ]]
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref)
	local var42 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var42 then
		var42 = shouldSuppressUnreadForTabMetadata(p11 and p11.Metadata)
	end
	return var42
end

textChatService.MessageReceived:Connect(function(p12) --[[ line: 311 ]]
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var28 (write), updateUnreadNotification (ref)
	local var43 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var43 then
		var43 = shouldSuppressUnreadForTabMetadata(p12 and p12.Metadata)
	end
	if var43 then return end
	if not visibility then
		var28 += 1
		updateUnreadNotification()
	end
end)

if getFFlagTextChatEnableUniverseChatTabs() then
	textChatService.UniverseChatMessageReceived:Connect(function(p13) --[[ line: 323 ]]
		-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var28 (write), updateUnreadNotification (ref)
		local var44 = expChatSuppressWelcomeMessageUnibarUnread
		
		if var44 then
			var44 = shouldSuppressUnreadForTabMetadata(p13 and p13.Metadata)
		end
		if var44 then return end
		if not visibility then
			var28 += 1
			updateUnreadNotification()
		end
	end)
end
local var34 = 0
chatSelectorModule.MessagesChanged:connect(function(p14) --[[ line: 335 ]]
	-- upvalues: visibility (write), var28 (write), var34 (write), updateUnreadNotification (ref)
	if not visibility then
		var28 += p14 - var34
		updateUnreadNotification()
	end
	var34 = p14
end)

if not fFlagExpChatWindowSyncUnibar then
	chatSelectorModule.ChatActiveChanged:connect(function(p15) --[[ line: 344 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), runService (ref), chatService (ref), playersService (ref), var30 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setChatActiveCalledByDeveloper(p15)
			
			return
		elseif p15 then
			local status_1
			if runService:IsStudio() then
				status_1 = true
			else
				local ok, status = pcall(function() --[[ line: 91 ]]
					-- upvalues: chatService (copy), playersService (copy)
					return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
				end)
				status_1 = ok and status
			end
			if not status_1 then
				var30.availability:available()
			end
		end
	end)
end
local _ = function() --[[ line: 358 | named "setChatVisibilityOnLoad" ]]
	-- upvalues: gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref)
	local var46 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
	visibility = var46
	chatSelectorModule:SetVisible(var46)
end

coroutine.wrap(function() --[[ line: 368 ]]
	-- upvalues: playersService (ref), runService (ref), chatService (ref), expChatUnibarAvailabilityRefactor (ref), default (ref), gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref), var30 (write), chromeUtilsModule (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local status_1
	if runService:IsStudio() then
		status_1 = true
	else
		local ok, status = pcall(function() --[[ line: 91 ]]
			-- upvalues: chatService (copy), playersService (copy)
			return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
		end)
		status_1 = ok and status
	end
	if expChatUnibarAvailabilityRefactor then
		default.setLocalUserChat(status_1)
		
		if status_1 then
			local var48 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
			visibility = var48
			chatSelectorModule:SetVisible(var48)
			
			return
		end
	elseif status_1 and var30.availability then
		chromeUtilsModule.setCoreGuiAvailability(var30, Enum.CoreGuiType.Chat, function(p16) --[[ line: 383 ]]
			-- upvalues: var30 (copy)
			if p16 then
				var30.availability:pinned()
				
				return
			end
			var30.availability:unavailable()
		end)
		local var49 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
		visibility = var49
		chatSelectorModule:SetVisible(var49)
	end
end)()

function _simulateChat() --[[ line: 403 ]]
	-- upvalues: visibility (write), var28 (write), updateUnreadNotification (ref)
	while true do
		task.wait(math.random(1, 15))
		if visibility then continue end
		var28 += 1
		updateUnreadNotification()
	end
end

return var30