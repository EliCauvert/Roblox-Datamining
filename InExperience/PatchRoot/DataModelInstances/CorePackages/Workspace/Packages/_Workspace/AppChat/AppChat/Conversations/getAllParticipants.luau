local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p0)
	-- upvalues: cryoModule (ref)
	local t = {}
	cryoModule.List.map(p0, function(p1)
		-- upvalues: cryoModule (copy), t (ref)
		cryoModule.List.map(p1.otherParticipants, function(p2)
			-- upvalues: t (copy)
			t[p2] = true
		end)
	end)
	
	return cryoModule.Dictionary.keys(t)
end