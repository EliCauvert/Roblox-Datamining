local string = require(script.Parent.Parent.Parent.LuauPolyfill).String
local _ = require(script.Parent.source)

return {
	getLocation = function(p1, p2)
		-- upvalues: string (ref)
		local list = { "\r\n", "\r", "\n" }
		local var1 = 1
		local var2 = p2
		local var3 = string.findOr(p1.body, list)
		while var3 ~= nil and var3.index < p2 do
			local var4 = var3.index + string.len(var3.match)
			var1 += 1
			var2 = p2 + 1 - var4
			var3 = string.findOr(p1.body, list, var4)
		end
		return { line = var1, column = var2 }
	end
}