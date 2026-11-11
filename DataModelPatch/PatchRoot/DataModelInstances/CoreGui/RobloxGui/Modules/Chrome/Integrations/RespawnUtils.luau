local Chrome = script:FindFirstAncestor("Chrome")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local FFlagRespawnChromeShortcutTelemetryModule = require(Chrome.Flags.FFlagRespawnChromeShortcutTelemetry)
local IsNameMatch = false
local NewResult = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Signal.new()
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewResult, function()
	-- upvalues: IsNameMatch (ref)
	return IsNameMatch
end)
task.defer(function()
	-- upvalues: RobloxGui (copy), IsNameMatch (ref), NewResult (copy)
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	SettingsHubModule.CurrentPageSignal:connect(function(Name)
		-- upvalues: IsNameMatch (upval), SettingsHubModule (copy), NewResult (upval)
		IsNameMatch = Name == SettingsHubModule.Instance.ResetCharacterPage.Page.Name
		NewResult:fire()
	end)
end)

return {
	respawnPageOpenSignal = NewResult1,
	respawnPage = function(p1)
		-- upvalues: RobloxGui (copy), IsNameMatch (ref), FFlagRespawnChromeShortcutTelemetryModule (copy)
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		local ResetCharacterPage = SettingsHubModule.Instance.ResetCharacterPage
		
		local function _()
			-- upvalues: p1 (copy), SettingsHubModule (copy), ResetCharacterPage (copy)
			SettingsHubModule.Instance:SwitchToPage(ResetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
		end
		
		if SettingsHubModule:GetVisibility() then
			if IsNameMatch then
				SettingsHubModule:SetVisibility(false)
				
				return
			end
			if FFlagRespawnChromeShortcutTelemetryModule then
				SettingsHubModule.Instance:SwitchToPage(ResetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
				
				return
			else
				SettingsHubModule.Instance:SwitchToPage(ResetCharacterPage, true)
				
				return
			end
		elseif FFlagRespawnChromeShortcutTelemetryModule then
			SettingsHubModule:SetVisibility(true)
			SettingsHubModule.Instance:SwitchToPage(ResetCharacterPage, true, nil, nil, nil, { used_shortcut = if p1 then p1.usedShortcut else nil })
			
			return
		else
			SettingsHubModule:SetVisibility(true, false, ResetCharacterPage)
		end
	end
}