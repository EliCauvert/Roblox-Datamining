local UseSelectorFunction = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2): number
		return (tonumber(p2.LocalUserId))
	end)
	local List = {}
	
	for _, value in p1 and p1.participants or {} do
		local Number: number? = tonumber(value)
		
		if Number and Number ~= UseSelectorResult then
			table.insert(List, Number)
		end
	end
	return List
end