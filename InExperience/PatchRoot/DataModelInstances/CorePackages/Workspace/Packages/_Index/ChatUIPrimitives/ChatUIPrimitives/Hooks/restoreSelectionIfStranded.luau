local function _(p1) --[[ Line: 8 | Named "isSelectionOnScreen" ]]
	if p1 == nil then
		return false
	else
		local Success, Result = pcall(function() --[[ Line: 12 ]]
			-- upvalues: p1 (copy)
			return p1:IsDescendantOf(game)
		end)
		
		return Success and Result
	end
end

return function(p1, SelectedCoreObject) --[[ Line: 18 | Named "restoreSelectionIfStranded" ]]
	if SelectedCoreObject == nil then return end
	local SelectedCoreObject1 = p1.SelectedCoreObject
	local v1 = nil
	
	if SelectedCoreObject1 == nil then
		v1 = false
	else
		local Success, Result = pcall(function() --[[ Line: 12 ]]
			-- upvalues: SelectedCoreObject1 (copy)
			return SelectedCoreObject1:IsDescendantOf(game)
		end)
		v1 = Success and Result
	end
	if not v1 then
		p1.SelectedCoreObject = SelectedCoreObject
	end
end