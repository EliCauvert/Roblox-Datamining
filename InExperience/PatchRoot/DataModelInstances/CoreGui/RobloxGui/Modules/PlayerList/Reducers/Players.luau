local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p0, p1) --[[ line: 11 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.List.join(p0, { p1.player })
	end,
	[require(actions.RemovePlayer).name] = function(p2, p3) --[[ line: 15 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.List.filter(p2, function(p4) --[[ line: 16 ]]
			-- upvalues: p3 (ref)
			return p4 ~= p3.player
		end)
	end
})