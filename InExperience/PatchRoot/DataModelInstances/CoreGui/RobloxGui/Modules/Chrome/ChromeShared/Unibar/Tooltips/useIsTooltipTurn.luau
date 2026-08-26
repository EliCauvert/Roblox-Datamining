local reactModule = require(game:GetService("CorePackages").Packages.React)
local tooltipContextModule = require(script.Parent.TooltipContext)
local _ = require(script.Parent.TooltipProvider)

function useIsTooltipTurn(p1)
	-- upvalues: reactModule (ref), tooltipContextModule (ref)
	local var1 = reactModule.useContext(tooltipContextModule)
	
	return var1 and var1.isCurrentTooltip(p1)
end

return useIsTooltipTurn