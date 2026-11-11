local ReactModule = require(script:FindFirstAncestor("Impressions").Parent.React)
local ImpressionsTagUtilityModule = require(script.Parent.ImpressionsTagUtility)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), ImpressionsTagUtilityModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtilityModule (upval), p1 (copy), p2 (copy), p3 (copy)
		ImpressionsTagUtilityModule.AddTag(p1, p2, p3)
		
		return function()
			-- upvalues: ImpressionsTagUtilityModule (upval), p1 (upval), p2 (upval), p3 (upval)
			ImpressionsTagUtilityModule.RemoveTag(p1, p2, p3)
		end
	end, { p1, p2, p3 })
end