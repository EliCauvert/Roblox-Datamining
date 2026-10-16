local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

local function v1(...) --[[ Line: 18 ]]
	error("Not implemented. Dependencies used upstream aren't implemented")
end

return {
	default = function(p1) --[[ Line: 31 ]]
		-- upvalues: v1 (copy)
		local t = {}
		
		for _, supportedCommand in ipairs(p1.supportedCommands) do
			t[supportedCommand] = function(p2, ...) --[[ Line: 35 ]]
				-- upvalues: v1 (upval), supportedCommand (copy)
				v1(p2, supportedCommand, ...)
			end
		end
		return t
	end
}