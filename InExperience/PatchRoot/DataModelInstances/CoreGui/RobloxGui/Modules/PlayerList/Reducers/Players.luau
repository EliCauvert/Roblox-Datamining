local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.List.join(p1, { p2.player })
	end,
	[require(actions.RemovePlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.List.filter(p1, function(p3)
			-- upvalues: p2 (ref)
			return p3 ~= p2.player
		end)
	end
})