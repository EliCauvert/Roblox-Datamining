local CreateNetworkingModule = require(script:FindFirstAncestor("ExperienceLoadingScript").createNetworking)
local BuildPlayerLocalizationChoiceUrlModule = require(script.Parent.buildPlayerLocalizationChoiceUrl)

return function(p1)
	-- upvalues: BuildPlayerLocalizationChoiceUrlModule (copy), CreateNetworkingModule (copy)
	return CreateNetworkingModule(BuildPlayerLocalizationChoiceUrlModule(p1), "GET")
end