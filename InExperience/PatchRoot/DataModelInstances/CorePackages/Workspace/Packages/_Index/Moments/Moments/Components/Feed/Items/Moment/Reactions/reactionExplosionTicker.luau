local runService = game:GetService("RunService")

local function createTicker(p0)
	-- upvalues: runService (ref)
	local var2 = if p0 ~= nil then nil else p0.stepSignal
	local var3 = (if p0 ~= nil then nil else p0.clock) or os.clock
	local t = {}
	local var5 = nil
	
	local function step(p1)
		-- upvalues: var3 (ref), t (ref)
		p1 = p1 or var3()
		
		for i, v in table.clone(t) do
			v(p1)
		end
	end
	
	local function _()
		-- upvalues: var5 (write), t (ref), var2 (ref), runService (copy), var3 (ref)
		if var5 == nil and #t ~= 0 then
			var5 = (var2 or runService.PreRender):Connect(function()
				-- upvalues: var3 (copy), t (copy)
				local var8 = var3()
				
				for i, v in table.clone(t) do
					v(var8)
				end
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var5 (write), t (ref)
		if var5 ~= nil and #t == 0 then
			var5:Disconnect()
			var5 = nil
		end
	end
	
	return {
		add = function(p2)
			-- upvalues: t (ref), var5 (write), var2 (ref), runService (copy), var3 (ref)
			table.insert(t, p2)
			
			if var5 == nil and #t ~= 0 then
				var5 = (var2 or runService.PreRender):Connect(function()
					-- upvalues: var3 (copy), t (copy)
					local var8 = var3()
					
					for i, v in table.clone(t) do
						v(var8)
					end
				end)
			end
			local var9 = false
			
			return function()
				-- upvalues: var9 (write), t (copy), p2 (ref), var5 (copy)
				if var9 then return end
				var9 = true
				local index = table.find(t, p2)
				
				if index ~= nil then
					table.remove(t, index)
				end
				if var5 ~= nil and #t == 0 then
					var5:Disconnect()
					var5 = nil
				end
			end
		end,
		step = step,
		getActiveCount = function()
			-- upvalues: t (ref)
			return #t
		end,
		isConnected = function()
			-- upvalues: var5 (write)
			return var5 ~= nil
		end
	}
end

return { createTicker = createTicker, shared = createTicker() }