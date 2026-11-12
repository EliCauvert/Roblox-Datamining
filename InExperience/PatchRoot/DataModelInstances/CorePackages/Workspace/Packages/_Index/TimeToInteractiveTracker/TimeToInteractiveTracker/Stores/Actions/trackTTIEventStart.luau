local _ = require(script.Parent.Parent.types)
local NowModule = require(script.Parent.Parent.Parent.Utils.now)
local FFlagLuaAppNavTTIMeasurementV2 = require(script:FindFirstAncestor("TimeToInteractiveTracker").Parent.SharedFlags).FFlagLuaAppNavTTIMeasurementV2

return function(Callback, p1)
	-- upvalues: FFlagLuaAppNavTTIMeasurementV2 (copy), NowModule (copy)
	local t = {}
	
	return function(Key, p2)
		-- upvalues: FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (copy), Callback (copy), NowModule (upval), t (copy)
		if FFlagLuaAppNavTTIMeasurementV2 and p1 then
			p1[Key] = nil
		end
		Callback(function(Tbl)
			-- upvalues: Key (copy), NowModule (upval), p2 (copy), t (upval)
			local Entry = Tbl[Key]
			local Copy = table.clone(Tbl)
			Copy[Key] = {
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				startTime = NowModule(),
				metadata = if Entry == nil then {} else table.clone(Entry.metadata)
			}
			
			if p2 then
				Copy[Key].metadata.coldStart = not t[Key]
				t[Key] = true
			end
			return Copy
		end)
	end
end