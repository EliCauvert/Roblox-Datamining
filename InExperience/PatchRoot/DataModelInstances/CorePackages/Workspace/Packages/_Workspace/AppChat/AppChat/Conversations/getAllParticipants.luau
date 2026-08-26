local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	cryoModule.List.map(p1, function(p2)
		-- upvalues: cryoModule (copy), t (ref)
		cryoModule.List.map(p2.otherParticipants, function(p3)
			-- upvalues: t (copy)
			t[p3] = true
		end)
	end)
	
	return cryoModule.Dictionary.keys(t)
end