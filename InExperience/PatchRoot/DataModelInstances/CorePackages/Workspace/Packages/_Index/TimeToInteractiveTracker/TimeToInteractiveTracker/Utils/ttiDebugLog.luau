local httpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.Stores.types)
local fFlagDebugTimeToInteractiveTrackerModule = require(script.Parent.FFlagDebugTimeToInteractiveTracker)

local function _(p0) --[[ line: 9 | named "formatPayload" ]]
	-- upvalues: httpService (ref)
	if p0 == nil then
		return ""
	elseif type(p0) ~= "table" then
		return tostring(p0)
	end
	local ok, status = pcall(function() --[[ line: 18 ]]
		-- upvalues: httpService (copy), p0 (ref)
		return httpService:JSONEncode(p0)
	end)
	
	return if ok then status else tostring(p0)
end

local function formatMilestones(p1) --[[ line: 28 ]]
	if not p1 or #p1 == 0 then
		return ""
	end
	local t = {}
	
	for i, v in p1 do
		table.insert(t, ("  %s %.0fms%s"):format(v.name, v.deltaMs, if v.totalMemoryMB or v.luaHeapMB then (" [mem: total=%.1fMB lua=%.1fMB]"):format(v.totalMemoryMB or 0, v.luaHeapMB or 0) else ""))
		
		if v.subphases then
			for i_1, v_1 in v.subphases do
				table.insert(t, ("    -> %s %.0fms"):format(v_1.name, v_1.deltaMs or 0))
			end
		end
		if v.requests then
			for i_1, v_1 in v.requests do
				table.insert(t, ("    -> [req] %s %.0fms"):format(v_1.name, v_1.deltaMs or 0))
			end
		end
	end
	return "\n" .. table.concat(t, "\n")
end

return function(p2, p3, p4, p5, p6) --[[ line: 57 ]]
	-- upvalues: fFlagDebugTimeToInteractiveTrackerModule (ref), httpService (ref), formatMilestones (ref)
	if not fFlagDebugTimeToInteractiveTrackerModule then return end
	local var5
	local var4 = ("[TimeToInteractiveTracker][%s]"):format(p2)
	
	if p5 == nil then
		var5 = ""
	elseif type(p5) == "table" then
		local ok, status = pcall(function() --[[ line: 18 ]]
			-- upvalues: httpService (copy), p5 (ref)
			return httpService:JSONEncode(p5)
		end)
		var5 = if ok then status else tostring(p5)
	else
		var5 = tostring(p5)
	end
	local list = { var4, p3 }
	
	if p4 ~= nil then
		table.insert(list, ("%.0fms"):format(p4))
	end
	if var5 ~= "" then
		table.insert(list, var5)
	end
	local var7 = formatMilestones(p6)
	
	if var7 ~= "" then
		table.insert(list, var7)
	end
	print(table.unpack(list))
end