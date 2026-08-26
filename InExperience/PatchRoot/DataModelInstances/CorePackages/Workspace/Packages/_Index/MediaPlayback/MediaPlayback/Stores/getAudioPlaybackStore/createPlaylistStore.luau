local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local createSignal = require(mediaPlayback.Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	
	local function _(p1, p2)
		-- upvalues: var3 (ref), var1 (ref)
		local var5 = var3(false)[tostring(p1)]
		
		return if var5 then var1(false)[var5 + p2] else nil
	end
	
	return {
		get = var1,
		set = function(value)
			-- upvalues: var2 (ref), var4 (ref)
			var2(value)
			local t = {}
			
			for i, v in value do
				t[tostring(v)] = i
			end
			var4(t)
		end,
		getNext = function(p1)
			-- upvalues: var3 (ref), var1 (ref)
			local var5 = var3(false)[tostring(p1)]
			
			return if var5 then var1(false)[var5 + 1] else nil
		end,
		getPrev = function(p1)
			-- upvalues: var3 (ref), var1 (ref)
			local var5 = var3(false)[tostring(p1)]
			
			return if var5 then var1(false)[var5 + -1] else nil
		end
	}
end