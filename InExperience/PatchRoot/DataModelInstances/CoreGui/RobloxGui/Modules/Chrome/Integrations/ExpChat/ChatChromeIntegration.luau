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

local function updateUnreadNotification() --[[ line: 78 ]]
	-- upvalues: var30 (write), fFlagExpChatEnableFriendsTab (ref), var28 (write), getFriendsChatIconUnreadStoreModule (ref), visibility (write)
	if not var30.notification then return end
	if not fFlagExpChatEnableFriendsTab then
		var30.notification:fireCount(var28)
		
		return
	end
	local var37 = var28 + getFriendsChatIconUnreadStoreModule(false).getUnreadCountToDisplay(false)
	
	if visibility or var37 == 0 then
		var30.notification:clear()
		
		return
	end
	var30.notification:fireCount(var37)
end

local function _() --[[ line: 97 | named "localUserCanChat" ]]
	-- upvalues: runService (ref), chatService (ref), playersService (ref)
	if runService:IsStudio() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 99 ]]
		-- upvalues: chatService (copy), playersService (copy)
		return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	end)
	
	return ok and status
end

if not fFlagExpChatWindowSyncUnibar then
	visibilityStateChanged:connect(function(p0) --[[ line: 110 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var30 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p0)
			
			return
		elseif p0 then
			var30.availability:pinned()
		end
	end)
	chatSelectorModule.ChatWindowToggled:connect(function(p1) --[[ line: 121 ]]
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
	gameSettings:GetPropertyChangedSignal("ChatVisible"):Connect(function() --[[ line: 135 ]]
		-- upvalues: default (ref), gameSettings (ref)
		default.setGameSettingsChatVisible(gameSettings.ChatVisible)
	end)
	default.setGameSettingsChatVisible(gameSettings.ChatVisible)
end
local var32 = mappedSignal.new(visibilityStateChanged, function() --[[ line: 141 ]]
	-- upvalues: visibility (write)
	return visibility
end, function() --[[ line: 143 ]]
	-- upvalues: chatSelectorModule (ref), expChatUnibarAvailabilityRefactor (ref), runService (ref), chatService (ref), playersService (ref), var30 (write), guiService (ref), gameSettings (ref), visibility (write), fFlagExpChatEnableFriendsTab (ref), var28 (write), getFriendsChatIconUnreadStoreModule (ref), updateUnreadNotification (ref)
	local visibility_1 = chatSelectorModule.GetVisibility()
	
	if not expChatUnibarAvailabilityRefactor and not visibility_1 then
		local status_1
		if runService:IsStudio() then
			status_1 = true
		else
			local ok, status = pcall(function() --[[ line: 99 ]]
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

local _ = function() --[[ line: 172 | named "hideAppChat" ]]
	-- upvalues: inExperienceAppChatModalModule (ref)
	if inExperienceAppChatModalModule:getVisible() then
		inExperienceAppChatModalModule.default:setVisible(false)
		
		return
	end
end

local _ = function() --[[ line: 180 | named "revealChat" ]]
	-- upvalues: inExperienceAppChatModalModule (ref), chatSelectorModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var30 (write)
	if inExperienceAppChatModalModule:getVisible() then
		inExperienceAppChatModalModule.default:setVisible(false)
	end
	chatSelectorModule:SetVisible(true)
	
	if fFlagEnableConsoleExpControls then
		focusSelectExpChatModule(var30.id)
	end
end

local function isChatOpenAvailable() --[[ line: 190 ]]
	-- upvalues: var30 (write), serviceModule (ref)
	return var30.availability:get() ~= serviceModule.AvailabilitySignal.Unavailable
end

local _ = function() --[[ line: 194 | named "isSpatialDirectOpen" ]]
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref)
	return isInExperienceUIVREnabled and (isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter())
end

local function ensureOpenChat(p2) --[[ line: 200 ]]
	-- upvalues: visibility (write), inExperienceAppChatModalModule (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chatSelectorModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var30 (write), chromeIntegrationUtilsModule (ref), serviceModule (ref)
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
			focusSelectExpChatModule(var30.id)
			
			return
		end
	else
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 206 ]]
			-- upvalues: p2 (ref), var30 (copy), serviceModule (copy), inExperienceAppChatModalModule (copy), chatSelectorModule (copy), fFlagEnableConsoleExpControls (copy), focusSelectExpChatModule (copy)
			if p2() and var30.availability:get() ~= serviceModule.AvailabilitySignal.Unavailable then
				if inExperienceAppChatModalModule:getVisible() then
					inExperienceAppChatModalModule.default:setVisible(false)
				end
				chatSelectorModule:SetVisible(true)
				
				if fFlagEnableConsoleExpControls then
					focusSelectExpChatModule(var30.id)
				end
			end
		end)
	end
end

local t = {
	id = "chat",
	label = "CoreScripts.TopBar.Chat",
	sideSheetPlacement = if argoPartyExperimentation.getIsRenameEnabled() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not fFlagExpChatEnableFriendsTab) then sideSheetPlacement.None else sideSheetPlacement.Unibar
}

