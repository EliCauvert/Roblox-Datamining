local reactModule = require(script:FindFirstAncestor("Impressions").Parent.React)
local impressionsTagUtilityModule = require(script.Parent.ImpressionsTagUtility)

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: reactModule (ref), impressionsTagUtilityModule (ref)
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: impressionsTagUtilityModule (copy), p0 (ref), p1 (ref), p2 (ref)
		impressionsTagUtilityModule.AddTag(p0, p1, p2)
		
		return function() --[[ line: 12 ]]
			-- upvalues: impressionsTagUtilityModule (copy), p0 (copy), p1 (copy), p2 (copy)
			impressionsTagUtilityModule.RemoveTag(p0, p1, p2)
		end
	end, { p0, p1, p2 })
end