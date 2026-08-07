local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { [p1.userId] = {} })
	end,
	[require(actions.RemovePlayer).name] = function(p2, p3) --[[ line: 19 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { [p3.userId] = cryoModule.None })
	end,
	[require(actions.SetPlayerLeaderstat).name] = function(p4, p5) --[[ line: 25 ]]
		-- upvalues: cryoModule (ref)
		return if p4[p5.userId] == nil then p4 else cryoModule.Dictionary.join(p4, {
			[p5.userId] = cryoModule.Dictionary.join(p4[p5.userId], { [p5.leaderstat] = p5.value })
		})
	end
})