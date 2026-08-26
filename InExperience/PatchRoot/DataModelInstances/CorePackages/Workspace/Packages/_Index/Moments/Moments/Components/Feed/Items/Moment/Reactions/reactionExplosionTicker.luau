local runService = game:GetService("RunService")

local function createTicker(p1)
	-- upvalues: runService (ref)
	local var1 = if p1 ~= nil then nil else p1.stepSignal
	local var2 = (if p1 ~= nil then nil else p1.clock) or os.clock
	local t = {}
	local var3 = nil
	
	local function step(p2)
		-- upvalues: var2 (ref), t (ref)
		p2 = p2 or var2()
		
		for i, v in table.clone(t) do
			v(p2)
		end
	end
	
	local function _()
		-- upvalues: var3 (write), t (ref), var1 (ref), runService (copy), var2 (ref)
		if var3 == nil and #t ~= 0 then
			var3 = (var1 or runService.PreRender):Connect(function()
				-- upvalues: var2 (copy), t (copy)
				local var4 = var2()
				
				for i, v in table.clone(t) do
					v(var4)
				end
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var3 (write), t (ref)
		if var3 ~= nil and #t == 0 then
			var3:Disconnect()
			var3 = nil
		end
	end
	
	return {
		add = function(p3)
			-- upvalues: t (ref), var3 (write), var1 (ref), runService (copy), var2 (ref)
			table.insert(t, p3)
			
			if var3 == nil and #t ~= 0 then
				var3 = (var1 or runService.PreRender):Connect(function()
					-- upvalues: var2 (copy), t (copy)
					local var4 = var2()
					
					for i, v in table.clone(t) do
						v(var4)
					end
				end)
			end
			local var4 = false
			
			return function()
				-- upvalues: var4 (write), t (copy), p3 (ref), var3 (copy)
				if var4 then return end
				var4 = true
				local index = table.find(t, p3)
				
				if index ~= nil then
					table.remove(t, index)
				end
				if var3 ~= nil and #t == 0 then
					var3:Disconnect()
					var3 = nil
				end
			end
		end,
		step = step,
		getActiveCount = function()
			-- upvalues: t (ref)
			return #t
		end,
		isConnected = function()
			-- upvalues: var3 (write)
			return var3 ~= nil
		end
	}
end

return { createTicker = createTicker, shared = createTicker() }