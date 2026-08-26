local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useCurrentSquadSelector = require(parent.RoduxSquads).Hooks.useCurrentSquadSelector

function useCurrentSquadMember(p1)
	-- upvalues: useCurrentSquadSelector (ref), reactModule (ref), cryoModule (ref)
	local var1 = useCurrentSquadSelector()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return if var1 then var1.members else {}
	end, { var1 })
	
	return reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var2 (ref), p1 (ref)
		local var3 = cryoModule.List.findWhere(var2, function(p2)
			-- upvalues: p1 (copy)
			return p2.userId == p1
		end)
		
		return if var3 then var2[var3] else nil
	end, { var2, p1 })
end

return useCurrentSquadMember