local CrossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(CrossExperience.Types)

return require(CrossExperience.dependencies).Rodux.makeActionCreator(script.Name, function(Payload) --[[ Line: 6 ]]
	return { payload = Payload }
end)