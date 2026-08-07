local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useCurrentSquadSelector = require(parent.RoduxSquads).Hooks.useCurrentSquadSelector

function useCurrentSquadMember(p0) --[[ line: 12 ]]
	-- upvalues: useCurrentSquadSelector (ref), reactModule (ref), cryoModule (ref)
	local var2 = useCurrentSquadSelector()
	local var3 = reactModule.useMemo(function() --[[ line: 14 ]]
		-- upvalues: var2 (ref)
		return if var2 then var2.members else {}
	end, { var2 })
	
	return reactModule.useMemo(function() --[[ line: 21 ]]
		-- upvalues: cryoModule (copy), var3 (ref), p0 (ref)
		local var4 = cryoModule.List.findWhere(var3, function(p1) --[[ line: 22 ]]
			-- upvalues: p0 (copy)
			return p1.userId == p0
		end)
		
		return if var4 then var3[var4] else nil
	end, { var3, p0 })
end

return useCurrentSquadMember