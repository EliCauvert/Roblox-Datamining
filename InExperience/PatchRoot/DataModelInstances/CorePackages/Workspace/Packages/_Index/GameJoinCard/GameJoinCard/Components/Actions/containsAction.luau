local _ = require(script:FindFirstAncestor("GameJoinCard").Parent.DataHydration)

return function(p1, Type): boolean --[[ Line: 8 | Named "containsAction" ]]
	if p1 == nil or p1.actions == nil then
		return false
	end
	for _, action in p1.actions do
		if action.type == Type then
			return true
		end
	end
	return false
end