local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.ElevationLayer)
local elevationProviderModule = require(script.Parent.ElevationProvider)
local _ = require(script.Parent.elevation)
local useElevationManager = elevationProviderModule.useElevationManager
local useOwnerToken = elevationProviderModule.useOwnerToken

return function(p1, p2)
	-- upvalues: useElevationManager (ref), useOwnerToken (ref), reactModule (ref)
	local var1 = useElevationManager()
	local var2 = useOwnerToken()
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref), p2 (ref), var1 (ref)
		local var4 = var2 ~= nil and var2.layer == p1
		
		return if p2.stackAboveOwner then if var2 then if var4 then var1.acquire(p1, { reserve = true, owner = var2 }) else { index = -1, layer = p1, zIndex = var2.zIndex + 1 } else var1.acquire(p1, { reserve = false }) else var1.acquire(p1, { reserve = var4 })
	end, { p1, var2, var1, p2.stackAboveOwner })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), p1 (ref)
		return function()
			-- upvalues: var3 (copy), var1 (copy), p1 (copy)
			if var3.index ~= nil and var3.index >= 0 then
				var1.releaseIfTop(p1, var3.index)
			end
		end
	end, { p1, var3.index })
	
	return var3
end