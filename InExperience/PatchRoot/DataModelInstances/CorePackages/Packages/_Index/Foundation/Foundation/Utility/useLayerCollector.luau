local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local signal = wrappersModule.Signal
local connection = wrappersModule.Connection

local function findLayerCollector(p0)
	return if p0 then p0:FindFirstAncestorWhichIsA("LayerCollector") else nil
end

return function(p1)
	-- upvalues: reactModule (ref), findLayerCollector (ref), signal (ref), connection (ref)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), findLayerCollector (copy), p1 (ref)
		var5(findLayerCollector(p1))
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), signal (copy), connection (copy)
		if p1 then
			var6()
			local var7 = signal.Connect(p1.AncestryChanged, var6)
			
			return function()
				-- upvalues: connection (copy), var7 (ref)
				connection.Disconnect(var7)
			end
		end
		return nil
	end, { p1 })
	
	return var4
end