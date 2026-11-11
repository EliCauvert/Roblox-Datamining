local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local NewResult = require(TimeToInteractiveTracker.Logger):new(script.Name)
local FFlagLuaAppPerfTrackerUseLogger = require(TimeToInteractiveTracker.Parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local _ = require(script.Parent.Parent.types)
local MergeTTIEventMetadataModule = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata)

return function(Callback)
	-- upvalues: FFlagLuaAppPerfTrackerUseLogger (copy), NewResult (copy), MergeTTIEventMetadataModule (copy)
	return function(p1, p2)
		-- upvalues: Callback (copy), FFlagLuaAppPerfTrackerUseLogger (upval), NewResult (upval), MergeTTIEventMetadataModule (upval)
		Callback(function(Tbl)
			-- upvalues: p1 (copy), FFlagLuaAppPerfTrackerUseLogger (upval), NewResult (upval), MergeTTIEventMetadataModule (upval), p2 (copy)
			local Entry = Tbl[p1]
			
			if Entry ~= nil then
				local Copy = table.clone(Tbl)
				local Copy1 = table.clone(Entry)
				Copy1.metadata = MergeTTIEventMetadataModule(Entry.metadata, p2)
				Copy[p1] = Copy1
				
				return Copy
			elseif FFlagLuaAppPerfTrackerUseLogger then
				NewResult:warning(`called before trackStart for eventName={p1}`)
				
				return Tbl
			else
				warn(`TimeToInteractiveTracker.updateMetadata called before trackStart for eventName={p1}`)
				
				return Tbl
			end
		end)
	end
end