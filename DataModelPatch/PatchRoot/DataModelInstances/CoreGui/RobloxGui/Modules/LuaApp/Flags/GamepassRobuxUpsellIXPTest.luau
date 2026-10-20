local AppUserLayers = require(game:GetService("CorePackages").Workspace.Packages.ExperimentLayers).AppUserLayers
game:DefineFastFlag("GamepassRobuxUpsellIXPV2", false)
game:DefineFastFlag("GamepassRobuxUpsellIXPRolledOutV2", false)
game:DefineFastFlag("GamepassRobuxUpsellEnabledV2", false)

local function _()
	return game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPRolledOutV2")
end

return {
	isEnabled = function()
		return game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPV2")
	end,
	isEnabledForAll = function()
		return game:GetFastFlag("GamepassRobuxUpsellEnabledV2")
	end,
	isUserEnrolled = function(p1): boolean
		-- upvalues: AppUserLayers (copy)
		if game:GetFastFlag("GamepassRobuxUpsellEnabledV2") then
			return true
		elseif not game:GetFastFlag("GamepassRobuxUpsellEnabledV2") and not game:GetFastFlag("GamepassRobuxUpsellIXPV2") then
			return false
		else
			local v1 = p1[AppUserLayers.GamepassRobuxUpsellLayer] or {}
			
			if v1.isInExperiment then
				return v1.isInExperiment ~= 0
			else
				local GamepassRobuxUpsellEnabledV2FastFlag = game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPRolledOutV2")
				
				return if GamepassRobuxUpsellEnabledV2FastFlag then true else false
			end
		end
	end
}