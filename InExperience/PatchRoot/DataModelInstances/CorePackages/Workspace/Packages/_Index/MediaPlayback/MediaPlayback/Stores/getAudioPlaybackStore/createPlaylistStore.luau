local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local createSignal = require(mediaPlayback.Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	
	local function _(p0, p1)
		-- upvalues: var3 (ref), var1 (ref)
		local var5 = var3(false)[tostring(p0)]
		
		return if var5 then var1(false)[var5 + p1] else nil
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
		getNext = function(p2)
			-- upvalues: var3 (ref), var1 (ref)
			local var7 = var3(false)[tostring(p2)]
			
			return if var7 then var1(false)[var7 + 1] else nil
		end,
		getPrev = function(p3)
			-- upvalues: var3 (ref), var1 (ref)
			local var8 = var3(false)[tostring(p3)]
			
			return if var8 then var1(false)[var8 + -1] else nil
		end
	}
end