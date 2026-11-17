local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceModel)

return require(Parent.Rodux).makeActionCreator(script.Name, function(Metadata)
	return { metadata = Metadata }
end)