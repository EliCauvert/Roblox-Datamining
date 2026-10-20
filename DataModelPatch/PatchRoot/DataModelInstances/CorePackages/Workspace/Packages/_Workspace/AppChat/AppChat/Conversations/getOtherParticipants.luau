local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1, p2)
	-- upvalues: CryoModule (copy)
	return if p1 and p1.participants then CryoModule.List.filter(p1.participants, function(p3): boolean
		-- upvalues: p2 (copy)
		return tostring(p3) ~= tostring(p2)
	end) else {}
end