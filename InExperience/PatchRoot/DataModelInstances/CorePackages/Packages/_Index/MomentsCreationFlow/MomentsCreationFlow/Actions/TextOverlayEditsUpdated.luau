local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local _ = require(parent.MomentsCommon)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { textOverlayEdits = p1 }
end)