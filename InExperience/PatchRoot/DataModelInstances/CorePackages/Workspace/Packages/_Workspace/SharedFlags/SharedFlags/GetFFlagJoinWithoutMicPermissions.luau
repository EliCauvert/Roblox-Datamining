game:DefineFastFlag("JoinWithoutMicPermissions3", false)
local var0 = true

return function(p0) --[[ line: 14 ]]
	-- upvalues: var0 (write)
	if p0 ~= nil then
		var0 = p0
	end
	return game:GetFastFlag("JoinWithoutMicPermissions3") and var0
end