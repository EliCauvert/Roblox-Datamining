local roduxNetworkingModule = require(script.Parent.RoduxNetworking)

return function(p1)
	-- upvalues: roduxNetworkingModule (ref)
	local networkImpl = roduxNetworkingModule.getNetworkImpl()
	roduxNetworkingModule.setNetworkImpl(p1)
	
	return function()
		-- upvalues: roduxNetworkingModule (copy), networkImpl (ref)
		roduxNetworkingModule.setNetworkImpl(networkImpl)
	end
end