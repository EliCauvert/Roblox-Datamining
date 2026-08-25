local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility

return function(value, p0, p1)
	-- upvalues: reactModule (ref), impressionsTagUtility (ref)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), value (ref), p0 (ref), p1 (ref)
		impressionsTagUtility.AddTag(value, p0, p1)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), value (copy), p0 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(value, p0, p1)
		end
	end, { value, p0, p1 })
end