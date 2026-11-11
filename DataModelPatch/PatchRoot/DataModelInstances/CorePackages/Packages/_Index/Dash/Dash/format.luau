local Parent = script.Parent
local FormatValueModule = require(Parent.formatValue)
local SplitOnModule = require(Parent.splitOn)
local StartsWithModule = require(Parent.startsWith)
local ConcatFunction = table.concat
local InsertFunction = table.insert

return function(p1, ...)
	-- upvalues: SplitOnModule (copy), InsertFunction (copy), StartsWithModule (copy), FormatValueModule (copy), ConcatFunction (copy)
	local list = { ... }
	local Count = 1
	local v1, v2 = SplitOnModule(p1, "{[^{}]*}")
	local t = {}
	
	for i, Text in v1 do
		InsertFunction(t, (Text:gsub("{{", "{"):gsub("}}", "}")))
		local Segment = v2[i] and v2[i]:sub(2, -2)
		
		if Segment then
			local v3 = Text:gmatch("{+$")()
			
			if v3 and #v3 % 2 == 1 then
				InsertFunction(t, Segment)
				continue
			end
			local v4 = SplitOnModule(Segment, ":")
			local v5 = StartsWithModule(v4[1], "#")
			local Segment1 = v5 and v4[1]:sub(2) or v4[1]
			local Number: number? = tonumber(Segment1)
			local v6 = v4[2]
			local Count1 = "nil"
			
			if Number then
				Count1 = list[Number]
			elseif Segment1:len() > 0 then
				local Entry = list[1] and list[1][Segment1]
				
				if Entry ~= nil then
					Count1 = Entry
				end
			else
				Count1 = list[Count]
				Count += 1
			end
			if v5 then
				Count1 = #Count1
			end
			InsertFunction(t, FormatValueModule(Count1, v6 or ""))
		end
	end
	return ConcatFunction(t, "")
end