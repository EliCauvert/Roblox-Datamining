local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local chrome = script:FindFirstAncestor("Chrome")
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local fFlagRespawnChromeShortcutTelemetryModule = require(chrome.Flags.FFlagRespawnChromeShortcutTelemetry)
local var5 = false
local var6 = signal.new()
local var7 = mappedSignal.new(var6, function() --[[ line: 17 ]]
	-- upvalues: var5 (write)
	return var5
end)
task.defer(function() --[[ line: 21 ]]
	-- upvalues: robloxGui (ref), var5 (write), var6 (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.CurrentPageSignal:connect(function(p0) --[[ line: 23 ]]
		-- upvalues: var5 (copy), settingsHubModule (ref), var6 (copy)
		var5 = p0 == settingsHubModule.Instance.ResetCharacterPage.Page.Name
		var6:fire()
	end)
end)

return {
	respawnPageOpenSignal = var7,
	respawnPage = function(p1) --[[ line: 33 ]]
		-- upvalues: robloxGui (ref), var5 (write), fFlagRespawnChromeShortcutTelemetryModule (ref)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		local resetCharacterPage = settingsHubModule.Instance.ResetCharacterPage
		
		local function _() --[[ line: 36 | named "switchToRespawnPage" ]]
			-- upvalues: p1 (ref), settingsHubModule (ref), resetCharacterPage (ref)
			settingsHubModule.Instance:SwitchToPage(resetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
		end
		
		if settingsHubModule:GetVisibility() then
			if var5 then
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