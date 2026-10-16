local function v0(p1) --[[ Line: 3 ]]
	return p1
end

return function(List, p1): boolean --[[ Line: 17 | Named "all" ]]
	-- upvalues: v0 (copy)
	local Callback = p1 or v0
	for i, value in List do
		if not Callback(value, i) then
			return false
		end
	end
	return true
end