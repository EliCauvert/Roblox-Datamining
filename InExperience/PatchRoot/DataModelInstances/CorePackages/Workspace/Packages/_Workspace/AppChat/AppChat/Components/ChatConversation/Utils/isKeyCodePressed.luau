local argCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(p0, ...)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "table", "isKeyCodePressed.pressedKeys")
	local list = { ... }
	
	for i, v in ipairs(p0) do
		for i_1, v_1 in ipairs(list) do
			if v.KeyCode == v_1 then
				return true
			end
		end
	end
	return false
end