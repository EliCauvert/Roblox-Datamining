local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddTeam).name] = function(p0, p1) --[[ line: 11 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.List.join(p0, { p1.team })
	end,
	[require(actions.RemoveTeam).name] = function(p2, p3) --[[ line: 15 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.List.filter(p2, function(p4) --[[ line: 16 ]]
			-- upvalues: p3 (ref)
			return p4 ~= p3.team
		end)
	end
})