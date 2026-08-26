local reactModule = require(script:FindFirstAncestor("Impressions").Parent.React)
local impressionsTagUtilityModule = require(script.Parent.ImpressionsTagUtility)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), impressionsTagUtilityModule (ref)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtilityModule (copy), p1 (ref), p2 (ref), p3 (ref)
		impressionsTagUtilityModule.AddTag(p1, p2, p3)
		
		return function()
			-- upvalues: impressionsTagUtilityModule (copy), p1 (copy), p2 (copy), p3 (copy)
			impressionsTagUtilityModule.RemoveTag(p1, p2, p3)
		end
	end, { p1, p2, p3 })
end