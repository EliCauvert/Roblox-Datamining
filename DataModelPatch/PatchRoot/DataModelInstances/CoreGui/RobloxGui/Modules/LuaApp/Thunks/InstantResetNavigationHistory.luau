local ResetNavigationHistoryModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.ResetNavigationHistory)

return function(p1, p2)
	-- upvalues: ResetNavigationHistoryModule (copy)
	return function(p3)
		-- upvalues: ResetNavigationHistoryModule (upval), p1 (copy), p2 (copy)
		p3:dispatch(ResetNavigationHistoryModule(p1, p2))
		p3:flush()
	end
end