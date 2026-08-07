local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent

return inGameMenuDependenciesModule.Rodux.createReducer({ dialogOpen = false, enabled = true, customCallback = nil }, {
	[require(parent.Actions.SetRespawning).name] = function(p0, p1) --[[ line: 20 ]]
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p0, { dialogOpen = p1.respawning })
	end,
	[require(parent.Actions.SetMenuOpen).name] = function(p2, p3) --[[ line: 25 ]]
		-- upvalues: cryo (ref)
		return if p3.menuOpen then p2 else cryo.Dictionary.join(p2, { dialogOpen = false })
	end,
	[require(parent.Actions.SetCurrentPage).name] = function(p4, _) --[[ line: 35 ]]
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p4, { dialogOpen = false })
	end,
	[require(parent.Actions.SetRespawnBehavior).name] = function(p5, p6) --[[ line: 40 ]]
		return {
			customCallback = p6.customCallback,
			enabled = p6.respawnEnabled,
			dialogOpen = if not p6.respawnEnabled then false else p5.dialogOpen
		}
	end
})