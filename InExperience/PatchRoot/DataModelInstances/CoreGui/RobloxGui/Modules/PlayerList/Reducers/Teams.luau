local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddTeam).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.List.join(p1, { p2.team })
	end,
	[require(actions.RemoveTeam).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.List.filter(p1, function(p3)
			-- upvalues: p2 (ref)
			return p3 ~= p2.team
		end)
	end
})