local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")

if not require(corePackagesService.Workspace.Packages.Chrome).Enabled() then
	return nil
end
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.Integrations.Party.Constants)
local isConnectUnibarEnabledModule = require(chrome.Integrations.Connect.isConnectUnibarEnabled)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local configureShortcutsModule = require(chrome.ChromeShared.Shortcuts.ConfigureShortcuts)
local buildMenuOrderModule = require(chrome.ChromeShared.Unibar.buildMenuOrder)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagDebugEnableUnibarDummyIntegrations = sharedFlagsModule.GetFFlagDebugEnableUnibarDummyIntegrations
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial

local function _()
	-- upvalues: chrome (ref)
	require(chrome.Integrations)
end

local _ = function()
	-- upvalues: configureShortcutsModule (ref)
	configureShortcutsModule()
end

local function configureUnibar()
	-- upvalues: buildMenuOrderModule (ref), getFFlagDebugEnableUnibarDummyIntegrations (ref), isConnectUnibarEnabledModule (ref), argoPartyExperimentation (ref), constantsModule (ref), fFlagAppNavMyStatsTab (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), serviceModule (ref)
	local var1 = buildMenuOrderModule()
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
	serviceModule:configureSubMenu("nine_dot", var1)
end

require(chrome.Integrations)

if fFlagEnableConsoleExpControls then
	configureShortcutsModule()
end
configureUnibar()

return nil