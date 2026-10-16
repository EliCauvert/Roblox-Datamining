game:DefineFastFlag("JoinWithoutMicPermissions3", false)
local v1 = true

return function(p1) --[[ Line: 14 ]]
	-- upvalues: v1 (ref)
	if p1 ~= nil then
		v1 = p1
	end
	return game:GetFastFlag("JoinWithoutMicPermissions3") and v1
end