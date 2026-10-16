local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local t = {}

local function _(p1) --[[ Line: 19 | Named "replaceNil" ]]
	-- upvalues: t (copy)
	return if p1 == nil then t else p1
end

local _ = function() --[[ Line: 26 | Named "newWeakMap" ]]
	return (setmetatable({}, { __mode = "kv" }))
end

return {
	memoize3 = function(Callback) --[[ Line: 33 ]]
		-- upvalues: t (copy)
		local self = nil
		
		return function(p1, p2, p3) --[[ Line: 36 ]]
			-- upvalues: t (upval), self (ref), Callback (copy)
			local T = if p1 == nil then t else p1
			local T1 = if p2 == nil then t else p2
			local T2 = if p3 == nil then t else p3
			
			if not self then
				self = setmetatable({}, { __mode = "kv" })
			end
			local SelfEntry = self[T]
			local v1 = nil
			
			if SelfEntry then
				v1 = SelfEntry[T1]
				
				if v1 then
					local v2 = v1[T2]
					
					if v2 ~= nil then
						return if v2 == t then nil else v2
					end
				end
			else
				SelfEntry = setmetatable({}, { __mode = "kv" })
				self[T] = SelfEntry
			end
			if not v1 then
				v1 = setmetatable({}, { __mode = "kv" })
				SelfEntry[T1] = v1
			end
			local CallbackResult = Callback(p1, p2, p3)
			v1[T2] = if CallbackResult == nil then t else CallbackResult
			
			return CallbackResult
		end
	end
}