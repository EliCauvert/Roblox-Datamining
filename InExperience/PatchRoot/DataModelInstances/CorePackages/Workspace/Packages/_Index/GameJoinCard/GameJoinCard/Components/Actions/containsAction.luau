local _ = require(script:FindFirstAncestor("GameJoinCard").Parent.DataHydration)

return function(p1, p2)
	if p1 == nil or p1.actions == nil then
		return false
	end
	for i, v in p1.actions do
		if v.type == p2 then
			return true
		end
	end
	return false
end