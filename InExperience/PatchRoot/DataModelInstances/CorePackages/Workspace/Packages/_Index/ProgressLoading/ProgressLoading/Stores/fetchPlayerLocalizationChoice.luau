local createNetworkingModule = require(script:FindFirstAncestor("ProgressLoading").createNetworking)
local buildPlayerLocalizationChoiceUrlModule = require(script.Parent.buildPlayerLocalizationChoiceUrl)

return function(p1)
	-- upvalues: buildPlayerLocalizationChoiceUrlModule (ref), createNetworkingModule (ref)
	return createNetworkingModule(buildPlayerLocalizationChoiceUrlModule(p1), "GET")
end