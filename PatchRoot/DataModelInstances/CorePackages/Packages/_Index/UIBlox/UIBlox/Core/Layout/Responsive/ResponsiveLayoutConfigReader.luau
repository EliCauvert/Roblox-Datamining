-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent.Parent
local tModule = require(parent.t)
local array = require(parent.LuauPolyfill).Array

local function _(p0, p1) --[[ line: 28 | named "hasValue" ]]
	for i, v in p0 do
		if v == p1 then
			return true
		end
	end
	return false
end

local _ = function(p2, p3) --[[ line: 37 | named "matches" ]]
	if not p2 or not p3 then
		return true
	elseif typeof(p3) ~= "table" then
		return p3 == p2
	end
	for i, v in p3 do
		if v == p2 then
			return true
		end
	end
	return false
end

local function readValue(p4, p5, p6, p7, p8) --[[ line: 48 ]]
	-- upvalues: array (ref), readValue (ref)
	local var4 = p4[p7]
	local var5 = if var4 ~= nil then -1 else p8
	array.forEach(p4, function(p9) --[[ line: 51 ]]
		-- upvalues: p5 (ref), p6 (ref), readValue (copy), p7 (ref), p8 (ref), var5 (write), var4 (write)
		local var7
		local var6 = p5
		local breakpoint = p9.breakpoint
		
		if not var6 or not breakpoint then
			var7 = true
		elseif typeof(breakpoint) == "table" then
			for i, v in breakpoint do
				if v == var6 then
					var7 = true
				end
			end
			var7 = false
		else
			local _ = breakpoint == var6
		end
		if var7 then
			var6 = p6
			local kind = p9.kind
			
			if not var6 or not kind then
				var7 = true
			elseif typeof(kind) == "table" then
				for i, v in kind do
					if v == var6 then
						var7 = true
					end
				end
				var7 = false
			else
				var7 = kind == var6
				var7 = nil
			end
			if var7 then
				var7, var6 = readValue(p9, p5, p6, p7, p8 + 1)
				
				if var5 < var6 then
					var4 = var7
					var5 = var6
				end
			end
		end
	end)
	
	return var4, var5
end

local t = { name = "_default", min = 1e999, max = 0 }
local t_1 = {
	[tModule.strictInterface({ Scale = tModule.number, Offset = tModule.number })] = function(p10) --[[ line: 89 ]]
		return UDim.new(p10.Scale, p10.Offset)
	end
}

return {
	getValue = function(p11, p12) --[[ line: 95 ]]
		-- upvalues: array (ref), readValue (ref), t_1 (ref)
		local config = p11.config
		local breakpoint = p11.breakpoint
		local kind = p11.kind
		local var8 = config[p12]
		local var9 = if var8 ~= nil then -1 else 0
		local var10 = 0
		array.forEach(config, function(p13) --[[ line: 51 ]]
			-- upvalues: breakpoint (ref), kind (ref), readValue (copy), p12 (ref), var10 (ref), var9 (write), var8 (write)
			local var7
			local var6 = breakpoint
			local breakpoint = p13.breakpoint
			
			if not var6 or not breakpoint then
				var7 = true
			elseif typeof(breakpoint) == "table" then
				for i, v in breakpoint do
					if v == var6 then
						var7 = true
					end
				end
				var7 = false
			else
				local _ = breakpoint == var6
			end
			if var7 then
				var6 = kind
				local kind = p13.kind
				
				if not var6 or not kind then
					var7 = true
				elseif typeof(kind) == "table" then
					for i, v in kind do
						if v == var6 then
							var7 = true
						end
					end
					var7 = false
				else
					var7 = kind == var6
					var7 = nil
				end
				if var7 then
					var7, var6 = readValue(p13, breakpoint, kind, p12, var10 + 1)
					
					if var9 < var6 then
						var4 = var7
						var9 = var6
					end
				end
			end
		end)
		local var11 = var8
		local _ = var9
		
		for var8, var9 in t_1 do
			if var8(var11) then
				return var9(var11)
			end
		end
		return var11
	end,
	findBreakpoint = function(p14, p15) --[[ line: 69 ]]
		-- upvalues: array (ref), t (ref)
		local var12 = array.find(p14, function(p16) --[[ line: 70 ]]
			-- upvalues: p15 (ref)
			return type(p16) == "table" and (type(p16.breakpoint) == "string" and (p15 <= (p16.max or 1e999) and (p16.min or 0) <= p15))
		end)
		
		return if var12 then {
			name = var12.breakpoint,
			min = var12.min or 0,
			max = var12.max or 1e999
		} else t
	end
}