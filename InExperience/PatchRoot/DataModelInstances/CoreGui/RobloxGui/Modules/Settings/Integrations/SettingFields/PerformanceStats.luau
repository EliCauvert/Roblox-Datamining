local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local SettingsServiceModule = require(CorePackages.Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal

return {
	id = "perf-stats",
	alreadyLocalized = false,
	label = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
	field_type = SettingsServiceModule.SettingEnum.Toggle,
	onChanged = (function() --[[ Line: 23 | Named "PerfStatsValue" ]]
		-- upvalues: ValueChangedSignal (copy), GameSettings (copy)
		local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.PerformanceStatsVisible)
		NewValueChangedSignal:connect(function(PerformanceStatsVisible) --[[ Line: 26 ]]
			-- upvalues: GameSettings (upval)
			if GameSettings.PerformanceStatsVisible ~= PerformanceStatsVisible then
				GameSettings.PerformanceStatsVisible = PerformanceStatsVisible
				
				return
			end
		end)
		GameSettings.PerformanceStatsVisibleChanged:Connect(function() --[[ Line: 36 ]]
			-- upvalues: NewValueChangedSignal (copy), GameSettings (upval)
			NewValueChangedSignal:set(GameSettings.PerformanceStatsVisible)
		end)
		
		return NewValueChangedSignal
	end)(),
	availability = SettingsServiceModule.AvailabilitySignal.new(not require(CorePackages.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies()),
	layoutOrder = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.PerformanceStatsFrame
}