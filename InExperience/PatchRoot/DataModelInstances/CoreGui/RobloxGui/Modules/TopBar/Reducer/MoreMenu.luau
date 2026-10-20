local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local CryoModule = require(CorePackages.Packages.Cryo)

if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
	return nil
else
	local Actions = script.Parent.Parent.Actions
	
	return (RoduxModule.createReducer({
		open = false,
		backpackOpen = false,
		leaderboardOpen = false,
		emotesOpen = false,
		emotesEnabled = true
	}, {
		[require(Actions.SetMoreMenuOpen).name] = function(p1, p2)
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { open = p2.open })
		end,
		[require(Actions.SetBackpackOpen).name] = function(p1, p2)
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { open = false, backpackOpen = p2.open })
		end,
		[require(Actions.SetEmotesOpen).name] = function(p1, p2)
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { open = false, emotesOpen = p2.open })
		end,
		[require(Actions.SetEmotesEnabled).name] = function(p1, p2)
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { emotesEnabled = p2.enabled })
		end,
		[require(Actions.SetLeaderboardOpen).name] = function(p1, p2)
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { open = false, leaderboardOpen = p2.open })
		end
	}))
end