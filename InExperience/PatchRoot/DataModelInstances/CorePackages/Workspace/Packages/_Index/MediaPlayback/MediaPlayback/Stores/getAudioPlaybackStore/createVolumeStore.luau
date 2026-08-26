local signalsModule = require(script:FindFirstAncestor("MediaPlayback").Parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref)
	local var1, var2 = createSignal(1)
	local var3, var4 = createSignal(var1(false))
	local var5 = createComputed(function(p1)
		-- upvalues: var1 (ref)
		return var1(p1) <= 0
	end)
	
	return {
		getVolume = var1,
		setVolume = function(value)
			-- upvalues: var2 (ref)
			var2(math.clamp(value, 0, 1))
		end,
		getIsMuted = var5,
		mute = function()
			-- upvalues: var5 (ref), var4 (ref), var1 (ref), var2 (ref)
			if not var5(false) then
				var4(var1(false))
				var2(0)
			end
		end,
		unmute = function()
			-- upvalues: var5 (ref), var2 (ref), var3 (ref)
			if var5(false) then
				var2(var3(false))
			end
		end
	}
end