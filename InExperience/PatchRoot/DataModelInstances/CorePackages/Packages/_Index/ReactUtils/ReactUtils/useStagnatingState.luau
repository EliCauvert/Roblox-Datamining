local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

local function shallowEqual(p0, p1)
	if p0 == p1 then
		return true
	elseif typeof(p0) ~= typeof(p1) then
		return false
	elseif typeof(p0) ~= "table" then
		return p0 == p1
	end
	assert(typeof(p1) == "table", "Luau")
	
	if #p0 ~= #p1 then
		return false
	end
	for i in p0 do
		if p0[i] ~= p1[i] then
			return false
		end
	end
	for i in p1 do
		if p0[i] ~= p1[i] then
			return false
		end
	end
	return true
end

return function(p2, p3)
	-- upvalues: reactModule (ref), shallowEqual (ref)
	local var2 = reactModule.useRef(p3)
	local var3 = reactModule.useRef(0)
	
	if not shallowEqual(var2.current, p3) then
		var2.current = p3
		var3.current += 1
	end
	local var4, var5 = reactModule.useState({ tick = var3.current, value = p2 })
	
	return if var4.tick == var3.current then var4.value else p2, reactModule.useCallback(function(p4)
		-- upvalues: var5 (ref), var3 (ref), p2 (ref)
		if typeof(p4) == "function" then
			var5(function(p5)
				-- upvalues: var3 (copy), p2 (copy), p4 (ref)
				return {
					tick = var3.current,
					value = p4(if p5.tick == var3.current then p5.value else p2)
				}
			end)
			
			return
		end
		var5({ tick = var3.current, value = p4 })
	end, { p2 })
end