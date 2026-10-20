local Parent = script.Parent.Parent
local GetDeepValueModule = require(Parent.getDeepValue)
local _ = require(Parent.roduxFriendsTypes)
local FilterByKeysModule = require(script.Parent.filterByKeys)

return function(p1)
	-- upvalues: GetDeepValueModule (copy), FilterByKeysModule (copy)
	local KeyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy), FilterByKeysModule (upval)
		return function(p3, p4)
			-- upvalues: GetDeepValueModule (upval), p2 (copy), KeyPath (upval), FilterByKeysModule (upval)
			local DeepValueModule = GetDeepValueModule(p2, string.format("%s.recommendations.byUserId.%s", KeyPath, p3 or "")) or {}
			
			return if p4 then FilterByKeysModule(p4, DeepValueModule) else DeepValueModule
		end
	end
end