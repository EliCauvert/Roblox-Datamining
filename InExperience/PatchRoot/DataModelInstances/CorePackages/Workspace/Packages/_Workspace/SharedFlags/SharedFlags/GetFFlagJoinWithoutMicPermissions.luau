game:DefineFastFlag("JoinWithoutMicPermissions3", false)
local var1 = true

return function(p1)
	-- upvalues: var1 (write)
	if p1 ~= nil then
		var1 = p1
	end
	return game:GetFastFlag("JoinWithoutMicPermissions3") and var1
end