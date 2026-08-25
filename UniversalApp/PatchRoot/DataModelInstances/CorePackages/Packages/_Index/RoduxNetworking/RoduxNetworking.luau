local roduxNetworkingModule = require(script.RoduxNetworking)
local networkStatusModule = require(script.NetworkStatus)
local _ = require(script.Types)

return {
	config = function(p0)
		-- upvalues: roduxNetworkingModule (ref), networkStatusModule (ref)
		local var2 = roduxNetworkingModule(p0)
		local var3 = networkStatusModule(p0)
		
		return {
			GET = function(p1, p2)
				-- upvalues: var2 (ref)
				return var2.GET(p1, p2)
			end,
			POST = function(p3, p4)
				-- upvalues: var2 (ref)
				return var2.POST(p3, p4)
			end,
			PATCH = function(p5, p6)
				-- upvalues: var2 (ref)
				return var2.PATCH(p5, p6)
			end,
			DELETE = function(p7, p8)
				-- upvalues: var2 (ref)
				return var2.DELETE(p7, p8)
			end,
			getNetworkImpl = function()
				-- upvalues: var2 (ref)
				return var2.getNetworkImpl()
			end,
			setNetworkImpl = function(...)
				-- upvalues: var2 (ref)
				var2.setNetworkImpl(...)
			end,
			installReducer = var3.installReducer,
			Enum = { NetworkStatus = var3.Enum.Status }
		}
	end,
	mock = require(script.mockRoduxNetworking)
}