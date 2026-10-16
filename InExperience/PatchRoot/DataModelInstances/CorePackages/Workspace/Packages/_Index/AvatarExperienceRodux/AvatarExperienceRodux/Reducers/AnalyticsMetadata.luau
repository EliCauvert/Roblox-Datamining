local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({}, {
	[require(AvatarExperienceRodux.Actions.AddAnalyticsMetadata).name] = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, p2.metadata)
	end
})