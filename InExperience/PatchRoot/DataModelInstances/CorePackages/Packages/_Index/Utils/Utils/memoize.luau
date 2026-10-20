local LuauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local WeakMap = LuauPolyfillModule.WeakMap
local NewWeakMap = WeakMap.new()

return {
	memoize1 = function(Callback)
		-- upvalues: WeakMap (copy)
		local NewWeakMap = WeakMap.new()
		
		return function(p1)
			-- upvalues: NewWeakMap (copy), Callback (copy)
			local GetResult = NewWeakMap:get(p1)
			
			if GetResult == nil then
				local CallbackResult = Callback(p1)
				NewWeakMap:set(p1, CallbackResult)
				
				return CallbackResult
			else
				return GetResult
			end
		end
	end,
	memoize2 = function(Callback)
		-- upvalues: WeakMap (copy), Boolean (copy)
		local NewWeakMap = WeakMap.new()
		
		return function(p1, p2)
			-- upvalues: NewWeakMap (copy), Boolean (upval), WeakMap (upval), Callback (copy)
			local GetResult = NewWeakMap:get(p1)
			
			if not Boolean.toJSBoolean(GetResult) then
				GetResult = WeakMap.new()
				NewWeakMap:set(p1, GetResult)
				local CallbackResult = Callback(p1, p2)
				GetResult:set(p2, CallbackResult)
				
				return CallbackResult
			end
			local GetResult1 = GetResult:get(p2)
			
			if GetResult1 == nil then
				local CallbackResult = Callback(p1, p2)
				GetResult:set(p2, CallbackResult)
				
				return CallbackResult
			else
				return GetResult1
			end
		end
	end,
	memoize3 = function(Callback)
		-- upvalues: WeakMap (copy), Boolean (copy)
		local NewWeakMap = WeakMap.new()
		
		return function(p1, p2, p3)
			-- upvalues: NewWeakMap (copy), Boolean (upval), WeakMap (upval), Callback (copy)
			local GetResult = NewWeakMap:get(p1)
			
			if not Boolean.toJSBoolean(GetResult) then
				GetResult = WeakMap.new()
				NewWeakMap:set(p1, GetResult)
				local NewWeakMap1 = WeakMap.new()
				GetResult:set(p2, NewWeakMap1)
				local CallbackResult = Callback(p1, p2, p3)
				NewWeakMap1:set(p3, CallbackResult)
				
				return CallbackResult
			end
			local GetResult1 = GetResult:get(p2)
			
			if not Boolean.toJSBoolean(GetResult1) then
				GetResult1 = WeakMap.new()
				GetResult:set(p2, GetResult1)
				local CallbackResult = Callback(p1, p2, p3)
				GetResult1:set(p3, CallbackResult)
				
				return CallbackResult
			end
			local GetResult2 = GetResult1:get(p3)
			
			if GetResult2 == nil then
				local CallbackResult = Callback(p1, p2, p3)
				GetResult1:set(p3, CallbackResult)
				
				return CallbackResult
			else
				return GetResult2
			end
		end
	end,
	memoize4 = function(Callback)
		-- upvalues: WeakMap (copy), Boolean (copy)
		local NewWeakMap = WeakMap.new()
		
		return function(p1, p2, p3, p4)
			-- upvalues: NewWeakMap (copy), Boolean (upval), WeakMap (upval), Callback (copy)
			local GetResult = NewWeakMap:get(p1)
			
			if not Boolean.toJSBoolean(GetResult) then
				GetResult = WeakMap.new()
				NewWeakMap:set(p1, GetResult)
				local NewWeakMap1 = WeakMap.new()
				GetResult:set(p2, NewWeakMap1)
				local NewWeakMap2 = WeakMap.new()
				NewWeakMap1:set(p3, NewWeakMap2)
				local CallbackResult = Callback(p1, p2, p3, p4)
				NewWeakMap2:set(p4, CallbackResult)
				
				return CallbackResult
			end
			local GetResult1 = GetResult:get(p2)
			
			if not Boolean.toJSBoolean(GetResult1) then
				GetResult1 = WeakMap.new()
				GetResult:set(p2, GetResult1)
				local NewWeakMap3 = WeakMap.new()
				GetResult1:set(p3, NewWeakMap3)
				local CallbackResult = Callback(p1, p2, p3, p4)
				NewWeakMap3:set(p4, CallbackResult)
				
				return CallbackResult
			end
			local GetResult2 = GetResult1:get(p3)
			
			if not Boolean.toJSBoolean(GetResult2) then
				GetResult2 = WeakMap.new()
				GetResult1:set(p3, GetResult2)
				local CallbackResult = Callback(p1, p2, p3, p4)
				GetResult2:set(p4, CallbackResult)
				
				return CallbackResult
			end
			local GetResult21 = GetResult2:get(p4)
			
			if GetResult21 == nil then
				local CallbackResult = Callback(p1, p2, p3, p4)
				GetResult2:set(p4, CallbackResult)
				
				return CallbackResult
			else
				return GetResult21
			end
		end
	end,
	memoize5 = function(Callback)
		-- upvalues: WeakMap (copy), Boolean (copy)
		local NewWeakMap = WeakMap.new()
		
		return function(p1, p2, p3, p4, p5)
			-- upvalues: NewWeakMap (copy), Boolean (upval), WeakMap (upval), Callback (copy)
			local GetResult = NewWeakMap:get(p1)
			
			if not Boolean.toJSBoolean(GetResult) then
				GetResult = WeakMap.new()
				NewWeakMap:set(p1, GetResult)
				local NewWeakMap1 = WeakMap.new()
				GetResult:set(p2, NewWeakMap1)
				local NewWeakMap2 = WeakMap.new()
				NewWeakMap1:set(p3, NewWeakMap2)
				local NewWeakMap3 = WeakMap.new()
				NewWeakMap2:set(p4, NewWeakMap3)
				local CallbackResult = Callback(p1, p2, p3, p4, p5)
				NewWeakMap3:set(p5, CallbackResult)
				
				return CallbackResult
			end
			local GetResult1 = GetResult:get(p2)
			
			if not Boolean.toJSBoolean(GetResult1) then
				GetResult1 = WeakMap.new()
				GetResult:set(p2, GetResult1)
				local NewWeakMap4 = WeakMap.new()
				GetResult1:set(p3, NewWeakMap4)
				local NewWeakMap5 = WeakMap.new()
				NewWeakMap4:set(p4, NewWeakMap5)
				local CallbackResult = Callback(p1, p2, p3, p4, p5)
				NewWeakMap5:set(p5, CallbackResult)
				
				return CallbackResult
			end
			local GetResult2 = GetResult1:get(p3)
			
			if not Boolean.toJSBoolean(GetResult2) then
				GetResult2 = WeakMap.new()
				GetResult1:set(p3, GetResult2)
				local NewWeakMap6 = WeakMap.new()
				GetResult2:set(p4, NewWeakMap6)
				local CallbackResult = Callback(p1, p2, p3, p4, p5)
				NewWeakMap6:set(p5, CallbackResult)
				
				return CallbackResult
			end
			local GetResult21 = GetResult2:get(p4)
			
			if not Boolean.toJSBoolean(GetResult21) then
				GetResult21 = WeakMap.new()
				GetResult2:set(p4, GetResult21)
				local CallbackResult = Callback(p1, p2, p3, p4, p5)
				GetResult21:set(p5, CallbackResult)
				
				return CallbackResult
			end
			local GetResult3 = GetResult21:get(p5)
			
			if GetResult3 == nil then
				local CallbackResult = Callback(p1, p2, p3, p4, p5)
				GetResult21:set(p5, CallbackResult)
				
				return CallbackResult
			else
				return GetResult3
			end
		end
	end,
	memoize2of4 = function(Callback)
		-- upvalues: NewWeakMap (copy), Boolean (copy), WeakMap (copy)
		return function(p1, p2, p3, p4)
			-- upvalues: NewWeakMap (upval), Boolean (upval), WeakMap (upval), Callback (copy)
			local GetResult = NewWeakMap:get(p1)
			
			if not Boolean.toJSBoolean(GetResult) then
				GetResult = WeakMap.new()
				NewWeakMap:set(p1, GetResult)
				local CallbackResult = Callback(p1, p2, p3, p4)
				GetResult:set(p2, CallbackResult)
				
				return CallbackResult
			end
			local GetResult1 = GetResult:get(p2)
			
			if GetResult1 == nil then
				local CallbackResult = Callback(p1, p2, p3, p4)
				GetResult:set(p2, CallbackResult)
				
				return CallbackResult
			else
				return GetResult1
			end
		end
	end
}