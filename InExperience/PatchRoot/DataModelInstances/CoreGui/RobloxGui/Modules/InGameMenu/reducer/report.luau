local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local rodux = inGameMenuDependenciesModule.Rodux
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent

return rodux.createReducer({
	dialogOpen = false,
	reportSentOpen = false,
	userId = nil,
	userName = nil
}, {
	[require(parent.Actions.OpenReportDialog).name] = function(p1, p2)
		return {
			dialogOpen = true,
			reportSentOpen = p1.reportSentOpen,
			userId = p2.userId,
			userName = p2.userName
		}
	end,
	[require(parent.Actions.SetCurrentPage).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(parent.Actions.CloseReportDialog).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { dialogOpen = false })
	end,
	[require(parent.Actions.OpenReportSentDialog).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { reportSentOpen = true })
	end,
	[require(parent.Actions.CloseReportSentDialog).name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { reportSentOpen = false })
	end
})