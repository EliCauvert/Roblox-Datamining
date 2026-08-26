local parent = script:FindFirstAncestor("SquadsCore").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.RoduxSquads)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	if p1 and p1.members then
		local var1 = cryoModule.List.findWhere(p1.members, function(p3)
			-- upvalues: p2 (ref)
			return p3.userId == p2
		end)
		
		return if var1 then p1.members[var1] else nil
	end
end