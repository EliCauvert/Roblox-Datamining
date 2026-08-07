-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local _ = require(script.ReactInternalTypes)
local _ = require(script.ReactRootTags)
local _ = require(script.ReactFiberHostConfig)
local _ = require(script["ReactFiberHotReloading.new"])

return function(p0) --[[ line: 39 | named "initialize" ]]
	local reactFiberHostConfigModule = require(script.ReactFiberHostConfig)
	
	for i, v in p0 do
		reactFiberHostConfigModule[i] = v
	end
	return require(script.ReactFiberReconciler)
end