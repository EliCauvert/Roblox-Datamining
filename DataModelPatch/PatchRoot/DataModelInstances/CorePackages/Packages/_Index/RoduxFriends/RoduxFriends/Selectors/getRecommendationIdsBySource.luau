local Parent = script.Parent.Parent
local GetDeepValueModule = require(Parent.getDeepValue)
local _ = require(Parent.roduxFriendsTypes)
local Object = require(Parent.Parent.LuauPolyfill).Object

return function(p1)
	-- upvalues: GetDeepValueModule (copy), Object (copy)
	local KeyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy), Object (upval)
		return function(p3)
			-- upvalues: GetDeepValueModule (upval), p2 (copy), KeyPath (upval), Object (upval)
			return Object.keys(GetDeepValueModule(p2, string.format("%s.recommendations.bySource.%s", KeyPath, p3 or "")) or {})
		end
	end
end