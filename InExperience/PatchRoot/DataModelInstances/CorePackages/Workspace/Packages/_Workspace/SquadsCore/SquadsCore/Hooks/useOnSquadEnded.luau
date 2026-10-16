local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local UseCurrentSquadIdModule = require(SquadsCore.Hooks.useCurrentSquadId)
local ReactModule = require(Parent.React)
local UsePreviousFunction = require(Parent.RoactUtils).Hooks.usePrevious

return function(Callback) --[[ Line: 9 ]]
	-- upvalues: UseCurrentSquadIdModule (copy), UsePreviousFunction (copy), ReactModule (copy)
	local UseCurrentSquadIdModuleResult = UseCurrentSquadIdModule() or ""
	local UsePreviousResult = UsePreviousFunction(UseCurrentSquadIdModuleResult) or ""
	ReactModule.useEffect(function() --[[ Line: 12 ]]
		-- upvalues: UseCurrentSquadIdModuleResult (copy), UsePreviousResult (copy), Callback (copy)
		if UseCurrentSquadIdModuleResult ~= UsePreviousResult and UsePreviousResult ~= "" and Callback then
			Callback()
		end
	end, { UseCurrentSquadIdModuleResult, Callback })
end