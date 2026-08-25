local createNetworkingModule = require(script:FindFirstAncestor("ProgressLoading").createNetworking)
local buildPlayerLocalizationChoiceUrlModule = require(script.Parent.buildPlayerLocalizationChoiceUrl)

return function(p0)
	-- upvalues: buildPlayerLocalizationChoiceUrlModule (ref), createNetworkingModule (ref)
	return createNetworkingModule(buildPlayerLocalizationChoiceUrlModule(p0), "GET")
end