local GETModule = require(script.Parent.GET)
local POSTModule = require(script.Parent.POST)
local PATCHModule = require(script.Parent.PATCH)
local DELETEModule = require(script.Parent.DELETE)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: GETModule (ref), POSTModule (ref), PATCHModule (ref), DELETEModule (ref)
	assert(p1, "Expected options to be passed into RoduxNetworking")
	assert(p1.keyPath, "Expected options.keyPath to be passed into RoduxNetworking")
	assert(p1.networkImpl, "Expected options.networkImpl to be passed into RoduxNetworking")
	
	return {
		GET = function(p2, p3)
			-- upvalues: GETModule (copy), p1 (ref)
			assert(p2, "RoduxNetworking:GET expects moduleScript argument")
			assert(p2, "RoduxNetworking:GET expects constructBuilderFunction argument")
			
			return GETModule(p1)(p2, p3)
		end,
		POST = function(p2, p3)
			-- upvalues: POSTModule (copy), p1 (ref)
			return POSTModule(p1)(p2, p3)
		end,
		PATCH = function(p2, p3)
			-- upvalues: PATCHModule (copy), p1 (ref)
			return PATCHModule(p1)(p2, p3)
		end,
		DELETE = function(p2, p3)
			-- upvalues: DELETEModule (copy), p1 (ref)
			return DELETEModule(p1)(p2, p3)
		end,
		getNetworkImpl = function()
			-- upvalues: p1 (ref)
			return p1.networkImpl
		end,
		setNetworkImpl = function(value)
			-- upvalues: p1 (ref)
			p1.networkImpl = value
		end
	}
end