local diagnosticsModule = require(script:FindFirstAncestor("ViewRecycler").Core.Diagnostics)
local frozen = table.freeze({})

local function _(a)
	return if a ~= nil then a >= 0 and a % 1 == 0 else true
end

local _ = function(p1, p2, p3, p4, p5, p6)
	table.insert(p1, {
		p2,
		p3,
		p4,
		p5,
		p6
	})
end

return function(p1)
	-- upvalues: frozen (ref), diagnosticsModule (ref)
	local maxPoolSize = p1.maxPoolSize
	assert(if maxPoolSize ~= nil then maxPoolSize >= 0 and maxPoolSize % 1 == 0 else true, "RecyclingScope: maxPoolSize must be a non-negative integer")
	local adapter = p1.adapter
	local maxPoolSize_1 = p1.maxPoolSize
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = 1
	local var2 = 1
	local var3 = false
	local var4 = false
	local batch = adapter.batch or function(p2)
		p2()
	end
	
	local function poolFor(p2)
		-- upvalues: t (ref)
		local var5 = t[p2]
		
		if var5 == nil then
			var5 = { first = 1, last = 0, viewType = p2, items = {} }
			t[p2] = var5
		end
		return var5
	end
	
	local function _(p2)
		-- upvalues: t_1 (ref), t_2 (ref)
		local var5 = t_1[p2]
		local t_2Count = #t_2
		local var6 = t_2[t_2Count]
		
		if var5.inventoryIndex ~= t_2Count then
			t_2[var5.inventoryIndex] = var6
			t_1[var6].inventoryIndex = var5.inventoryIndex
		end
		t_2[t_2Count] = nil
		t_1[p2] = nil
	end
	
	local function notify(p2, p3, p4, p5, p6)
		-- upvalues: p1 (ref)
		if p1.onPoolChanged ~= nil then
			p1.onPoolChanged({
				action = p2,
				viewType = p3,
				occupiedDelta = p4,
				vacantDelta = p5,
				totalDelta = p6
			})
		end
	end
	
	local function evictExcess()
		-- upvalues: t (ref), maxPoolSize_1 (write), t_1 (ref), t_2 (ref), diagnosticsModule (copy), p1 (ref), adapter (ref)
		local t_3 = {}
		local t_4 = {}
		
		for i, v in t do
			while maxPoolSize_1 ~= nil and maxPoolSize_1 < v.last - v.first + 1 do
				local first = v.items[v.first]
				v.items[v.first] = nil
				v.first += 1
				local var5 = t_1[first]
				local t_2Count = #t_2
				local var6 = t_2[t_2Count]
				
				if var5.inventoryIndex ~= t_2Count then
					t_2[var5.inventoryIndex] = var6
					t_1[var6].inventoryIndex = var5.inventoryIndex
				end
				t_2[t_2Count] = nil
				t_1[first] = nil
				table.insert(t_3, first)
				table.insert(t_4, { v.viewType })
			end
		end
		for i, v_1 in t_4 do
			local evict = diagnosticsModule.PoolAction.Evict
			local var7 = v_1[1]
			
			if p1.onPoolChanged ~= nil then
				p1.onPoolChanged({
					occupiedDelta = 0,
					vacantDelta = -1,
					totalDelta = -1,
					action = evict,
					viewType = var7
				})
			end
		end
		for i, v_2 in t_3 do
			adapter.destroy(v_2)
		end
	end
	
	return {
		exchange = function(p2, p3, p4)
			-- upvalues: var3 (write), var4 (write), var2 (write), t_1 (ref), p1 (ref), frozen (copy), t (ref), maxPoolSize_1 (write), t_2 (ref), batch (ref), adapter (ref), diagnosticsModule (copy), poolFor (ref), var1 (write)
			assert(not var3, "RecyclingScope: cannot exchange after destruction")
			assert(not var4, "RecyclingScope: cannot mutate during an exchange")
			assert(p2 ~= nil, "RecyclingScope: exchange requires an owner")
			var2 += 1
			local var8 = if #p4 == 0 then nil else {}
			
			for i, v in p3 do
				local record = t_1[v.record]
				assert(record ~= nil and (record.owner == p2 and record.leaseToken == v.leaseToken), "RecyclingScope: cannot use a stale Lease")
				assert(record.validationToken ~= var2, "RecyclingScope: cannot release one Lease more than once")
				record.validationToken = var2
			end
			if #p4 == 0 and p1.onPoolChanged == nil then
				local t_3 = { acquired = frozen, releasedCount = #p3 }
				local t_4 = {}
				var4 = true
				
				for i_1, v_1 in p3 do
					local record = t_1[v_1.record]
					record.owner = nil
					record.leaseToken = nil
					record.pool.last += 1
					record.pool.items[record.pool.last] = v_1.record
				end
				for i_2, v_2 in t do
					while maxPoolSize_1 ~= nil and maxPoolSize_1 < v_2.last - v_2.first + 1 do
						local first = v_2.items[v_2.first]
						v_2.items[v_2.first] = nil
						v_2.first += 1
						local var9 = t_1[first]
						local t_2Count = #t_2
						local var10 = t_2[t_2Count]
						
						if var9.inventoryIndex ~= t_2Count then
							t_2[var9.inventoryIndex] = var10
							t_1[var10].inventoryIndex = var9.inventoryIndex
						end
						t_2[t_2Count] = nil
						t_1[first] = nil
						table.insert(t_4, first)
					end
				end
				var4 = false
				batch(function()
					-- upvalues: t_4 (ref), adapter (copy)
					for i, v in t_4 do
						adapter.destroy(v)
					end
				end)
				
				return t_3
			else
				var4 = true
				local t_3 = {}
				
				for i_1, v_1 in t do
					t_3[i_1] = v_1.last - v_1.first + 1
				end
				local var11 = if #p3 == 0 then nil else {}
				
				if var11 ~= nil then
					for i_2, v_2 in p3 do
						local record = t_1[v_2.record]
						local viewType = var11[record.viewType]
						
						if viewType == nil then
							viewType = {}
							var11[record.viewType] = viewType
						end
						table.insert(viewType, v_2.record)
					end
				end
				local t_4 = {}
				local var12 = if var11 == nil then nil else {}
				local var13 = if var12 == nil then frozen else {}
				local ok, status = pcall(function()
					-- upvalues: p4 (ref), var11 (ref), var12 (ref), var13 (ref), t_3 (ref), adapter (copy), t_1 (copy), var8 (ref), t_4 (ref)
					for i, v in p4 do
						local var14 = if var11 == nil then nil else var11[v.viewType]
						local var15 = if var14 == nil then nil else table.remove(var14)
						
						if var15 == nil then
							local viewType = t_3[v.viewType] or 0
							
							if viewType > 0 then
								t_3[v.viewType] = viewType - 1
							else
								local var16 = adapter.create(v.viewType)
								assert(t_1[var16] == nil and not var8[var16], "RecyclingScope: create must return a new record")
								var8[var16] = true
								t_4[i] = var16
							end
						else
							var12[i] = var15
							var13[var15] = true
						end
					end
				end)
				
				if not ok then
					var4 = false
					
					for i_2, v_2 in t_4 do
						adapter.destroy(v_2)
					end
					error(status, 0)
				end
				local t_5 = { releasedCount = 0, acquired = table.create(#p4) }
				local t_6 = {}
				local var17 = if p1.onPoolChanged == nil then nil else {}
				
				for i_2, v_2 in p3 do
					if not var13[v_2.record] then
						local record = t_1[v_2.record]
						record.owner = nil
						record.leaseToken = nil
						local pool = record.pool
						pool.last += 1
						pool.items[pool.last] = v_2.record
						t_5.releasedCount += 1
						
						if var17 ~= nil then
							table.insert(var17, {
								diagnosticsModule.PoolAction.Release,
								record.viewType,
								-1,
								1,
								0
							})
						end
					end
				end
				for i_3, v_3 in p4 do
					local var18 = poolFor(v_3.viewType)
					local var19 = if var12 == nil then nil else var12[i_3]
					
					if var19 == nil then
						if var18.first <= var18.last then
							var19 = var18.items[var18.last]
							var18.items[var18.last] = nil
							var18.last -= 1
							
							if var17 ~= nil then
								table.insert(var17, {
									diagnosticsModule.PoolAction.Acquire,
									v_3.viewType,
									1,
									-1,
									0
								})
							end
						else
							local var20 = t_4[i_3]
							var19 = var20
							t_1[var20] = {
								owner = nil,
								leaseToken = nil,
								validationToken = nil,
								viewType = v_3.viewType,
								pool = var18,
								inventoryIndex = #t_2 + 1
							}
							table.insert(t_2, var20)
							
							if var17 ~= nil then
								table.insert(var17, {
									diagnosticsModule.PoolAction.Create,
									v_3.viewType,
									1,
									0,
									1
								})
							end
						end
					end
					local var21 = var19
					local var22 = t_1[var21]
					local var23 = var1
					var1 += 1
					var22.owner = p2
					var22.leaseToken = var23
					table.insert(t_5.acquired, { record = var21, leaseToken = var23 })
				end
				for i_4, v_4 in t do
					while maxPoolSize_1 ~= nil and maxPoolSize_1 < v_4.last - v_4.first + 1 do
						local first = v_4.items[v_4.first]
						v_4.items[v_4.first] = nil
						v_4.first += 1
						local var24 = t_1[first]
						local t_2Count = #t_2
						local var25 = t_2[t_2Count]
						
						if var24.inventoryIndex ~= t_2Count then
							t_2[var24.inventoryIndex] = var25
							t_1[var25].inventoryIndex = var24.inventoryIndex
						end
						t_2[t_2Count] = nil
						t_1[first] = nil
						table.insert(t_6, first)
						
						if var17 ~= nil then
							table.insert(var17, {
								diagnosticsModule.PoolAction.Evict,
								v_4.viewType,
								0,
								-1,
								-1
							})
						end
					end
				end
				var4 = false
				batch(function()
					-- upvalues: var17 (ref), p1 (copy), t_6 (ref), adapter (copy)
					if var17 ~= nil then
						for i, v in var17 do
							local var26 = v[1]
							local var27 = v[2]
							local var28 = v[3]
							local var29 = v[4]
							local var30 = v[5]
							
							if p1.onPoolChanged ~= nil then
								p1.onPoolChanged({
									action = var26,
									viewType = var27,
									occupiedDelta = var28,
									vacantDelta = var29,
									totalDelta = var30
								})
							end
						end
					end
					for i, v in t_6 do
						adapter.destroy(v)
					end
				end)
				
				return t_5
			end
		end,
		batch = batch,
		isLeaseCurrent = function(p5, p6, p7)
			-- upvalues: t_1 (ref), var3 (write)
			local var26 = t_1[p6]
			
			return not var3 and (var26 ~= nil and (var26.owner == p5 and var26.leaseToken == p7))
		end,
		setMaxPoolSize = function(a)
			-- upvalues: var3 (write), var4 (write), maxPoolSize_1 (write), evictExcess (ref)
			assert(not var3 and not var4, "RecyclingScope: cannot set capacity now")
			assert(if a ~= nil then a >= 0 and a % 1 == 0 else true, "RecyclingScope: maxPoolSize must be a non-negative integer")
			maxPoolSize_1 = a
			evictExcess()
		end,
		getScopeInventory = function()
			-- upvalues: t_2 (ref)
			return table.clone(t_2)
		end,
		getVacantRecords = function()
			-- upvalues: t (ref)
			local t_1 = {}
			
			for i, v in t do
				for i_1 = v.first, v.last do
					table.insert(t_1, v.items[i_1])
				end
			end
			return t_1
		end,
		destroy = function()
			-- upvalues: var3 (write), var4 (write), t_2 (ref), p1 (ref), t_1 (ref), t (ref), batch (ref), notify (ref), diagnosticsModule (copy), adapter (ref)
			if var3 then return end
			assert(not var4, "RecyclingScope: cannot destroy during an exchange")
			var3 = true
			local cloned = table.clone(t_2)
			local var26 = if p1.onPoolChanged == nil then nil else table.create(#cloned)
			
			if var26 ~= nil then
				for i, v in cloned do
					local var27 = t_1[v]
					var26[i] = { viewType = var27.viewType, occupied = var27.owner ~= nil }
				end
			end
			table.clear(t_2)
			table.clear(t_1)
			table.clear(t)
			local var28 = nil
			
			local function _(p5, p6)
				-- upvalues: var28 (write)
				if not p5 and var28 == nil then
					var28 = p6
				end
			end
			
			batch(function()
				-- upvalues: cloned (ref), var26 (ref), notify (copy), diagnosticsModule (copy), var28 (write), adapter (copy)
				for i, v in cloned do
					if var26 ~= nil then
						local var29 = var26[i]
						local ok, status = pcall(notify, diagnosticsModule.PoolAction.Evict, var29.viewType, if var29.occupied then -1 else 0, if var29.occupied then 0 else -1, -1)
						
						if not ok and var28 == nil then
							var28 = status
						end
					end
					local ok, status = pcall(adapter.destroy, v)
					
					if not ok and var28 == nil then
						var28 = status
					end
				end
			end)
			
			if var28 ~= nil then
				error(var28, 0)
			end
		end
	}
end