function t.activated(_) --[[ line: 226 ]]
	-- upvalues: visibility (write), chatSelectorModule (ref), fFlagExpChatPerfTracking (ref), expChatPerfTracker (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), inExperienceAppChatModalModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var30 (write)
	if visibility then
		chatSelectorModule:SetVisible(false)
		
		return
	elseif fFlagExpChatPerfTracking then
		expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowMountTTI, {})
	end
	if isInExperienceUIVREnabled and (isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter()) then
		chatSelectorModule:SetVisible(true)
		
		return
	end
	chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 236 ]]
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

t.isActivated = var32
t.selected = if fFlagEnableConsoleExpControls then function(p3) --[[ line: 244 ]]
	-- upvalues: expChatUnibarThumbstickNavigate (ref), serviceModule (ref), userInputService (ref), gamepadUtils (ref), focusSelectExpChatModule (ref), var30 (write)
	local inputEndedConnection
	if expChatUnibarThumbstickNavigate then
		inputEndedConnection = nil
		local inputChangedConnection = nil
		local inputBeganConnection = nil
		inputEndedConnection = serviceModule:selectedItem():connect(function(p4) --[[ line: 250 ]]
			-- upvalues: p3 (ref), inputEndedConnection (write), inputChangedConnection (write), inputBeganConnection (write)
			assert(p4 ~= p3.id, "Expected selectedId to not be self.id on selection")
			inputEndedConnection:disconnect()
			inputChangedConnection:Disconnect()
			inputBeganConnection:Disconnect()
		end)
		inputChangedConnection = userInputService.InputChanged:Connect(function(p5) --[[ line: 260 ]]
			-- upvalues: gamepadUtils (copy), focusSelectExpChatModule (copy), var30 (copy)
			if p5.KeyCode == Enum.KeyCode.Thumbstick1 and gamepadUtils.mapPositionToDirection(Vector2.new(p5.Position.X, p5.Position.Y)) == Enum.KeyCode.Down then
				focusSelectExpChatModule(var30.id)
			end
		end)
		inputBeganConnection = userInputService.InputBegan:Connect(function(p6) --[[ line: 269 ]]
			-- upvalues: focusSelectExpChatModule (copy), var30 (copy)
			local keyCode = p6.KeyCode
			
			if keyCode == Enum.KeyCode.DPadDown or keyCode == Enum.KeyCode.Down then
				focusSelectExpChatModule(var30.id)
			end
		end)
		
		return
	end
	inputEndedConnection = nil
	inputEndedConnection = userInputService.InputEnded:Connect(function(p7) --[[ line: 277 ]]
		-- upvalues: focusSelectExpChatModule (copy), var30 (copy), inputEndedConnection (write), serviceModule (copy), p3 (ref)
		if p7.KeyCode == Enum.KeyCode.DPadDown then
			focusSelectExpChatModule(var30.id)
		end
		if inputEndedConnection and serviceModule:selectedItem():get() ~= p3.id then
			inputEndedConnection:Disconnect()
		end
	end)
end else nil
t.components = {
	Icon = function(_) --[[ line: 290 ]]
		-- upvalues: getExperienceChatVisualConfig (ref), commonIconModule (ref), var32 (ref)
		local var43 = getExperienceChatVisualConfig()
		
		return commonIconModule(var43.icon.off, var43.icon.on, var32)
	end
}
var30 = serviceModule:register(t)
var30.chatOpenCapability = if fFlagExpChatEnableFriendsTab then {
	isAvailable = isChatOpenAvailable,
	ensureOpenChat = ensureOpenChat
} else nil

if expChatUnibarAvailabilityRefactor then
	signalsRobloxModule.createDetachedEffect(function(p8) --[[ line: 308 ]]
		-- upvalues: default (ref), var30 (write), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref)
		if default.getIsChatIconVisible(p8) then
			var30.availability:available()
		else
			var30.availability:unavailable()
		end
		if fFlagExpChatWindowSyncUnibar then
			expChatModule.Events.ChatTopBarButtonActivated(default.getIsChatWindowVisible(p8))
		end
	end)
	chromeUtilsModule.setCoreGuiAvailability(var30, Enum.CoreGuiType.Chat, function(p9) --[[ line: 325 ]]
		-- upvalues: default (ref)
		default.setCoreGuiEnabled(p9)
	end)
