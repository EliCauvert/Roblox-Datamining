local reactModule = require(game:GetService("CorePackages").Packages.React)
local tooltipContextModule = require(script.Parent.TooltipContext)
local _ = require(script.Parent.TooltipProvider)

function useIsTooltipTurn(p0)
	-- upvalues: reactModule (ref), tooltipContextModule (ref)
	local var2 = reactModule.useContext(tooltipContextModule)
	
	return var2 and var2.isCurrentTooltip(p0)
end

return useIsTooltipTurn