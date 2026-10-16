local _ = require(script.Parent.Parent.LuauPolyfill)
local SupportsTestSelectors = require(script.Parent.ReactFiberHostConfig).supportsTestSelectors
local t = {}

return {
	onCommitRoot = function() --[[ Line: 512 ]]
		-- upvalues: SupportsTestSelectors (copy), t (copy)
		if SupportsTestSelectors then
			for _, value in t do
				value()
			end
		end
	end
}