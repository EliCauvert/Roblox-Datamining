local Parent = script:FindFirstAncestor("SquadsCore").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseCurrentSquadSelectorFunction = require(Parent.RoduxSquads).Hooks.useCurrentSquadSelector

function useCurrentSquadMember(UserId) --[[ Line: 12 ]]
	-- upvalues: UseCurrentSquadSelectorFunction (copy), ReactModule (copy), CryoModule (copy)
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 14 ]]
		-- upvalues: UseCurrentSquadSelectorResult (copy)
		return if UseCurrentSquadSelectorResult then UseCurrentSquadSelectorResult.members else {}
	end, { UseCurrentSquadSelectorResult })
	
	return (ReactModule.useMemo(function() --[[ Line: 21 ]]
		-- upvalues: CryoModule (upval), UseMemoResult (copy), UserId (copy)
		local Where = CryoModule.List.findWhere(UseMemoResult, function(p1): boolean --[[ Line: 22 ]]
			-- upvalues: UserId (upval)
			return p1.userId == UserId
		end)
		
		return if Where then UseMemoResult[Where] else nil
	end, { UseMemoResult, UserId }))
end

return useCurrentSquadMember