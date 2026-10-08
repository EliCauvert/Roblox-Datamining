local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)
local reconcileSnapshotModule = require(script.ReconcileSnapshot)
local arrayDataSourceModule = require(script.ArrayDataSource)
local concatDataSourceModule = require(script.ConcatDataSource)
local dequeDataSourceModule = require(script.DequeDataSource)
local mapDataSourceModule = require(script.MapDataSource)
local reverseDataSourceModule = require(script.ReverseDataSource)
local ringBufferDataSourceModule = require(script.RingBufferDataSource)
local sequenceDataSourceModule = require(script.SequenceDataSource)

return {
	snapshot = function(p1, p2)
		-- upvalues: arrayDataSourceModule (ref)
		return arrayDataSourceModule(p1, p2)
	end,
	sequence = function(p1, p2)
		-- upvalues: sequenceDataSourceModule (ref)
		return sequenceDataSourceModule(p1, p2)
	end,
	deque = function(p1, p2)
		-- upvalues: dequeDataSourceModule (ref)
		return dequeDataSourceModule(p1, p2)
	end,
	ringBuffer = function(p1, p2, p3)
		-- upvalues: ringBufferDataSourceModule (ref)
		return ringBufferDataSourceModule(p1, p2, p3)
	end,
	map = function(p1, p2)
		-- upvalues: mapDataSourceModule (ref)
		return mapDataSourceModule(p1, p2)
	end,
	concat = function(...)
		-- upvalues: concatDataSourceModule (ref)
		return concatDataSourceModule(...)
	end,
	reverse = function(p1)
		-- upvalues: reverseDataSourceModule (ref)
		return reverseDataSourceModule(p1)
	end,
	reconcileSnapshot = function(p1, p2, p3, p4)
		-- upvalues: reconcileSnapshotModule (ref)
		reconcileSnapshotModule(p1, p2, p3, p4)
	end
}