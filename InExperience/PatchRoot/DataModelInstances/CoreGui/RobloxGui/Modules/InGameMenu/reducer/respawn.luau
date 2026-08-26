local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent

return inGameMenuDependenciesModule.Rodux.createReducer({ dialogOpen = false, enabled = true, customCallback = nil }, {
	[require(parent.Actions.SetRespawning).name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { dialogOpen = p2.respawning })
	end,
	[require(parent.Actions.SetMenuOpen).name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return if p2.menuOpen then p1 else cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(parent.Actions.SetCurrentPage).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(parent.Actions.SetRespawnBehavior).name] = function(p1, p2)
		return {
			customCallback = p2.customCallback,
			enabled = p2.respawnEnabled,
			dialogOpen = if not p2.respawnEnabled then false else p1.dialogOpen
		}
	end
})