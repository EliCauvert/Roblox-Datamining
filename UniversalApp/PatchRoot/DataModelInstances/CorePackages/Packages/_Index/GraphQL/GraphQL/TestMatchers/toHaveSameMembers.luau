local inspect = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect
local arrayContainsModule = require(script.Parent.Parent.luaUtils.arrayContains)

return function(p0, p1, p2) --[[ line: 20 | named "toHaveSameMembers" ]]
	-- upvalues: arrayContainsModule (ref), inspect (ref)
	if #p0 ~= #p1 then
		return {
			pass = false,
			message = ("Received array length %s / expected length %s"):format(tostring(#p0), tostring(#p1))
		}
	end
	for i, v in ipairs(p1) do
		if not arrayContainsModule(p0, v, p2) then
			return {
				pass = false,
				message = ("Expected item %s to be in Array %s"):format(inspect(v), inspect(p0))
			}
		end
	end
	return { pass = true, message = "" }
end