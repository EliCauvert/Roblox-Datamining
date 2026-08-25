local signal = require(script:FindFirstAncestor("RoactUtils").Parent.AppCommonLib).Signal
local _ = require(script.Parent.types)

return function()
	-- upvalues: signal (ref)
	return { onRender = signal.new(), onCommit = signal.new() }
end