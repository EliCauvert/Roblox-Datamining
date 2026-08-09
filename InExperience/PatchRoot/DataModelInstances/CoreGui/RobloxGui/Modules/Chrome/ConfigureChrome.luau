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
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagDebugEnableUnibarDummyIntegrations = sharedFlagsModule.GetFFlagDebugEnableUnibarDummyIntegrations
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagEnableInExperienceAvatarSwitcher = sharedFlagsModule.FFlagEnableInExperienceAvatarSwitcher
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagSideSheetSwapGalleryOrder = sharedFlagsModule.FFlagSideSheetSwapGalleryOrder
local fFlagEnableInExperienceShop = sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagReverseUnibarModule = require(chrome.Flags.FFlagReverseUnibar)
local fFlagIntegrateTraversalHistoryInSideSheet = sharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local fFlagAddTraversalHistory = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagAddTraversalHistory
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial

local function _() --[[ line: 42 | named "initializeIntegrations" ]]
	-- upvalues: chrome (ref)
	require(chrome.Integrations)
end

local _ = function() --[[ line: 46 ]]
	-- upvalues: configureShortcutsModule (ref)
	configureShortcutsModule()
end

local function configureUnibar() --[[ line: 50 ]]
	-- upvalues: fFlagEnableSideSheet (ref), isConnectDropdownEnabledModule (ref), fFlagRemoveFriendsChatUnibarEntrypoints (ref), fFlagExpChatEnableFriendsTab (ref), argoPartyExperimentation (ref), fFlagReverseUnibarModule (ref), getFFlagDebugEnableUnibarDummyIntegrations (ref), isConnectUnibarEnabledModule (ref), constantsModule (ref), fFlagAppNavMyStatsTab (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), serviceModule (ref), fFlagEnableInExperienceAvatarSwitcher (ref), constantsModule_1 (ref), guiService (ref), fFlagSideSheetSwapGalleryOrder (ref), fFlagAddTraversalHistory (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), fFlagAddInviteFriendsIntegration (ref), inExperienceSideSheetModule (ref), fFlagEnableInExperienceShop (ref)
	local list = { "leaderboard", "emotes", "backpack" }
	
	if not fFlagEnableSideSheet then
		table.insert(list, "respawn")
	end
	table.insert(list, 1, "trust_and_safety")
	
	if isConnectDropdownEnabledModule() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not fFlagExpChatEnableFriendsTab or not argoPartyExperimentation.getIsRenameEnabled()) then
		table.insert(list, 1, "connect_dropdown")
	end
	local list_1 = { "nine_dot", "chat", "toggle_mic_mute" }
	
	if fFlagReverseUnibarModule then
		table.insert(list_1, 3, "join_voice")
		
		if getFFlagDebugEnableUnibarDummyIntegrations() then
			table.insert(list_1, "dummy_window")
			table.insert(list_1, "dummy_window_2")
		end
		if isConnectUnibarEnabledModule() then
			table.insert(list_1, if argoPartyExperimentation.getIsRenameEnabled() then "party_entrypoint" else "connect_unibar")
		end
		local index = table.find(list_1, "toggle_mic_mute")
		
		if index then
			table.insert(list_1, index, constantsModule.TOGGLE_MIC_INTEGRATION_ID)
		end
	else
		list_1 = { "toggle_mic_mute", "chat", "nine_dot" }
		table.insert(list_1, 2, "join_voice")
		
		if getFFlagDebugEnableUnibarDummyIntegrations() then
			table.insert(list_1, 1, "dummy_window")
			table.insert(list_1, 1, "dummy_window_2")
		end
		if isConnectUnibarEnabledModule() then
			table.insert(list_1, 1, if argoPartyExperimentation.getIsRenameEnabled() then "party_entrypoint" else "connect_unibar")
		end
		local index = table.find(list_1, "toggle_mic_mute")
		
		if index then
			table.insert(list_1, index + 1, constantsModule.TOGGLE_MIC_INTEGRATION_ID)
		end
	end
	if fFlagAppNavMyStatsTab then
		table.insert(list_1, "assistant_build")
	end
	if isInExperienceUIVREnabled and isSpatial() then
		serviceModule:configureMenu({ { "vr_toggle_button", "vr_safety_bubble" }, list_1 })
	else
		serviceModule:configureMenu({ list_1 })
	end
	if not isInExperienceUIVREnabled then
		table.insert(list, 2, "camera_entrypoint")
		table.insert(list, 2, "selfie_view")
	elseif not isSpatial() then
		table.insert(list, 2, "camera_entrypoint")
		table.insert(list, 2, "selfie_view")
	end
	if fFlagEnableInExperienceAvatarSwitcher then
		table.insert(list, 3, constantsModule_1.AVATAR_SWITCHER_ID)
	end
	if not isSpatial() and not guiService:IsTenFootInterface() then
		table.insert(list, 4, "music_entrypoint")
	end
	if fFlagEnableSideSheet then
		table.insert(list, "people")
		table.insert(list, "settings")
		
		if fFlagSideSheetSwapGalleryOrder then
			table.insert(list, "gallery")
			table.remove(list, table.find(list, "trust_and_safety"))
			table.insert(list, "trust_and_safety")
		else
			table.remove(list, table.find(list, "trust_and_safety"))
			table.insert(list, "trust_and_safety")
			table.insert(list, "gallery")
		end
		table.insert(list, "help")
		
		if fFlagAddTraversalHistory and fFlagIntegrateTraversalHistoryInSideSheet then
			table.insert(list, "traversal_history")
		end
		if fFlagAddInviteFriendsIntegration then
			table.insert(list, 2, "invite_friends")
		end
		table.insert(list, inExperienceSideSheetModule.Enums.ActionBinding.Leave)
		table.insert(list, inExperienceSideSheetModule.Enums.ActionBinding.Respawn)
	end
	if fFlagEnableInExperienceShop then
		table.insert(list, 2, constantsModule_1.IN_EXPERIENCE_SHOP_ID)
	end
	serviceModule:configureSubMenu("nine_dot", list)
end

require(chrome.Integrations)

if fFlagEnableConsoleExpControls then
	configureShortcutsModule()
end
configureUnibar()

return nil