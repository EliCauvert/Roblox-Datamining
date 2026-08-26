local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

local var1 = function(...)
	error("Not implemented. Dependencies used upstream aren't implemented")
end

return {
	default = function(p1)
		-- upvalues: var1 (ref)
		local t = {}
		
		for i, v in ipairs(p1.supportedCommands) do
			t[v] = function(p2, ...)
				-- upvalues: var1 (copy), v (ref)
				var1(p2, v, ...)
			end
		end
		return t
	end
}