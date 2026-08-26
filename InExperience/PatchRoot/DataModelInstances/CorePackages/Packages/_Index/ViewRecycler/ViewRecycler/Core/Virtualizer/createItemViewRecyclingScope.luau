local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local recyclingScopeModule = require(viewRecycler.Core.RecyclingScope)

local function directBatch(p1)
	p1()
end

return function(p1)
	-- upvalues: directBatch (ref), recyclingScopeModule (ref), diagnosticsModule (ref)
	local itemViewAdapter = p1.itemViewAdapter
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function flushLifecycleNotifications()
		-- upvalues: t_2 (write), itemViewAdapter (ref), t_1 (write), t (ref)
		if #t_2 > 0 and itemViewAdapter.onEvicted ~= nil then
			itemViewAdapter.onEvicted(t_2)
		end
		if #t_1 > 0 and itemViewAdapter.onCreated ~= nil then
			local t_3 = {}
			
			for i, v in t_1 do
				if t[v] then
					table.insert(t_3, v)
				end
			end
			if #t_3 > 0 then
				itemViewAdapter.onCreated(t_3)
			end
		end
		t_1 = {}
		t_2 = {}
	end
	
	local batch = itemViewAdapter.batch or directBatch
	local diagnostics = p1.diagnostics
	
	return recyclingScopeModule({
		adapter = {
			create = function(p2)
				-- upvalues: itemViewAdapter (ref), t (ref), t_1 (write)
				local var1 = itemViewAdapter.create(p2)
				t[var1] = true
				table.insert(t_1, var1)
				
				return var1
			end,
			destroy = function(p2)
				-- upvalues: t (ref), t_2 (write)
				t[p2] = nil
				table.insert(t_2, p2)
			end,
			batch = function(p2)
				-- upvalues: batch (ref), flushLifecycleNotifications (ref)
				local ok, status = pcall(batch, p2)
				flushLifecycleNotifications()
				
				if not ok then
					error(status, 0)
				end
			end
		},
		maxPoolSize = p1.maxPoolSize,
		onPoolChanged = if diagnostics == nil then nil else function(p2)
			-- upvalues: diagnostics (ref), diagnosticsModule (copy)
			diagnostics({
				kind = diagnosticsModule.EventKind.PoolChanged,
				action = p2.action,
				itemViewType = p2.viewType,
				occupiedDelta = p2.occupiedDelta,
				vacantDelta = p2.vacantDelta,
				totalDelta = p2.totalDelta
			})
		end
	})
end