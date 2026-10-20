local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local LocalPlayer = game:GetService("Players").LocalPlayer
local CryoModule = require(Parent.Cryo)
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(InterventionShared.Flags.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local _ = require(InterventionShared.Utils.Types)

return function(List, p1)
	-- upvalues: FFlagScopeBadUtterancePlayerNameToChatDialogsModule (copy), LocalPlayer (copy), NewResult (copy), UseLocalizationFunction (copy), CryoModule (copy)
	local LabelTranslationKey = if p1 then p1.labelTranslationKey else nil
	local ShouldAddPlayerName = if p1 then p1.shouldAddPlayerName else nil
	local FeatureInExperienceInterventionLabelPlayers = {}
	local t = {}
	local NoFFlagScopeBadUtterancePlayerNameToChatDialogsModule: boolean = not FFlagScopeBadUtterancePlayerNameToChatDialogsModule or ShouldAddPlayerName == true
	
	if LabelTranslationKey and LabelTranslationKey ~= "" then
		t[LabelTranslationKey] = "Feature.NotApproved." .. LabelTranslationKey
	end
	for _, value in List do
		local UtteranceText = value.utteranceText
		table.insert(FeatureInExperienceInterventionLabelPlayers, if LocalPlayer and NoFFlagScopeBadUtterancePlayerNameToChatDialogsModule then NewResult:Format("Feature.InExperienceIntervention.Label.Player", { username = LocalPlayer.Name, evidence = UtteranceText }) else UtteranceText)
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