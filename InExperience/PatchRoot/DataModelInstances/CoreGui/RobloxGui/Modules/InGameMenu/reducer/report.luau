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
	[require(parent.Actions.OpenReportDialog).name] = function(p0, p1)
		return {
			dialogOpen = true,
			reportSentOpen = p0.reportSentOpen,
			userId = p1.userId,
			userName = p1.userName
		}
	end,
	[require(parent.Actions.SetCurrentPage).name] = function(p2, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p2, { dialogOpen = false })
	end,
	[require(parent.Actions.CloseReportDialog).name] = function(p3, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p3, { dialogOpen = false })
	end,
	[require(parent.Actions.OpenReportSentDialog).name] = function(p4, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p4, { reportSentOpen = true })
	end,
	[require(parent.Actions.CloseReportSentDialog).name] = function(p5, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p5, { reportSentOpen = false })
	end
})