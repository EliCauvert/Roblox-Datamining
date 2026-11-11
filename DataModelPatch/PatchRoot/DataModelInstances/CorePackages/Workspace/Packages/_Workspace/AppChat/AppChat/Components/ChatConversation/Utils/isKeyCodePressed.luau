local ArgCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(Inputs, ...): boolean
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Inputs, "table", "isKeyCodePressed.pressedKeys")
	local KeyCodes = { ... }
	
	for _, input in ipairs(Inputs) do
		for _, keyCode in ipairs(KeyCodes) do
			if input.KeyCode == keyCode then
				return true
			end
		end
	end
	return false
end