local _ = require(script.Parent.Parent.LuauPolyfill)
local supportsTestSelectors = require(script.Parent.ReactFiberHostConfig).supportsTestSelectors
local t = {}
local t_1 = {}

function t.onCommitRoot() --[[ line: 512 ]]
	-- upvalues: supportsTestSelectors (ref), t_1 (ref)
	if supportsTestSelectors then
		for i, v in t_1 do
			v()
		end
	end
end

return t