local ReactModule = require(game:GetService("CorePackages").Packages.React)
local TooltipContextModule = require(script.Parent.TooltipContext)
local _ = require(script.Parent.TooltipProvider)

function useIsTooltipTurn(p1)
	-- upvalues: ReactModule (copy), TooltipContextModule (copy)
	local UseContextResult = ReactModule.useContext(TooltipContextModule)
	
	return UseContextResult and UseContextResult.isCurrentTooltip(p1)
end

return useIsTooltipTurn