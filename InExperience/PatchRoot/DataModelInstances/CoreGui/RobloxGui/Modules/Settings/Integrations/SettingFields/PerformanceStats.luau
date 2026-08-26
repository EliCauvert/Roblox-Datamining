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
		local var1 = valueChangedSignal.new(gameSettings.PerformanceStatsVisible)
		var1:connect(function(p1)
			-- upvalues: gameSettings (copy)
			if gameSettings.PerformanceStatsVisible == p1 then
				return
			end
			gameSettings.PerformanceStatsVisible = p1
		end)
		gameSettings.PerformanceStatsVisibleChanged:Connect(function()
			-- upvalues: var1 (ref), gameSettings (copy)
			var1:set(gameSettings.PerformanceStatsVisible)
		end)
		
		return var1
	end)(),
	availability = settingsServiceModule.AvailabilitySignal.new(not cachedPolicyServiceModule:IsSubjectToChinaPolicies()),
	layoutOrder = require(settings.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER.PerformanceStatsFrame
}