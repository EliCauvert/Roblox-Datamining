local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Cryo = InGameMenuDependenciesModule.Cryo
local Parent = script.Parent.Parent

return InGameMenuDependenciesModule.Rodux.createReducer({ dialogOpen = false, enabled = true, customCallback = nil }, {
	[require(Parent.Actions.SetRespawning).name] = function(p1, p2)
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { dialogOpen = p2.respawning })
	end,
	[require(Parent.Actions.SetMenuOpen).name] = function(p1, p2)
		-- upvalues: Cryo (copy)
		return if p2.menuOpen then p1 else Cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(Parent.Actions.SetCurrentPage).name] = function(p1, _)
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(Parent.Actions.SetRespawnBehavior).name] = function(p1, p2)
		return {
			customCallback = p2.customCallback,
			enabled = p2.respawnEnabled,
			dialogOpen = if p2.respawnEnabled then p1.dialogOpen else false
		}
	end
})