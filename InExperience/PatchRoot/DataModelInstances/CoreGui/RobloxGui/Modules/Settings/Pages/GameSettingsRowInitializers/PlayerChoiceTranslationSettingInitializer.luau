local localizationService = game:GetService("LocalizationService")
local utilityModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Utility)
local localization = require(game:GetService("CorePackages").Workspace.Packages.InExperienceLocales).Localization
local t = { [1] = "On", [2] = "Off" }

return function(p1, p2, p3)
	-- upvalues: localization (ref), localizationService (ref), utilityModule (ref), t (ref)
	local var1 = localization.new(localizationService.RobloxLocaleId)
	local var2 = if localizationService:GetIsLoadingInternalTranslations() then 1 else 2
	local var3, var4, var5 = utilityModule:AddNewRow(p1, var1:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingLabel"), "Selector", t, var2, nil, var1:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingDescription"))
	p1.PlayerChoiceTranslationFrame = var3
	p1.PlayerChoiceSettingLabel = var4
	p1.PlayerChoiceSettingMode = var5
	p1.PlayerChoiceTranslationFrame.LayoutOrder = p2.PlayerChoiceTranslationFrame
	p1.PlayerChoiceSettingMode.IndexChanged:connect(function(p4)
		-- upvalues: var2 (ref), localizationService (copy), p3 (ref)
		local var6 = p4 == 1
		local var7 = var2 == 1
		localizationService:IsLoadingInternalTranslationsSettingChanged(var6)
		p3("player_choice_translation", var7, var6)
	end)
	
	return p1.PlayerChoiceTranslationFrame, p1.PlayerChoiceSettingLabel, p1.PlayerChoiceSettingMode
end