local function _(p1, p2): boolean
	return p1 ~= nil and (p2 ~= nil and math.abs(p1 - p2) < 0.5)
end

return {
	new = function()
		return { waited = 0, entries = setmetatable({}, { __mode = "k" }) }
	end,
	forget = function(p1, p2)
		p1.entries[p2] = nil
	end,
	step = function(p1, List, p2, p3, p4)
		local v1 = if p4 == nil then 2 else p4
		local Entries = p1.entries
		local Flag = true
		local t = {}
		
		for _, value in List do
			local Entry = Entries[value]
			
			if Entry == nil then
				local config = {
					min = 0,
					offset = nil,
					bias = 0,
					lastSize = nil,
					lastMin = nil,
					lastContent = nil,
					quiet = 0,
					corrected = false
				}
				Entries[value] = config
				Entry = config
			end
			local LastSize = p2[value] or 0
			local LastContent = p3[value] or 0
			local LastSize1 = Entry.lastSize
			local IsMagnitudeBelow: boolean = LastSize ~= nil and (LastSize1 ~= nil and math.abs(LastSize - LastSize1) < 0.5)
			
			if IsMagnitudeBelow then
				local Min = Entry.min
				local LastMin = Entry.lastMin
				IsMagnitudeBelow = Min ~= nil and (LastMin ~= nil and math.abs(Min - LastMin) < 0.5)
				
				if IsMagnitudeBelow then
					local LastContent1 = Entry.lastContent
					IsMagnitudeBelow = LastContent ~= nil and (LastContent1 ~= nil and math.abs(LastContent - LastContent1) < 0.5)
				end
			end
			Entry.quiet = if IsMagnitudeBelow then Entry.quiet + 1 else 0
			
			if Entry.quiet < v1 then
				Flag = false
			end
			Entry.lastSize = LastSize
			Entry.lastMin = Entry.min
			Entry.lastContent = LastContent
		end
		if Flag or p1.waited >= 8 then
			p1.waited = 0
			
			for _, value2 in List do
				local Entry = Entries[value2]
				local v2 = p2[value2] or 0
				local v3 = p3[value2] or 0
				
				if v1 <= Entry.quiet then
					if Entry.min <= 0 then
						Entry.bias = v2 - v3
					elseif v3 + Entry.bias < v2 - 0.5 then
						Entry.offset = v2 - Entry.min
					end
				end
				t[value2] = v3 + Entry.bias
			end
			local v4 = nil
			local v5 = -1e999
			
			for _, value3 in List do
				if v5 < t[value3] then
					v4 = value3
					v5 = t[value3]
				end
			end
			local Largests = {}
			local v6 = if v4 == nil then 0 elseif Entries[v4].min > 0 then v5 else p2[v4] or v5
			for _, value4 in List do
				local Entry = Entries[value4]
				local v7: boolean = Entry.min > 0 and (Entry.corrected and (p2[value4] or 0) > v6 + 0.5)
				
				if v7 then
					Entry.offset = nil
				end
				local Largest: number = if #List < 2 or value4 == v4 or v7 or v6 - 0.5 <= t[value4] then 0 else math.max(0.5, v6 - (Entry.offset or 0))
				Entry.corrected = Largest > 0 and Entry.offset ~= nil
				local Min: number = Entry.min
				
				if Largest == nil or (Min == nil or math.abs(Largest - Min) >= 0.5) then
					Flag = false
				end
				Entry.min = Largest
				Largests[value4] = Largest
			end
			return Largests, Flag
		else
			p1.waited += 1
			local Mins = {}
			
			for _, value1 in List do
				Mins[value1] = Entries[value1].min
			end
			return Mins, false
		end
	end
}