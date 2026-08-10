local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local localPlayer = game:GetService("Players").LocalPlayer
local cryoModule = require(parent.Cryo)
local var2 = require(parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(interventionShared.Utils.Types)

return function(p0, p1) --[[ line: 40 | named "useParsedBadUtterances" ]]
	-- upvalues: localPlayer (ref), var2 (ref), useLocalization (ref), cryoModule (ref)
	local t = {}
	local t_1 = {}
	
	if p1 and p1 ~= "" then
		t_1[p1] = "Feature.NotApproved." .. p1
	end
	for i, v in p0 do
		local utteranceText = v.utteranceText
		table.insert(t, if localPlayer then var2:Format("Feature.InExperienceIntervention.Label.Player", { username = localPlayer.Name, evidence = utteranceText }) else utteranceText)
		t_1[v.labelTranslationKey] = "Feature.NotApproved." .. v.labelTranslationKey
	end
	local var5 = useLocalization(t_1)
	local t_2 = {}
	
	for i_1, v_1 in t_1 do
		local var7 = var5[i_1]
		
		if var7 and var7 ~= "" then
			t_2[var7] = true
		end
	end
	return {
		textItems = cryoModule.List.reverse(t),
		abuseTypes = cryoModule.Dictionary.keys(t_2)
	}
end