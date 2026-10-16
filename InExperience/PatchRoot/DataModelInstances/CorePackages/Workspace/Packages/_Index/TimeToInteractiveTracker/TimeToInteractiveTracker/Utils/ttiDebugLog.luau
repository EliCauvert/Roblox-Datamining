local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.Stores.types)
local FFlagDebugTimeToInteractiveTrackerModule = require(script.Parent.FFlagDebugTimeToInteractiveTracker)

local function _(p1) --[[ Line: 9 | Named "formatPayload" ]]
	-- upvalues: HttpService (copy)
	if p1 == nil then
		return ""
	elseif type(p1) == "table" then
		local Success, Result = pcall(function() --[[ Line: 18 ]]
			-- upvalues: HttpService (upval), p1 (copy)
			return HttpService:JSONEncode(p1)
		end)
		
		return if Success then Result else tostring(p1)
	else
		return (tostring(p1))
	end
end

local function formatMilestones(List): string --[[ Line: 28 ]]
	if not List or #List == 0 then
		return ""
	end
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, ("  %s %.0fms%s"):format(value.name, value.deltaMs, if value.totalMemoryMB or value.luaHeapMB then (" [mem: total=%.1fMB lua=%.1fMB]"):format(value.totalMemoryMB or 0, value.luaHeapMB or 0) else ""))
		
		if value.subphases then
			for _, subphas in value.subphases do
				table.insert(List1, ("    -> %s %.0fms"):format(subphas.name, subphas.deltaMs or 0))
			end
		end
		if value.requests then
			for _, request in value.requests do
				table.insert(List1, ("    -> [req] %s %.0fms"):format(request.name, request.deltaMs or 0))
			end
		end
	end
	return "\n" .. table.concat(List1, "\n")
end

return function(p1, p2, p3, Input, p4) --[[ Line: 57 ]]
	-- upvalues: FFlagDebugTimeToInteractiveTrackerModule (copy), HttpService (copy), formatMilestones (copy)
	if not FFlagDebugTimeToInteractiveTrackerModule then return end
	local TimeToInteractiveTrackerName: string = ("[TimeToInteractiveTracker][%s]"):format(p1)
	local Text = nil
	
	if Input == nil then
		Text = ""
	elseif type(Input) == "table" then
		local Success, Result = pcall(function() --[[ Line: 18 ]]
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONEncode(Input)
		end)
		Text = if Success then Result else tostring(Input)
	else
		Text = tostring(Input)
	end
	local List = { TimeToInteractiveTrackerName, p2 }
	
	if p3 ~= nil then
		table.insert(List, ("%.0fms"):format(p3))
	end
	if Text ~= "" then
		table.insert(List, Text)
	end
	local FormatMilestonesResult = formatMilestones(p4)
	
	if FormatMilestonesResult ~= "" then
		table.insert(List, FormatMilestonesResult)
	end
	print(table.unpack(List))
end