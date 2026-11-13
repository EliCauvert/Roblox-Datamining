local _ = require("../vendor/compose/core")

local function peek(p1)
	return p1:peek()
end

return function(Callback)
	-- upvalues: peek (copy)
	return function(Callback2, Callback1)
		-- upvalues: Callback (copy), peek (upval)
		local ValueType = type(Callback2)
		
		return if ValueType == "table" and Callback(Callback2) then if Callback1 then Callback1(Callback2) else Callback2:peek() elseif ValueType == "function" then Callback2(Callback1 or peek) else Callback2
	end
end