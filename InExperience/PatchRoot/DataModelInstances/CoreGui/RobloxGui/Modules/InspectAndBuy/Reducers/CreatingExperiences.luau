local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetExperienceInfo).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local experienceInfo = p2.experienceInfo
		local universeId = experienceInfo.universeId
		assert(universeId ~= nil, "Expected a universe id when setting an experiences's information.")
		
		return cryoModule.Dictionary.join(p1, {
			[universeId] = cryoModule.Dictionary.join(p1[universeId] or {}, experienceInfo)
		})
	end
})