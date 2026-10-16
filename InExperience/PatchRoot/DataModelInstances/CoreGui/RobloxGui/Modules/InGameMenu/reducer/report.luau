local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Cryo = InGameMenuDependenciesModule.Cryo
local Parent = script.Parent.Parent

return InGameMenuDependenciesModule.Rodux.createReducer({
	dialogOpen = false,
	reportSentOpen = false,
	userId = nil,
	userName = nil
}, {
	[require(Parent.Actions.OpenReportDialog).name] = function(p1, p2) --[[ Line: 21 ]]
		return {
			dialogOpen = true,
			reportSentOpen = p1.reportSentOpen,
			userId = p2.userId,
			userName = p2.userName
		}
	end,
	[require(Parent.Actions.SetCurrentPage).name] = function(p1, _) --[[ Line: 31 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(Parent.Actions.CloseReportDialog).name] = function(p1, _) --[[ Line: 36 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(Parent.Actions.OpenReportSentDialog).name] = function(p1, _) --[[ Line: 41 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { reportSentOpen = true })
	end,
	[require(Parent.Actions.CloseReportSentDialog).name] = function(p1, _) --[[ Line: 46 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { reportSentOpen = false })
	end
})