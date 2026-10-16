local HttpService = game:GetService("HttpService")
local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local _ = require(TimeToInteractiveTracker.Stores.types)
local _ = require(TimeToInteractiveTracker.Milestones.types)
local FFlagTTITrackerMemoryTrackingModule = require(script.Parent.FFlagTTITrackerMemoryTracking)
local t = {}
local t1 = {}

for _, value in require(TimeToInteractiveTracker.Milestones.constants) do
	if type(value) == "string" then
		t[value] = true
	else
		t[value.Name] = true
		
		for _, value1 in value.Subphase do
			t1[value1] = true
		end
	end
end
local function _(Text: string) --[[ Line: 35 | Named "sanitizeIdSegment" ]]
	return Text:gsub("[^%w_%-]", "_"):sub(1, 40)
end

return {
	findLastMilestoneIndex = function(p1, Name): number? --[[ Line: 55 ]]
		for i = #p1, 1, -1 do
			if p1[i].name == Name then
				return i
			end
		end
		return nil
	end,
	deepCloneMilestones = function(Tbl) --[[ Line: 64 ]]
		local Copy = table.clone(Tbl)
		
		for i, value in Copy do
			local Copy1 = table.clone(value)
			
			if Copy1.subphases then
				local Copy2 = table.clone(Copy1.subphases)
				
				for i1, value1 in Copy2 do
					Copy2[i1] = table.clone(value1)
				end
				Copy1.subphases = Copy2
			end
			if Copy1.requests then
				local Copy3 = table.clone(Copy1.requests)
				
				for i2, value2 in Copy3 do
					Copy3[i2] = table.clone(value2)
				end
				Copy1.requests = Copy3
			end
			Copy[i] = Copy1
		end
		return Copy
	end,
	encodeMilestonesJSON = function(Input) --[[ Line: 87 ]]
		-- upvalues: HttpService (copy)
		local Success, Result = pcall(function() --[[ Line: 88 ]]
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONEncode(Input)
		end)
		
		return if Success then Result else nil
	end,
	milestonesToProto = function(List) --[[ Line: 103 ]]
		local List1 = {}
		
		for _, value in List do
			local config = {
				name = value.name,
				timestamp_seconds = value.timestamp,
				delta_ms = value.deltaMs,
				total_memory_mb = value.totalMemoryMB,
				lua_heap_mb = value.luaHeapMB
			}
			
			if value.id then
				config.id = value.id
			end
			if value.subphases then
				local Subphases = {}
				
				for _, subphas in value.subphases do
					table.insert(Subphases, {
						name = subphas.name,
						timestamp_seconds = subphas.timestamp,
						delta_ms = subphas.deltaMs or 0
					})
				end
				config.subphases = Subphases
			end
			if value.requests then
				local Requests = {}
				
				for _, request in value.requests do
					table.insert(Requests, {
						name = request.name,
						timestamp_seconds = request.timestamp,
						delta_ms = request.deltaMs or 0
					})
				end
				config.requests = Requests
			end
			table.insert(List1, config)
		end
		return List1
	end,
	generateMilestoneStats = function(Text, List) --[[ Line: 172 ]]
		-- upvalues: FFlagTTITrackerMemoryTrackingModule (copy)
		local List1 = {}
		
		for _, value in List do
			local Text1 = Text .. "_" .. (if value.id then value.name .. "__" .. value.id else value.name)
			local config = { eventName = Text1, deltaMs = value.deltaMs }
			
			if FFlagTTITrackerMemoryTrackingModule then
				config.totalMemoryMB = value.totalMemoryMB
				config.luaHeapMB = value.luaHeapMB
			end
			table.insert(List1, config)
			
			if value.subphases then
				for _, subphas in value.subphases do
					table.insert(List1, {
						eventName = Text1 .. "_sp_" .. subphas.name,
						deltaMs = subphas.deltaMs or 0
					})
				end
			end
			if value.requests then
				for _, request in value.requests do
					table.insert(List1, {
						eventName = Text1 .. "_rq_" .. request.name,
						deltaMs = request.deltaMs or 0
					})
				end
			end
		end
		return List1
	end,
	milestonesToPointsFields = function(List) --[[ Line: 240 ]]
		-- upvalues: t (copy), FFlagTTITrackerMemoryTrackingModule (copy), t1 (copy)
		local LuaHeapMBs = {}
		
		for _, value in List do
			if t[value.name] then
				local Text = "ms_" .. value.name .. (if value.id == nil or value.id == "" then "" else "__" .. value.id:gsub("[^%w_%-]", "_"):sub(1, 40))
				LuaHeapMBs[Text] = value.deltaMs
				
				if FFlagTTITrackerMemoryTrackingModule then
					if value.totalMemoryMB then
						LuaHeapMBs[Text .. "_total_memory_mb"] = value.totalMemoryMB
					end
					if value.luaHeapMB then
						LuaHeapMBs[Text .. "_lua_heap_mb"] = value.luaHeapMB
					end
				end
				if value.subphases then
					for _, subphas in value.subphases do
						if t1[subphas.name] then
							LuaHeapMBs[Text .. "_sp_" .. subphas.name] = subphas.deltaMs or 0
						end
					end
				end
			end
		end
		return LuaHeapMBs
	end
}