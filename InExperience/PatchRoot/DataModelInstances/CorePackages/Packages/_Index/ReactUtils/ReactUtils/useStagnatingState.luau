local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

local function shallowEqual(p1, p2)
	if p1 == p2 then
		return true
	elseif typeof(p1) ~= typeof(p2) then
		return false
	elseif typeof(p1) ~= "table" then
		return p1 == p2
	end
	assert(typeof(p2) == "table", "Luau")
	
	if #p1 ~= #p2 then
		return false
	end
	for i in p1 do
		if p1[i] ~= p2[i] then
			return false
		end
	end
	for i in p2 do
		if p1[i] ~= p2[i] then
			return false
		end
	end
	return true
end

return function(p3, p4)
	-- upvalues: reactModule (ref), shallowEqual (ref)
	local var1 = reactModule.useRef(p4)
	local var2 = reactModule.useRef(0)
	
	if not shallowEqual(var1.current, p4) then
		var1.current = p4
		var2.current += 1
	end
	local var3, var4 = reactModule.useState({ tick = var2.current, value = p3 })
	
	return if var3.tick == var2.current then var3.value else p3, reactModule.useCallback(function(p5)
		-- upvalues: var4 (ref), var2 (ref), p3 (ref)
		if typeof(p5) == "function" then
			var4(function(p6)
				-- upvalues: var2 (copy), p3 (copy), p5 (ref)
				return {
					tick = var2.current,
					value = p5(if p6.tick == var2.current then p6.value else p3)
				}
			end)
			
			return
		end
		var4({ tick = var2.current, value = p5 })
	end, { p3 })
end