local InspectFunction = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect
local ArrayContainsModule = require(script.Parent.Parent.luaUtils.arrayContains)

return function(p1, List, p2) --[[ Line: 20 | Named "toHaveSameMembers" ]]
	-- upvalues: ArrayContainsModule (copy), InspectFunction (copy)
	if #p1 ~= #List then
		return {
			pass = false,
			message = ("Received array length %s / expected length %s"):format(tostring(#p1), (tostring(#List)))
		}
	end
	for _, value in ipairs(List) do
		if not ArrayContainsModule(p1, value, p2) then
			return {
				pass = false,
				message = ("Expected item %s to be in Array %s"):format(InspectFunction(value), InspectFunction(p1))
			}
		end
	end
	return { pass = true, message = "" }
end