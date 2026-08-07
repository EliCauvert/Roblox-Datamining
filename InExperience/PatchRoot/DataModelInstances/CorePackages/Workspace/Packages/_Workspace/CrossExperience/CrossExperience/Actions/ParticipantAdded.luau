local crossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(crossExperience.Types)

return require(crossExperience.dependencies).Rodux.makeActionCreator(script.Name, function(p0) --[[ line: 7 ]]
	return { payload = { participant = p0 } }
end)