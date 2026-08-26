local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	return if p1 and p1.participants then cryoModule.List.filter(p1.participants, function(p3)
		-- upvalues: p2 (ref)
		return tostring(p3) ~= tostring(p2)
	end) else {}
end