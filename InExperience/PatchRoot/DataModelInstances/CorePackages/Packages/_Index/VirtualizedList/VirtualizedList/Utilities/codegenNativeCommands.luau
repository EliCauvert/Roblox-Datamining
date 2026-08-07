local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

local var0 = function(...) --[[ line: 18 ]]
	error("Not implemented. Dependencies used upstream aren't implemented")
end

return {
	default = function(p0) --[[ line: 31 ]]
		-- upvalues: var0 (ref)
		local t = {}
		
		for i, v in ipairs(p0.supportedCommands) do
			t[v] = function(p1, ...) --[[ line: 35 ]]
				-- upvalues: var0 (copy), v (ref)
				var0(p1, v, ...)
			end
		end
		return t
	end
}