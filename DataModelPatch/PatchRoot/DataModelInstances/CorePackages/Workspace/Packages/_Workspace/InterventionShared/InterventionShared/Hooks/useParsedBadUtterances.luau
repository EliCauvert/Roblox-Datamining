local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local LocalPlayer = game:GetService("Players").LocalPlayer
local CryoModule = require(Parent.Cryo)
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(InterventionShared.Utils.Types)

return function(List, Key)
	-- upvalues: LocalPlayer (copy), NewResult (copy), UseLocalizationFunction (copy), CryoModule (copy)
	local FeatureInExperienceInterventionLabelPlayers = {}
	local t = {}
	
	if Key and Key ~= "" then
		t[Key] = "Feature.NotApproved." .. Key
	end
	for _, value in List do
		local UtteranceText = value.utteranceText
		table.insert(FeatureInExperienceInterventionLabelPlayers, if LocalPlayer then NewResult:Format("Feature.InExperienceIntervention.Label.Player", { username = LocalPlayer.Name, evidence = UtteranceText }) else UtteranceText)
		t[value.labelTranslationKey] = "Feature.NotApproved." .. value.labelTranslationKey
	end
	local UseLocalizationResult = UseLocalizationFunction(t)
	local t1 = {}
	
	for i, _ in t do
		local UseLocalizationResultEntry = UseLocalizationResult[i]
		
		if UseLocalizationResultEntry and UseLocalizationResultEntry ~= "" then
			t1[UseLocalizationResultEntry] = true
		end
	end
	return {
		textItems = CryoModule.List.reverse(FeatureInExperienceInterventionLabelPlayers),
		abuseTypes = CryoModule.Dictionary.keys(t1)
	}
end