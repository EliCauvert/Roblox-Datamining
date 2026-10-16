local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetExperienceInfo).name] = function(p1, p2) --[[ Line: 12 ]]
		-- upvalues: CryoModule (copy)
		local ExperienceInfo = p2.experienceInfo
		local UniverseId = ExperienceInfo.universeId
		assert(UniverseId ~= nil, "Expected a universe id when setting an experiences's information.")
		
		return CryoModule.Dictionary.join(p1, {
			[UniverseId] = CryoModule.Dictionary.join(p1[UniverseId] or {}, ExperienceInfo)
		})
	end
})