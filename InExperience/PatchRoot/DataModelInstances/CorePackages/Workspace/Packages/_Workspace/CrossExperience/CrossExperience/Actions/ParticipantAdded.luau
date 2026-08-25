local crossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(crossExperience.Types)

return require(crossExperience.dependencies).Rodux.makeActionCreator(script.Name, function(p0)
	return { payload = { participant = p0 } }
end)