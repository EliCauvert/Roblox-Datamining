local settings = script:FindFirstAncestor("Settings")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local settingsServiceModule = require(corePackagesService.Workspace.Packages.SettingsService)
local valueChangedSignal = settingsServiceModule.ValueChangedSignal

return {
	id = "perf-stats",
	alreadyLocalized = false,
	label = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
	field_type = settingsServiceModule.SettingEnum.Toggle,
	onChanged = (function()
		-- upvalues: valueChangedSignal (ref), gameSettings (ref)
		local var4 = valueChangedSignal.new(gameSettings.PerformanceStatsVisible)
		var4:connect(function(p0)
			-- upvalues: gameSettings (copy)
			if gameSettings.PerformanceStatsVisible == p0 then
				return
			end
			gameSettings.PerformanceStatsVisible = p0
		end)
		gameSettings.PerformanceStatsVisibleChanged:Connect(function()
			-- upvalues: var4 (ref), gameSettings (copy)
			var4:set(gameSettings.PerformanceStatsVisible)
		end)
		
		return var4
	end)(),
	availability = settingsServiceModule.AvailabilitySignal.new(not cachedPolicyServiceModule:IsSubjectToChinaPolicies()),
	layoutOrder = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.PerformanceStatsFrame
}