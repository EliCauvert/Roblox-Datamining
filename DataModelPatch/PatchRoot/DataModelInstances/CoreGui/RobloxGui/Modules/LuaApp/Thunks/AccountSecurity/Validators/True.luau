local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)

return function(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(nil)
end