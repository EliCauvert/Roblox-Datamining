local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)
local SetNetworkingErrorToastModule = require(script.Parent.SetNetworkingErrorToast)

return function(p1)
	-- upvalues: PromiseModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
		return p2:dispatch(p1):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result)
		end, function(p3)
			-- upvalues: p2 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p2:dispatch(SetNetworkingErrorToastModule(p3))
			
			return PromiseModule.reject(p3)
		end)
	end
end