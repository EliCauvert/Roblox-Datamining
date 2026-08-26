local t = {}
local var1 = nil
local var2 = nil
local var3 = nil

function t.push(p1, p2)
	-- upvalues: var2 (write)
	local var4 = #p1 + 1
	p1[var4] = p2
	var2(p1, p2, var4)
end

function t.peek(p1)
	return p1[1]
end

function t.pop(p1)
	-- upvalues: var3 (write)
	local var4 = p1[1]
	
	if var4 == nil then
		return nil
	end
	local var5 = p1[#p1]
	p1[#p1] = nil
	
	if var5 ~= var4 then
		p1[1] = var5
		var3(p1, var5, 1)
	end
	return var4
end

var2 = function(p1, p2, p3)
	-- upvalues: var1 (write)
	local floored, var4
	while true do
		floored = math.floor(p3 / 2)
		var4 = p1[floored]
		if var4 ~= nil and var1(var4, p2) > 0 then
			return
		end
		p1[floored] = p2
		p1[p3] = var4
		_ = floored
	end
end

var3 = function(p4, p5, p6)
	-- upvalues: var1 (write)
	local var5, var6
	local p7Count = #p4
	while p6 < p7Count do
		local var7 = p6 * 2
		local var8 = p4[var7]
		var5 = var7 + 1
		var6 = p4[var5]
		
		if var8 == nil or var1(var8, p5) >= 0 then
			if var6 ~= nil and var1(var6, p5) < 0 then
				return
			end
			p4[p6] = var6
			p4[var5] = p5
			p6 = var5
		elseif var6 == nil or var1(var6, var8) >= 0 then
			p4[p6] = var8
			p4[var7] = p5
			p6 = var7
		else
			p4[p6] = var6
			p4[var5] = p5
			p6 = var5
		end
	end
end

var1 = function(p7, p8)
	local var9 = p7.sortIndex - p8.sortIndex
	
	return if var9 == 0 then p7.id - p8.id else var9
end

return t