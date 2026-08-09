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
local var27 = 0
local visibility = chatSelectorModule:GetVisibility()
local var29 = nil
local visibilityStateChanged = chatSelectorModule.VisibilityStateChanged

local function _() --[[ line: 65 | named "localUserCanChat" ]]
	-- upvalues: runService (ref), chatService (ref), playersService (ref)
	if runService:IsStudio() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 67 ]]
		-- upvalues: chatService (copy), playersService (copy)
		return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	end)
	
	return ok and status
end

if not fFlagExpChatWindowSyncUnibar then
	visibilityStateChanged:connect(function(p0) --[[ line: 78 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var29 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p0)
			
			return
		elseif p0 then
			var29.availability:pinned()
		end
	end)
	chatSelectorModule.ChatWindowToggled:connect(function(p1) --[[ line: 89 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), var29 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setVisibleViaChatSelector(p1)
			
			return
		elseif p1 then
			var29.availability:pinned()
		end
	end)
end
if fFlagExpChatWindowSyncUnibar then
	gameSettings:GetPropertyChangedSignal("ChatVisible"):Connect(function() --[[ line: 103 ]]
		-- upvalues: default (ref), gameSettings (ref)
		default.setGameSettingsChatVisible(gameSettings.ChatVisible)
	end)
	default.setGameSettingsChatVisible(gameSettings.ChatVisible)
end
local var30 = mappedSignal.new(visibilityStateChanged, function() --[[ line: 109 ]]
	-- upvalues: visibility (write)
	return visibility
end, function() --[[ line: 111 ]]
	-- upvalues: chatSelectorModule (ref), expChatUnibarAvailabilityRefactor (ref), runService (ref), chatService (ref), playersService (ref), var29 (write), guiService (ref), gameSettings (ref), visibility (write), var27 (write)
	local visibility_1 = chatSelectorModule.GetVisibility()
	
	if not expChatUnibarAvailabilityRefactor and not visibility_1 then
		local status_1
		if runService:IsStudio() then
			status_1 = true
		else
			local ok, status = pcall(function() --[[ line: 67 ]]
				-- upvalues: chatService (copy), playersService (copy)
				return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
			end)
			status_1 = ok and status
		end
		if not status_1 then
			var29.availability:unavailable()
		end
	end
	if not guiService.MenuIsOpen then
		gameSettings.ChatVisible = visibility_1
	end
	visibility = visibility_1
	
	if visibility_1 and var27 and var29.notification then
		var27 = 0
		var29.notification:clear()
	end
end)

local _ = function() --[[ line: 132 ]]
	-- upvalues: inExperienceAppChatModalModule (ref), chatSelectorModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var29 (write)
	if inExperienceAppChatModalModule:getVisible() then
		inExperienceAppChatModalModule.default:setVisible(false)
	end
	chatSelectorModule:SetVisible(true)
	
	if fFlagEnableConsoleExpControls then
		focusSelectExpChatModule(var29.id)
	end
end

local t = {
	id = "chat",
	label = "CoreScripts.TopBar.Chat",
	sideSheetPlacement = if argoPartyExperimentation.getIsRenameEnabled() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not fFlagExpChatEnableFriendsTab) then sideSheetPlacement.None else sideSheetPlacement.Unibar
}

function t.activated(_) --[[ line: 152 ]]
	-- upvalues: visibility (write), chatSelectorModule (ref), fFlagExpChatPerfTracking (ref), expChatPerfTracker (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), inExperienceAppChatModalModule (ref), fFlagEnableConsoleExpControls (ref), focusSelectExpChatModule (ref), var29 (write)
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
	chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 162 ]]
		-- upvalues: inExperienceAppChatModalModule (copy), chatSelectorModule (copy), fFlagEnableConsoleExpControls (copy), focusSelectExpChatModule (copy), var29 (copy)
		if inExperienceAppChatModalModule:getVisible() then
			inExperienceAppChatModalModule.default:setVisible(false)
		end
		chatSelectorModule:SetVisible(true)
		
		if fFlagEnableConsoleExpControls then
			focusSelectExpChatModule(var29.id)
		end
	end)
end

t.isActivated = if fFlagChromeActivatedMappedSignal then var30 else function() --[[ line: 170 ]]
	-- upvalues: var30 (ref)
	return var30:get()
