local function captureSize(...) --[[ Line: 30 ]]
	return { ... }, select("#", ...)
end

return function(Callback) --[[ Line: 34 | Named "memoize" ]]
	-- upvalues: captureSize (copy)
	assert(type(Callback) == "function", "memoize requires a function to memoize")
	local List = nil
	local Count = nil
	local v1 = nil
	local v2 = nil
	
	return function(...) --[[ Line: 42 ]]
		-- upvalues: Count (ref), List (ref), v1 (ref), v2 (ref), captureSize (upval), Callback (copy)
		local Selected = select("#", ...)
		while Selected > 0 and select(Selected, ...) == nil do
			Selected -= 1
		end
		if Selected ~= Count then
			List = { ... }
			Count = Selected
			v1, v4 = captureSize(Callback(...))
			
			return unpack(v1, 1, v2)
		end
		for i = 1, Count do
			if select(i, ...) == List[i] then
				continue
			end
			List = { ... }
			v1, v4 = captureSize(Callback(...))
			break
		end
		return unpack(v1, 1, v2)
	end
end