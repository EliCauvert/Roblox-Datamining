local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)
local ReconcileSnapshotModule = require(script.ReconcileSnapshot)
local ArrayDataSourceModule = require(script.ArrayDataSource)
local ConcatDataSourceModule = require(script.ConcatDataSource)
local DequeDataSourceModule = require(script.DequeDataSource)
local MapDataSourceModule = require(script.MapDataSource)
local ReverseDataSourceModule = require(script.ReverseDataSource)
local RingBufferDataSourceModule = require(script.RingBufferDataSource)
local SequenceDataSourceModule = require(script.SequenceDataSource)

return {
	snapshot = function(p1, p2) --[[ Line: 57 ]]
		-- upvalues: ArrayDataSourceModule (copy)
		return ArrayDataSourceModule(p1, p2)
	end,
	sequence = function(p1, p2) --[[ Line: 61 ]]
		-- upvalues: SequenceDataSourceModule (copy)
		return SequenceDataSourceModule(p1, p2)
	end,
	deque = function(p1, p2) --[[ Line: 65 ]]
		-- upvalues: DequeDataSourceModule (copy)
		return DequeDataSourceModule(p1, p2)
	end,
	ringBuffer = function(p1, p2, p3) --[[ Line: 69 ]]
		-- upvalues: RingBufferDataSourceModule (copy)
		return RingBufferDataSourceModule(p1, p2, p3)
	end,
	map = function(p1, p2) --[[ Line: 73 ]]
		-- upvalues: MapDataSourceModule (copy)
		return MapDataSourceModule(p1, p2)
	end,
	concat = function(...) --[[ Line: 77 ]]
		-- upvalues: ConcatDataSourceModule (copy)
		return ConcatDataSourceModule(...)
	end,
	reverse = function(p1) --[[ Line: 81 ]]
		-- upvalues: ReverseDataSourceModule (copy)
		return ReverseDataSourceModule(p1)
	end,
	reconcileSnapshot = function(p1, p2, p3, p4) --[[ Line: 85 ]]
		-- upvalues: ReconcileSnapshotModule (copy)
		ReconcileSnapshotModule(p1, p2, p3, p4)
	end
}