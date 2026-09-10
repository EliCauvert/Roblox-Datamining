local var1, var2 = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Signals).createSignal({})

local function _(value, p1)
	-- upvalues: var1 (ref), var2 (ref)
	local cloned = table.clone(var1(false))
	
	if p1 == nil then
		cloned[value] = nil
	else
		cloned[value] = p1
	end
	var2(cloned)
end

return {
	getCooldownEndsAtByKey = var1,
	getCooldownEndsAt = function(p1)
		-- upvalues: var1 (ref)
		return var1(false)[p1]
	end,
	startCooldown = function(p1, p2)
		-- upvalues: var1 (ref), var2 (ref)
		local cloned = table.clone(var1(false))
		
		if p2 == nil then
			cloned[p1] = nil
		else
			cloned[p1] = p2
		end
		var2(cloned)
		task.delay(math.max(0, p2 - os.clock()), function()
			-- upvalues: p1 (ref), var1 (copy), p2 (ref), var2 (copy)
			if var1(false)[p1] == p2 then
				local cloned = table.clone(var1(false))
				cloned[p1] = nil
				var2(cloned)
			end
		end)
	end,
	clearCooldown = function(p1)
		-- upvalues: var1 (ref), var2 (ref)
		local cloned = table.clone(var1(false))
		cloned[p1] = nil
		var2(cloned)
	end,
	_resetForTesting = function()
		-- upvalues: var2 (ref)
		var2({})
	end
}