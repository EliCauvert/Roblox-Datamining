local parent = script.Parent.Parent.Parent.Parent.Parent
local tModule = require(parent.t)
local array = require(parent.LuauPolyfill).Array

local function _(p1, p2)
	for i, v in p1 do
		if v == p2 then
			return true
		end
	end
	return false
end

local _ = function(p3, p4)
	if not p3 or not p4 then
		return true
	elseif typeof(p4) ~= "table" then
		return p4 == p3
	end
	for i, v in p4 do
		if v == p3 then
			return true
		end
	end
	return false
end

local function readValue(p5, p6, p7, p8, p9)
	-- upvalues: array (ref), readValue (ref)
	local var1 = p5[p8]
	local var2 = if var1 ~= nil then -1 else p9
	array.forEach(p5, function(p10)
		-- upvalues: p6 (ref), p7 (ref), readValue (copy), p8 (ref), p9 (ref), var2 (write), var1 (write)
		local var3
		local var4 = p6
		local breakpoint = p10.breakpoint
		
		if not var4 or not breakpoint then
			var3 = true
		elseif typeof(breakpoint) == "table" then
			for i, v in breakpoint do
				if v == var4 then
					var3 = true
				end
			end
			var3 = false
		else
			local _ = breakpoint == var4
		end
		if var3 then
			var4 = p7
			local kind = p10.kind
			
			if not var4 or not kind then
				var3 = true
			elseif typeof(kind) == "table" then
				for i, v in kind do
					if v == var4 then
						var3 = true
					end
				end
				var3 = false
			else
				var3 = kind == var4
				var3 = nil
			end
			if var3 then
				var3, var6 = readValue(p10, p6, p7, p8, p9 + 1)
				
				if var2 < var4 then
					var1 = var3
					var2 = var4
				end
			end
		end
	end)
	
	return var1, var2
end

local t = { name = "_default", min = 1e999, max = 0 }
local t_1 = {
	[tModule.strictInterface({ Scale = tModule.number, Offset = tModule.number })] = function(p11)
		return UDim.new(p11.Scale, p11.Offset)
	end
}

return {
	getValue = function(p11, p12)
		-- upvalues: array (ref), readValue (ref), t_1 (ref)
		local config = p11.config
		local breakpoint = p11.breakpoint
		local kind = p11.kind
		local var5 = config[p12]
		local var6 = if var5 ~= nil then -1 else 0
		local var7 = 0
		array.forEach(config, function(p13)
			-- upvalues: breakpoint (ref), kind (ref), readValue (copy), p12 (ref), var7 (ref), var6 (write), var5 (write)
			local var8
			local var9 = breakpoint
			local breakpoint = p13.breakpoint
			
			if not var9 or not breakpoint then
				var8 = true
			elseif typeof(breakpoint) == "table" then
				for i, v in breakpoint do
					if v == var9 then
						var8 = true
					end
				end
				var8 = false
			else
				local _ = breakpoint == var9
			end
			if var8 then
				var9 = kind
				local kind = p13.kind
				
				if not var9 or not kind then
					var8 = true
				elseif typeof(kind) == "table" then
					for i, v in kind do
						if v == var9 then
							var8 = true
						end
					end
					var8 = false
				else
					var8 = kind == var9
					var8 = nil
				end
				if var8 then
					var8, var6 = readValue(p13, breakpoint, kind, p12, var7 + 1)
					
					if var6 < var9 then
						var1 = var8
						var6 = var9
					end
				end
			end
		end)
		local var10 = var5
		local _ = var6
		
		for var5, var6 in t_1 do
			if var5(var10) then
				return var6(var10)
			end
		end
		return var10
	end,
	findBreakpoint = function(p14, p15)
		-- upvalues: array (ref), t (ref)
		local var11 = array.find(p14, function(p16)
			-- upvalues: p15 (ref)
			return type(p16) == "table" and (type(p16.breakpoint) == "string" and (p15 <= (p16.max or 1e999) and (p16.min or 0) <= p15))
		end)
		
		return if var11 then {
			name = var11.breakpoint,
			min = var11.min or 0,
			max = var11.max or 1e999
		} else t
	end
}