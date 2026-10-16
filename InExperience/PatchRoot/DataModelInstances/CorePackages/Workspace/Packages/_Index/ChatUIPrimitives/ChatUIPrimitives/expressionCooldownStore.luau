local Signal, Signal2 = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Signals).createSignal({})

local function _(Key, p1) --[[ Line: 38 | Named "setDeadline" ]]
	-- upvalues: Signal (copy), Signal2 (copy)
	local Copy = table.clone(Signal(false))
	
	if p1 == nil then
		Copy[Key] = nil
	else
		Copy[Key] = p1
	end
	Signal2(Copy)
end

return {
	getCooldownEndsAtByKey = Signal,
	getCooldownEndsAt = function(p1) --[[ Line: 33 ]]
		-- upvalues: Signal (copy)
		return Signal(false)[p1]
	end,
	startCooldown = function(Key, p1) --[[ Line: 50 ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local Copy = table.clone(Signal(false))
		
		if p1 == nil then
			Copy[Key] = nil
		else
			Copy[Key] = p1
		end
		Signal2(Copy)
		task.delay(math.max(0, p1 - os.clock()), function() --[[ Line: 52 ]]
			-- upvalues: Key (copy), Signal (upval), p1 (copy), Signal2 (upval)
			if Signal(false)[Key] == p1 then
				local Copy = table.clone(Signal(false))
				Copy[Key] = nil
				Signal2(Copy)
			end
		end)
	end,
	clearCooldown = function(Key) --[[ Line: 59 ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local Copy = table.clone(Signal(false))
		Copy[Key] = nil
		Signal2(Copy)
	end,
	_resetForTesting = function() --[[ Line: 65 ]]
		-- upvalues: Signal2 (copy)
		Signal2({})
	end
}