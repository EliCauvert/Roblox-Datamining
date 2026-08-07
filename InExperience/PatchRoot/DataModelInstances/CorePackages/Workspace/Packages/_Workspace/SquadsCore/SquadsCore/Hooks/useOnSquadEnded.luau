local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local reactModule = require(parent.React)
local usePrevious = require(parent.RoactUtils).Hooks.usePrevious

return function(p0) --[[ line: 9 ]]
	-- upvalues: useCurrentSquadIdModule (ref), usePrevious (ref), reactModule (ref)
	local var3 = useCurrentSquadIdModule() or ""
	local var4 = usePrevious(var3) or ""
	reactModule.useEffect(function() --[[ line: 12 ]]
		-- upvalues: var3 (ref), var4 (ref), p0 (ref)
		if var3 ~= var4 and var4 ~= "" and p0 then
			p0()
		end
	end, { var3, p0 })
end