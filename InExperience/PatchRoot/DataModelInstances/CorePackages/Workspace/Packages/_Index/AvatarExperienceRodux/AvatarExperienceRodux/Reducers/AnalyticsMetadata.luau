local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({}, {
	[require(avatarExperienceRodux.Actions.AddAnalyticsMetadata).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, p2.metadata)
	end
})