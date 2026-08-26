local corePackagesService = game:GetService("CorePackages")
local actions = script.Parent.Parent.Actions

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else require(corePackagesService.Packages.Rodux).createReducer({ isDead = false, currentHealth = 100, maxHealth = 100 }, {
	[require(actions.UpdateHealth).name] = function(p1, p2)
		return {
			isDead = p1.isDead,
			currentHealth = p2.health,
			maxHealth = p2.maxHealth
		}
	end,
	[require(actions.SetIsDead).name] = function(p1, p2)
		return {
			isDead = p2.isDead,
			currentHealth = p1.currentHealth,
			maxHealth = p1.maxHealth
		}
	end
})