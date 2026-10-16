local Parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local _ = require(Parent.MomentsCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(MusicInfos) --[[ Line: 13 ]]
	return { musicInfos = MusicInfos }
end)