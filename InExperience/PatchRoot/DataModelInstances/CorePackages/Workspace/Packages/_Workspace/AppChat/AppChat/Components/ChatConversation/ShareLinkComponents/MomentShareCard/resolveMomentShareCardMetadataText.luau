local function _(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

return function(p1, p2, p3)
	local var1 = if p1 == nil or p1 == "" then nil else p1
	
	if not var1 then
		var1 = if p2 == nil or p2 == "" then nil else p2
		
		if not var1 then
			if p3 ~= nil and p3 ~= "" then
				return p3
			end
			var1 = nil
		end
	end
	return var1
end