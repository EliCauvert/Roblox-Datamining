local function _(p1)
	if p1 == nil then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1:IsDescendantOf(game)
	end)
	
	return ok and status
end

return function(p1, p2)
	if p2 == nil then return end
	local var1
	local selectedCoreObject = p1.SelectedCoreObject
	
	if selectedCoreObject == nil then
		var1 = false
	else
		local ok, status = pcall(function()
			-- upvalues: selectedCoreObject (ref)
			return selectedCoreObject:IsDescendantOf(game)
		end)
		var1 = ok and status
	end
	if not var1 then
		p1.SelectedCoreObject = p2
	end
end