local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.userId] = {} })
	end,
	[require(actions.RemovePlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.userId] = cryoModule.None })
	end,
	[require(actions.SetPlayerLeaderstat).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1[p2.userId] == nil then p1 else cryoModule.Dictionary.join(p1, {
			[p2.userId] = cryoModule.Dictionary.join(p1[p2.userId], { [p2.leaderstat] = p2.value })
		})
	end
})