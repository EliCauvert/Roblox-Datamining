local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local localPlayer = game:GetService("Players").LocalPlayer
local cryoModule = require(parent.Cryo)
local var2 = require(parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(interventionShared.Flags.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local _ = require(interventionShared.Utils.Types)

return function(p0, p1)
	-- upvalues: fFlagScopeBadUtterancePlayerNameToChatDialogsModule (ref), localPlayer (ref), var2 (ref), useLocalization (ref), cryoModule (ref)
	local var4 = if p1 then p1.labelTranslationKey else nil
	local var5 = if p1 then p1.shouldAddPlayerName else nil
	local t = {}
	local t_1 = {}
	local var8 = not fFlagScopeBadUtterancePlayerNameToChatDialogsModule or var5 == true
	
	if var4 and var4 ~= "" then
		t_1[var4] = "Feature.NotApproved." .. var4
	end
	for i, v in p0 do
		local utteranceText = v.utteranceText
		table.insert(t, if localPlayer and var8 then var2:Format("Feature.InExperienceIntervention.Label.Player", { username = localPlayer.Name, evidence = utteranceText }) else utteranceText)
		t_1[v.labelTranslationKey] = "Feature.NotApproved." .. v.labelTranslationKey
	end
	local var9 = useLocalization(t_1)
	local t_2 = {}
	
	for i_1, v_1 in t_1 do
		local var11 = var9[i_1]
		
		if var11 and var11 ~= "" then
			t_2[var11] = true
		end
	end
	return {
		textItems = cryoModule.List.reverse(t),
		abuseTypes = cryoModule.Dictionary.keys(t_2)
	}
end