end
t.selected = if fFlagEnableConsoleExpControls then function(p2) --[[ line: 174 ]]
	-- upvalues: expChatUnibarThumbstickNavigate (ref), serviceModule (ref), userInputService (ref), gamepadUtils (ref), focusSelectExpChatModule (ref), var29 (write)
	local inputEndedConnection
	if expChatUnibarThumbstickNavigate then
		inputEndedConnection = nil
		local inputChangedConnection = nil
		local inputBeganConnection = nil
		inputEndedConnection = serviceModule:selectedItem():connect(function(p3) --[[ line: 180 ]]
			-- upvalues: p2 (ref), inputEndedConnection (write), inputChangedConnection (write), inputBeganConnection (write)
			assert(p3 ~= p2.id, "Expected selectedId to not be self.id on selection")
			inputEndedConnection:disconnect()
			inputChangedConnection:Disconnect()
			inputBeganConnection:Disconnect()
		end)
		inputChangedConnection = userInputService.InputChanged:Connect(function(p4) --[[ line: 190 ]]
			-- upvalues: gamepadUtils (copy), focusSelectExpChatModule (copy), var29 (copy)
			if p4.KeyCode == Enum.KeyCode.Thumbstick1 and gamepadUtils.mapPositionToDirection(Vector2.new(p4.Position.X, p4.Position.Y)) == Enum.KeyCode.Down then
				focusSelectExpChatModule(var29.id)
			end
		end)
		inputBeganConnection = userInputService.InputBegan:Connect(function(p5) --[[ line: 199 ]]
			-- upvalues: focusSelectExpChatModule (copy), var29 (copy)
			local keyCode = p5.KeyCode
			
			if keyCode == Enum.KeyCode.DPadDown or keyCode == Enum.KeyCode.Down then
				focusSelectExpChatModule(var29.id)
			end
		end)
		
		return
	end
	inputEndedConnection = nil
	inputEndedConnection = userInputService.InputEnded:Connect(function(p6) --[[ line: 207 ]]
		-- upvalues: focusSelectExpChatModule (copy), var29 (copy), inputEndedConnection (write), serviceModule (copy), p2 (ref)
		if p6.KeyCode == Enum.KeyCode.DPadDown then
			focusSelectExpChatModule(var29.id)
		end
		if inputEndedConnection and serviceModule:selectedItem():get() ~= p2.id then
			inputEndedConnection:Disconnect()
		end
	end)
end else nil
t.components = {
	Icon = function(_) --[[ line: 220 ]]
		-- upvalues: getExperienceChatVisualConfig (ref), commonIconModule (ref), var30 (ref)
		local var38 = getExperienceChatVisualConfig()
		
		return commonIconModule(var38.icon.off, var38.icon.on, var30)
	end
}
var29 = serviceModule:register(t)

if expChatUnibarAvailabilityRefactor then
	signalsRobloxModule.createDetachedEffect(function(p7) --[[ line: 231 ]]
		-- upvalues: default (ref), var29 (write), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref)
		if default.getIsChatIconVisible(p7) then
			var29.availability:available()
		else
			var29.availability:unavailable()
		end
		if fFlagExpChatWindowSyncUnibar then
			expChatModule.Events.ChatTopBarButtonActivated(default.getIsChatWindowVisible(p7))
		end
	end)
	chromeUtilsModule.setCoreGuiAvailability(var29, Enum.CoreGuiType.Chat, function(p8) --[[ line: 248 ]]
		-- upvalues: default (ref)
		default.setCoreGuiEnabled(p8)
	end)
end
if fFlagChatIntegrationFixShortcutModule and fFlagEnableConsoleExpControls then
	signalsRobloxModule.createDetachedEffect(function(p9) --[[ line: 254 ]]
		-- upvalues: focusNavigationStore (ref), serviceModule (ref), constantsModule (ref)
		if focusNavigationStore.getChatInputBarFocused(p9) then
			serviceModule:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
			
			return
		end
		serviceModule:setShortcutBar(nil)
	end)
end
local _ = function(p10) --[[ line: 266 | named "shouldIgnoreUnreadForMessage" ]]
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref)
	local var39 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var39 then
		var39 = shouldSuppressUnreadForTabMetadata(p10 and p10.Metadata)
	end
	return var39
