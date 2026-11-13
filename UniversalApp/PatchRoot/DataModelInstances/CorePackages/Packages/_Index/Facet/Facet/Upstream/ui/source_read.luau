local _ = require("../vendor/compose/core")

local function peek(p1)
	return p1:peek()
end

return function(Callback, Callback1)
	-- upvalues: peek (copy)
	return if type(Callback) == "function" then Callback(Callback1 or peek) elseif Callback1 then Callback1(Callback) else Callback:peek()
end