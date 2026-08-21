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
	snapshot = function(p0, p1) --[[ line: 57 ]]
		-- upvalues: arrayDataSourceModule (ref)
		return arrayDataSourceModule(p0, p1)
	end,
	sequence = function(p2, p3) --[[ line: 61 ]]
		-- upvalues: sequenceDataSourceModule (ref)
		return sequenceDataSourceModule(p2, p3)
	end,
	deque = function(p4, p5) --[[ line: 65 ]]
		-- upvalues: dequeDataSourceModule (ref)
		return dequeDataSourceModule(p4, p5)
	end,
	ringBuffer = function(p6, p7, p8) --[[ line: 69 ]]
		-- upvalues: ringBufferDataSourceModule (ref)
		return ringBufferDataSourceModule(p6, p7, p8)
	end,
	map = function(p9, p10) --[[ line: 73 ]]
		-- upvalues: mapDataSourceModule (ref)
		return mapDataSourceModule(p9, p10)
	end,
	concat = function(...) --[[ line: 77 ]]
		-- upvalues: concatDataSourceModule (ref)
		return concatDataSourceModule(...)
	end,
	reverse = function(p11) --[[ line: 81 ]]
		-- upvalues: reverseDataSourceModule (ref)
		return reverseDataSourceModule(p11)
	end,
	reconcileSnapshot = function(p12, p13, p14, p15) --[[ line: 85 ]]
		-- upvalues: reconcileSnapshotModule (ref)
		reconcileSnapshotModule(p12, p13, p14, p15)
	end
}