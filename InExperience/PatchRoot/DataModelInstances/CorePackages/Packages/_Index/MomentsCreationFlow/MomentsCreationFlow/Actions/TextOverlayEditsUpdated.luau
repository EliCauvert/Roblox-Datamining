local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local _ = require(parent.MomentsCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 13 ]]
	return { textOverlayEdits = p0 }
end)