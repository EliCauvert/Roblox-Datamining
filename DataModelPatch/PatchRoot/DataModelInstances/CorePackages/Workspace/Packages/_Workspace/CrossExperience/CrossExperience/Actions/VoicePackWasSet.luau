local CrossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(CrossExperience.Types)

return require(CrossExperience.dependencies).Rodux.makeActionCreator(script.Name, function(Payload)
	return { payload = Payload }
end)