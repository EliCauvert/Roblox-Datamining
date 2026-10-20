local config = {
	AMS = "Amsterdam",
	ATL = "Atlanta",
	BOM = "Mumbai",
	CDG = "Paris",
	DFW = "Dallas",
	FRA = "Frankfurt",
	GRU = "São Paulo",
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

local function _(p1: number): boolean
	return type(p1) == "number" and p1 >= 0 and p1 < 1e999
end

return {
	buildRoster = function(List, PopCode)
		local t = {}
		local List1 = {}
		
		for _, value in ipairs(List) do
			local PopCode1 = value.popCode
			
			if type(PopCode1) == "string" and PopCode1 ~= "" then
				local Entry = t[PopCode1]
				local Entry1 = Entry or { popCode = PopCode1 }
				
				if not Entry then
					t[PopCode1] = Entry1
					table.insert(List1, Entry1)
				end
				local RttMs: number = value.rttMs
				
				if type(RttMs) == "number" and (RttMs >= 0 and RttMs < 1e999) and (Entry1.rttMs == nil or RttMs < Entry1.rttMs) then
					Entry1.rttMs = RttMs
				end
			end
		end
		if PopCode ~= "" and t[PopCode] == nil then
			table.insert(List1, { popCode = PopCode })
		end
		table.sort(List1, function(A, B): boolean
			return if A.rttMs == nil or B.rttMs == nil then A.rttMs ~= nil or B.rttMs == nil and A.popCode < B.popCode elseif A.rttMs == B.rttMs then A.popCode < B.popCode else A.rttMs < B.rttMs
		end)
		
		return List1
	end,
	getDisplayCode = function(Text: string): string
		return string.upper(Text)
	end,
	getLocationName = function(Text: string)
		-- upvalues: config (copy)
		local Uppered = string.upper(Text)
		local Match: string? = string.match(Uppered, "^([A-Z][A-Z][A-Z])%d*$")
		
		return Match and config[Match] or Uppered
	end,
	formatPing = function(p1: number): string
		if p1 == nil or (type(p1) ~= "number" or (p1 < 0 or p1 >= 1e999)) then
			return "Ping unavailable"
		else
			return (string.format("%.0f ms", (math.floor(p1 + 0.5))))
		end
	end,
	getVisibleRoster = function(Tbl, PopCode, p1)
		if p1 then
			return table.clone(Tbl)
		end
		local List = {}
		
		for i, value in ipairs(Tbl) do
			if i <= 5 or value.popCode == PopCode then
				table.insert(List, value)
			end
		end
		return List
	end
}