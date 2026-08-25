local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local cryoModule = require(mediaPlayback.Parent.Cryo)
local signalsModule = require(mediaPlayback.Parent.Signals)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var3, var4 = signalsModule.createSignal({})
	
	return {
		subscribe = function(p0)
			-- upvalues: var4 (ref), cryoModule (copy)
			var4(function(p1)
				-- upvalues: p0 (ref), cryoModule (copy)
				return cryoModule.Dictionary.join(p1, { [p0] = (p1[p0] or 0) + 1 })
			end)
		end,
		unsubscribe = function(p2)
			-- upvalues: var4 (ref), cryoModule (copy)
			local var5 = nil
			var4(function(p3)
				-- upvalues: p2 (ref), var5 (write), cryoModule (copy)
				var5 = math.max(0, (p3[p2] or 0) - 1)
				
				return cryoModule.Dictionary.join(p3, { [p2] = if var5 > 0 then var5 else cryoModule.None })
			end)
			
			return var5
		end,
		getConsumerCounts = var3
	}
end