end
if fFlagChatIntegrationFixShortcutModule and fFlagEnableConsoleExpControls then
	signalsRobloxModule.createDetachedEffect(function(p10) --[[ line: 331 ]]
		-- upvalues: focusNavigationStore (ref), serviceModule (ref), constantsModule (ref)
		if focusNavigationStore.getChatInputBarFocused(p10) then
			serviceModule:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
			
			return
		end
		serviceModule:setShortcutBar(nil)
	end)
end
if fFlagExpChatEnableFriendsTab then
	signalsRobloxModule.createDetachedEffect(function(p11) --[[ line: 343 ]]
		-- upvalues: getFriendsChatIconUnreadStoreModule (ref), updateUnreadNotification (ref)
		getFriendsChatIconUnreadStoreModule(p11).getUnreadCountToDisplay(p11)
		updateUnreadNotification()
	end)
end
local _ = function(p12) --[[ line: 351 | named "shouldIgnoreUnreadForMessage" ]]
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref)
	local var44 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var44 then
		var44 = shouldSuppressUnreadForTabMetadata(p12 and p12.Metadata)
	end
	return var44
end

textChatService.MessageReceived:Connect(function(p13) --[[ line: 356 ]]
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var28 (write), updateUnreadNotification (ref)
	local var45 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var45 then
		var45 = shouldSuppressUnreadForTabMetadata(p13 and p13.Metadata)
	end
	if var45 then return end
	if not visibility then
		var28 += 1
		updateUnreadNotification()
	end
end)

if getFFlagTextChatEnableUniverseChatTabs() then
	textChatService.UniverseChatMessageReceived:Connect(function(p14) --[[ line: 368 ]]
		-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var28 (write), updateUnreadNotification (ref)
		local var46 = expChatSuppressWelcomeMessageUnibarUnread
		
		if var46 then
			var46 = shouldSuppressUnreadForTabMetadata(p14 and p14.Metadata)
		end
		if var46 then return end
		if not visibility then
			var28 += 1
			updateUnreadNotification()
		end
	end)
end
local var36 = 0
chatSelectorModule.MessagesChanged:connect(function(p15) --[[ line: 380 ]]
	-- upvalues: visibility (write), var28 (write), var36 (write), updateUnreadNotification (ref)
	if not visibility then
		var28 += p15 - var36
		updateUnreadNotification()
	end
	var36 = p15
end)

if not fFlagExpChatWindowSyncUnibar then
	chatSelectorModule.ChatActiveChanged:connect(function(p16) --[[ line: 389 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), runService (ref), chatService (ref), playersService (ref), var30 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setChatActiveCalledByDeveloper(p16)
			
			return
		elseif p16 then
			local status_1
			if runService:IsStudio() then
				status_1 = true
			else
				local ok, status = pcall(function() --[[ line: 99 ]]
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
local _ = function() --[[ line: 403 | named "setChatVisibilityOnLoad" ]]
	-- upvalues: gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref)
	local var48 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
	visibility = var48
	chatSelectorModule:SetVisible(var48)
end

coroutine.wrap(function() --[[ line: 413 ]]
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
		local ok, status = pcall(function() --[[ line: 99 ]]
			-- upvalues: chatService (copy), playersService (copy)
			return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
		end)
		status_1 = ok and status
	end
	if expChatUnibarAvailabilityRefactor then
		default.setLocalUserChat(status_1)
		
		if status_1 then
			local var50 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
			visibility = var50
			chatSelectorModule:SetVisible(var50)
			
			return
		end
	elseif status_1 and var30.availability then
		chromeUtilsModule.setCoreGuiAvailability(var30, Enum.CoreGuiType.Chat, function(p17) --[[ line: 428 ]]
			-- upvalues: var30 (copy)
			if p17 then
				var30.availability:pinned()
				
				return
			end
			var30.availability:unavailable()
		end)
		local var51 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
		visibility = var51
		chatSelectorModule:SetVisible(var51)
	end
end)()

function _simulateChat() --[[ line: 448 ]]
	-- upvalues: visibility (write), var28 (write), updateUnreadNotification (ref)
	while true do
		task.wait(math.random(1, 15))
		if visibility then continue end
		var28 += 1
		updateUnreadNotification()
	end
end

return var30