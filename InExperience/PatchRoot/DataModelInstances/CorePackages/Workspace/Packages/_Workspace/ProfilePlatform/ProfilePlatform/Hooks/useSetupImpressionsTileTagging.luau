local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility

return function(p1, p2, p3) --[[ Line: 8 | Named "useSetupImpressionsTileTagging" ]]
	-- upvalues: ReactModule (copy), ImpressionsTagUtility (copy)
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: ImpressionsTagUtility (upval), p1 (copy), p2 (copy), p3 (copy)
		ImpressionsTagUtility.AddTag(p1, p2, p3)
		
		return function() --[[ Line: 11 ]]
			-- upvalues: ImpressionsTagUtility (upval), p1 (upval), p2 (upval), p3 (upval)
			ImpressionsTagUtility.RemoveTag(p1, p2, p3)
		end
	end, { p1, p2, p3 })
end