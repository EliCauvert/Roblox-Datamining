local httpService = game:GetService("HttpService")
local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local _ = require(timeToInteractiveTracker.Stores.types)
local _ = require(timeToInteractiveTracker.Milestones.types)
local fFlagTTITrackerMemoryTrackingModule = require(script.Parent.FFlagTTITrackerMemoryTracking)

return {
	findLastMilestoneIndex = function(p0, p1) --[[ line: 33 ]]
		for i = #p0, 1, -1 do
			if p0[i].name ~= p1 then
				continue
			end
			return i
		end
		return nil
	end,
	deepCloneMilestones = function(p2) --[[ line: 42 ]]
		local cloned = table.clone(p2)
		
		for i, v in cloned do
			local cloned_1 = table.clone(v)
			
			if cloned_1.subphases then
				local cloned_2 = table.clone(cloned_1.subphases)
				
				for i_1, v_1 in cloned_2 do
					cloned_2[i_1] = table.clone(v_1)
				end
				cloned_1.subphases = cloned_2
			end
			if cloned_1.requests then
				local cloned_2 = table.clone(cloned_1.requests)
				
				for i_1, v_1 in cloned_2 do
					cloned_2[i_1] = table.clone(v_1)
				end
				cloned_1.requests = cloned_2
			end
			cloned[i] = cloned_1
		end
		return cloned
	end,
	encodeMilestonesJSON = function(p3) --[[ line: 65 ]]
		-- upvalues: httpService (ref)
		local ok, status = pcall(function() --[[ line: 66 ]]
			-- upvalues: httpService (copy), p3 (ref)
			return httpService:JSONEncode(p3)
		end)
		
		return if ok then status else nil
	end,
	milestonesToProto = function(p4) --[[ line: 81 ]]
		local t = {}
		
		for i, v in p4 do
			local t_1 = {
				name = v.name,
				timestamp_seconds = v.timestamp,
				delta_ms = v.deltaMs,
				total_memory_mb = v.totalMemoryMB,
				lua_heap_mb = v.luaHeapMB
			}
			
			if v.id then
				t_1.id = v.id
			end
			if v.subphases then
				local t_2 = {}
				
				for i_1, v_1 in v.subphases do
					table.insert(t_2, {
						name = v_1.name,
						timestamp_seconds = v_1.timestamp,
						delta_ms = v_1.deltaMs or 0
					})
				end
				t_1.subphases = t_2
			end
			if v.requests then
				local t_2 = {}
				
				for i_1, v_1 in v.requests do
					table.insert(t_2, {
						name = v_1.name,
						timestamp_seconds = v_1.timestamp,
						delta_ms = v_1.deltaMs or 0
					})
				end
				t_1.requests = t_2
			end
			table.insert(t, t_1)
		end
		return t
	end,
	generateMilestoneStats = function(p5, p6) --[[ line: 150 ]]
		-- upvalues: fFlagTTITrackerMemoryTrackingModule (ref)
		local t = {}
		
		for i, v in p6 do
			local text = p5 .. "_" .. (if v.id then v.name .. "__" .. v.id else v.name)
			local t_1 = { eventName = text, deltaMs = v.deltaMs }
			
			if fFlagTTITrackerMemoryTrackingModule then
				t_1.totalMemoryMB = v.totalMemoryMB
				t_1.luaHeapMB = v.luaHeapMB
			end
			table.insert(t, t_1)
			
			if v.subphases then
				for i_1, v_1 in v.subphases do
					table.insert(t, {
						eventName = text .. "_sp_" .. v_1.name,
						deltaMs = v_1.deltaMs or 0
					})
				end
			end
			if v.requests then
				for i_1, v_1 in v.requests do
					table.insert(t, {
						eventName = text .. "_rq_" .. v_1.name,
						deltaMs = v_1.deltaMs or 0
					})
				end
			end
		end
		return t
	end
}