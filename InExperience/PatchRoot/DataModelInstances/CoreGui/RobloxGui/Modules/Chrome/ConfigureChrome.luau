local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")

if not require(corePackagesService.Workspace.Packages.Chrome).Enabled() then
	return nil
end
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.Integrations.Party.Constants)
local isConnectUnibarEnabledModule = require(chrome.Integrations.Connect.isConnectUnibarEnabled)
local isConnectDropdownEnabledModule = require(chrome.Integrations.Connect.isConnectDropdownEnabled)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local configureShortcutsModule = require(chrome.ChromeShared.Shortcuts.ConfigureShortcuts)
local constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
local buildMenuOrderModule = require(chrome.ChromeShared.Unibar.buildMenuOrder)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagDebugEnableUnibarDummyIntegrations = sharedFlagsModule.GetFFlagDebugEnableUnibarDummyIntegrations
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagEnableInExperienceAvatarSwitcher = sharedFlagsModule.FFlagEnableInExperienceAvatarSwitcher
local fFlagAddMapToNineDot = sharedFlagsModule.FFlagAddMapToNineDot
local fFlagEnableInExperienceShop = sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial

local function _() --[[ line: 34 | named "initializeIntegrations" ]]
	-- upvalues: chrome (ref)
	require(chrome.Integrations)
end

local _ = function() --[[ line: 38 ]]
	-- upvalues: configureShortcutsModule (ref)
	configureShortcutsModule()
end

local function configureUnibar() --[[ line: 42 ]]
	-- upvalues: fFlagAddMapToNineDot (ref), buildMenuOrderModule (ref), isConnectDropdownEnabledModule (ref), fFlagRemoveFriendsChatUnibarEntrypoints (ref), fFlagExpChatCanShowFriendsTab (ref), argoPartyExperimentation (ref), getFFlagDebugEnableUnibarDummyIntegrations (ref), isConnectUnibarEnabledModule (ref), constantsModule (ref), fFlagAppNavMyStatsTab (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), serviceModule (ref), fFlagEnableInExperienceAvatarSwitcher (ref), constantsModule_1 (ref), guiService (ref), fFlagEnableInExperienceShop (ref)
	local var12
	local _ = nil
	
	if fFlagAddMapToNineDot then
		var12 = buildMenuOrderModule()
	else
		var12 = { "leaderboard", "emotes", "backpack" }
		table.insert(var12, "respawn")
		table.insert(var12, 1, "trust_and_safety")
		
		if isConnectDropdownEnabledModule() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not fFlagExpChatCanShowFriendsTab or not argoPartyExperimentation.getIsRenameEnabled()) then
			table.insert(var12, 1, "connect_dropdown")
		end
	end
	local list = { "nine_dot", "chat", "toggle_mic_mute" }
	table.insert(list, 3, "join_voice")
	
	if getFFlagDebugEnableUnibarDummyIntegrations() then
		table.insert(list, "dummy_window")
		table.insert(list, "dummy_window_2")
	end
	if isConnectUnibarEnabledModule() then
		table.insert(list, if argoPartyExperimentation.getIsRenameEnabled() then "party_entrypoint" else "connect_unibar")
	end
	local index = table.find(list, "toggle_mic_mute")
	
	if index then
		table.insert(list, index, constantsModule.TOGGLE_MIC_INTEGRATION_ID)
	end
	if fFlagAppNavMyStatsTab then
		table.insert(list, "assistant_build")
	end
	if isInExperienceUIVREnabled and isSpatial() then
		serviceModule:configureMenu({ { "vr_toggle_button", "vr_safety_bubble" }, list })
	else
		serviceModule:configureMenu({ list })
	end
	if not fFlagAddMapToNineDot then
		if not isInExperienceUIVREnabled then
			table.insert(var12, 2, "camera_entrypoint")
			table.insert(var12, 2, "selfie_view")
		elseif not isSpatial() then
			table.insert(var12, 2, "camera_entrypoint")
			table.insert(var12, 2, "selfie_view")
		end
		if fFlagEnableInExperienceAvatarSwitcher then
			table.insert(var12, 3, constantsModule_1.AVATAR_SWITCHER_ID)
		end
		if not isSpatial() and not guiService:IsTenFootInterface() then
			table.insert(var12, 4, "music_entrypoint")
		end
		if fFlagEnableInExperienceShop then
			table.insert(var12, 2, constantsModule_1.IN_EXPERIENCE_SHOP_ID)
		end
	end
	serviceModule:configureSubMenu("nine_dot", var12)
end

require(chrome.Integrations)

if fFlagEnableConsoleExpControls then
	configureShortcutsModule()
end
configureUnibar()

return nil