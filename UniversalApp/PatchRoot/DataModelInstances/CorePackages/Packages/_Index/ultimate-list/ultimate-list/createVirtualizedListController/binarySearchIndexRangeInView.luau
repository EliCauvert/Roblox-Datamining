local var0 = script:FindFirstAncestor("ultimate-list")
local dataSourceMethodsModule = require(var0.DataSources.DataSourceMethods)
local _ = require(var0.DataSources)
local _ = require(var0.Dimensions)
local exhaustiveMatchModule = require(var0.Util.exhaustiveMatch)

return function(p0, p1, p2, p3, p4) --[[ line: 8 | named "binarySearchIndexRangeInView" ]]
	-- upvalues: exhaustiveMatchModule (ref), dataSourceMethodsModule (ref)
	local var7, var8, var9
	local function compareInView(p5) --[[ line: 18 ]]
		-- upvalues: p4 (ref), exhaustiveMatchModule (copy), p2 (ref), p3 (ref)
		local var16 = if p4 == "x" then p5.position.X.Offset elseif p4 == "y" then p5.position.Y.Offset else exhaustiveMatchModule(p4)
		
		return if var16 + (if p4 == "x" then p5.size.X.Offset elseif p4 == "y" then p5.size.Y.Offset else exhaustiveMatchModule(p4)) < p2 then "before" elseif p2 + p3 < var16 then "after" else "inside"
	end
	
	local var4 = 1
	local var5 = dataSourceMethodsModule.length(p0)
	local var6 = var5
	while var4 <= var6 do
		var7 = (var4 + var6) // 2
		var8 = dataSourceMethodsModule.get(p0, var7)
		assert(var8 ~= nil, "get() returned nil, meaning the length is inaccurate")
		var9 = compareInView(p1(var8.value, var7))
		
		if var9 == "after" then
			var6 = var7 - 1
		elseif var9 == "before" then
			var4 = var7 + 1
		elseif var9 ~= "inside" then
			exhaustiveMatchModule(var9)
			continue
		end
		local var10 = var7
		local var11 = var8
		while var10 > 1 do
			local var12 = var11.before()
			
			if var12 == nil or compareInView(p1(var12.value, var10 - 1)) ~= "inside" then break end
			var10 -= 1
			var11 = var12
		end
		local var13 = var7
		local var14 = var8
		while var13 < var5 do
			local var15 = var14.after()
			
			if var15 == nil or compareInView(p1(var15.value, var13 + 1)) ~= "inside" then break end
			var13 += 1
			var14 = var15
		end
		return Vector3.new(var10, var13)
	end
	return Vector3.new(0, 0, 0)
end