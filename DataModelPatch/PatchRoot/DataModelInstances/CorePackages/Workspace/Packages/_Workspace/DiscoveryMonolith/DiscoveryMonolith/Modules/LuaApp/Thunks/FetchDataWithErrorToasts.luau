local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local PromiseModule = require(Parent.Promise)
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(p1)
	-- upvalues: PromiseModule (copy), SetNetworkingErrorToastFunction (copy)
	return function(p2)
		-- upvalues: p1 (copy), PromiseModule (upval), SetNetworkingErrorToastFunction (upval)
		return p2:dispatch(p1):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result)
		end, function(p3)
			-- upvalues: p2 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
			p2:dispatch(SetNetworkingErrorToastFunction(p3))
			
			return PromiseModule.reject(p3)
		end)
	end
end