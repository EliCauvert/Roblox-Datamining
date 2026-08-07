local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: cryoModule (ref)
	return if p0 and p0.participants then cryoModule.List.filter(p0.participants, function(p2) --[[ line: 8 ]]
		-- upvalues: p1 (ref)
		return tostring(p2) ~= tostring(p1)
	end) else {}
end