local SduiRuntimeFlagNames = game:DefineFastString("SduiRuntimeFlagNames", "")
local v1 = nil
local Count = 0

local function getNames()
	-- upvalues: v1 (ref), Count (ref), SduiRuntimeFlagNames (copy)
	if v1 ~= nil then
		return v1, Count
	end
	local List = {}
	local t = {}
	
	for _, value in string.split(SduiRuntimeFlagNames, ",") do
		local Match: string = string.match(value, "^%s*(.-)%s*$") or ""
		
		if Match ~= "" and not t[Match] then
			if #List >= 16 or #Match > 128 or string.match(Match, "^[A-Za-z0-9_]+$") == nil then
				Count += 1
			else
				t[Match] = true
				table.insert(List, Match)
			end
		end
	end
	table.sort(List)
	v1 = List
	
	return List, Count
end

return function(Callback)
	-- upvalues: getNames (copy)
	local Names, Names2 = getNames()
	local t = {}
	local Count = 0
	
	for _, name in Names do
		local CallbackResult, CallbackResult2 = Callback(name)
		
		if CallbackResult and type(CallbackResult2) == "boolean" then
			t[name] = CallbackResult2
		else
			Count += 1
		end
	end
	return t, Names2, Count
end