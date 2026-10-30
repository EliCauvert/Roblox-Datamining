local _ = require(script:FindFirstAncestor("AppChat").Hooks.useProfileNames)

return function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	else
		local NamesByUserIdEntry = p1.namesByUserId[tostring(p2)]
		
		return if NamesByUserIdEntry then NamesByUserIdEntry.combinedName else nil
	end
end