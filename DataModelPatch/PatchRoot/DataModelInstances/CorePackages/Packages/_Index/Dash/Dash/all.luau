local function v0(p1)
	return p1
end

return function(List, p1): boolean
	-- upvalues: v0 (copy)
	local Callback = p1 or v0
	for i, value in List do
		if not Callback(value, i) then
			return false
		end
	end
	return true
end