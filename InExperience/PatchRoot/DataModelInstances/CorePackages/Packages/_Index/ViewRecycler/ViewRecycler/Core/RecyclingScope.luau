local diagnosticsModule = require(script:FindFirstAncestor("ViewRecycler").Core.Diagnostics)
local frozen = table.freeze({})

local function _(a)
	return if a ~= nil then a >= 0 and a % 1 == 0 else true
end

local _ = function(p0, p1, p2, p3, p4, p5)
	table.insert(p0, {
		p1,
		p2,
		p3,
		p4,
		p5
	})
end

return function(p6)
	-- upvalues: frozen (ref), diagnosticsModule (ref)
	local maxPoolSize = p6.maxPoolSize
	assert(if maxPoolSize ~= nil then maxPoolSize >= 0 and maxPoolSize % 1 == 0 else true, "RecyclingScope: maxPoolSize must be a non-negative integer")
	local adapter = p6.adapter
	local maxPoolSize_1 = p6.maxPoolSize
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var5 = 1
	local var6 = 1
	local var7 = false
	local var8 = false
	local batch = adapter.batch or function(p7)
		p7()
	end
	
	local function poolFor(p8)
		-- upvalues: t (ref)
		local var13 = t[p8]
		
		if var13 == nil then
			var13 = { first = 1, last = 0, viewType = p8, items = {} }
			t[p8] = var13
		end
		return var13
	end
	
	local function _(p9)
		-- upvalues: t_1 (ref), t_2 (ref)
		local var14 = t_1[p9]
		local t_2Count = #t_2
		local var16 = t_2[t_2Count]
		
		if var14.inventoryIndex ~= t_2Count then
			t_2[var14.inventoryIndex] = var16
			t_1[var16].inventoryIndex = var14.inventoryIndex
		end
		t_2[t_2Count] = nil
		t_1[p9] = nil
	end
	
	local function notify(p10, p11, p12, p13, p14)
		-- upvalues: p6 (ref)
		if p6.onPoolChanged ~= nil then
			p6.onPoolChanged({
				action = p10,
				viewType = p11,
				occupiedDelta = p12,
				vacantDelta = p13,
				totalDelta = p14
			})
		end
	end
	
	local function evictExcess()
		-- upvalues: t (ref), maxPoolSize_1 (write), t_1 (ref), t_2 (ref), diagnosticsModule (copy), p6 (ref), adapter (ref)
		local t_3 = {}
		local t_4 = {}
		
		for i, v in t do
			while maxPoolSize_1 ~= nil and maxPoolSize_1 < v.last - v.first + 1 do
				local first = v.items[v.first]
				v.items[v.first] = nil
				v.first += 1
				local var20 = t_1[first]
				local t_2Count = #t_2
				local var22 = t_2[t_2Count]
				
				if var20.inventoryIndex ~= t_2Count then
					t_2[var20.inventoryIndex] = var22
					t_1[var22].inventoryIndex = var20.inventoryIndex
				end
				t_2[t_2Count] = nil
				t_1[first] = nil
				table.insert(t_3, first)
				table.insert(t_4, { v.viewType })
			end
		end
		for i, v_1 in t_4 do
			local evict = diagnosticsModule.PoolAction.Evict
			local var19 = v_1[1]
			
			if p6.onPoolChanged ~= nil then
				p6.onPoolChanged({
					occupiedDelta = 0,
					vacantDelta = -1,
					totalDelta = -1,
					action = evict,
					viewType = var19
				})
			end
		end
		for i, v_2 in t_3 do
			adapter.destroy(v_2)
		end
	end
	
	return {
		exchange = function(p15, p16, p17)
			-- upvalues: var7 (write), var8 (write), var6 (write), t_1 (ref), p6 (ref), frozen (copy), t (ref), maxPoolSize_1 (write), t_2 (ref), batch (ref), adapter (ref), diagnosticsModule (copy), poolFor (ref), var5 (write)
			assert(not var7, "RecyclingScope: cannot exchange after destruction")
			assert(not var8, "RecyclingScope: cannot mutate during an exchange")
			assert(p15 ~= nil, "RecyclingScope: exchange requires an owner")
			var6 += 1
			local var23 = if #p17 == 0 then nil else {}
			
			for i, v in p16 do
				local record = t_1[v.record]
				assert(record ~= nil and (record.owner == p15 and record.leaseToken == v.leaseToken), "RecyclingScope: cannot use a stale Lease")
				assert(record.validationToken ~= var6, "RecyclingScope: cannot release one Lease more than once")
				record.validationToken = var6
			end
			if #p17 == 0 and p6.onPoolChanged == nil then
				local t_3 = { acquired = frozen, releasedCount = #p16 }
				local t_4 = {}
				var8 = true
				
				for i_1, v_1 in p16 do
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
						local var26 = t_1[first]
						local t_2Count = #t_2
						local var28 = t_2[t_2Count]
						
						if var26.inventoryIndex ~= t_2Count then
							t_2[var26.inventoryIndex] = var28
							t_1[var28].inventoryIndex = var26.inventoryIndex
						end
						t_2[t_2Count] = nil
						t_1[first] = nil
						table.insert(t_4, first)
					end
				end
				var8 = false
				batch(function()
					-- upvalues: t_4 (ref), adapter (copy)
					for i, v in t_4 do
						adapter.destroy(v)
					end
				end)
				
				return t_3
			else
				var8 = true
				local t_3 = {}
				
				for i_1, v_1 in t do
					t_3[i_1] = v_1.last - v_1.first + 1
				end
				local var30 = if #p16 == 0 then nil else {}
				
				if var30 ~= nil then
					for i_2, v_2 in p16 do
						local record = t_1[v_2.record]
						local viewType = var30[record.viewType]
						
						if viewType == nil then
							viewType = {}
							var30[record.viewType] = viewType
						end
						table.insert(viewType, v_2.record)
					end
				end
				local t_4 = {}
				local var32 = if var30 == nil then nil else {}
				local var33 = if var32 == nil then frozen else {}
				local ok, status = pcall(function()
					-- upvalues: p17 (ref), var30 (ref), var32 (ref), var33 (ref), t_3 (ref), adapter (copy), t_1 (copy), var23 (ref), t_4 (ref)
					for i, v in p17 do
						local var46 = if var30 == nil then nil else var30[v.viewType]
						local var47 = if var46 == nil then nil else table.remove(var46)
						
						if var47 == nil then
							local viewType = t_3[v.viewType] or 0
							
							if viewType > 0 then
								t_3[v.viewType] = viewType - 1
							else
								local var49 = adapter.create(v.viewType)
								assert(t_1[var49] == nil and not var23[var49], "RecyclingScope: create must return a new record")
								var23[var49] = true
								t_4[i] = var49
							end
						else
							var32[i] = var47
							var33[var47] = true
						end
					end
				end)
				
				if not ok then
					var8 = false
					
					for i_2, v_2 in t_4 do
						adapter.destroy(v_2)
					end
					error(status, 0)
				end
				local t_5 = { releasedCount = 0, acquired = table.create(#p17) }
				local t_6 = {}
				local var36 = if p6.onPoolChanged == nil then nil else {}
				
				for i_2, v_2 in p16 do
					if not var33[v_2.record] then
						local record = t_1[v_2.record]
						record.owner = nil
						record.leaseToken = nil
						local pool = record.pool
						pool.last += 1
						pool.items[pool.last] = v_2.record
						t_5.releasedCount += 1
						
						if var36 ~= nil then
							table.insert(var36, {
								diagnosticsModule.PoolAction.Release,
								record.viewType,
								-1,
								1,
								0
							})
						end
					end
				end
				for i_3, v_3 in p17 do
					local var40 = poolFor(v_3.viewType)
					local var41 = if var32 == nil then nil else var32[i_3]
					
					if var41 == nil then
						if var40.first <= var40.last then
							var41 = var40.items[var40.last]
							var40.items[var40.last] = nil
							var40.last -= 1
							
							if var36 ~= nil then
								table.insert(var36, {
									diagnosticsModule.PoolAction.Acquire,
									v_3.viewType,
									1,
									-1,
									0
								})
							end
						else
							local var42 = t_4[i_3]
							var41 = var42
							t_1[var42] = {
								owner = nil,
								leaseToken = nil,
								validationToken = nil,
								viewType = v_3.viewType,
								pool = var40,
								inventoryIndex = #t_2 + 1
							}
							table.insert(t_2, var42)
							
							if var36 ~= nil then
								table.insert(var36, {
									diagnosticsModule.PoolAction.Create,
									v_3.viewType,
									1,
									0,
									1
								})
							end
						end
					end
					local var43 = var41
					local var44 = t_1[var43]
					local var45 = var5
					var5 += 1
					var44.owner = p15
					var44.leaseToken = var45
					table.insert(t_5.acquired, { record = var43, leaseToken = var45 })
				end
				for i_4, v_4 in t do
					while maxPoolSize_1 ~= nil and maxPoolSize_1 < v_4.last - v_4.first + 1 do
						local first = v_4.items[v_4.first]
						v_4.items[v_4.first] = nil
						v_4.first += 1
						local var37 = t_1[first]
						local t_2Count = #t_2
						local var39 = t_2[t_2Count]
						
						if var37.inventoryIndex ~= t_2Count then
							t_2[var37.inventoryIndex] = var39
							t_1[var39].inventoryIndex = var37.inventoryIndex
						end
						t_2[t_2Count] = nil
						t_1[first] = nil
						table.insert(t_6, first)
						
						if var36 ~= nil then
							table.insert(var36, {
								diagnosticsModule.PoolAction.Evict,
								v_4.viewType,
								0,
								-1,
								-1
							})
						end
					end
				end
				var8 = false
				batch(function()
					-- upvalues: var36 (ref), p6 (copy), t_6 (ref), adapter (copy)
					if var36 ~= nil then
						for i, v in var36 do
							local var50 = v[1]
							local var51 = v[2]
							local var52 = v[3]
							local var53 = v[4]
							local var54 = v[5]
							
							if p6.onPoolChanged ~= nil then
								p6.onPoolChanged({
									action = var50,
									viewType = var51,
									occupiedDelta = var52,
									vacantDelta = var53,
									totalDelta = var54
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
		isLeaseCurrent = function(p18, p19, p20)
			-- upvalues: t_1 (ref), var7 (write)
			local var55 = t_1[p19]
			
			return not var7 and (var55 ~= nil and (var55.owner == p18 and var55.leaseToken == p20))
		end,
		setMaxPoolSize = function(a)
			-- upvalues: var7 (write), var8 (write), maxPoolSize_1 (write), evictExcess (ref)
			assert(not var7 and not var8, "RecyclingScope: cannot set capacity now")
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
			-- upvalues: var7 (write), var8 (write), t_2 (ref), p6 (ref), t_1 (ref), t (ref), batch (ref), notify (ref), diagnosticsModule (copy), adapter (ref)
			if var7 then return end
			assert(not var8, "RecyclingScope: cannot destroy during an exchange")
			var7 = true
			local cloned = table.clone(t_2)
			local var58 = if p6.onPoolChanged == nil then nil else table.create(#cloned)
			
			if var58 ~= nil then
				for i, v in cloned do
					local var59 = t_1[v]
					var58[i] = { viewType = var59.viewType, occupied = var59.owner ~= nil }
				end
			end
			table.clear(t_2)
			table.clear(t_1)
			table.clear(t)
			local var60 = nil
			
			local function _(p21, p22)
				-- upvalues: var60 (write)
				if not p21 and var60 == nil then
					var60 = p22
				end
			end
			
			batch(function()
				-- upvalues: cloned (ref), var58 (ref), notify (copy), diagnosticsModule (copy), var60 (write), adapter (copy)
				for i, v in cloned do
					if var58 ~= nil then
						local var61 = var58[i]
						local ok, status = pcall(notify, diagnosticsModule.PoolAction.Evict, var61.viewType, if var61.occupied then -1 else 0, if var61.occupied then 0 else -1, -1)
						
						if not ok and var60 == nil then
							var60 = status
						end
					end
					local ok, status = pcall(adapter.destroy, v)
					
					if not ok and var60 == nil then
						var60 = status
					end
				end
			end)
			
			if var60 ~= nil then
				error(var60, 0)
			end
		end
	}
end