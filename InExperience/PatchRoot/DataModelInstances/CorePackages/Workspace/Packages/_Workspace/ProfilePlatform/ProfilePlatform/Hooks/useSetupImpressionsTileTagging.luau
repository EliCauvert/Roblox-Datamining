local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility

return function(value, p0, p1) --[[ line: 8 | named "useSetupImpressionsTileTagging" ]]
	-- upvalues: reactModule (ref), impressionsTagUtility (ref)
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: impressionsTagUtility (copy), value (ref), p0 (ref), p1 (ref)
		impressionsTagUtility.AddTag(value, p0, p1)
		
		return function() --[[ line: 11 ]]
			-- upvalues: impressionsTagUtility (copy), value (copy), p0 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(value, p0, p1)
		end
	end, { value, p0, p1 })
end