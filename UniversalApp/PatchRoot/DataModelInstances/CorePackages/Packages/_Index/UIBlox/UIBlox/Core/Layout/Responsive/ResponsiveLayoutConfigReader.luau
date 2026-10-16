local Parent = script.Parent.Parent.Parent.Parent.Parent
local TModule = require(Parent.t)
local Array = require(Parent.LuauPolyfill).Array

local function _(List, p1): boolean --[[ Line: 28 | Named "hasValue" ]]
	for _, value in List do
		if value == p1 then
			return true
		end
	end
	return false
end

local _ = function(p2, List): boolean --[[ Line: 37 | Named "matches" ]]
	if not p2 or not List then
		return true
	end
	if typeof(List) ~= "table" then
		return List == p2
	end
	for _, value in List do
		if value == p2 then
			return true
		end
	end
	return false
end

local function readValue(p3, Breakpoint, Kind, p4, p5) --[[ Line: 48 ]]
	-- upvalues: Array (copy), readValue (copy)
	local v1 = p3[p4]
	local v2 = if v1 == nil then -1 else p5
	Array.forEach(p3, function(p6) --[[ Line: 51 ]]
		-- upvalues: Breakpoint (copy), Kind (copy), readValue (upval), p4 (copy), p5 (copy), v2 (ref), v1 (ref)
		local Breakpoint = p6.breakpoint
		local Flag = nil
		
		if Breakpoint and Breakpoint then
			if typeof(Breakpoint) == "table" then
				Flag = false
				
				for _, value in Breakpoint do
					if value == Breakpoint then
						Flag = true
						break
					end
				end
			else
				Flag = Breakpoint == Breakpoint
			end
		else
			Flag = true
		end
		if Flag then
			local Kind = p6.kind
			local Flag1 = nil
			
			if Kind and Kind then
				if typeof(Kind) == "table" then
					Flag1 = false
					
					for _, value1 in Kind do
						if value1 == Kind then
							Flag1 = true
							break
						end
					end
				else
					Flag1 = Kind == Kind
				end
			else
				Flag1 = true
			end
			if Flag1 then
				local v3, v4 = readValue(p6, Breakpoint, Kind, p4, p5 + 1)
				
				if v2 < v4 then
					v1 = v3
					v2 = v4
				end
			end
		end
	end)
	
	return v1, v2
end

local config = { name = "_default", min = 1e999, max = 0 }
local config1 = {
	[TModule.strictInterface({ Scale = TModule.number, Offset = TModule.number })] = function(p7): UDim --[[ Line: 89 ]]
		return UDim.new(p7.Scale, p7.Offset)
	end
}

return {
	getValue = function(p7, p8) --[[ Line: 95 ]]
		-- upvalues: Array (copy), readValue (copy), config1 (copy)
		local Config = p7.config
		local Breakpoint = p7.breakpoint
		local Kind = p7.kind
		local Entry = Config[p8]
		local v5: number = if Entry == nil then -1 else 0
		local v6 = 0
		Array.forEach(Config, function(p9) --[[ Line: 51 ]]
			-- upvalues: Breakpoint (copy), Kind (copy), readValue (upval), p8 (copy), v6 (copy), v5 (ref), Entry (ref)
			local Breakpoint = p9.breakpoint
			local Flag = nil
			
			if Breakpoint and Breakpoint then
				if typeof(Breakpoint) == "table" then
					Flag = false
					
					for _, value in Breakpoint do
						if value == Breakpoint then
							Flag = true
							break
						end
					end
				else
					Flag = Breakpoint == Breakpoint
				end
			else
				Flag = true
			end
			if Flag then
				local Kind = p9.kind
				local Flag1 = nil
				
				if Kind and Kind then
					if typeof(Kind) == "table" then
						Flag1 = false
						
						for _, value1 in Kind do
							if value1 == Kind then
								Flag1 = true
								break
							end
						end
					else
						Flag1 = Kind == Kind
					end
				else
					Flag1 = true
				end
				if Flag1 then
					local v7, v8 = readValue(p9, Breakpoint, Kind, p8, v6 + 1)
					
					if v5 < v8 then
						Entry = v7
						v5 = v8
					end
				end
			end
		end)
		local Entry1 = Entry
		
		for i, value in config1 do
			if i(Entry1) then
				return value(Entry1)
			end
		end
		return Entry1
	end,
	findBreakpoint = function(p10, p11) --[[ Line: 69 ]]
		-- upvalues: Array (copy), config (copy)
		local FindResult = Array.find(p10, function(p12): boolean --[[ Line: 70 ]]
			-- upvalues: p11 (copy)
			return type(p12) == "table" and (type(p12.breakpoint) == "string" and p11 <= (p12.max or 1e999)) and (p12.min or 0) <= p11
		end)
		
		return if FindResult then {
			name = FindResult.breakpoint,
			min = FindResult.min or 0,
			max = FindResult.max or 1e999
		} else config
	end
}