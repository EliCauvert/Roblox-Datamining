local FormatCaughtErrorModule = require(script.Parent.formatCaughtError)

return function(p1, p2)
	-- upvalues: FormatCaughtErrorModule (copy)
	local FormatCaughtErrorModuleResult = FormatCaughtErrorModule(p1, p2)
	task.spawn(function()
		-- upvalues: FormatCaughtErrorModuleResult (copy)
		error(FormatCaughtErrorModuleResult, 0)
	end)
end