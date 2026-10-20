local FFlagAXTTIEnableColdWarmDetection = require(script:FindFirstAncestor("TimeToInteractiveTracker").Parent.SharedFlags).FFlagAXTTIEnableColdWarmDetection
local _ = require(script.Parent.Parent.types)
local NowModule = require(script.Parent.Parent.Parent.Utils.now)

return function(Callback)
	-- upvalues: NowModule (copy), FFlagAXTTIEnableColdWarmDetection (copy)
	local t = {}
	
	return function(p1, p2)
		-- upvalues: Callback (copy), NowModule (upval), FFlagAXTTIEnableColdWarmDetection (upval), t (copy)
		Callback(function(Tbl)
			-- upvalues: p1 (copy), NowModule (upval), FFlagAXTTIEnableColdWarmDetection (upval), p2 (copy), t (upval)
			local Entry = Tbl[p1]
			local Copy = table.clone(Tbl)
			Copy[p1] = {
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				startTime = NowModule(),
				metadata = if Entry == nil then {} else table.clone(Entry.metadata)
			}
			
			if FFlagAXTTIEnableColdWarmDetection and p2 then
				Copy[p1].metadata.coldStart = not t[p1]
				t[p1] = true
			end
			return Copy
		end)
	end
end