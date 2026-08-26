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
	[require(actions.SetMoreMenuOpen).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { open = p2.open })
	end,
	[require(actions.SetBackpackOpen).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { open = false, backpackOpen = p2.open })
	end,
	[require(actions.SetEmotesOpen).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { open = false, emotesOpen = p2.open })
	end,
	[require(actions.SetEmotesEnabled).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { emotesEnabled = p2.enabled })
	end,
	[require(actions.SetLeaderboardOpen).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { open = false, leaderboardOpen = p2.open })
	end
})