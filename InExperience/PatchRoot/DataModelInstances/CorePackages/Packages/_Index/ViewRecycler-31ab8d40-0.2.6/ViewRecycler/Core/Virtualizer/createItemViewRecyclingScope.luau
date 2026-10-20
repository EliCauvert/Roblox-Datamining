local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local RecyclingScopeModule = require(ViewRecycler.Core.RecyclingScope)

local function directBatch(Callback: () -> ())
	Callback()
end

return function(p1)
	-- upvalues: directBatch (copy), RecyclingScopeModule (copy), DiagnosticsModule (copy)
	local ItemViewAdapter = p1.itemViewAdapter
	local t = {}
	local CreateResults = {}
	local Keys = {}
	
	local function flushLifecycleNotifications()
		-- upvalues: Keys (ref), ItemViewAdapter (copy), CreateResults (ref), t (copy)
		if #Keys > 0 and ItemViewAdapter.onEvicted ~= nil then
			ItemViewAdapter.onEvicted(Keys)
		end
		if #CreateResults > 0 and ItemViewAdapter.onCreated ~= nil then
			local List = {}
			
			for _, createResult in CreateResults do
				if t[createResult] then
					table.insert(List, createResult)
				end
			end
			if #List > 0 then
				ItemViewAdapter.onCreated(List)
			end
		end
		CreateResults = {}
		Keys = {}
	end
	
	local Batch = ItemViewAdapter.batch or directBatch
	local DiagnosticsFunction = p1.diagnostics
	
	return RecyclingScopeModule({
		adapter = {
			create = function(p2)
				-- upvalues: ItemViewAdapter (copy), t (copy), CreateResults (ref)
				local NewItemViewAdapter = ItemViewAdapter.create(p2)
				t[NewItemViewAdapter] = true
				table.insert(CreateResults, NewItemViewAdapter)
				
				return NewItemViewAdapter
			end,
			destroy = function(Key)
				-- upvalues: t (copy), Keys (ref)
				t[Key] = nil
				table.insert(Keys, Key)
			end,
			batch = function(p2)
				-- upvalues: Batch (copy), flushLifecycleNotifications (copy)
				local Success, Result = pcall(Batch, p2)
				flushLifecycleNotifications()
				
				if not Success then
					error(Result, 0)
				end
			end
		},
		maxPoolSize = p1.maxPoolSize,
		onPoolChanged = if DiagnosticsFunction == nil then nil else function(p2)
			-- upvalues: DiagnosticsFunction (copy), DiagnosticsModule (upval)
			DiagnosticsFunction({
				kind = DiagnosticsModule.EventKind.PoolChanged,
				action = p2.action,
				itemViewType = p2.viewType,
				occupiedDelta = p2.occupiedDelta,
				vacantDelta = p2.vacantDelta,
				totalDelta = p2.totalDelta
			})
		end
	})
end