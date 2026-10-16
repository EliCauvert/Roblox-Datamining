local ReduceModule = require(script.Parent.reduce)

local function v1(p1, p2): boolean --[[ Line: 8 ]]
	return p2 < p1
end

return function(p1, Callback, p2) --[[ Line: 46 | Named "max" ]]
	-- upvalues: v1 (copy), ReduceModule (copy)
	local Callback1 = p2 or v1
	
	return if Callback then ReduceModule(p1, function(p3, Original, p4) --[[ Line: 50 ]]
		-- upvalues: Callback (copy), Callback1 (copy)
		local CallbackResult = Callback(Original, p4)
		
		return if p3 then if Callback1(CallbackResult, p3.value) then { value = CallbackResult, original = Original } else p3 else { value = CallbackResult, original = Original }
	end, nil).original else ReduceModule(p1, function(p3, p4) --[[ Line: 60 ]]
		-- upvalues: Callback1 (copy)
		return if p3 then if Callback1(p4, p3) then p4 else p3 else p4
	end, nil)
end