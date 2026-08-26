local var1 = script:FindFirstAncestor("ultimate-list")
local dataSourceMethodsModule = require(var1.DataSources.DataSourceMethods)
local _ = require(var1.DataSources)
local _ = require(var1.Dimensions)
local exhaustiveMatchModule = require(var1.Util.exhaustiveMatch)

return function(p1, p2, p3, p4, p5)
	-- upvalues: exhaustiveMatchModule (ref), dataSourceMethodsModule (ref)
	local var2, var3, var4
	local function compareInView(p6)
		-- upvalues: p5 (ref), exhaustiveMatchModule (copy), p3 (ref), p4 (ref)
		local var5 = if p5 == "x" then p6.position.X.Offset elseif p5 == "y" then p6.position.Y.Offset else exhaustiveMatchModule(p5)
		
		return if var5 + (if p5 == "x" then p6.size.X.Offset elseif p5 == "y" then p6.size.Y.Offset else exhaustiveMatchModule(p5)) < p3 then "before" elseif p3 + p4 < var5 then "after" else "inside"
	end
	
	local var5 = 1
	local var6 = dataSourceMethodsModule.length(p1)
	local var7 = var6
	while var5 <= var7 do
		var2 = (var5 + var7) // 2
		var3 = dataSourceMethodsModule.get(p1, var2)
		assert(var3 ~= nil, "get() returned nil, meaning the length is inaccurate")
		var4 = compareInView(p2(var3.value, var2))
		
		if var4 == "after" then
			var7 = var2 - 1
		elseif var4 == "before" then
			var5 = var2 + 1
		elseif var4 ~= "inside" then
			exhaustiveMatchModule(var4)
			continue
		end
		local var8 = var2
		local var9 = var3
		while var8 > 1 do
			local var10 = var9.before()
			
			if var10 == nil or compareInView(p2(var10.value, var8 - 1)) ~= "inside" then break end
			var8 -= 1
			var9 = var10
		end
		local var11 = var2
		local var12 = var3
		while var11 < var6 do
			local var13 = var12.after()
			
			if var13 == nil or compareInView(p2(var13.value, var11 + 1)) ~= "inside" then break end
			var11 += 1
			var12 = var13
		end
		return Vector3.new(var8, var11)
	end
	return Vector3.new(0, 0, 0)
end