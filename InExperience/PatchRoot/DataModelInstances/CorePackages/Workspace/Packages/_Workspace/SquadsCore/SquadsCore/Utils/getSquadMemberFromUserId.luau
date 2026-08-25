local parent = script:FindFirstAncestor("SquadsCore").Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.RoduxSquads)

return function(p0, p1)
	-- upvalues: cryoModule (ref)
	if p0 and p0.members then
		local var1 = cryoModule.List.findWhere(p0.members, function(p2)
			-- upvalues: p1 (ref)
			return p2.userId == p1
		end)
		
		return if var1 then p0.members[var1] else nil
	end
end