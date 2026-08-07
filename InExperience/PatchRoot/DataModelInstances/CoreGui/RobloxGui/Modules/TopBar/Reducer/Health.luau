local corePackagesService = game:GetService("CorePackages")
local actions = script.Parent.Parent.Actions

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else require(corePackagesService.Packages.Rodux).createReducer({ isDead = false, currentHealth = 100, maxHealth = 100 }, {
	[require(actions.UpdateHealth).name] = function(p0, p1) --[[ line: 25 ]]
		return {
			isDead = p0.isDead,
			currentHealth = p1.health,
			maxHealth = p1.maxHealth
		}
	end,
	[require(actions.SetIsDead).name] = function(p2, p3) --[[ line: 33 ]]
		return {
			isDead = p3.isDead,
			currentHealth = p2.currentHealth,
			maxHealth = p2.maxHealth
		}
	end
})