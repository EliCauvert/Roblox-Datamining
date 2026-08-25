local dataModelTraversalOptionsModule = require(script:FindFirstAncestor("SceneUnderstanding").options.DataModelTraversalOptions)

return function(p0, p1, p2)
	-- upvalues: dataModelTraversalOptionsModule (ref)
	local var1 = dataModelTraversalOptionsModule.new(p2)
	local var2 = false
	local t = {}
	local var4 = 0
	local t_1 = {}
	local var6 = nil
	local t_2 = {}
	local t_3 = {}
	
	local function _()
		-- upvalues: t_2 (ref), var1 (ref)
		return math.min(#t_2, var1.instanceProcessingLimit)
	end
	
	local function onAncestryChanged(p3)
		-- upvalues: t (ref)
		if p3.Parent == nil then
			local index = table.find(t, p3)
			
			if index then
				table.remove(t, index)
			end
		end
	end
	
	local function processStack()
		-- upvalues: t_2 (ref), var1 (ref), p1 (ref), t (ref), t_1 (ref), onAncestryChanged (ref), var4 (write), t_3 (write), var2 (write)
		local removed
		local minValue = math.min(#t_2, var1.instanceProcessingLimit)
		
		for _ = 1, minValue do
			removed = table.remove(t_2, #t_2)
			
			if not removed then
				continue
			end
			if not p1 or p1(removed) then
				table.insert(t, removed)
				table.insert(t_1, removed.AncestryChanged:Connect(onAncestryChanged))
			end
			for i, v in removed:GetChildren() do
				table.insert(t_2, v)
			end
		end
		var4 += minValue
		
		for removed in t_3 do
			task.spawn(function()
				-- upvalues: removed (ref), t (copy)
				removed(t)
			end)
		end
		if #t_2 == 0 then
			var2 = false
			
			return false
		elseif var1.instanceProcessingLimit <= var4 then
			var4 = 0
			
			return true
		end
		return false
	end
	
	local _ = function()
		-- upvalues: var2 (write), t_2 (ref), var1 (ref), processStack (ref), var6 (write)
		if var2 or math.min(#t_2, var1.instanceProcessingLimit) == 0 then
			return
		end
		var2 = true
		processStack()
		var6 = task.spawn(function()
			-- upvalues: var2 (copy), processStack (copy)
			task.wait()
			while var2 do
				if var2 and processStack() then
					task.wait()
				end
			end
		end)
	end
	
	local function onDescendantAdded(p4)
		-- upvalues: t_2 (ref), var2 (write), var1 (ref), processStack (ref), var6 (write)
		table.insert(t_2, p4)
		
		if not var2 and not var2 then
			if math.min(#t_2, var1.instanceProcessingLimit) == 0 then return end
			var2 = true
			processStack()
			var6 = task.spawn(function()
				-- upvalues: var2 (copy), processStack (copy)
				task.wait()
				while true do
					while var2 do
						if var2 and processStack() then
							task.wait()
						end
					end
				end
			end)
		end
	end
	
	return {
		setInstancesProcessedPerFrame = function(value)
			-- upvalues: var1 (ref), var2 (write), t_2 (ref), processStack (ref), var6 (write)
			var1.instanceProcessingLimit = math.clamp(value, 0, 1e999)
			
			if not var2 then
				if math.min(#t_2, var1.instanceProcessingLimit) == 0 then return end
				var2 = true
				processStack()
				var6 = task.spawn(function()
					-- upvalues: var2 (copy), processStack (copy)
					task.wait()
					while true do
						while var2 do
							if var2 and processStack() then
								task.wait()
							end
						end
					end
				end)
			end
		end,
		listen = function()
			-- upvalues: p0 (ref), t_1 (ref), onDescendantAdded (ref), t_2 (ref), var2 (write), var1 (ref), processStack (ref), var6 (write)
			for i, v in p0 do
				table.insert(t_1, v.DescendantAdded:Connect(onDescendantAdded))
				
				for i_1, v_1 in v:GetChildren() do
					table.insert(t_2, v_1)
				end
			end
			if not var2 then
				if math.min(#t_2, var1.instanceProcessingLimit) == 0 then return end
				var2 = true
				processStack()
				var6 = task.spawn(function()
					-- upvalues: var2 (copy), processStack (copy)
					task.wait()
					while true do
						while var2 do
							if var2 and processStack() then
								task.wait()
							end
						end
					end
				end)
			end
		end,
		get = function()
			-- upvalues: t (ref)
			return t
		end,
		destroy = function()
			-- upvalues: var2 (write), t_1 (ref), t_3 (write), var6 (write)
			var2 = false
			
			for i, v in t_1 do
				v:Disconnect()
			end
			t_3 = {}
			
			if var6 then
				task.cancel(var6)
			end
		end,
		onStepped = function(p5)
			-- upvalues: t_3 (write)
			t_3[p5] = true
			
			return function()
				-- upvalues: t_3 (copy), p5 (ref)
				t_3[p5] = nil
			end
		end
	}
end