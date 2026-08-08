local function _(p0) --[[ line: 1 | named "nonEmpty" ]]
	return if p0 == nil or p0 == "" then nil else p0
end

return function(p1, p2, p3) --[[ line: 5 | named "resolveMomentShareCardMetadataText" ]]
	local var0 = if p1 == nil or p1 == "" then nil else p1
	
	if not var0 then
		var0 = if p2 == nil or p2 == "" then nil else p2
		
		if not var0 then
			if p3 ~= nil and p3 ~= "" then
				return p3
			end
			var0 = nil
		end
	end
	return var0
end