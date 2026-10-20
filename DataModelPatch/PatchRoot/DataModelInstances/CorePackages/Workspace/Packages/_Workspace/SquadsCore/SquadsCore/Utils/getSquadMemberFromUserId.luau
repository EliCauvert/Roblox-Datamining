local Parent = script:FindFirstAncestor("SquadsCore").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.RoduxSquads)

return function(p1, UserId)
	-- upvalues: CryoModule (copy)
	if p1 and p1.members then
		local Where = CryoModule.List.findWhere(p1.members, function(p2): boolean
			-- upvalues: UserId (copy)
			return p2.userId == UserId
		end)
		
		if Where then
			return p1.members[Where]
		end
	end
	return nil
end