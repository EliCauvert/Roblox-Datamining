local Parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local _ = require(Parent.MomentsCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(TrimEdit) --[[ Line: 13 ]]
	return { trimEdit = TrimEdit }
end)