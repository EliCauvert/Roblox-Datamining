local t = {}
local var1 = nil
local var2 = nil
local var3 = nil

function t.push(p0, p1)
	-- upvalues: var2 (write)
	local var4 = #p0 + 1
	p0[var4] = p1
	var2(p0, p1, var4)
end

function t.peek(p2)
	return p2[1]
end

function t.pop(p3)
	-- upvalues: var3 (write)
	local var5 = p3[1]
	
	if var5 == nil then
		return nil
	end
	local var6 = p3[#p3]
	p3[#p3] = nil
	
	if var6 ~= var5 then
		p3[1] = var6
		var3(p3, var6, 1)
	end
	return var5
end

var2 = function(p4, p5, p6)
	-- upvalues: var1 (write)
	local floored, var8
	while true do
		floored = math.floor(p6 / 2)
		var8 = p4[floored]
		if var8 ~= nil and var1(var8, p5) > 0 then
			return
		end
		p4[floored] = p5
		p4[p6] = var8
		_ = floored
	end
end

var3 = function(p7, p8, p9)
	-- upvalues: var1 (write)
	local var12, var13
	local p7Count = #p7
	while p9 < p7Count do
		local var10 = p9 * 2
		local var11 = p7[var10]
		var12 = var10 + 1
		var13 = p7[var12]
		
		if var11 == nil or var1(var11, p8) >= 0 then
			if var13 ~= nil and var1(var13, p8) < 0 then
				return
			end
			p7[p9] = var13
			p7[var12] = p8
			p9 = var12
		elseif var13 == nil or var1(var13, var11) >= 0 then
			p7[p9] = var11
			p7[var10] = p8
			p9 = var10
		else
			p7[p9] = var13
			p7[var12] = p8
			p9 = var12
		end
	end
end

var1 = function(p10, p11)
	local var14 = p10.sortIndex - p11.sortIndex
	
	return if var14 == 0 then p10.id - p11.id else var14
end

return t