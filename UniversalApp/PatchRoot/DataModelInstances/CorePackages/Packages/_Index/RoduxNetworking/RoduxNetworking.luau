local RoduxNetworkingModule = require(script.RoduxNetworking)
local NetworkStatusModule = require(script.NetworkStatus)
local _ = require(script.Types)

return {
	config = function(p1) --[[ Line: 11 ]]
		-- upvalues: RoduxNetworkingModule (copy), NetworkStatusModule (copy)
		local RoduxNetworkingModuleResult = RoduxNetworkingModule(p1)
		local NetworkStatusModuleResult = NetworkStatusModule(p1)
		
		return {
			GET = function(p2, p3) --[[ Line: 16 ]]
				-- upvalues: RoduxNetworkingModuleResult (copy)
				return RoduxNetworkingModuleResult.GET(p2, p3)
			end,
			POST = function(p2, p3) --[[ Line: 19 ]]
				-- upvalues: RoduxNetworkingModuleResult (copy)
				return RoduxNetworkingModuleResult.POST(p2, p3)
			end,
			PATCH = function(p2, p3) --[[ Line: 22 ]]
				-- upvalues: RoduxNetworkingModuleResult (copy)
				return RoduxNetworkingModuleResult.PATCH(p2, p3)
			end,
			DELETE = function(p2, p3) --[[ Line: 25 ]]
				-- upvalues: RoduxNetworkingModuleResult (copy)
				return RoduxNetworkingModuleResult.DELETE(p2, p3)
			end,
			getNetworkImpl = function() --[[ Line: 28 ]]
				-- upvalues: RoduxNetworkingModuleResult (copy)
				return RoduxNetworkingModuleResult.getNetworkImpl()
			end,
			setNetworkImpl = function(...) --[[ Line: 31 ]]
				-- upvalues: RoduxNetworkingModuleResult (copy)
				RoduxNetworkingModuleResult.setNetworkImpl(...)
			end,
			installReducer = NetworkStatusModuleResult.installReducer,
			Enum = { NetworkStatus = NetworkStatusModuleResult.Enum.Status }
		}
	end,
	mock = require(script.mockRoduxNetworking)
}