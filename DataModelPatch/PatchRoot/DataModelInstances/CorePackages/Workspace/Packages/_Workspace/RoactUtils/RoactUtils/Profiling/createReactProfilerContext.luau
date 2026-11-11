local Signal = require(script:FindFirstAncestor("RoactUtils").Parent.AppCommonLib).Signal
local _ = require(script.Parent.types)

return function()
	-- upvalues: Signal (copy)
	return { onRender = Signal.new(), onCommit = Signal.new() }
end