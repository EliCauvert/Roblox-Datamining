local DataModelTraversalOptionsModule = require(script:FindFirstAncestor("SceneUnderstanding").options.DataModelTraversalOptions)

return function(p1, Callback, p2) --[[ Line: 9 | Named "createLazyInstanceCollector" ]]
	-- upvalues: DataModelTraversalOptionsModule (copy)
	local NewDataModelTraversalOptions = DataModelTraversalOptionsModule.new(p2)
	local Flag = false
	local List = {}
	local Total = 0
	local List1 = {}
	local SpawnedThread = nil
	local List2 = {}
	local t = {}
	
	local function _(): number --[[ Line: 24 | Named "getBatchCount" ]]
		-- upvalues: List2 (copy), NewDataModelTraversalOptions (copy)
		return (math.min(#List2, NewDataModelTraversalOptions.instanceProcessingLimit))
	end
	
	local function onAncestryChanged(Value) --[[ Line: 28 ]]
		-- upvalues: List (copy)
		if Value.Parent == nil then
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end
	
	local function processStack(): boolean --[[ Line: 37 ]]
		-- upvalues: List2 (copy), NewDataModelTraversalOptions (copy), Callback (copy), List (copy), List1 (copy), onAncestryChanged (copy), Total (ref), t (ref), Flag (ref)
		local Smallest = math.min(#List2, NewDataModelTraversalOptions.instanceProcessingLimit)
		
		for _ = 1, Smallest do
			local Removed = table.remove(List2, #List2)
			
			if Removed then
				if not Callback or Callback(Removed) then
					table.insert(List, Removed)
					table.insert(List1, Removed.AncestryChanged:Connect(onAncestryChanged))
				end
				for _, child in Removed:GetChildren() do
					table.insert(List2, child)
				end
			end
		end
		Total += Smallest
		
		for i in t do
			task.spawn(function() --[[ Line: 58 ]]
				-- upvalues: i (copy), List (upval)
				i(List)
			end)
		end
		if #List2 == 0 then
			Flag = false
			
			return false
		elseif NewDataModelTraversalOptions.instanceProcessingLimit <= Total then
			Total = 0
			
			return true
		else
			return false
		end
	end
	
	local _ = function() --[[ Line: 80 | Named "startProcessingLoop" ]]
		-- upvalues: Flag (ref), List2 (copy), NewDataModelTraversalOptions (copy), processStack (copy), SpawnedThread (ref)
		if not Flag and math.min(#List2, NewDataModelTraversalOptions.instanceProcessingLimit) ~= 0 then
			Flag = true
			processStack()
			SpawnedThread = task.spawn(function() --[[ Line: 89 ]]
				-- upvalues: Flag (upval), processStack (upval)
				task.wait()
				while Flag do
					local v1 = processStack()
					
					if Flag and v1 then
						task.wait()
					end
				end
			end)
			
			return
		end
	end
	
	local function onDescendantAdded(Descendant) --[[ Line: 102 ]]
		-- upvalues: List2 (copy), Flag (ref), NewDataModelTraversalOptions (copy), processStack (copy), SpawnedThread (ref)
		table.insert(List2, Descendant)
		
		if not Flag and not Flag then
			if math.min(#List2, NewDataModelTraversalOptions.instanceProcessingLimit) == 0 then return end
			Flag = true
			processStack()
			SpawnedThread = task.spawn(function() --[[ Line: 89 ]]
				-- upvalues: Flag (upval), processStack (upval)
				task.wait()
				while Flag do
					local v1 = processStack()
					
					if Flag and v1 then
						task.wait()
					end
				end
			end)
		end
	end
	
	return {
		setInstancesProcessedPerFrame = function(Value: number) --[[ Line: 143 ]]
			-- upvalues: NewDataModelTraversalOptions (copy), Flag (ref), List2 (copy), processStack (copy), SpawnedThread (ref)
			NewDataModelTraversalOptions.instanceProcessingLimit = math.clamp(Value, 0, 1e999)
			
			if not Flag then
				if math.min(#List2, NewDataModelTraversalOptions.instanceProcessingLimit) == 0 then return end
				Flag = true
				processStack()
				SpawnedThread = task.spawn(function() --[[ Line: 89 ]]
					-- upvalues: Flag (upval), processStack (upval)
					task.wait()
					while Flag do
						local v1 = processStack()
						
						if Flag and v1 then
							task.wait()
						end
					end
				end)
			end
		end,
		listen = function() --[[ Line: 110 ]]
			-- upvalues: p1 (copy), List1 (copy), onDescendantAdded (copy), List2 (copy), Flag (ref), NewDataModelTraversalOptions (copy), processStack (copy), SpawnedThread (ref)
			for _, value in p1 do
				table.insert(List1, value.DescendantAdded:Connect(onDescendantAdded))
				
				for _, child in value:GetChildren() do
					table.insert(List2, child)
				end
			end
			if not Flag then
				if math.min(#List2, NewDataModelTraversalOptions.instanceProcessingLimit) == 0 then return end
				Flag = true
				processStack()
				SpawnedThread = task.spawn(function() --[[ Line: 89 ]]
					-- upvalues: Flag (upval), processStack (upval)
					task.wait()
					while Flag do
						local v1 = processStack()
						
						if Flag and v1 then
							task.wait()
						end
					end
				end)
			end
		end,
		get = function() --[[ Line: 148 ]]
			-- upvalues: List (copy)
			return List
		end,
		destroy = function() --[[ Line: 129 ]]
			-- upvalues: Flag (ref), List1 (copy), t (ref), SpawnedThread (ref)
			Flag = false
			
			for _, Connection in List1 do
				Connection:Disconnect()
			end
			t = {}
			
			if SpawnedThread then
				task.cancel(SpawnedThread)
			end
		end,
		onStepped = function(Key) --[[ Line: 122 ]]
			-- upvalues: t (ref)
			t[Key] = true
			
			return function() --[[ Line: 124 ]]
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
			end
		end
	}
end