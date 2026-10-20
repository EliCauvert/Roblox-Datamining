local config = { [Enum.KeyCode.Up] = true, [Enum.KeyCode.DPadUp] = true }

return function(p1, p2, p3): boolean
	-- upvalues: config (copy)
	return if config[p1] and p2 then p3 == nil or p3 == "" else false
end