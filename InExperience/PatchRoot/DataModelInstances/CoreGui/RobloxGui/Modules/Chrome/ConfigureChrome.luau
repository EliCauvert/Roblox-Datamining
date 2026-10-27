local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")

if not require(CorePackages.Workspace.Packages.Chrome).Enabled() then
	return nil
end
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.Integrations.Party.Constants)
local IsConnectUnibarEnabledModule = require(Chrome.Integrations.Connect.isConnectUnibarEnabled)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ConfigureShortcutsModule: () -> () = require(Chrome.ChromeShared.Shortcuts.ConfigureShortcuts)
local BuildMenuOrderModule = require(Chrome.ChromeShared.Unibar.buildMenuOrder)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagDebugEnableUnibarDummyIntegrationsFunction = SharedFlagsModule.GetFFlagDebugEnableUnibarDummyIntegrations
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial

local function _()
	-- upvalues: Chrome (copy)
	require(Chrome.Integrations)
end

local _ = function()
	-- upvalues: ConfigureShortcutsModule (copy)
	ConfigureShortcutsModule()
end

local function configureUnibar()
	-- upvalues: BuildMenuOrderModule (copy), GetFFlagDebugEnableUnibarDummyIntegrationsFunction (copy), IsConnectUnibarEnabledModule (copy), ConstantsModule (copy), FFlagAppNavMyStatsTab (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), ServiceModule (copy)
	local MenuOrderModule = BuildMenuOrderModule()
	local List = { "nine_dot", "chat", "toggle_mic_mute" }
	table.insert(List, 3, "join_voice")
	
	if GetFFlagDebugEnableUnibarDummyIntegrationsFunction() then
		table.insert(List, "dummy_window")
		table.insert(List, "dummy_window_2")
	end
	if IsConnectUnibarEnabledModule() then
		table.insert(List, "party_entrypoint")
	end
	local FoundIndex: number? = table.find(List, "toggle_mic_mute")
	
	if FoundIndex then
		table.insert(List, FoundIndex, ConstantsModule.TOGGLE_MIC_INTEGRATION_ID)
	end
	if FFlagAppNavMyStatsTab then
		table.insert(List, "assistant_build")
	end
	if IsInExperienceUIVREnabled and IsSpatialFunction() then
		ServiceModule:configureMenu({ { "vr_toggle_button", "vr_safety_bubble" }, List })
	else
		ServiceModule:configureMenu({ List })
	end
	ServiceModule:configureSubMenu("nine_dot", MenuOrderModule)
end

require(Chrome.Integrations)

if FFlagEnableConsoleExpControls then
	ConfigureShortcutsModule()
end
configureUnibar()

return nil