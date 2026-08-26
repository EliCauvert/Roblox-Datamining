local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local localPlayer = game:GetService("Players").LocalPlayer
local cryoModule = require(parent.Cryo)
local var1 = require(parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagScopeBadUtterancePlayerNameToChatDialogsModule = require(interventionShared.Flags.FFlagScopeBadUtterancePlayerNameToChatDialogs)
local _ = require(interventionShared.Utils.Types)

return function(p1, p2)
	-- upvalues: fFlagScopeBadUtterancePlayerNameToChatDialogsModule (ref), localPlayer (ref), var1 (ref), useLocalization (ref), cryoModule (ref)
	local var2 = if p2 then p2.labelTranslationKey else nil
	local var3 = if p2 then p2.shouldAddPlayerName else nil
	local t = {}
	local t_1 = {}
	local var4 = not fFlagScopeBadUtterancePlayerNameToChatDialogsModule or var3 == true
	
	if var2 and var2 ~= "" then
		t_1[var2] = "Feature.NotApproved." .. var4
	end
	for i, v in p1 do
		local utteranceText = v.utteranceText
		table.insert(t, if localPlayer and var4 then var1:Format("Feature.InExperienceIntervention.Label.Player", { username = localPlayer.Name, evidence = utteranceText }) else utteranceText)
		t_1[v.labelTranslationKey] = "Feature.NotApproved." .. v.labelTranslationKey
	end
	local var5 = useLocalization(t_1)
	local t_2 = {}
	
	for i_1, v_1 in t_1 do
		local var6 = var5[i_1]
		
		if var6 and var6 ~= "" then
			t_2[var6] = true
		end
	end
	return {
		textItems = cryoModule.List.reverse(t),
		abuseTypes = cryoModule.Dictionary.keys(t_2)
	}
end