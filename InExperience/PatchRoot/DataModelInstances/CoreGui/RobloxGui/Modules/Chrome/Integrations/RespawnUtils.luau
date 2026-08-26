local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local chrome = script:FindFirstAncestor("Chrome")
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local fFlagRespawnChromeShortcutTelemetryModule = require(chrome.Flags.FFlagRespawnChromeShortcutTelemetry)
local var1 = false
local var2 = signal.new()
local var3 = mappedSignal.new(var2, function()
	-- upvalues: var1 (write)
	return var1
end)
task.defer(function()
	-- upvalues: robloxGui (ref), var1 (write), var2 (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.CurrentPageSignal:connect(function(p1)
		-- upvalues: var1 (copy), settingsHubModule (ref), var2 (copy)
		var1 = p1 == settingsHubModule.Instance.ResetCharacterPage.Page.Name
		var2:fire()
	end)
end)

return {
	respawnPageOpenSignal = var3,
	respawnPage = function(p1)
		-- upvalues: robloxGui (ref), var1 (write), fFlagRespawnChromeShortcutTelemetryModule (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local resetCharacterPage = settingsHubModule.Instance.ResetCharacterPage
		
		local function _()
			-- upvalues: p1 (ref), settingsHubModule (ref), resetCharacterPage (ref)
			settingsHubModule.Instance:SwitchToPage(resetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
		end
		
		if settingsHubModule:GetVisibility() then
			if var1 then
				settingsHubModule:SetVisibility(false)
				
				return
			elseif fFlagRespawnChromeShortcutTelemetryModule then
				settingsHubModule.Instance:SwitchToPage(resetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
				
				return
			end
			settingsHubModule.Instance:SwitchToPage(resetCharacterPage, true)
			
			return
		elseif fFlagRespawnChromeShortcutTelemetryModule then
			settingsHubModule:SetVisibility(true)
			settingsHubModule.Instance:SwitchToPage(resetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
			
			return
		end
		settingsHubModule:SetVisibility(true, false, resetCharacterPage)
	end
}