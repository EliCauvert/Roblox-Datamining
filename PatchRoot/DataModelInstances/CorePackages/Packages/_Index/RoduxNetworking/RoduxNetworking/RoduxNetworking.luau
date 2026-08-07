-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local GETModule = require(script.Parent.GET)
local POSTModule = require(script.Parent.POST)
local PATCHModule = require(script.Parent.PATCH)
local DELETEModule = require(script.Parent.DELETE)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 8 ]]
	-- upvalues: GETModule (ref), POSTModule (ref), PATCHModule (ref), DELETEModule (ref)
	assert(p0, "Expected options to be passed into RoduxNetworking")
	assert(p0.keyPath, "Expected options.keyPath to be passed into RoduxNetworking")
	assert(p0.networkImpl, "Expected options.networkImpl to be passed into RoduxNetworking")
	
	return {
		GET = function(p1, p2) --[[ line: 14 ]]
			-- upvalues: GETModule (copy), p0 (ref)
			assert(p1, "RoduxNetworking:GET expects moduleScript argument")
			assert(p1, "RoduxNetworking:GET expects constructBuilderFunction argument")
			
			return GETModule(p0)(p1, p2)
		end,
		POST = function(p3, p4) --[[ line: 19 ]]
			-- upvalues: POSTModule (copy), p0 (ref)
			return POSTModule(p0)(p3, p4)
		end,
		PATCH = function(p5, p6) --[[ line: 22 ]]
			-- upvalues: PATCHModule (copy), p0 (ref)
			return PATCHModule(p0)(p5, p6)
		end,
		DELETE = function(p7, p8) --[[ line: 25 ]]
			-- upvalues: DELETEModule (copy), p0 (ref)
			return DELETEModule(p0)(p7, p8)
		end,
		getNetworkImpl = function() --[[ line: 28 ]]
			-- upvalues: p0 (ref)
			return p0.networkImpl
		end,
		setNetworkImpl = function(value) --[[ line: 31 ]]
			-- upvalues: p0 (ref)
			p0.networkImpl = value
		end
	}
end