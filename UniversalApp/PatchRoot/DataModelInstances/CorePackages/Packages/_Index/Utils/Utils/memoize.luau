local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local weakMap = luauPolyfillModule.WeakMap
local t = {
	memoize1 = function(p1)
		-- upvalues: weakMap (ref)
		local var1 = weakMap.new()
		
		return function(p2)
			-- upvalues: var1 (ref), p1 (ref)
			local var2 = var1:get(p2)
			
			if var2 == nil then
				local var3 = p1(p2)
				var1:set(p2, var3)
				
				return var3
			end
			return var2
		end
	end,
	memoize2 = function(p1)
		-- upvalues: weakMap (ref), boolean (ref)
		local var1 = weakMap.new()
		
		return function(p2, p3)
			-- upvalues: var1 (ref), boolean (copy), weakMap (copy), p1 (ref)
			local var2 = var1:get(p2)
			
			if not boolean.toJSBoolean(var2) then
				var2 = weakMap.new()
				var1:set(p2, var2)
				local var3 = p1(p2, p3)
				var2:set(p3, var3)
				
				return var3
			end
			local var4 = var2:get(p3)
			
			if var4 == nil then
				local var5 = p1(p2, p3)
				var2:set(p3, var5)
				
				return var5
			end
			return var4
		end
	end,
	memoize3 = function(p1)
		-- upvalues: weakMap (ref), boolean (ref)
		local var1 = weakMap.new()
		
		return function(p2, p3, p4)
			-- upvalues: var1 (ref), boolean (copy), weakMap (copy), p1 (ref)
			local var2 = var1:get(p2)
			
			if not boolean.toJSBoolean(var2) then
				var2 = weakMap.new()
				var1:set(p2, var2)
				local var3 = weakMap.new()
				var2:set(p3, var3)
				local var4 = p1(p2, p3, p4)
				var3:set(p4, var4)
				
				return var4
			end
			local var5 = var2:get(p3)
			
			if not boolean.toJSBoolean(var5) then
				var5 = weakMap.new()
				var2:set(p3, var5)
				local var6 = p1(p2, p3, p4)
				var5:set(p4, var6)
				
				return var6
			end
			local var7 = var5:get(p4)
			
			if var7 == nil then
				local var8 = p1(p2, p3, p4)
				var5:set(p4, var8)
				
				return var8
			end
			return var7
		end
	end,
	memoize4 = function(p1)
		-- upvalues: weakMap (ref), boolean (ref)
		local var1 = weakMap.new()
		
		return function(p2, p3, p4, p5)
			-- upvalues: var1 (ref), boolean (copy), weakMap (copy), p1 (ref)
			local var2 = var1:get(p2)
			
			if not boolean.toJSBoolean(var2) then
				var2 = weakMap.new()
				var1:set(p2, var2)
				local var3 = weakMap.new()
				var2:set(p3, var3)
				local var4 = weakMap.new()
				var3:set(p4, var4)
				local var5 = p1(p2, p3, p4, p5)
				var4:set(p5, var5)
				
				return var5
			end
			local var6 = var2:get(p3)
			
			if not boolean.toJSBoolean(var6) then
				var6 = weakMap.new()
				var2:set(p3, var6)
				local var7 = weakMap.new()
				var6:set(p4, var7)
				local var8 = p1(p2, p3, p4, p5)
				var7:set(p5, var8)
				
				return var8
			end
			local var9 = var6:get(p4)
			
			if not boolean.toJSBoolean(var9) then
				var9 = weakMap.new()
				var6:set(p4, var9)
				local var10 = p1(p2, p3, p4, p5)
				var9:set(p5, var10)
				
				return var10
			end
			local var11 = var9:get(p5)
			
			if var11 == nil then
				local var12 = p1(p2, p3, p4, p5)
				var9:set(p5, var12)
				
				return var12
			end
			return var11
		end
	end,
	memoize5 = function(p1)
		-- upvalues: weakMap (ref), boolean (ref)
		local var1 = weakMap.new()
		
		return function(p2, p3, p4, p5, p6)
			-- upvalues: var1 (ref), boolean (copy), weakMap (copy), p1 (ref)
			local var2 = var1:get(p2)
			
			if not boolean.toJSBoolean(var2) then
				var2 = weakMap.new()
				var1:set(p2, var2)
				local var3 = weakMap.new()
				var2:set(p3, var3)
				local var4 = weakMap.new()
				var3:set(p4, var4)
				local var5 = weakMap.new()
				var4:set(p5, var5)
				local var6 = p1(p2, p3, p4, p5, p6)
				var5:set(p6, var6)
				
				return var6
			end
			local var7 = var2:get(p3)
			
			if not boolean.toJSBoolean(var7) then
				var7 = weakMap.new()
				var2:set(p3, var7)
				local var8 = weakMap.new()
				var7:set(p4, var8)
				local var9 = weakMap.new()
				var8:set(p5, var9)
				local var10 = p1(p2, p3, p4, p5, p6)
				var9:set(p6, var10)
				
				return var10
			end
			local var11 = var7:get(p4)
			
			if not boolean.toJSBoolean(var11) then
				var11 = weakMap.new()
				var7:set(p4, var11)
				local var12 = weakMap.new()
				var11:set(p5, var12)
				local var13 = p1(p2, p3, p4, p5, p6)
				var12:set(p6, var13)
				
				return var13
			end
			local var14 = var11:get(p5)
			
			if not boolean.toJSBoolean(var14) then
				var14 = weakMap.new()
				var11:set(p5, var14)
				local var15 = p1(p2, p3, p4, p5, p6)
				var14:set(p6, var15)
				
				return var15
			end
			local var16 = var14:get(p6)
			
			if var16 == nil then
				local var17 = p1(p2, p3, p4, p5, p6)
				var14:set(p6, var17)
				
				return var17
			end
			return var16
		end
	end
}
local var1 = weakMap.new()

function t.memoize2of4(p1)
	-- upvalues: var1 (ref), boolean (ref), weakMap (ref)
	return function(p2, p3, p4, p5)
		-- upvalues: var1 (copy), boolean (copy), weakMap (copy), p1 (ref)
		local var2 = var1:get(p2)
		
		if not boolean.toJSBoolean(var2) then
			var2 = weakMap.new()
			var1:set(p2, var2)
			local var3 = p1(p2, p3, p4, p5)
			var2:set(p3, var3)
			
			return var3
		end
		local var4 = var2:get(p3)
		
		if var4 == nil then
			local var5 = p1(p2, p3, p4, p5)
			var2:set(p3, var5)
			
			return var5
		end
		return var4
	end
end

return t