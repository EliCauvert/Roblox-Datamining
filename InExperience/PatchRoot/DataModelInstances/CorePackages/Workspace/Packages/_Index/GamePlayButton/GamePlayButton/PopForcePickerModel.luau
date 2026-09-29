local t = {
	AMS = "Amsterdam",
	ATL = "Atlanta",
	BOM = "Mumbai",
	CDG = "Paris",
	DFW = "Dallas",
	FRA = "Frankfurt",
	GRU = "S\195\163o Paulo",
	HKG = "Hong Kong",
	IAD = "Washington, DC",
	ICN = "Seoul",
	LAX = "Los Angeles",
	LHR = "London",
	NRT = "Tokyo",
	ORD = "Chicago",
	SEA = "Seattle",
	SFO = "San Francisco",
	SIN = "Singapore",
	SJC = "San Jose",
	SYD = "Sydney"
}

local function _(p1)
	return type(p1) == "number" and (p1 >= 0 and p1 < 1e999)
end

return {
	buildRoster = function(p1, p2)
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p1) do
			local popCode = v.popCode
			
			if type(popCode) == "string" and popCode ~= "" then
				local var1 = t[popCode]
				local var2 = var1 or { popCode = popCode }
				
				if not var1 then
					t[popCode] = var2
					table.insert(t_1, var2)
				end
				local rttMs = v.rttMs
				
				if (type(rttMs) == "number" and (rttMs >= 0 and rttMs < 1e999)) and (var2.rttMs == nil or rttMs < var2.rttMs) then
					var2.rttMs = rttMs
				end
			end
		end
		if p2 ~= "" and t[p2] == nil then
			table.insert(t_1, { popCode = p2 })
		end
		table.sort(t_1, function(p3, p4)
			return if p3.rttMs == nil or p4.rttMs == nil then if p3.rttMs == nil then p4.rttMs == nil and p3.popCode < p4.popCode else true elseif p3.rttMs == p4.rttMs then p3.popCode < p4.popCode else p3.rttMs < p4.rttMs
		end)
		
		return t_1
	end,
	getDisplayCode = function(p3)
		return string.upper(p3)
	end,
	getLocationName = function(p3)
		-- upvalues: t (ref)
		local upperText = string.upper(p3)
		local match = string.match(upperText, "^([A-Z][A-Z][A-Z])%d*$")
		
		return if match then t[match] or upperText else upperText
	end,
	formatPing = function(p3)
		return if p3 == nil or not (type(p3) == "number" and (p3 >= 0 and p3 < 1e999)) then "Ping unavailable" else string.format("%.0f ms", math.floor(p3 + 0.5))
	end,
	getVisibleRoster = function(p3, p4, p5)
		if p5 then
			return table.clone(p3)
		end
		local t = {}
		
		for i, v in ipairs(p3) do
			if i <= 5 or v.popCode == p4 then
				table.insert(t, v)
			end
		end
		return t
	end
}