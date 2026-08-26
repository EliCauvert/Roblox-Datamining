local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref)
	local var1 = useSelector(function(p2)
		return tonumber(p2.LocalUserId)
	end)
	local t = {}
	
	for i, v in if p1 then p1.participants else {} do
		local var2 = tonumber(v)
		
		if var2 and var2 ~= var1 then
			table.insert(t, var2)
		end
	end
	return t
end