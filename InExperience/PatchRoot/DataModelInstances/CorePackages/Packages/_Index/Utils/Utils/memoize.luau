local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local weakMap = luauPolyfillModule.WeakMap
local t = {
	memoize1 = function(p0)
		-- upvalues: weakMap (ref)
		local var3 = weakMap.new()
		
		return function(p1)
			-- upvalues: var3 (ref), p0 (ref)
			local var4 = var3:get(p1)
			
			if var4 == nil then
				local var5 = p0(p1)
				var3:set(p1, var5)
				
				return var5
			end
			return var4
		end
	end,
	memoize2 = function(p2)
		-- upvalues: weakMap (ref), boolean (ref)
		local var6 = weakMap.new()
		
		return function(p3, p4)
			-- upvalues: var6 (ref), boolean (copy), weakMap (copy), p2 (ref)
			local var7 = var6:get(p3)
			
			if not boolean.toJSBoolean(var7) then
				var7 = weakMap.new()
				var6:set(p3, var7)
				local var8 = p2(p3, p4)
				var7:set(p4, var8)
				
				return var8
			end
			local var9 = var7:get(p4)
			
			if var9 == nil then
				local var10 = p2(p3, p4)
				var7:set(p4, var10)
				
				return var10
			end
			return var9
		end
	end,
	memoize3 = function(p5)
		-- upvalues: weakMap (ref), boolean (ref)
		local var11 = weakMap.new()
		
		return function(p6, p7, p8)
			-- upvalues: var11 (ref), boolean (copy), weakMap (copy), p5 (ref)
			local var12 = var11:get(p6)
			
			if not boolean.toJSBoolean(var12) then
				var12 = weakMap.new()
				var11:set(p6, var12)
				local var13 = weakMap.new()
				var12:set(p7, var13)
				local var14 = p5(p6, p7, p8)
				var13:set(p8, var14)
				
				return var14
			end
			local var15 = var12:get(p7)
			
			if not boolean.toJSBoolean(var15) then
				var15 = weakMap.new()
				var12:set(p7, var15)
				local var16 = p5(p6, p7, p8)
				var15:set(p8, var16)
				
				return var16
			end
			local var17 = var15:get(p8)
			
			if var17 == nil then
				local var18 = p5(p6, p7, p8)
				var15:set(p8, var18)
				
				return var18
			end
			return var17
		end
	end,
	memoize4 = function(p9)
		-- upvalues: weakMap (ref), boolean (ref)
		local var19 = weakMap.new()
		
		return function(p10, p11, p12, p13)
			-- upvalues: var19 (ref), boolean (copy), weakMap (copy), p9 (ref)
			local var20 = var19:get(p10)
			
			if not boolean.toJSBoolean(var20) then
				var20 = weakMap.new()
				var19:set(p10, var20)
				local var21 = weakMap.new()
				var20:set(p11, var21)
				local var22 = weakMap.new()
				var21:set(p12, var22)
				local var23 = p9(p10, p11, p12, p13)
				var22:set(p13, var23)
				
				return var23
			end
			local var24 = var20:get(p11)
			
			if not boolean.toJSBoolean(var24) then
				var24 = weakMap.new()
				var20:set(p11, var24)
				local var25 = weakMap.new()
				var24:set(p12, var25)
				local var26 = p9(p10, p11, p12, p13)
				var25:set(p13, var26)
				
				return var26
			end
			local var27 = var24:get(p12)
			
			if not boolean.toJSBoolean(var27) then
				var27 = weakMap.new()
				var24:set(p12, var27)
				local var28 = p9(p10, p11, p12, p13)
				var27:set(p13, var28)
				
				return var28
			end
			local var29 = var27:get(p13)
			
			if var29 == nil then
				local var30 = p9(p10, p11, p12, p13)
				var27:set(p13, var30)
				
				return var30
			end
			return var29
		end
	end,
	memoize5 = function(p14)
		-- upvalues: weakMap (ref), boolean (ref)
		local var31 = weakMap.new()
		
		return function(p15, p16, p17, p18, p19)
			-- upvalues: var31 (ref), boolean (copy), weakMap (copy), p14 (ref)
			local var32 = var31:get(p15)
			
			if not boolean.toJSBoolean(var32) then
				var32 = weakMap.new()
				var31:set(p15, var32)
				local var33 = weakMap.new()
				var32:set(p16, var33)
				local var34 = weakMap.new()
				var33:set(p17, var34)
				local var35 = weakMap.new()
				var34:set(p18, var35)
				local var36 = p14(p15, p16, p17, p18, p19)
				var35:set(p19, var36)
				
				return var36
			end
			local var37 = var32:get(p16)
			
			if not boolean.toJSBoolean(var37) then
				var37 = weakMap.new()
				var32:set(p16, var37)
				local var38 = weakMap.new()
				var37:set(p17, var38)
				local var39 = weakMap.new()
				var38:set(p18, var39)
				local var40 = p14(p15, p16, p17, p18, p19)
				var39:set(p19, var40)
				
				return var40
			end
			local var41 = var37:get(p17)
			
			if not boolean.toJSBoolean(var41) then
				var41 = weakMap.new()
				var37:set(p17, var41)
				local var42 = weakMap.new()
				var41:set(p18, var42)
				local var43 = p14(p15, p16, p17, p18, p19)
				var42:set(p19, var43)
				
				return var43
			end
			local var44 = var41:get(p18)
			
			if not boolean.toJSBoolean(var44) then
				var44 = weakMap.new()
				var41:set(p18, var44)
				local var45 = p14(p15, p16, p17, p18, p19)
				var44:set(p19, var45)
				
				return var45
			end
			local var46 = var44:get(p19)
			
			if var46 == nil then
				local var47 = p14(p15, p16, p17, p18, p19)
				var44:set(p19, var47)
				
				return var47
			end
			return var46
		end
	end
}
local var2 = weakMap.new()

function t.memoize2of4(p20)
	-- upvalues: var2 (ref), boolean (ref), weakMap (ref)
	return function(p21, p22, p23, p24)
		-- upvalues: var2 (copy), boolean (copy), weakMap (copy), p20 (ref)
		local var48 = var2:get(p21)
		
		if not boolean.toJSBoolean(var48) then
			var48 = weakMap.new()
			var2:set(p21, var48)
			local var49 = p20(p21, p22, p23, p24)
			var48:set(p22, var49)
			
			return var49
		end
		local var50 = var48:get(p22)
		
		if var50 == nil then
			local var51 = p20(p21, p22, p23, p24)
			var48:set(p22, var51)
			
			return var51
		end
		return var50
	end
end

return t