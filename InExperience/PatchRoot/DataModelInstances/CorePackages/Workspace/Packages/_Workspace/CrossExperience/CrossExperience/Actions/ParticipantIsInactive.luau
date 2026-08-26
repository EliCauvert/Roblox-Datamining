local crossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(crossExperience.Types)

return require(crossExperience.dependencies).Rodux.makeActionCreator(script.Name, function(p1)
	return { payload = p1 }
end)