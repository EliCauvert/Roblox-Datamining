local localizationService = game:GetService("LocalizationService")
local utilityModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Utility)
local localization = require(game:GetService("CorePackages").Workspace.Packages.InExperienceLocales).Localization
local t = { [1] = "On", [2] = "Off" }

return function(p0, p1, p2)
	-- upvalues: localization (ref), localizationService (ref), utilityModule (ref), t (ref)
	local var3 = localization.new(localizationService.RobloxLocaleId)
	local var4 = if localizationService:GetIsLoadingInternalTranslations() then 1 else 2
	local var5, var6, var7 = utilityModule:AddNewRow(p0, var3:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingLabel"), "Selector", t, var4, nil, var3:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingDescription"))
	p0.PlayerChoiceTranslationFrame = var5
	p0.PlayerChoiceSettingLabel = var6
	p0.PlayerChoiceSettingMode = var7
	p0.PlayerChoiceTranslationFrame.LayoutOrder = p1.PlayerChoiceTranslationFrame
	p0.PlayerChoiceSettingMode.IndexChanged:connect(function(p3)
		-- upvalues: var4 (ref), localizationService (copy), p2 (ref)
		local var8 = p3 == 1
		local var9 = var4 == 1
		localizationService:IsLoadingInternalTranslationsSettingChanged(var8)
		p2("player_choice_translation", var9, var8)
	end)
	
	return p0.PlayerChoiceTranslationFrame, p0.PlayerChoiceSettingLabel, p0.PlayerChoiceSettingMode
end