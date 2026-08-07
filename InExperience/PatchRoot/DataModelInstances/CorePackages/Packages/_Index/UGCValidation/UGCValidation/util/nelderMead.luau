local floatVectorModule = require(script.Parent.Parent.util.FloatVector)
local t = {}
t.__index = t

function t.new(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: t (ref), floatVectorModule (ref)
	local tbl = setmetatable({}, t)
	
	if p0 and #p0 > 0 then
		local var3 = p0[1]
		
		for i, v in p0 do
			if not var3:checkCompatible(v) then
				error("initial simplex has vectors that are not compatible")
			end
		end
	else
		error("must provide an initial simplex")
	end
	tbl.simplex = {}
	
	for i, v in p0 do
		table.insert(tbl.simplex, floatVectorModule.new(v))
	end
	tbl.objectFunction = p1
	tbl.terminateFunction = p2
	
	return tbl
end

function t:evaluate() --[[ line: 51 ]]
	-- upvalues: floatVectorModule (ref)
	local simplex = self.simplex
	local t = {}
	
	local _ = function(p3) --[[ line: 55 ]]
		-- upvalues: t (write), self (ref)
		local var22 = t[p3]
		
		if not var22 then
			var22 = self.objectFunction(p3)
			t[p3] = var22
		end
		return var22
	end
	
	local var5 = 0
	while not self.terminateFunction(simplex, var5) do
		t = {}
		table.sort(simplex, function(p4, p5) --[[ line: 68 ]]
			-- upvalues: t (write), self (ref)
			local var23 = t[p4]
			
			if not var23 then
				var23 = self.objectFunction(p4)
				t[p4] = var23
			end
			local var24 = t[p5]
			
			if not var24 then
				var24 = self.objectFunction(p5)
				t[p5] = var24
			end
			return var23 < var24
		end)
		local var6 = simplex[#simplex]
		local t_1 = {}
		
		for _ = 1, simplex[1]:getSize() do
			table.insert(t_1, 0)
		end
		local i
		local var8 = floatVectorModule.new(t_1)
		
		for i = 1, #simplex - 1 do
			var8 += simplex[i]
		end
		local var9 = var8 / (#simplex - 1) - var6
		var10 = var6 + var9 * 2
		local var11 = t[var10]
		
		if not var11 then
			var11 = self.objectFunction(var10)
			t[var10] = var11
		end
		i = var11
		local var12 = simplex[1]
		local var13 = t[var12]
		
		if not var13 then
			var13 = self.objectFunction(var12)
			t[var12] = var13
		end
		if var13 < i then
			local var14 = simplex[#simplex - 1]
			var13 = t[var14]
			
			if not var13 then
				var13 = self.objectFunction(var14)
				t[var14] = var13
			end
			if i < var13 then
				simplex[#simplex] = var10
			else
				local var15 = simplex[1]
				var13 = t[var15]
				
				if not var13 then
					var13 = self.objectFunction(var15)
					t[var15] = var13
				end
				if i < var13 then
					local var16 = var10 + var9
					var13 = t[var16]
					
					if not var13 then
						var13 = self.objectFunction(var16)
						t[var16] = var13
					end
					if var13 < i then
						simplex[#simplex] = var16
					else
						simplex[#simplex] = var10
					end
				else
					local var17 = var6 + var9 * 0.5
					local var18 = var6 + var9 * 1.5
					var13 = nil
					local var19 = t[var17]
					
					if not var19 then
						var19 = self.objectFunction(var17)
						t[var17] = var19
					end
					local var20 = t[var18]
					
					if not var20 then
						var20 = self.objectFunction(var18)
						t[var18] = var20
					end
					var13 = if var19 < var20 then var17 else var18
					var20 = t[var13]
					
					if not var20 then
						var20 = self.objectFunction(var13)
						t[var13] = var20
					end
					var20 = simplex[#simplex - 1]
					local var21 = t[var20]
					
					if not var21 then
						var21 = self.objectFunction(var20)
						t[var20] = var21
					end
					if var20 < var21 then
						simplex[#simplex] = var13
					else
						for var20 = 1, #simplex do
							simplex[var20] = (simplex[var20] - simplex[1]) * 0.8 + simplex[1]
						end
					end
				end
			end
			var5 += 1
		end
	end
end

function t:calculateMaxLengthBetweenVertices() --[[ line: 122 ]]
	local var25 = 0
	
	for i_1 = 1, #self - 1 do
		for i = i_1 + 1, #self do
			var25 = math.max(var25, (self[i] - self[i_1]):magnitude())
		end
	end
	return var25
end

return t