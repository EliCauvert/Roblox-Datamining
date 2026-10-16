local LocalizationService = game:GetService("LocalizationService")
local UtilityModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Utility)
local Localization = require(game:GetService("CorePackages").Workspace.Packages.InExperienceLocales).Localization
local config = { [1] = "On", [2] = "Off" }

return function(p1, p2, Callback) --[[ Line: 19 ]]
	-- upvalues: Localization (copy), LocalizationService (copy), UtilityModule (copy), config (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local v1: number = if LocalizationService:GetIsLoadingInternalTranslations() then 1 else 2
	p1.PlayerChoiceTranslationFrame, p1.PlayerChoiceSettingLabel, p1.PlayerChoiceSettingMode = UtilityModule:AddNewRow(p1, NewLocalization:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingLabel"), "Selector", config, v1, nil, (NewLocalization:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingDescription")))
	p1.PlayerChoiceTranslationFrame.LayoutOrder = p2.PlayerChoiceTranslationFrame
	p1.PlayerChoiceSettingMode.IndexChanged:connect(function(p3) --[[ Line: 38 ]]
		-- upvalues: v1 (copy), LocalizationService (upval), Callback (copy)
		local NewIsLoadingInternalTranslations = p3 == 1
		local v2 = v1 == 1
		LocalizationService:IsLoadingInternalTranslationsSettingChanged(NewIsLoadingInternalTranslations)
		Callback("player_choice_translation", v2, NewIsLoadingInternalTranslations)
	end)
	
	return p1.PlayerChoiceTranslationFrame, p1.PlayerChoiceSettingLabel, p1.PlayerChoiceSettingMode
end