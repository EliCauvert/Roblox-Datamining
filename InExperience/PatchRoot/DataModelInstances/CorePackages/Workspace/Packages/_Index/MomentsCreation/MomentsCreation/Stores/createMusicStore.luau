local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local signalsModule = require(momentsCreation.Parent.Signals)
local createMusicSourceModule = require(momentsCreation.Stores.createMusicSource)
local getFFlagMomentsCreationMusicSearchStateFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationMusicSearchStateFix)
local _ = require(momentsCreation.Types.Music)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function(p1)
	-- upvalues: createMusicSourceModule (ref), createSignal (ref), createComputed (ref), getFFlagMomentsCreationMusicSearchStateFixModule (ref)
	p1 = p1 or createMusicSourceModule()
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal("idle")
	local var7 = 0
	local t = {}
	local var8 = createComputed(function(p2)
		-- upvalues: var1 (ref), var3 (ref)
		local var9 = var1(p2)
		local t = {}
		
		for i, v in var3(p2) do
			local var10 = var9[v]
			
			if var10 ~= nil then
				table.insert(t, var10)
			end
		end
		return t
	end)
	
	local function _(p3)
		-- upvalues: var1 (ref), var2 (ref)
		if #p3 == 0 then return end
		local cloned = table.clone(var1(false))
		
		for i, v in p3 do
			cloned[v.AssetId] = v
		end
		var2(cloned)
	end
	
	local _ = function(p4)
		local t = {}
		
		for i, v in p4 do
			table.insert(t, v.AssetId)
		end
		return t
	end
	
	return {
		getInfoMap = var1,
		getResults = var8,
		getSearchStatus = var5,
		search = function(p5, p6)
			-- upvalues: getFFlagMomentsCreationMusicSearchStateFixModule (copy), p1 (ref), var1 (ref), var2 (ref), var4 (ref), var7 (write), var6 (ref)
			if getFFlagMomentsCreationMusicSearchStateFixModule() then
				var7 += 1
				local var11 = var7
				var6("loading")
				var4({})
				task.spawn(function()
					-- upvalues: p1 (copy), p5 (ref), p6 (ref), var11 (ref), var7 (copy), var6 (copy), var1 (copy), var2 (copy), var4 (copy)
					local ok, status = pcall(p1.searchMusic, p5, p6 or 30)
					
					if var11 ~= var7 then return end
					if not ok then
						var6("error")
						
						return
					elseif #status ~= 0 then
						local cloned = table.clone(var1(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var2(cloned)
					end
					local t = {}
					
					for i, v in status do
						table.insert(t, v.AssetId)
					end
					var4(t)
					var6("success")
				end)
				
				return
			end
			task.spawn(function()
				-- upvalues: p1 (copy), p5 (ref), p6 (ref), var1 (copy), var2 (copy), var4 (copy)
				local ok, status = pcall(p1.searchMusic, p5, p6 or 30)
				
				if not ok then return end
				if #status ~= 0 then
					local cloned = table.clone(var1(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var2(cloned)
				end
				local t = {}
				
				for i, v in status do
					table.insert(t, v.AssetId)
				end
				var4(t)
			end)
		end,
		fetchInfo = function(p7)
			-- upvalues: var1 (ref), getFFlagMomentsCreationMusicSearchStateFixModule (copy), t (ref), p1 (ref), var2 (ref)
			if var1(false)[p7] ~= nil then return end
			if not getFFlagMomentsCreationMusicSearchStateFixModule() then
				task.spawn(function()
					-- upvalues: p1 (copy), p7 (ref), var1 (copy), var2 (copy)
					local ok, status = pcall(p1.getMetadata, { p7 })
					
					if ok then
						if #status == 0 then return end
						local cloned = table.clone(var1(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var2(cloned)
					end
				end)
				
				return
			elseif t[p7] then
				return
			end
			t[p7] = true
			task.spawn(function()
				-- upvalues: p1 (copy), p7 (ref), t (copy), var1 (copy), var2 (copy)
				local ok, status = pcall(p1.getMetadata, { p7 })
				t[p7] = nil
				
				if ok then
					if #status == 0 then return end
					local cloned = table.clone(var1(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var2(cloned)
				end
			end)
		end
	}
end