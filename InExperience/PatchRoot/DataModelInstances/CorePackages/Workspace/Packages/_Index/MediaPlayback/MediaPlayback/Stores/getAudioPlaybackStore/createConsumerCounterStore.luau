local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local cryoModule = require(mediaPlayback.Parent.Cryo)
local signalsModule = require(mediaPlayback.Parent.Signals)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		subscribe = function(p1)
			-- upvalues: var2 (ref), cryoModule (copy)
			var2(function(p2)
				-- upvalues: p1 (ref), cryoModule (copy)
				return cryoModule.Dictionary.join(p2, { [p1] = (p2[p1] or 0) + 1 })
			end)
		end,
		unsubscribe = function(p1)
			-- upvalues: var2 (ref), cryoModule (copy)
			local var3 = nil
			var2(function(p2)
				-- upvalues: p1 (ref), var3 (write), cryoModule (copy)
				var3 = math.max(0, (p2[p1] or 0) - 1)
				
				return cryoModule.Dictionary.join(p2, { [p1] = if var3 > 0 then var3 else cryoModule.None })
			end)
			
			return var3
		end,
		getConsumerCounts = var1
	}
end