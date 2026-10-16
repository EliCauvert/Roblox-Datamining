local FormatCaughtErrorModule = require(script.Parent.formatCaughtError)

return function(p1, p2) --[[ Line: 3 | Named "reportCaughtError" ]]
	-- upvalues: FormatCaughtErrorModule (copy)
	local FormatCaughtErrorModuleResult = FormatCaughtErrorModule(p1, p2)
	task.spawn(function() --[[ Line: 5 ]]
		-- upvalues: FormatCaughtErrorModuleResult (copy)
		error(FormatCaughtErrorModuleResult, 0)
	end)
end