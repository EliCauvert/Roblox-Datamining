local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)

return function(p1, p2)
	-- upvalues: PromiseModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), PromiseModule (upval), p1 (copy)
		return if p3 == p2 then PromiseModule.resolve(nil) else PromiseModule.resolve(p1)
	end
end