local Parent = script.Parent.Parent
local _ = require(Parent.roduxFriendsTypes)
local SelectRecommendationsForUserIdModule = require(script.Parent.selectRecommendationsForUserId)
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Array = LuauPolyfillModule.Array

local function v6(p1, p2) --[[ Line: 13 ]]
	return (p1.rank or 0) - (p2.rank or 0)
end

return function(p1) --[[ Line: 19 ]]
	-- upvalues: SelectRecommendationsForUserIdModule (copy), Array (copy), Object (copy), v6 (copy)
	return function(p2) --[[ Line: 20 ]]
		-- upvalues: SelectRecommendationsForUserIdModule (upval), p1 (copy), Array (upval), Object (upval), v6 (upval)
		return function(p3, p4) --[[ Line: 21 ]]
			-- upvalues: SelectRecommendationsForUserIdModule (upval), p1 (upval), p2 (copy), Array (upval), Object (upval), v6 (upval)
			return Array.map(Array.sort(Object.values((SelectRecommendationsForUserIdModule(p1)(p2)(p3, p4))), v6), function(p5) --[[ Line: 28 ]]
				return p5.id
			end)
		end
	end
end