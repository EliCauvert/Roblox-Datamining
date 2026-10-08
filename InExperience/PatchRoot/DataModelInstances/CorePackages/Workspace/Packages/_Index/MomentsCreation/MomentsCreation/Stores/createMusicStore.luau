local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local signalsModule = require(momentsCreation.Parent.Signals)
local createMusicSourceModule = require(momentsCreation.Stores.createMusicSource)
local fFlagMomentsCreationMusicPickerPaginationModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicPickerPagination)
local getFFlagMomentsCreationMusicSearchStateFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationMusicSearchStateFix)
local _ = require(momentsCreation.Types.Music)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function(p1)
	-- upvalues: createMusicSourceModule (ref), createSignal (ref), createComputed (ref), fFlagMomentsCreationMusicPickerPaginationModule (ref), getFFlagMomentsCreationMusicSearchStateFixModule (ref)
	p1 = p1 or createMusicSourceModule()
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal("idle")
	local var7, var8 = createSignal(false)
	local var9, var10 = createSignal(false)
	local var11 = 0
	local t = {}
	local var12 = ""
	local var13 = nil
	local var14 = nil
	local var15 = createComputed(function(p2)
		-- upvalues: var1 (ref), var3 (ref)
		local var16 = var1(p2)
		local t = {}
		
		for i, v in var3(p2) do
			local var17 = var16[v]
			
			if var17 ~= nil then
				table.insert(t, var17)
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
	
	local _ = function(value)
		-- upvalues: var14 (write), var8 (ref), var10 (ref)
		var14 = value
		var8(value ~= nil and not value.isFinished())
		var10(false)
	end
	
	local function search(p5, p6)
		-- upvalues: var12 (write), var13 (write), fFlagMomentsCreationMusicPickerPaginationModule (copy), var14 (write), var8 (ref), var10 (ref), getFFlagMomentsCreationMusicSearchStateFixModule (copy), p1 (ref), var1 (ref), var2 (ref), var4 (ref), var11 (write), var6 (ref)
		var12 = p5
		var13 = p6
		
		if fFlagMomentsCreationMusicPickerPaginationModule then
			var14 = nil
			var8(false)
			var10(false)
		end
		if getFFlagMomentsCreationMusicSearchStateFixModule() then
			var11 += 1
			local var18 = var11
			var6("loading")
			var4({})
			task.spawn(function()
				-- upvalues: p1 (copy), p5 (ref), p6 (ref), var18 (ref), var11 (copy), var6 (copy), var1 (copy), var2 (copy), var4 (copy), fFlagMomentsCreationMusicPickerPaginationModule (copy), var14 (copy), var8 (copy), var10 (copy)
				local ok, status, var19 = pcall(p1.searchMusic, p5, p6 or 30)
				
				if var18 ~= var11 then return end
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
				
				if fFlagMomentsCreationMusicPickerPaginationModule then
					var14 = var19
					var8(var19 ~= nil and not var19.isFinished())
					var10(false)
				end
				var6("success")
			end)
			
			return
		end
		task.spawn(function()
			-- upvalues: p1 (copy), p5 (ref), p6 (ref), var1 (copy), var2 (copy), var4 (copy), fFlagMomentsCreationMusicPickerPaginationModule (copy), var14 (copy), var8 (copy), var10 (copy)
			local ok, status, var20 = pcall(p1.searchMusic, p5, p6 or 30)
			
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
			
			if fFlagMomentsCreationMusicPickerPaginationModule then
				var14 = var20
				var8(var20 ~= nil and not var20.isFinished())
				var10(false)
			end
		end)
	end
	
	return {
		getInfoMap = var1,
		getResults = var15,
		getSearchStatus = var5,
		search = search,
		retry = function()
			-- upvalues: search (ref), var12 (write), var13 (write)
			search(var12, var13)
		end,
		getHasMore = var7,
		getIsLoadingMore = var9,
		loadMore = function()
			-- upvalues: var14 (write), var7 (ref), var9 (ref), var10 (ref), var8 (ref), var1 (ref), var2 (ref), var3 (ref), var4 (ref)
			if var14 == nil or not var7(false) or var9(false) then
				return
			end
			var10(true)
			task.spawn(function()
				-- upvalues: var14 (ref), var14 (copy), var8 (copy), var10 (copy), var1 (copy), var2 (copy), var3 (copy), var4 (copy)
				local ok, status = pcall(var14.nextPage)
				
				if var14 ~= var14 then return end
				if not ok then
					var14 = nil
					var8(false)
					var10(false)
					
					return
				elseif #status ~= 0 then
					local cloned = table.clone(var1(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var2(cloned)
				end
				local cloned = table.clone(var3(false))
				local t = {}
				
				for i, v in cloned do
					t[v] = true
				end
				for i_1, v_1 in status do
					if not t[v_1.AssetId] then
						t[v_1.AssetId] = true
						table.insert(cloned, v_1.AssetId)
					end
				end
				var4(cloned)
				var14 = var14
				var8(var14 ~= nil and not var14.isFinished())
				var10(false)
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