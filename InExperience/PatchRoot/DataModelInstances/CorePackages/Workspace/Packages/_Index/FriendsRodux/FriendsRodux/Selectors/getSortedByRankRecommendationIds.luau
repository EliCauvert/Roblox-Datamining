local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent.roduxFriendsTypes)
local selectRecommendationsForUserIdModule = require(script.Parent.selectRecommendationsForUserId)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array

local var2 = function(p0, p1) --[[ line: 13 ]]
	return (p0.rank or 0) - (p1.rank or 0)
end

return function(p2) --[[ line: 19 ]]
	-- upvalues: selectRecommendationsForUserIdModule (ref), array (ref), object (ref), var2 (ref)
	return function(p3) --[[ line: 20 ]]
		-- upvalues: selectRecommendationsForUserIdModule (copy), p2 (ref), array (copy), object (copy), var2 (copy)
		return function(p4, p5) --[[ line: 21 ]]
			-- upvalues: selectRecommendationsForUserIdModule (copy), p2 (copy), p3 (ref), array (copy), object (copy), var2 (copy)
			return array.map(array.sort(object.values(selectRecommendationsForUserIdModule(p2)(p3)(p4, p5)), var2), function(p6) --[[ line: 30 ]]
				return p6.id
			end)
		end
	end
end