end

textChatService.MessageReceived:Connect(function(p11) --[[ line: 271 ]]
	-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var27 (write), var29 (write)
	local var40 = expChatSuppressWelcomeMessageUnibarUnread
	
	if var40 then
		var40 = shouldSuppressUnreadForTabMetadata(p11 and p11.Metadata)
	end
	if var40 then return end
	if not visibility then
		var27 += 1
		var29.notification:fireCount(var27)
	end
end)

if getFFlagTextChatEnableUniverseChatTabs() then
	textChatService.UniverseChatMessageReceived:Connect(function(p12) --[[ line: 283 ]]
		-- upvalues: expChatSuppressWelcomeMessageUnibarUnread (ref), shouldSuppressUnreadForTabMetadata (ref), visibility (write), var27 (write), var29 (write)
		local var41 = expChatSuppressWelcomeMessageUnibarUnread
		
		if var41 then
			var41 = shouldSuppressUnreadForTabMetadata(p12 and p12.Metadata)
		end
		if var41 then return end
		if not visibility then
			var27 += 1
			var29.notification:fireCount(var27)
		end
	end)
end
local var32 = 0
chatSelectorModule.MessagesChanged:connect(function(p13) --[[ line: 295 ]]
	-- upvalues: visibility (write), var27 (write), var32 (write), var29 (write)
	if not visibility then
		var27 += p13 - var32
		var29.notification:fireCount(var27)
	end
	var32 = p13
end)

if not fFlagExpChatWindowSyncUnibar then
	chatSelectorModule.ChatActiveChanged:connect(function(p14) --[[ line: 304 ]]
		-- upvalues: expChatUnibarAvailabilityRefactor (ref), default (ref), runService (ref), chatService (ref), playersService (ref), var29 (write)
		if expChatUnibarAvailabilityRefactor then
			default.setChatActiveCalledByDeveloper(p14)
			
			return
		elseif p14 then
			local status_1
			if runService:IsStudio() then
				status_1 = true
			else
				local ok, status = pcall(function() --[[ line: 67 ]]
					-- upvalues: chatService (copy), playersService (copy)
					return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
				end)
				status_1 = ok and status
			end
			if not status_1 then
				var29.availability:available()
			end
		end
	end)
end
local _ = function() --[[ line: 318 | named "setChatVisibilityOnLoad" ]]
	-- upvalues: gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref)
	local var43 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
	visibility = var43
	chatSelectorModule:SetVisible(var43)
end

coroutine.wrap(function() --[[ line: 328 ]]
	-- upvalues: playersService (ref), runService (ref), chatService (ref), expChatUnibarAvailabilityRefactor (ref), default (ref), gameSettings (ref), viewportUtilModule (ref), visibility (write), chatSelectorModule (ref), var29 (write), chromeUtilsModule (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local status_1
	if runService:IsStudio() then
		status_1 = true
	else
		local ok, status = pcall(function() --[[ line: 67 ]]
			-- upvalues: chatService (copy), playersService (copy)
			return chatService:CanUserChatAsync(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
		end)
		status_1 = ok and status
	end
	if expChatUnibarAvailabilityRefactor then
		default.setLocalUserChat(status_1)
		
		if status_1 then
			local var45 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
			visibility = var45
			chatSelectorModule:SetVisible(var45)
			
			return
		end
	elseif status_1 and var29.availability then
		chromeUtilsModule.setCoreGuiAvailability(var29, Enum.CoreGuiType.Chat, function(p15) --[[ line: 343 ]]
			-- upvalues: var29 (copy)
			if p15 then
				var29.availability:pinned()
				
				return
			end
			var29.availability:unavailable()
		end)
		local var46 = if viewportUtilModule.isSmallTouchScreen() then false else gameSettings.ChatVisible
		visibility = var46
		chatSelectorModule:SetVisible(var46)
	end
end)()

function _simulateChat() --[[ line: 363 ]]
	-- upvalues: visibility (write), var27 (write), var29 (write)
	while true do
		task.wait(math.random(1, 15))
		if visibility then continue end
		var27 += 1
		var29.notification:fireCount(var27)
	end
end

return var29