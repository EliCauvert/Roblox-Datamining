local RoduxNetworkingModule = require(script.Parent.RoduxNetworking)

return function(p1) --[[ Line: 3 ]]
	-- upvalues: RoduxNetworkingModule (copy)
	local NetworkImpl = RoduxNetworkingModule.getNetworkImpl()
	RoduxNetworkingModule.setNetworkImpl(p1)
	
	return function() --[[ Line: 7 ]]
		-- upvalues: RoduxNetworkingModule (upval), NetworkImpl (copy)
		RoduxNetworkingModule.setNetworkImpl(NetworkImpl)
	end
end