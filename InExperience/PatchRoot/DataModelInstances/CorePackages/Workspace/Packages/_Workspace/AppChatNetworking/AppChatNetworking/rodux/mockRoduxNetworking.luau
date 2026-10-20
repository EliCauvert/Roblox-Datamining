local RoduxNetworkingModule = require(script.Parent.RoduxNetworking)

return function(p1)
	-- upvalues: RoduxNetworkingModule (copy)
	local NetworkImpl = RoduxNetworkingModule.getNetworkImpl()
	RoduxNetworkingModule.setNetworkImpl(p1)
	
	return function()
		-- upvalues: RoduxNetworkingModule (upval), NetworkImpl (copy)
		RoduxNetworkingModule.setNetworkImpl(NetworkImpl)
	end
end