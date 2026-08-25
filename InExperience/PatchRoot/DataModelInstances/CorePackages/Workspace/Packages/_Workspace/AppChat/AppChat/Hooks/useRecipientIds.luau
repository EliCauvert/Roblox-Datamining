local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref)
	local var0 = useSelector(function(p1)
		return tonumber(p1.LocalUserId)
	end)
	local t = {}
	
	for i, v in if p0 then p0.participants else {} do
		local var2 = tonumber(v)
		
		if var2 and var2 ~= var0 then
			table.insert(t, var2)
		end
	end
	return t
end