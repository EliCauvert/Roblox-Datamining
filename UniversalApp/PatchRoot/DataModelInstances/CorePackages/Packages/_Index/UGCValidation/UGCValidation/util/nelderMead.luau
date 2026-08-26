local floatVectorModule = require(script.Parent.Parent.util.FloatVector)
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: t (ref), floatVectorModule (ref)
	local tbl = setmetatable({}, t)
	
	if p1 and #p1 > 0 then
		local var1 = p1[1]
		
		for i, v in p1 do
			if not var1:checkCompatible(v) then
				error("initial simplex has vectors that are not compatible")
			end
		end
	else
		error("must provide an initial simplex")
	end
	tbl.simplex = {}
	
	for i, v in p1 do
		table.insert(tbl.simplex, floatVectorModule.new(v))
	end
	tbl.objectFunction = p2
	tbl.terminateFunction = p3
	
	return tbl
end

function t:evaluate()
	-- upvalues: floatVectorModule (ref)
	local simplex = self.simplex
	local t = {}
	
	local _ = function(p4)
		-- upvalues: t (write), self (ref)
		local var2 = t[p4]
		
		if not var2 then
			var2 = self.objectFunction(p4)
			t[p4] = var2
		end
		return var2
	end
	
	local var2 = 0
	while not self.terminateFunction(simplex, var2) do
		t = {}
		table.sort(simplex, function(p4, p5)
			-- upvalues: t (write), self (ref)
			local var3 = t[p4]
			
			if not var3 then
				var3 = self.objectFunction(p4)
				t[p4] = var3
			end
			local var4 = t[p5]
			
			if not var4 then
				var4 = self.objectFunction(p5)
				t[p5] = var4
			end
			return var3 < var4
		end)
		local var3 = simplex[#simplex]
		local t_1 = {}
		
		for _ = 1, simplex[1]:getSize() do
			table.insert(t_1, 0)
		end
		local i
		local var4 = floatVectorModule.new(t_1)
		
		for i = 1, #simplex - 1 do
			var4 += simplex[i]
		end
		local var5 = var4 / (#simplex - 1) - var3
		var10 = var3 + var5 * 2
		local var6 = t[var10]
		
		if not var6 then
			var6 = self.objectFunction(var10)
			t[var10] = var6
		end
		i = var6
		local var7 = simplex[1]
		local var8 = t[var7]
		
		if not var8 then
			var8 = self.objectFunction(var7)
			t[var7] = var8
		end
		if var8 < i then
			local var9 = simplex[#simplex - 1]
			var8 = t[var9]
			
			if not var8 then
				var8 = self.objectFunction(var9)
				t[var9] = var8
			end
			if i < var8 then
				simplex[#simplex] = var10
			else
				local var10 = simplex[1]
				var8 = t[var10]
				
				if not var8 then
					var8 = self.objectFunction(var10)
					t[var10] = var8
				end
				if i < var8 then
					local var11 = var10 + var5
					var8 = t[var11]
					
					if not var8 then
						var8 = self.objectFunction(var11)
						t[var11] = var8
					end
					if var8 < i then
						simplex[#simplex] = var11
					else
						simplex[#simplex] = var10
					end
				else
					local var12 = var3 + var5 * 0.5
					local var13 = var3 + var5 * 1.5
					var8 = nil
					local var14 = t[var12]
					
					if not var14 then
						var14 = self.objectFunction(var12)
						t[var12] = var14
					end
					local var15 = t[var13]
					
					if not var15 then
						var15 = self.objectFunction(var13)
						t[var13] = var15
					end
					var8 = if var14 < var15 then var12 else var13
					var15 = t[var8]
					
					if not var15 then
						var15 = self.objectFunction(var8)
						t[var8] = var15
					end
					var15 = simplex[#simplex - 1]
					local var16 = t[var15]
					
					if not var16 then
						var16 = self.objectFunction(var15)
						t[var15] = var16
					end
					if var15 < var16 then
						simplex[#simplex] = var8
					else
						for var15 = 1, #simplex do
							simplex[var15] = (simplex[var15] - simplex[1]) * 0.8 + simplex[1]
						end
					end
				end
			end
			var2 += 1
		end
	end
end

function t:calculateMaxLengthBetweenVertices()
	local var17 = 0
	
	for i_1 = 1, #self - 1 do
		for i = i_1 + 1, #self do
			var17 = math.max(var17, (self[i] - self[i_1]):magnitude())
		end
	end
	return var17
end

return t