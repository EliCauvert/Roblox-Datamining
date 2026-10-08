local diagnosticsModule = require(script:FindFirstAncestor("ViewRecycler").Core.Diagnostics)
local frozen = table.freeze({})

local function _(p1)
	return if p1 ~= nil then p1 >= 0 and p1 % 1 == 0 else true
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
	-- upvalues: diagnosticsModule (ref), frozen (ref)
	local adapter = p1.adapter
	local t = {}
	local t_1 = {}
	local var1 = false
	local var2 = false
	local batch = adapter.batch or function(p2)
		p2()
	end
	
	local function poolFor(p2)
		-- upvalues: t (ref)
		local var3 = t[p2]
		
		if var3 == nil then
			var3 = { first = 1, last = 0, viewType = p2, items = {} }
			t[p2] = var3
		end
		return var3
	end
	
	local function _(p2)
		-- upvalues: t_1 (ref)
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
	
	local function finalize(p2, p3, p4, p5)
		-- upvalues: adapter (ref), batch (ref), notify (ref)
		if (p2 == nil or #p2 == 0) and #p3 == 0 and (p4 == nil or #p4 == 0 or adapter.onCreated == nil) then
			return true, nil
		end
		local var3 = nil
		
		local function _(p6, p7)
			-- upvalues: var3 (write)
			if not p6 and var3 == nil then
				var3 = p7
			end
		end
		
		local packed = table.pack(pcall(batch, function()
			-- upvalues: p2 (ref), notify (copy), var3 (write), p5 (ref), p3 (ref), adapter (copy), p4 (ref)
			if p2 ~= nil then
				for i, v in p2 do
					local ok, status = pcall(notify, v[1], v[2], v[3], v[4], v[5])
					
					if not ok and var3 == nil then
						var3 = status
					end
				end
			end
			if p5 ~= false and #p3 > 0 and adapter.onEvicted ~= nil then
				local ok, status = pcall(adapter.onEvicted, p3)
				
				if not ok and var3 == nil then
					var3 = status
				end
			end
			for i, v in p3 do
				local ok, status = pcall(adapter.destroy, v)
				
				if not ok and var3 == nil then
					var3 = status
				end
			end
			if p4 ~= nil and #p4 > 0 and adapter.onCreated ~= nil then
				local ok, status = pcall(adapter.onCreated, p4)
				
				if not ok and var3 == nil then
					var3 = status
				end
			end
			if var3 ~= nil then
				error(var3, 0)
			end
		end))
		
		return packed[1], packed[2]
	end
	
	local function trimPoolExcess(p6, p7, p8, p9)
		-- upvalues: t_1 (ref), diagnosticsModule (copy)
		while p7 < p6.last - p6.first + 1 do
			local first = p6.items[p6.first]
			p6.items[p6.first] = nil
			p6.first += 1
			t_1[first] = nil
			table.insert(p8, first)
			
			if p9 ~= nil then
				table.insert(p9, {
					diagnosticsModule.PoolAction.Evict,
					p6.viewType,
					0,
					-1,
					-1
				})
			end
		end
	end
	
	local function uniformDirectReuse(p10, p11)
		-- upvalues: t_1 (ref)
		local p26Count = #p10
		
		if p26Count == 0 or p26Count ~= #p11 then
			return nil
		end
		local viewType = p11[1].viewType
		
		for i = 2, p26Count do
			if p11[i].viewType == viewType then
				continue
			end
			return nil
		end
		for i_1, v in p10 do
			local var4 = t_1[v]
			
			if var4 == nil or not var4.active then
				error("RecyclingScope: can only release an active view", 3)
			end
			if var4.viewType == viewType then
				for i_3 = 1, i_1 - 1 do
					if p10[i_3] == v then
						error("RecyclingScope: cannot release one view more than once", 3)
					end
				end
			end
			return nil
		end
		local list = table.create(p26Count)
		
		for i_2 = 1, p26Count do
			list[i_2] = p10[p26Count - i_2 + 1]
		end
		return { releasedCount = 0, acquired = list }
	end
	
	local t_2 = {}
	local t_3 = {}
	
	local function exchangeWithoutCreation(p12, p13, p14)
		-- upvalues: t_1 (ref), t_2 (ref), diagnosticsModule (copy), frozen (copy), t_3 (ref), t (ref)
		local var5
		if #p13 == 0 then
			for i, v in p12 do
				var5 = t_1[v]
				
				if var5 == nil or not var5.active then
					table.clear(t_2)
					error("RecyclingScope: can only release an active view", 3)
				end
				if t_2[v] then
					table.clear(t_2)
					error("RecyclingScope: cannot release one view more than once", 3)
				end
				t_2[v] = true
			end
			table.clear(t_2)
			
			for i, v_1 in p12 do
				var5 = t_1[v_1]
				var5.active = false
				local pool = var5.pool
				pool.last += 1
				pool.items[pool.last] = v_1
				
				if p14 ~= nil then
					table.insert(p14, {
						diagnosticsModule.PoolAction.Release,
						var5.viewType,
						-1,
						1,
						0
					})
				end
			end
			return { acquired = frozen, releasedCount = #p12 }
		elseif #p12 ~= 0 then
			return nil
		end
		local var6 = true
		
		for i, var5 in p13 do
			local viewType = var5.viewType
			local var7 = t_3[viewType]
			
			if var7 == nil then
				local var8 = t[viewType]
				var7 = if var8 == nil then 0 else var8.last - var8.first + 1
			end
			if var7 == 0 then
				var6 = false
				break
			end
			t_3[viewType] = var7 - 1
		end
		table.clear(t_3)
		
		if not var6 then
			return nil
		end
		local list = table.create(#p13)
		
		for var5, v_1 in p13 do
			local viewType = t[v_1.viewType]
			local last = viewType.items[viewType.last]
			viewType.items[viewType.last] = nil
			viewType.last -= 1
			t_1[last].active = true
			list[var5] = last
			
			if p14 ~= nil then
				table.insert(p14, {
					diagnosticsModule.PoolAction.Acquire,
					v_1.viewType,
					1,
					-1,
					0
				})
			end
		end
		return { releasedCount = 0, acquired = list }
	end
	
	return {
		bind = function(p15)
			-- upvalues: var1 (write), var2 (write), uniformDirectReuse (ref), p1 (ref), t (ref), trimPoolExcess (ref), finalize (ref), exchangeWithoutCreation (ref), frozen (copy), t_1 (ref), adapter (ref), diagnosticsModule (copy), poolFor (ref)
			assert(not var1, "RecyclingScope: cannot bind after disposal")
			assert(not var2, "RecyclingScope: cannot bind reentrantly")
			local capacity = p15.capacity
			assert(if capacity ~= nil then capacity >= 0 and capacity % 1 == 0 else true, "RecyclingScope: capacity must be a non-negative integer")
			local releases = p15.releases
			local requests = p15.requests
			local var9 = uniformDirectReuse(releases, requests)
			
			if var9 == nil then
				local var10 = if p1.onPoolChanged == nil then nil else {}
				local var11 = exchangeWithoutCreation(releases, requests, var10)
				
				if var11 == nil then
					local t_9
					var2 = true
					local t_2 = {}
					local t_3 = {}
					
					for i, v in releases do
						t_9 = t_1[v]
						
						if t_9 == nil or not t_9.active then
							var2 = false
							error("RecyclingScope: can only release an active view", 2)
						end
						if t_3[v] then
							var2 = false
							error("RecyclingScope: cannot release one view more than once", 2)
						end
						t_3[v] = true
						local viewType = t_2[t_9.viewType]
						
						if viewType == nil then
							viewType = {}
							t_2[t_9.viewType] = viewType
						end
						table.insert(viewType, v)
					end
					local t_4 = {}
					local t_5 = {}
					local t_6 = {}
					local t_7 = {}
					local t_8 = {}
					t_9 = {}
					local ok, status = pcall(function()
						-- upvalues: requests (ref), t_2 (ref), t_5 (ref), t_7 (ref), t_4 (ref), t (copy), t_6 (ref), adapter (copy), t_1 (copy), t_9 (ref), t_8 (ref)
						local var12
						for i, v in requests do
							local viewType = t_2[v.viewType]
							var12 = if viewType == nil then nil else table.remove(viewType)
							
							if var12 ~= nil then
								t_5[i] = var12
								t_7[var12] = true
								continue
							end
							local viewType_1 = t_4[v.viewType]
							
							if viewType_1 == nil then
								local viewType_2 = t[v.viewType]
								viewType_1 = if viewType_2 == nil then 0 else viewType_2.last - viewType_2.first + 1
							end
							if viewType_1 > 0 then
								t_4[v.viewType] = viewType_1 - 1
								t_6[i] = true
							else
								t_4[v.viewType] = 0
								local var13 = adapter.create(v.viewType)
								assert(t_1[var13] == nil and not t_9[var13], "RecyclingScope: create must return a new view")
								t_9[var13] = true
								t_8[i] = var13
							end
						end
					end)
					
					if not ok then
						finalize(nil, t_8, nil, false)
						var2 = false
						error(status, 0)
					end
					local t_10 = {
						releasedCount = 0,
						acquired = if #requests == 0 then frozen else table.create(#requests)
					}
					local var14 = if p1.onPoolChanged == nil then nil else {}
					local t_11 = {}
					
					for i_1, v_1 in releases do
						if not t_7[v_1] then
							local var15 = t_1[v_1]
							var15.active = false
							local pool = var15.pool
							pool.last += 1
							pool.items[pool.last] = v_1
							t_10.releasedCount += 1
							
							if var14 ~= nil then
								table.insert(var14, {
									diagnosticsModule.PoolAction.Release,
									var15.viewType,
									-1,
									1,
									0
								})
							end
						end
					end
					local v_3
					for i_2, v_2 in requests do
						v_3 = t_5[i_2]
						
						if v_3 == nil and t_6[i_2] then
							local viewType = t[v_2.viewType]
							v_3 = viewType.items[viewType.last]
							viewType.items[viewType.last] = nil
							viewType.last -= 1
							t_1[v_3].active = true
							
							if var14 ~= nil then
								table.insert(var14, {
									diagnosticsModule.PoolAction.Acquire,
									v_2.viewType,
									1,
									-1,
									0
								})
							end
						elseif v_3 == nil then
							v_3 = t_8[i_2]
							t_1[v_3] = {
								active = true,
								viewType = v_2.viewType,
								pool = poolFor(v_2.viewType)
							}
							
							if var14 ~= nil then
								table.insert(var14, {
									diagnosticsModule.PoolAction.Create,
									v_2.viewType,
									1,
									0,
									1
								})
							end
						end
						table.insert(t_10.acquired, v_3)
					end
					local capacity_1 = p15.capacity
					
					if capacity_1 ~= nil then
						for i_3, v_3 in t do
							trimPoolExcess(v_3, capacity_1, t_11, var14)
						end
					end
					local t_12 = {}
					
					for v_3, v_4 in t_8 do
						table.insert(t_12, v_4)
					end
					local var16, var17 = finalize(var14, t_11, t_12)
					var2 = false
					
					if not var16 then
						error(var17, 0)
					end
					return t_10
				else
					local var18 = frozen
					local capacity_1 = p15.capacity
					
					if capacity_1 ~= nil then
						var18 = {}
						
						for i, v in t do
							trimPoolExcess(v, capacity_1, var18, var10)
						end
					end
					var2 = true
					local var19, var20 = finalize(var10, var18, nil)
					var2 = false
					
					if not var19 then
						error(var20, 0)
					end
					return var11
				end
			else
				local capacity_1 = p15.capacity
				
				if capacity_1 ~= nil then
					local t_2 = {}
					local var21 = if p1.onPoolChanged == nil then nil else {}
					
					for i, v in t do
						trimPoolExcess(v, capacity_1, t_2, var21)
					end
					if #t_2 > 0 then
						var2 = true
						local var22, var23 = finalize(var21, t_2, nil)
						var2 = false
						
						if not var22 then
							error(var23, 0)
						end
					end
				end
				return var9
			end
		end,
		dispose = function()
			-- upvalues: var1 (write), var2 (write), p1 (ref), t_1 (ref), t (ref), diagnosticsModule (copy), finalize (ref)
			if var1 then return end
			assert(not var2, "RecyclingScope: cannot dispose during bind")
			var1 = true
			local t_2 = {}
			local var24 = if p1.onPoolChanged == nil then nil else {}
			
			for i, v in t_1 do
				table.insert(t_2, i)
				
				if var24 ~= nil then
					table.insert(var24, { viewType = v.viewType, occupied = v.active })
				end
			end
			table.clear(t_1)
			table.clear(t)
			local var25 = if var24 == nil then nil else table.create(#t_2)
			
			if var25 ~= nil then
				for i_1, v_1 in var24 do
					table.insert(var25, {
						diagnosticsModule.PoolAction.Evict,
						v_1.viewType,
						if v_1.occupied then -1 else 0,
						if v_1.occupied then 0 else -1,
						-1
					})
				end
			end
			local var26, var27 = finalize(var25, t_2, nil)
			
			if not var26 then
				error(var27, 0)
			end
		end
	}
end