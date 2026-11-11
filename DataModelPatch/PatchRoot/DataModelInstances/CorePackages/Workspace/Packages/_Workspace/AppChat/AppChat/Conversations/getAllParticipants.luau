local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1)
	-- upvalues: CryoModule (copy)
	local t = {}
	CryoModule.List.map(p1, function(p2)
		-- upvalues: CryoModule (upval), t (copy)
		CryoModule.List.map(p2.otherParticipants, function(Key)
			-- upvalues: t (upval)
			t[Key] = true
		end)
	end)
	
	return CryoModule.Dictionary.keys(t)
end