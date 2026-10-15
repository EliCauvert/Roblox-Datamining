local _ = require(script:FindFirstAncestor("Moments").Parent.ViewRecycler)

return function(p1)
	local schedule = p1.schedule or function(p2)
		task.defer(p2)
	end
	local t = {}
	local var1 = nil
	local var2 = false
	local var3 = false
	
	local function reveal()
		-- upvalues: var2 (write), p1 (ref)
		if var2 then
			return
		end
		var2 = true
		p1.onReady()
	end
	
	local function isVisibleRangeMeasured()
		-- upvalues: var1 (write), p1 (ref), t (ref)
		if var1 == nil or var1.lastIndex < var1.firstIndex then
			return false
		end
		for i = var1.firstIndex, var1.lastIndex do
			local itemKey = p1.getItemKey(i)
			
			if itemKey ~= nil and t[itemKey] then
				continue
			end
			return false
		end
		return true
	end
	
	local function check()
		-- upvalues: var3 (write), var2 (write), isVisibleRangeMeasured (ref), p1 (ref)
		var3 = false
		
		if not var2 and isVisibleRangeMeasured() then
			if var2 then return end
			var2 = true
			p1.onReady()
		end
	end
	
	local function _()
		-- upvalues: var2 (write), var3 (write), schedule (ref), check (ref)
		if var2 or var3 then
			return
		end
		var3 = true
		schedule(check)
	end
	
	local layout = p1.layout
	local updateItemMeasurement = layout.updateItemMeasurement
	
	function layout.updateItemMeasurement(p2)
		-- upvalues: updateItemMeasurement (ref), var2 (write), t (ref), var3 (write), schedule (ref), check (ref)
		local var4 = updateItemMeasurement(p2)
		
		if var4.accepted and not var2 then
			t[p2.itemKey] = true
			
			if not var2 then
				if var3 then
					return var4
				end
				var3 = true
				schedule(check)
			end
		end
		return var4
	end
	
	return {
		onVisibleRangeChanged = function(p2)
			-- upvalues: var1 (write), var2 (write), var3 (write), schedule (ref), check (ref)
			var1 = p2
			
			if not var2 then
				if var3 then return end
				var3 = true
				schedule(check)
			end
		end,
		reveal = reveal,
		destroy = function()
			-- upvalues: var2 (write)
			var2 = true
		end
	}
end