local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local SettingsServiceModule = require(CorePackages.Workspace.Packages.SettingsService)
local ValueChangedSignal = SettingsServiceModule.ValueChangedSignal

return {
	id = "perf-stats",
	alreadyLocalized = false,
	label = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
	field_type = SettingsServiceModule.SettingEnum.Toggle,
	onChanged = (function()
		-- upvalues: ValueChangedSignal (copy), GameSettings (copy)
		local NewValueChangedSignal = ValueChangedSignal.new(GameSettings.PerformanceStatsVisible)
		NewValueChangedSignal:connect(function(PerformanceStatsVisible)
			-- upvalues: GameSettings (upval)
			if GameSettings.PerformanceStatsVisible ~= PerformanceStatsVisible then
				GameSettings.PerformanceStatsVisible = PerformanceStatsVisible
				
				return
			end
		end)
		GameSettings.PerformanceStatsVisibleChanged:Connect(function()
			-- upvalues: NewValueChangedSignal (copy), GameSettings (upval)
			NewValueChangedSignal:set(GameSettings.PerformanceStatsVisible)
		end)
		
		return NewValueChangedSignal
	end)(),
	availability = SettingsServiceModule.AvailabilitySignal.new(not CachedPolicyServiceModule:IsSubjectToChinaPolicies()),
	layoutOrder = require(script:FindFirstAncestor("Settings").Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.PerformanceStatsFrame
}