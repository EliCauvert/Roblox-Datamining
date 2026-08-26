local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent.roduxFriendsTypes)
local selectRecommendationsForUserIdModule = require(script.Parent.selectRecommendationsForUserId)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array

local var1 = function(p1, p2)
	return (p1.rank or 0) - (p2.rank or 0)
end

return function(p1)
	-- upvalues: selectRecommendationsForUserIdModule (ref), array (ref), object (ref), var1 (ref)
	return function(p2)
		-- upvalues: selectRecommendationsForUserIdModule (copy), p1 (ref), array (copy), object (copy), var1 (copy)
		return function(p3, p4)
			-- upvalues: selectRecommendationsForUserIdModule (copy), p1 (copy), p2 (ref), array (copy), object (copy), var1 (copy)
			return array.map(array.sort(object.values(selectRecommendationsForUserIdModule(p1)(p2)(p3, p4)), var1), function(p5)
				return p5.id
			end)
		end
	end
end