-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.ElevationLayer)
local elevationProviderModule = require(script.Parent.ElevationProvider)
local _ = require(script.Parent.elevation)
local useElevationManager = elevationProviderModule.useElevationManager
local useOwnerToken = elevationProviderModule.useOwnerToken

return function(p0, p1) --[[ line: 20 | named "useElevation" ]]
	-- upvalues: useElevationManager (ref), useOwnerToken (ref), reactModule (ref)
	local var3 = useElevationManager()
	local var4 = useOwnerToken()
	local var5 = reactModule.useMemo(function() --[[ line: 25 ]]
		-- upvalues: var4 (ref), p0 (ref), p1 (ref), var3 (ref)
		local var6 = var4 ~= nil and var4.layer == p0
		
		return if p1.stackAboveOwner then if var4 then if var6 then var3.acquire(p0, { reserve = true, owner = var4 }) else { index = -1, layer = p0, zIndex = var4.zIndex + 1 } else var3.acquire(p0, { reserve = false }) else var3.acquire(p0, { reserve = var6 })
	end, { p0, var4, var3, p1.stackAboveOwner })
	reactModule.useEffect(function() --[[ line: 57 ]]
		-- upvalues: var5 (ref), var3 (ref), p0 (ref)
		return function() --[[ line: 58 ]]
			-- upvalues: var5 (copy), var3 (copy), p0 (copy)
			if var5.index ~= nil and var5.index >= 0 then
				var3.releaseIfTop(p0, var5.index)
			end
		end
	end, { p0, var5.index })
	
	return var5
end