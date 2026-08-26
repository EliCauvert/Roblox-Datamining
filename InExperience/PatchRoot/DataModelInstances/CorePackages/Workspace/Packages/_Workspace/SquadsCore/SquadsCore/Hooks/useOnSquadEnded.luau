local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local reactModule = require(parent.React)
local usePrevious = require(parent.RoactUtils).Hooks.usePrevious

return function(p1)
	-- upvalues: useCurrentSquadIdModule (ref), usePrevious (ref), reactModule (ref)
	local var1 = useCurrentSquadIdModule() or ""
	local var2 = usePrevious(var1) or ""
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), p1 (ref)
		if var1 ~= var2 and var2 ~= "" and p1 then
			p1()
		end
	end, { var1, p1 })
end