local roduxNetworkingModule = require(script.RoduxNetworking)
local networkStatusModule = require(script.NetworkStatus)
local _ = require(script.Types)

return {
	config = function(p1)
		-- upvalues: roduxNetworkingModule (ref), networkStatusModule (ref)
		local var1 = roduxNetworkingModule(p1)
		local var2 = networkStatusModule(p1)
		
		return {
			GET = function(p2, p3)
				-- upvalues: var1 (ref)
				return var1.GET(p2, p3)
			end,
			POST = function(p2, p3)
				-- upvalues: var1 (ref)
				return var1.POST(p2, p3)
			end,
			PATCH = function(p2, p3)
				-- upvalues: var1 (ref)
				return var1.PATCH(p2, p3)
			end,
			DELETE = function(p2, p3)
				-- upvalues: var1 (ref)
				return var1.DELETE(p2, p3)
			end,
			getNetworkImpl = function()
				-- upvalues: var1 (ref)
				return var1.getNetworkImpl()
			end,
			setNetworkImpl = function(...)
				-- upvalues: var1 (ref)
				var1.setNetworkImpl(...)
			end,
			installReducer = var2.installReducer,
			Enum = { NetworkStatus = var2.Enum.Status }
		}
	end,
	mock = require(script.mockRoduxNetworking)
}