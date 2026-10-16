local function v0(): boolean --[[ Line: 3 ]]
	return true
end

return function(List, p1): number --[[ Line: 39 | Named "count" ]]
	-- upvalues: v0 (copy)
	local Count = 0
	local Callback = p1 or v0
	for i, value in List do
		if Callback(value, i) then
			Count += 1
		end
	end
	return Count
end