local inspect = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect
local arrayContainsModule = require(script.Parent.Parent.luaUtils.arrayContains)

return function(p1, p2, p3)
	-- upvalues: arrayContainsModule (ref), inspect (ref)
	if #p1 ~= #p2 then
		return {
			pass = false,
			message = ("Received array length %s / expected length %s"):format(tostring(#p1), tostring(#p2))
		}
	end
	for i, v in ipairs(p2) do
		if not arrayContainsModule(p1, v, p3) then
			return {
				pass = false,
				message = ("Expected item %s to be in Array %s"):format(inspect(v), inspect(p1))
			}
		end
	end
	return { pass = true, message = "" }
end