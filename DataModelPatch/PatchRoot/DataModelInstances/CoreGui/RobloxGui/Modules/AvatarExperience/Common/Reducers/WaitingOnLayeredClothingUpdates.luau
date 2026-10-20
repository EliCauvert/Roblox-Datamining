local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(Modules.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate).name] = function(_, _): boolean
		return true
	end,
	[require(Modules.AvatarExperience.Common.Actions.FinishedWaitingOnLCUpdate).name] = function(_, _): boolean
		return false
	end
})