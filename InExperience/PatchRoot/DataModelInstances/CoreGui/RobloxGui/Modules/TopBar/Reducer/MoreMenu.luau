local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)

if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
	return nil
end
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({
	open = false,
	backpackOpen = false,
	leaderboardOpen = false,
	emotesOpen = false,
	emotesEnabled = true
}, {
	[require(actions.SetMoreMenuOpen).name] = function(p0, p1) --[[ line: 30 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { open = p1.open })
	end,
	[require(actions.SetBackpackOpen).name] = function(p2, p3) --[[ line: 36 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { open = false, backpackOpen = p3.open })
	end,
	[require(actions.SetEmotesOpen).name] = function(p4, p5) --[[ line: 43 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { open = false, emotesOpen = p5.open })
	end,
	[require(actions.SetEmotesEnabled).name] = function(p6, p7) --[[ line: 50 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, { emotesEnabled = p7.enabled })
	end,
	[require(actions.SetLeaderboardOpen).name] = function(p8, p9) --[[ line: 56 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, { open = false, leaderboardOpen = p9.open })
	end
})