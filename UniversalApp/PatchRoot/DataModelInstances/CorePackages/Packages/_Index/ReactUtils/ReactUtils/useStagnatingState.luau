local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

local function shallowEqual(Current, Current1): boolean --[[ Line: 22 ]]
	if Current == Current1 then
		return true
	end
	if typeof(Current) ~= typeof(Current1) then
		return false
	end
	if typeof(Current) ~= "table" then
		return Current == Current1
	end
	assert(typeof(Current1) == "table", "Luau")
	
	if #Current ~= #Current1 then
		return false
	end
	for i in Current do
		if Current[i] ~= Current1[i] then
			return false
		end
	end
	for i1 in Current1 do
		if Current[i1] ~= Current1[i1] then
			return false
		end
	end
	return true
end

return function(Value, Current) --[[ Line: 57 | Named "useStagnatingState" ]]
	-- upvalues: ReactModule (copy), shallowEqual (copy)
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = ReactModule.useRef(0)
	
	if not shallowEqual(UseRefResult.current, Current) then
		UseRefResult.current = Current
		UseRefResult1.current += 1
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState({ tick = UseRefResult1.current, value = Value })
	
	return if UseStateResult.tick == UseRefResult1.current then UseStateResult.value else Value, (ReactModule.useCallback(function(Callback) --[[ Line: 71 ]]
		-- upvalues: UseStateResult2 (copy), UseRefResult1 (copy), Value (copy)
		if typeof(Callback) == "function" then
			UseStateResult2(function(p1) --[[ Line: 73 ]]
				-- upvalues: UseRefResult1 (upval), Value (upval), Callback (copy)
				return {
					tick = UseRefResult1.current,
					value = Callback(if p1.tick == UseRefResult1.current then p1.value else Value)
				}
			end)
			
			return
		else
			UseStateResult2({ tick = UseRefResult1.current, value = Callback })
		end
	end, { Value }))
end