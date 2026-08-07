local createNetworkingModule = require(script:FindFirstAncestor("ExperienceLoadingScript").createNetworking)
local buildPlayerLocalizationChoiceUrlModule = require(script.Parent.buildPlayerLocalizationChoiceUrl)

return function(p0) --[[ line: 6 | named "fetchPlayerLocalizationChoice" ]]
	-- upvalues: buildPlayerLocalizationChoiceUrlModule (ref), createNetworkingModule (ref)
	return createNetworkingModule(buildPlayerLocalizationChoiceUrlModule(p0), "GET")
end