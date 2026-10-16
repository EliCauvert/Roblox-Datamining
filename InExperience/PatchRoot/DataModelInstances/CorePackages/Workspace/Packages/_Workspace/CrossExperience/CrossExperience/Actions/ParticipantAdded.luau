local CrossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(CrossExperience.Types)

return require(CrossExperience.dependencies).Rodux.makeActionCreator(script.Name, function(Participant) --[[ Line: 7 ]]
	return { payload = { participant = Participant } }
end)