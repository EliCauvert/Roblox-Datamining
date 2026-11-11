local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ focusController = nil, boundInputs = {} }, {
	[require(Modules.LuaApp.Actions.SetBoundInputs).name] = function(_, p1)
		return {
			boundInputs = p1.boundInputs or {},
			focusController = p1.focusController
		}
	end,
	[require(Modules.LuaApp.Actions.MaybeClearBoundInputs).name] = function(p1, p2)
		return if p1.focusController == p2.focusController then { focusController = nil, boundInputs = {} } else p1
	end
})