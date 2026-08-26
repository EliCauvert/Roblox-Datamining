local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility

return function(value, p1, p2)
	-- upvalues: reactModule (ref), impressionsTagUtility (ref)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), value (ref), p1 (ref), p2 (ref)
		impressionsTagUtility.AddTag(value, p1, p2)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), value (copy), p1 (copy), p2 (copy)
			impressionsTagUtility.RemoveTag(value, p1, p2)
		end
	end, { value, p1, p2 })
end