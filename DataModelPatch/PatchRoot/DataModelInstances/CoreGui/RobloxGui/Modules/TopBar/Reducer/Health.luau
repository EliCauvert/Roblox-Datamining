local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local Actions = script.Parent.Parent.Actions
local UpdateHealthModule = require(Actions.UpdateHealth)
local SetIsDeadModule = require(Actions.SetIsDead)

return if require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else RoduxModule.createReducer({ isDead = false, currentHealth = 100, maxHealth = 100 }, {
	[UpdateHealthModule.name] = function(p1, p2)
		return {
			isDead = p1.isDead,
			currentHealth = p2.health,
			maxHealth = p2.maxHealth
		}
	end,
	[SetIsDeadModule.name] = function(p1, p2)
		return {
			isDead = p2.isDead,
			currentHealth = p1.currentHealth,
			maxHealth = p1.maxHealth
		}
	end
})