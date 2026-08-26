local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local signal = wrappersModule.Signal
local connection = wrappersModule.Connection

local function findLayerCollector(p1)
	return if p1 then p1:FindFirstAncestorWhichIsA("LayerCollector") else nil
end

return function(p1)
	-- upvalues: reactModule (ref), findLayerCollector (ref), signal (ref), connection (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), findLayerCollector (copy), p1 (ref)
		var2(findLayerCollector(p1))
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), signal (copy), connection (copy)
		if p1 then
			var3()
			local var4 = signal.Connect(p1.AncestryChanged, var3)
			
			return function()
				-- upvalues: connection (copy), var4 (ref)
				connection.Disconnect(var4)
			end
		end
		return nil
	end, { p1 })
	
	return var1
end