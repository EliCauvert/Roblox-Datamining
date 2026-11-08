return function(p1, p2): boolean
	if p1 then
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy)
			return p1:IsEnabled()
		end)
		
		return if Success then Result == true else not p2
	else
		return not p2
	end
end